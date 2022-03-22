using System;
using Infragistics.WebUI.WebSchedule;
using System.Web;
using System.Web.UI.WebControls;
using Infragistics.WebUI.Shared;
using System.Collections;
using System.Xml;

namespace Infragistics.WebUI.Data
{
    /// <summary>
    /// Summary description for WebScheduleXMLDataProvider.
    /// </summary>
    public class WebScheduleXMLDataProvider : WebScheduleDataProviderBase, IDataFetch, IDataUpdate
    {
        public WebScheduleXMLDataProvider(string fileUrl)
        {
            this.fileUrl = fileUrl;
        }
        public WebScheduleXMLDataProvider(XmlTextReader reader, XmlTextWriter writer)
        {
            this.reader = reader;
            this.writer = writer;
        }
        public WebScheduleXMLDataProvider(XmlDocument doc)
        {
            this.doc = doc;
        }

        private XmlReader reader = null;
        private XmlDocument doc = null;
        private XmlWriter writer = null;
        private string fileUrl;
        private bool isDirty = false;
        public bool IsDirty
        {
            get { return this.isDirty; }
        }
        public string XmlFileUrl
        {
            get { return this.fileUrl; }
            set { this.fileUrl = value; }
        }
        public XmlWriter Writer
        {
            get
            {
                if (this.writer != null) return this.writer;
                if (this.fileUrl != null && this.fileUrl.Length > 0)
                {
                    this.writer = new XmlTextWriter((this.fileUrl), System.Text.Encoding.UTF8);
                }
                return this.writer;
            }
            set { this.writer = value; }
        }
        public XmlReader Reader
        {
            get
            {
                if (this.reader != null) return this.reader;
                if (this.fileUrl != null && this.fileUrl.Length > 0) this.reader = new XmlTextReader((this.fileUrl));
                return this.reader;
            }
            set { this.reader = value; }
        }



        protected virtual XmlDocument GetXmlDocument()
        {
            if (this.doc != null) return this.doc;
            bool mustCleanUpReader = this.reader == null;
            if (this.Reader != null)
            {
                XmlDocument doc = new XmlDocument();
                doc.Load(reader);
                this.doc = doc;
                if (mustCleanUpReader == true)
                {
                    this.reader.Close();
                    this.reader = null;
                }
                return this.doc;
            }
            return null;
        }
        protected virtual void SaveChanges(XmlDocument doc)
        {
            if (this.isDirty)
            {
                bool needToCleanUpWriter = this.writer == null;
                if (this.Writer != null && doc != null)
                {
                    doc.Save(this.writer);
                    if (needToCleanUpWriter)
                    {
                        writer.Close();
                        writer = null;
                    }
                }
            }
        }

        #region IData Implementations
        void IDataFetch.Fetch(DataContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException("context");
            }

            if (context.Operation != null && context.Operation.StartsWith("FetchResource"))
            {
                FetchResource(context as FetchResourcesContext);
            }
            else if (context.Operation == "FetchActivities")
            {
                FetchActivities(context as FetchActivitiesContext);
            }
            else if (context.Operation == "FetchReminders")
            {
                FetchReminders(context as FetchRemindersContext);
            }
            else if (context.Operation == "FetchRecurrences")
            {
                FetchRecurrences(context as FetchRecurrencesContext);
            }
            else if (context.Operation == "FetchVariances")
            {
                FetchVariances(context as FetchVariancesContext);
            }
        }
        #region Fetch
        protected virtual void FetchActivities(FetchActivitiesContext context)
        {
            context.Activities.Clear();
            Resource organizer = ((ResourcesCollection)context.Resources).GetResourceFromName(context.Activities.ScheduleInfo.ActiveResourceName);
            Activity[] activities = this.GetAppointments(context.FrameInterval.StartDateUTC, context.FrameInterval.EndDateUTC, organizer);
            if (activities != null && activities.Length > 0)
            {
                foreach (Activity activity in activities)
                {
                    this.OnInitializeActivity(activity, context.Activities, organizer);
                }
            }
        }
        protected virtual void FetchResource(FetchResourcesContext context)
        {
            context.Resources.Clear();
            if (String.IsNullOrEmpty(context.ActiveResourceName) && context.Resources != null)
            {
                ICollection resources = this.FetchResources();
                foreach (Resource resource in resources)
                {
                    context.Resources.Add(resource);
                }
            }
            else
            {
                Resource resources = this.GetResource(context.ActiveResourceName);
                if (resources != null)
                {
                    this.OnInitializeResource(resources, context.Resources);
                }
            }

        }

        public virtual ICollection FetchResources()
        {
            ArrayList resources = (ArrayList)this.GetResources();
            if (resources != null)
            {
                foreach (Resource theResource in resources)
                {
                    this.OnInitializeResource(theResource, resources);
                }
                return resources;
            }
            return null;
        }

        protected virtual void FetchReminders(FetchRemindersContext context)
        {
            if (context.Resource == null) return;
            int resourceID = Convert.ToInt32(context.Resource.DataKey);
            context.Activities.Clear();
            Appointment[] reminders = this.GetReminders(((DateTime)context.ExpireTime.Value + context.LookAheadInterval), resourceID);
            if (reminders != null && reminders.Length > 0)
            {
                foreach (Appointment reminder in reminders)
                {
                    this.OnInitializeReminder(reminder, context.Activities, context.Resource);
                }
            }
        }

        protected virtual void FetchRecurrences(FetchRecurrencesContext context)
        {
            context.Recurrences.Clear();
            this.recurrenceHistory.Clear();

            XmlDocument doc = this.GetXmlDocument();
            if (doc != null)
            {
                XmlNodeList recurrences = doc.SelectNodes("//recurrences/*");
                if (recurrences != null && recurrences.Count > 0)
                {
                    for (int n = 0; n < recurrences.Count; ++n)
                    {
                        Recurrence recur = this.CreateRecurrenceFromNode(null, recurrences[n]);
                        context.Recurrences.Add(recur);
                        if (!this.recurrenceHistory.ContainsKey(recur.Key))
                            this.recurrenceHistory.Add(recur.Key, recur);
                    }
                }
            }
        }

        protected virtual void FetchVariances(FetchVariancesContext context)
        {
            XmlDocument doc = this.GetXmlDocument();
            foreach (Appointment occurrence in this.varianceList)
            {
                /* Convert to AppointmentVariance */
                Recurrence recur = this.recurrenceHistory[occurrence.RecurrenceKey] as Recurrence;
                if (recur != null)
                {
                    foreach (Activity rootActivity in this.WebScheduleInfo.Activities)
                    {
                        if (recur.Key.CompareTo(rootActivity.RecurrenceKey) == 0)
                        {
                            Guid varianceKey = rootActivity.GetValue("VarianceKey", Guid.Empty);
                            AppointmentVariance variance = rootActivity.CreateVariance(occurrence.GetValue("OriginalStartDateTimeUtc", SmartDate.Empty), occurrence.StartDateTimeUtc) as AppointmentVariance;
                            if (variance != null)
                            {
                                XmlNode varianceNode = doc.SelectSingleNode(string.Format("//appointments/*[@dataKey='{0}']", occurrence.DataKey));
                                if (varianceNode != null)
                                {
                                    variance.AllDayEvent = XmlHelper.GetAttributeAsBoolean(varianceNode, "allDayEvent", false);
                                    variance.Description = XmlHelper.GetAttributeAsString(varianceNode, "description", string.Empty);
                                    variance.EnableReminder = XmlHelper.GetAttributeAsBoolean(varianceNode, "enableReminder", true);
                                    variance.StartDateTimeUtc = new SmartDate(new DateTime(XmlHelper.GetAttributeAsLong(varianceNode, "startDateTimeUtc", 0L) * 600000000));
                                    variance.EndDateTimeUtc = new SmartDate(new DateTime(XmlHelper.GetAttributeAsLong(varianceNode, "endDateTimeUtc", 0L) * 600000000));
                                    variance.EndDateTime = (variance.StartDateTime.Add(variance.EndDateTimeUtc.Subtract(variance.StartDateTimeUtc)));
                                    variance.Importance = (Importance)XmlHelper.GetAttributeAsInt(varianceNode, "importance", (int)(Importance.Normal));
                                    variance.Location = XmlHelper.GetAttributeAsString(varianceNode, "location", string.Empty);
                                    variance.ReminderInterval = new TimeSpan(XmlHelper.GetAttributeAsLong(varianceNode, "reminderInterval", 0L) * 600000000);
                                    variance.Key = XmlHelper.GetAttributeAsString(varianceNode, "key", string.Empty);
                                    variance.DataKey = XmlHelper.GetAttributeAsString(varianceNode, "dataKey", string.Empty);
                                    variance.Status = (ActivityStatus)XmlHelper.GetAttributeAsInt(varianceNode, "status", (int)(ActivityStatus.Normal));
                                    variance.ShowTimeAs = (ShowTimeAs)XmlHelper.GetAttributeAsInt(varianceNode, "showTimeAs", (int)(ShowTimeAs.Busy));
                                    variance.Subject = XmlHelper.GetAttributeAsString(varianceNode, "subject", string.Empty);
                                    variance.ResourceKey = XmlHelper.GetAttributeAsString(varianceNode, "resourceKey", "-999");
                                    variance.RecurrenceKey = rootActivity.RecurrenceKey;
                                    variance.SetValue("VarianceKey", varianceKey);
                                }
                                context.Variances.Add(variance);
                            }
                            break;
                        }
                    }
                }
            }
            this.varianceList.Clear();
            return;
        }

        #endregion

        void IDataUpdate.Update(DataContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException("context");
            }
            this.isDirty = true;
            if (context is UpdateRemindersContext)
            {
                this.UpdateReminder(context as UpdateRemindersContext);
            }
            else if (context is AddVarianceContext)
            {
                this.AddVariance((AddVarianceContext)context);
            }
            else if (context is UpdateVarianceContext)
            {
                this.UpdateVariance((UpdateVarianceContext)context);
            }
            else if (context is RemoveVarianceContext)
            {
                this.RemoveVariance((RemoveVarianceContext)context);
            }
            else if (context is UpdateActivityContext)
            {
                this.UpdateActivity((UpdateActivityContext)context);
            }
            else if (context is AddActivityContext)
            {
                this.AddActivity((AddActivityContext)context);
            }
            else if (context is RemoveActivityContext)
            {
                this.RemoveActivity((RemoveActivityContext)context);
            }
            else if (context is AddRecurrenceContext)
            {
                this.AddRecurrence((AddRecurrenceContext)context);
            }
            else if (context is UpdateRecurrenceContext)
            {
                this.UpdateRecurrence((UpdateRecurrenceContext)context);
            }
            else if (context is RemoveRecurrenceContext)
            {
                this.RemoveRecurrence((RemoveRecurrenceContext)context);
            }
            else if (context is UpdateSnoozeContext)
            {
                this.UpdateSnooze((UpdateSnoozeContext)context);
            }
            else if (context is UpdateResourceContext)
            {
                this.UpdateResource((UpdateResourceContext)context);
            }
            else if (context is AddResourceContext)
            {
                this.AddResource((AddResourceContext)context);
            }
            else if (context is RemoveResourceContext)
            {
                this.RemoveResource((RemoveResourceContext)context);
            }
        }

        #endregion
        #region Recurrence Add/Update/Remove
        protected virtual void AddRecurrence(AddRecurrenceContext context)
        {
            XmlNode recurrenceNode = this.CreateNodeFromRecurrence(context.Recurrence);
            XmlNode recurrenceParent = doc.SelectSingleNode("//recurrences");
            if (recurrenceParent == null)
            {
                recurrenceParent = doc.CreateElement("recurrences");
                doc.DocumentElement.AppendChild(recurrenceParent);
            }
            recurrenceParent.AppendChild(recurrenceNode);
        }

        protected virtual void UpdateRecurrence(UpdateRecurrenceContext context)
        {
            XmlDocument doc = this.GetXmlDocument();
            XmlNode node = doc.SelectSingleNode(String.Format("//recurrences/*[@recurrenceID='{0}']", context.Activity.RecurrenceKey));
            if (node != null)
            {
                this.UpdateNodeFromRecurrence(node, context.Activity.Recurrence);
            }
            XmlNodeList oldVarianceNodes = doc.SelectNodes(
                string.Format(
                    "//appointments/*[@recurrenceKey='{0}']",
                    context.Activity.RecurrenceKey
                )
            );
            if (oldVarianceNodes != null)
            {
                foreach (XmlNode varianceNode in oldVarianceNodes)
                {
                    if (varianceNode.Attributes.GetNamedItem("originalStartDateTimeUtc") != null)
                    {
                        varianceNode.ParentNode.RemoveChild(varianceNode);
                    }
                }
            }
        }

        protected virtual void RemoveRecurrence(RemoveRecurrenceContext context)
        {
            XmlNode recurrenceNode = doc.SelectSingleNode(
                string.Format(
                    "//recurrences/*[@recurrenceID='{0}']",
                    context.RecurrenceKey
                )
            );
            if (recurrenceNode != null)
            {
                recurrenceNode.ParentNode.RemoveChild(recurrenceNode);
            }

            XmlNodeList oldAppointmentNodes = doc.SelectNodes(
                string.Format(
                    "//appointments/*[@recurrenceKey='{0}']",
                    context.RecurrenceKey
                )
            );
            if (oldAppointmentNodes != null)
            {
                foreach (XmlNode appointmentNode in oldAppointmentNodes)
                {
                    if (appointmentNode.Attributes.GetNamedItem("originalStartDateTimeUtc") != null)
                    {
                        /* Delete any variances */
                        appointmentNode.ParentNode.RemoveChild(appointmentNode);
                    }
                    else
                    {
                        /* Detach the root activity when found */
                        XmlHelper.UpdateAttribute(appointmentNode.OwnerDocument, appointmentNode, "recurrenceKey", "-999");
                        XmlHelper.UpdateAttribute(appointmentNode.OwnerDocument, appointmentNode, "varianceKey", Guid.Empty);
                    }
                }
            }
        }
        #endregion
        #region Variance Add/Update/Remove
        protected virtual void AddVariance(AddVarianceContext context)
        {
            if (context.Variance is AppointmentVariance)
            {
                XmlDocument doc = this.GetXmlDocument();
                XmlNode varianceNode = this.CreateNodeFromAppointment((AppointmentVariance)(context.Variance));

                /* VarianceKey relates this Variance with other Variances and it's root Activity */
                Guid varianceKey = context.Variance.Recurrence.RootActivity.GetValue("VarianceKey", Guid.Empty);
                if (varianceKey == Guid.Empty)
                {
                    /* If VarianceKey did not previously exist, assign one to this (first) variance
                     * and it's root Activity */
                    varianceKey = Guid.NewGuid();
                    context.Variance.Recurrence.RootActivity.SetValue("VarianceKey", varianceKey);

                    XmlNode rootActivityNode = doc.SelectSingleNode(
                        string.Format(
                            "//appointments/*[@dataKey='{0}']",
                            context.Variance.Recurrence.RootActivity.DataKey
                        )
                    );
                    XmlHelper.UpdateAttribute(doc, rootActivityNode, "varianceKey", varianceKey);
                    XmlHelper.UpdateAttribute(doc, varianceNode, "varianceKey", varianceKey);
                    context.Variance.SetValue("VarianceKey", varianceKey);
                }
                else
                {
                    /* Otherwise VarianceKey did exist, and this variance must use the existing
                     * GUID to correlate itself with other existing variances of this root Activity */
                    XmlHelper.UpdateAttribute(doc, varianceNode, "varianceKey", varianceKey);
                    context.Variance.SetValue("VarianceKey", varianceKey);
                }

                /* DataKey identifies this specific Variance individually */
                string rowKey = DateTime.Now.Ticks.ToString();
                XmlHelper.UpdateAttribute(doc, varianceNode, "key", rowKey);
                XmlHelper.UpdateAttribute(doc, varianceNode, "dataKey", rowKey);
                XmlHelper.UpdateAttribute(doc, varianceNode, "resourceKey", context.Variance.Recurrence.RootActivity.ResourceKey);
                XmlHelper.UpdateAttribute(doc, varianceNode, "originalStartDateTimeUtc", context.Variance.OriginalStartDateTimeUtc.Ticks / 600000000);

                context.Variance.DataKey = context.Variance.Key = rowKey;

                XmlNode parentNode = doc.SelectSingleNode("//appointments");
                if (parentNode == null)
                {
                    parentNode = doc.CreateElement("appointments");
                    doc.DocumentElement.AppendChild(parentNode);
                }
                parentNode.AppendChild(varianceNode);
            }
        }

        protected virtual void UpdateVariance(UpdateVarianceContext context)
        {
            XmlDocument doc = this.GetXmlDocument();
            XmlNode varianceNode = doc.SelectSingleNode(String.Format("//appointments/*[@dataKey='{0}']", context.Variance.DataKey));
            if (varianceNode != null)
            {
                this.UpdateNodeFromAppointment(varianceNode, context.Variance);
            }
        }

        protected virtual void RemoveVariance(RemoveVarianceContext context)
        {
            XmlDocument doc = this.GetXmlDocument();
            if (context.IsDeleteAll)
            {
                XmlNodeList oldVarianceNodes = doc.SelectNodes(
                    string.Format(
                        "//appointments/*[@recurrenceKey='{0}']",
                        context.RecurrenceKey
                    )
                );
                if (oldVarianceNodes != null)
                {
                    foreach (XmlNode varianceNode in oldVarianceNodes)
                    {
                        if (varianceNode.Attributes.GetNamedItem("originalStartDateTimeUtc") != null)
                        {
                            varianceNode.ParentNode.RemoveChild(varianceNode);
                        }
                    }
                }
            }
            else
            {
                XmlNode varianceNode = doc.SelectSingleNode(String.Format("//appointments/*[@dataKey='{0}']", context.DataKey));
                if (varianceNode != null)
                {
                    /* Don't remove the variance; instead mark it's ActivityStatus as 'Deleted' */
                    XmlHelper.UpdateAttribute(doc, varianceNode, "status", (int)(ActivityStatus.Deleted));
                }
            }
        }
        #endregion Variance Add/Update/Remove
        #region Activity Add/Update/Remove
        protected virtual void UpdateActivity(UpdateActivityContext context)
        {
            XmlDocument doc = this.GetXmlDocument();
            XmlNode node = doc.SelectSingleNode(String.Format("//appointments/*[@dataKey='{0}']", context.Activity.DataKey));
            if (node != null && context.Activity is Appointment)
            {
                this.UpdateNodeFromAppointment(node, (Appointment)(context.Activity));
            }
        }
        protected virtual void AddActivity(AddActivityContext context)
        {
            if (context.Activity is Appointment)
            {
                XmlDocument doc = this.GetXmlDocument();
                XmlNode node = this.CreateNodeFromAppointment((Appointment)(context.Activity));
                XmlHelper.UpdateAttribute(doc, node, "key", DateTime.Now.Ticks.ToString());
                XmlHelper.UpdateAttribute(doc, node, "dataKey", XmlHelper.GetAttributeAsString(node, "key", string.Empty));
                XmlNode apptsNode = doc.SelectSingleNode("//appointments");
                if (apptsNode == null)
                {
                    apptsNode = doc.CreateElement("appointments");
                    doc.DocumentElement.AppendChild(apptsNode);
                }
                apptsNode.AppendChild(node);

                if (context.Activity.IsRecurring)
                {
                    XmlNode recurrenceNode = this.CreateNodeFromRecurrence(context.Activity.Recurrence);
                    XmlNode recurrenceParent = doc.SelectSingleNode("//recurrences");
                    if (recurrenceParent == null)
                    {
                        recurrenceParent = doc.CreateElement("recurrences");
                        doc.DocumentElement.AppendChild(recurrenceParent);
                    }
                    recurrenceParent.AppendChild(recurrenceNode);
                }
            }
        }
        protected virtual void RemoveActivity(RemoveActivityContext context)
        {
            XmlDocument doc = this.GetXmlDocument();
            XmlNode node = doc.SelectSingleNode(String.Format("//appointments/*[@dataKey='{0}']", context.DataKey));
            if (node != null)
            {
                node.ParentNode.RemoveChild(node);
            }
        }
        #endregion
        #region Reminder/Snooze Update
        protected virtual void UpdateReminder(UpdateRemindersContext context)
        {
            XmlDocument doc = this.GetXmlDocument();
            XmlNode node = doc.SelectSingleNode(String.Format("//appointments/*[@dataKey='{0}']", context.DataKey));
            if (node != null)
            {
                XmlHelper.UpdateAttribute(doc, node, "status", (int)(context.Status));
            }
        }
        protected virtual void UpdateSnooze(UpdateSnoozeContext context)
        {
            this.UpdateSnoozeInterval(context);
        }
        private void UpdateSnoozeInterval(UpdateSnoozeContext context)
        {
            Snooze snooze = context.Snooze;
            IList snoozeList = context.SnoozeList;
            snoozeList.Add(snooze);
        }
        #endregion
        #region Resource Add/Update/Remove
        protected virtual void UpdateResource(UpdateResourceContext context)
        {
            XmlDocument doc = this.GetXmlDocument();
            XmlNode node = doc.SelectSingleNode(String.Format("//resources/*[@dataKey='{0}']", context.Resource.DataKey));
            if (node != null)
            {
                this.UpdateNodeFromResource(node, context.Resource);
            }
        }
        protected virtual void AddResource(AddResourceContext context)
        {
            XmlDocument doc = this.GetXmlDocument();
            XmlNode node = doc.SelectSingleNode(("//resources"));
            if (node == null)
            {
                node = doc.CreateElement("resources");
                node = doc.DocumentElement.AppendChild(node);
            }
            int resourceID = 0;
            if (node != null && node.LastChild != null)
            {
                resourceID = XmlHelper.GetAttributeAsInt(node, "dataKey", 100) + 1;
            }
            if (node != null)
            {
                context.Resource.DataKey = resourceID;
                XmlNode resourceNode = this.CreateNodeFromResource(context.Resource);
                node.AppendChild(resourceNode);
            }
        }
        protected virtual void RemoveResource(RemoveResourceContext context)
        {
            XmlDocument doc = this.GetXmlDocument();
            XmlNode node = doc.SelectSingleNode(String.Format("//resources/*[@name='{0}']", context.ResourceName));
            if (node != null)
            {
                node.ParentNode.RemoveChild(node);
            }
        }
        #endregion
        #region Page Overrides
        public override void Dispose()
        {
            if (this.reader != null)
            {
                this.reader.Close();
            }
            this.reader = null;
            if (this.writer != null)
            {
                this.writer.Close();
            }
            this.writer = null;
            this.doc = null;
        }
        protected override void OnPreRender(EventArgs e)
        {
            if (this.IsDirty) this.SaveChanges(this.GetXmlDocument());
            base.OnPreRender(e);
        }
        #endregion
        #region GetAppointments/Reminders/Resource
        ArrayList varianceList = new ArrayList();
        Hashtable recurrenceHistory = new Hashtable();

        private void ImportAppointmentsFromNodeList(XmlNodeList nodeList, IList collection)
        {
            if (nodeList == null)
                return;

            foreach (XmlNode node in nodeList)
                /* Only Variances contain the OriginalStartDateTimeUtc attribute */
                if (node.Attributes.GetNamedItem("originalStartDateTimeUtc") == null)
                    collection.Add(this.CreateAppointmentFromNode(node));
                else
                {
                    Appointment variance = this.CreateAppointmentFromNode(node);
                    this.varianceList.Add(variance);
                }
        }

        protected virtual Appointment[] GetAppointments(SmartDate startDateUTC, SmartDate endDateUTC, Resource organizer)
        {
            XmlDocument doc = this.GetXmlDocument();
            if (doc == null) return null;

            ArrayList appointments = new ArrayList();

            object organizerKey = -999;
            if (organizer != null)
            {
                organizerKey = organizer.DataKey;
            }
            string result, searchPattern="";
            if (this.WebScheduleInfo.EnableMultiResourceView)
            {
                result = string.Format(
                        "//appointments/*[@startDateTimeUtc >= {0}][@startDateTimeUtc <= {1}][@recurrenceKey = '-999']",
                        (startDateUTC.Ticks / 600000000),
                        (endDateUTC.Ticks / 600000000),
                        organizerKey
                    );
                searchPattern = "//appointments/*[@recurrenceKey != '-999']";
            }
            else
            {
                result = string.Format(
                       "//appointments/*[@startDateTimeUtc >= {0}][@startDateTimeUtc <= {1}][@resourceKey = '{2}'][@recurrenceKey = '-999']",
                       (startDateUTC.Ticks / 600000000),
                       (endDateUTC.Ticks / 600000000),
                       organizerKey
                   );
                 searchPattern = "//appointments/*[@resourceKey = '{0}'][@recurrenceKey != '-999']";
            }


            XmlNodeList appointmentNodeList = doc.SelectNodes(result);

            XmlNodeList rootAppointmentNodeList = doc.SelectNodes(
                string.Format(
                    searchPattern,
                    organizerKey
                )
             );

            this.ImportAppointmentsFromNodeList(appointmentNodeList, appointments);
            this.ImportAppointmentsFromNodeList(rootAppointmentNodeList, appointments);

            return appointments.ToArray(typeof(Appointment)) as Appointment[];
        }
        /*
                protected virtual Appointment[] GetAppointments(SmartDate startDateUTC, SmartDate endDateUTC,Resource organizer)
                {
                    XmlDocument doc=this.GetXmlDocument();
                    if(doc!=null)
                    {
                        XmlNodeList appointments=doc.SelectNodes(String.Format("//appointments/*[@startDateTimeUtc >= {0}][@startDateTimeUtc <= {1}][@resourceKey = '{2}']",startDateUTC.Ticks/600000000,endDateUTC.Ticks/600000000,organizer.DataKey));
                        if(appointments!=null&&appointments.Count>0)
                        {
                            Hashtable recurrenceHistory = new Hashtable();
                            ArrayList appts=new ArrayList();
                            int i=0;
                            foreach(XmlNode appointmentNode in appointments)
                            {
                                if(appointmentNode!=null)
                                {
                                    string recurrenceKey = appointmentNode.Attributes.GetNamedItem("recurrenceKey").Value;
                                    recurrenceKey = (recurrenceKey == null) ? "-999" : recurrenceKey;
                                    Guid varianceKey = Guid.Empty;
                                    if (appointmentNode.Attributes.GetNamedItem("varianceKey") != null)
                                    {
                                        varianceKey = new Guid(appointmentNode.Attributes.GetNamedItem("varianceKey").Value);
                                    }
                                    if ((recurrenceKey != "-999") && appointmentNode.Attributes.GetNamedItem("originalStartDateTimeUtc") == null)
                                    {
                                        XmlNodeList recurrences = doc.SelectNodes(String.Format("//recurrences/*[@recurrenceID = '{0}']", recurrenceKey));
                                        if (recurrences != null && recurrences.Count > 0)
                                        {
                                            Recurrence recur;
                                            if (!recurrenceHistory.ContainsKey(recurrenceKey))
                                            {
                                                recur = this.CreateRecurrenceFromNode(appointmentNode, recurrences[0]);
                                                recurrenceHistory.Add(recurrenceKey, recur);
                                            }
                                            else
                                            {
                                                recur = recurrenceHistory[recurrenceKey] as Recurrence;
                                            }
                                            appts.Add(recur.RootActivity as Appointment);
                                        }
                                    }
                                    else if ((recurrenceKey != "-999") && varianceKey != Guid.Empty && appointmentNode.Attributes.GetNamedItem("originalStartDateTimeUtc") != null)
                                    {
                                        for (int j = 0; j < appts.Count; ++j)
                                        {
                                            if (appts[j] != null && ((Appointment)(appts[j])).RecurrenceKey == recurrenceKey)
                                            {
                                                Appointment appt = new Appointment(this.WebScheduleInfo);
                                                appt = ((Appointment)(appts[j])).CreateVariance(new SmartDate(new DateTime(XmlHelper.GetAttributeAsLong(appointmentNode, "originalStartDateTimeUtc", 0L) * 600000000)), new SmartDate(new DateTime(XmlHelper.GetAttributeAsLong(appointmentNode, "startDateTimeUtc", 0L) * 600000000))) as Appointment;
                                                appt.SetValue("Kind", 3);
                                                appt.AllDayEvent = XmlHelper.GetAttributeAsBoolean(appointmentNode, "allDayEvent", false);
                                                appt.Description = XmlHelper.GetAttributeAsString(appointmentNode, "description", string.Empty);

                                                //Note - Order matters!  Must set the StartTime before setting the EndTime.
                                                appt.StartDateTimeUtc = new SmartDate(new DateTime(XmlHelper.GetAttributeAsLong(appointmentNode, "startDateTimeUtc", 0L) * 600000000));
                                                appt.EndDateTimeUtc = new SmartDate(new DateTime(XmlHelper.GetAttributeAsLong(appointmentNode, "endDateTimeUtc", 0L) * 600000000));
                                                appt.Importance = (Importance)XmlHelper.GetAttributeAsInt(appointmentNode, "importance", (int)(Importance.Normal));
                                                appt.Location = XmlHelper.GetAttributeAsString(appointmentNode, "location", string.Empty);
                                                appt.DataKey = appt.Key = DateTime.Now.Ticks.ToString();
                                                appt.Status = (ActivityStatus)XmlHelper.GetAttributeAsInt(appointmentNode, "status", (int)(ActivityStatus.Normal));
                                                appt.Subject = XmlHelper.GetAttributeAsString(appointmentNode, "subject", string.Empty);
                                                appt.SetValue("VarianceKey", varianceKey);
                                        
                                                varianceList.Add(appt);
                                                break;
                                            }
                                        }
                                    }
                                    else
                                    {
                                        appts.Add(this.CreateAppointmentFromNode(appointmentNode));
                                    }
                                }
                                i++;
                            }
                            return appts.ToArray(typeof(Appointment)) as Appointment[];
                        }
                    }
                    return null;
                }
         */
        protected virtual Appointment[] GetReminders(DateTime endDate, int resourceID)
        {
            XmlDocument doc = this.GetXmlDocument();
            if (doc != null)
            {
                XmlNodeList appointments = doc.SelectNodes(String.Format("//appointments/*[@startDateTimeUtc<={0}][@status=0][@resourceKey='{2}'][@recurrenceKey='-999']", endDate.Ticks / 600000000, ActivityStatus.Expired, resourceID));
                if (appointments != null && appointments.Count > 0)
                {
                    Appointment[] appts = new Appointment[appointments.Count];
                    int i = 0;
                    foreach (XmlNode appointmentNode in appointments)
                    {
                        if (appointmentNode != null)
                        {
                            appts[i] = this.CreateAppointmentFromNode(appointmentNode);
                        }
                        i++;
                    }
                    return appts;
                }
            }
            return null;
        }
        protected virtual Resource GetResource(string name)
        {
            XmlDocument doc = this.GetXmlDocument();
            if (doc != null)
            {
                XmlNode resourceNode = doc.SelectSingleNode(String.Format("//resources/*[@name='{0}']", name));
                if (resourceNode != null) return CreateResourceFromNode(resourceNode);
            }
            return null;
        }
        protected virtual ICollection GetResources()
        {
            XmlDocument doc = this.GetXmlDocument();
            if (doc != null)
            {
                XmlNodeList resourceNodes = doc.SelectNodes("//resources/*");
                if (resourceNodes != null)
                {
                    ArrayList theNodes = new ArrayList();
                    foreach (XmlNode theNode in resourceNodes)
                    {
                        theNodes.Add(CreateResourceFromNode(theNode));
                    }
                    return theNodes;
                }
            }
            return null;
        }
        #endregion

        #region XML Implementation details
        #region CreateNode
        private XmlNode CreateNodeFromAppointment(Appointment appointment)
        {
            XmlDocument doc = this.GetXmlDocument();
            return this.UpdateNodeFromAppointment(doc.CreateElement("appointment"), appointment);
        }
        private XmlNode CreateNodeFromResource(Resource resource)
        {
            XmlDocument doc = this.GetXmlDocument();
            return this.UpdateNodeFromResource(doc.CreateElement("resource"), resource);
        }
        private XmlNode CreateNodeFromRecurrence(Recurrence recurrence)
        {
            XmlDocument doc = this.GetXmlDocument();
            return this.UpdateNodeFromRecurrence(doc.CreateElement("recurrence"), recurrence);
        }
        #endregion
        #region UpdateNode
        private XmlNode UpdateNodeFromAppointment(XmlNode node, Appointment appointment)
        {
            XmlDocument doc = this.GetXmlDocument();
            XmlHelper.UpdateAttribute(doc, node, "allDayEvent", appointment.AllDayEvent);
            XmlHelper.UpdateAttribute(doc, node, "description", appointment.Description);
            XmlHelper.UpdateAttribute(doc, node, "importance", (int)(appointment.Importance));
            XmlHelper.UpdateAttribute(doc, node, "location", appointment.Location);
            XmlHelper.UpdateAttribute(doc, node, "enableReminder", appointment.EnableReminder);
            XmlHelper.UpdateAttribute(doc, node, "key", appointment.Key);
            XmlHelper.UpdateAttribute(doc, node, "dataKey", appointment.DataKey);
            XmlHelper.UpdateAttribute(doc, node, "subject", appointment.Subject);
            XmlHelper.UpdateAttribute(doc, node, "status", (int)(appointment.Status));
            XmlHelper.UpdateAttribute(doc, node, "startDateTimeUtc", appointment.StartDateTimeUtc.Ticks / 600000000);
            XmlHelper.UpdateAttribute(doc, node, "endDateTimeUtc", appointment.EndDateTimeUtc.Ticks / 600000000);
            XmlHelper.UpdateAttribute(doc, node, "resourceKey", appointment.ResourceKey);
            XmlHelper.UpdateAttribute(doc, node, "recurrenceKey", appointment.RecurrenceKey);
            XmlHelper.UpdateAttribute(doc, node, "showTimeAs", (int)(appointment.ShowTimeAs));
            if (appointment.IsVariance)
            {
                XmlHelper.UpdateAttribute(doc, node, "varianceKey", appointment.GetValue("VarianceKey", Guid.Empty));
                XmlHelper.UpdateAttribute(doc, node, "originalStartDateTimeUtc", appointment.OriginalStartDateTimeUtc.Ticks / 600000000);
            }
            else if (appointment.GetValue("VarianceKey", Guid.Empty) != Guid.Empty)
            {
                XmlHelper.UpdateAttribute(doc, node, "varianceKey", appointment.GetValue("VarianceKey", Guid.Empty));
            }
            return node;
        }
        private XmlNode UpdateNodeFromResource(XmlNode node, Resource resource)
        {
            XmlHelper.UpdateAttribute(doc, node, "description", resource.Description);
            XmlHelper.UpdateAttribute(doc, node, "emailAddress", resource.EmailAddress);
            XmlHelper.UpdateAttribute(doc, node, "enableReminders", resource.EnableReminders);
			XmlHelper.UpdateAttribute(doc, node, "enableEmailReminders", resource.EnableEmailReminders);
            XmlHelper.UpdateAttribute(doc, node, "key", resource.Key);
            XmlHelper.UpdateAttribute(doc, node, "dataKey", resource.DataKey);
            XmlHelper.UpdateAttribute(doc, node, "name", resource.Name);
            return node;
        }
        private XmlNode UpdateNodeFromRecurrence(XmlNode node, Recurrence recurrence)
        {
            XmlHelper.UpdateAttribute(doc, node, "recurrenceID", recurrence.Key);
            XmlHelper.UpdateAttribute(doc, node, "period", (int)(recurrence.Period));
            XmlHelper.UpdateAttribute(doc, node, "periodMultiple", recurrence.PeriodMultiple);
            XmlHelper.UpdateAttribute(doc, node, "dayOfWeekMaskUtc", (int)(recurrence.DayOfWeekMaskUtc));
            XmlHelper.UpdateAttribute(doc, node, "dayOfMonth", recurrence.DayOfMonth);
            XmlHelper.UpdateAttribute(doc, node, "monthOfYear", recurrence.MonthOfYear);
            XmlHelper.UpdateAttribute(doc, node, "maxOccurrences", recurrence.MaxOccurrences);
            XmlHelper.UpdateAttribute(doc, node, "endDateUtc", recurrence.EndDateUtc.Ticks / 600000000);
            if (recurrence.LastReminderDateTimeUtc.IsEmpty)
            {
                XmlHelper.UpdateAttribute(doc, node, "lastReminderDateTimeUtc", DateTime.MinValue);
            }
            else
            {
                XmlHelper.UpdateAttribute(doc, node, "lastReminderDateTimeUtc", recurrence.LastReminderDateTimeUtc.Ticks / 600000000);
            }
            return node;
        }
        #endregion
        #region CreateObjectFromNode
        private Appointment CreateAppointmentFromNode(XmlNode appointmentNode)
        {
            if (appointmentNode == null) throw new ArgumentException("A reference to a valid XmlNode must be passed in.", "appointmentNode");
            Appointment appt = new Appointment(this.WebScheduleInfo);
            appt.AllDayEvent = XmlHelper.GetAttributeAsBoolean(appointmentNode, "allDayEvent", false);
            appt.Description = XmlHelper.GetAttributeAsString(appointmentNode, "description", string.Empty);
            appt.EnableReminder = XmlHelper.GetAttributeAsBoolean(appointmentNode, "enableReminder", true);

            //Note - Order matters!  Must set the StartTime before setting the EndTime.
            appt.StartDateTimeUtc = new SmartDate(new DateTime(XmlHelper.GetAttributeAsLong(appointmentNode, "startDateTimeUtc", 0L) * 600000000));
            appt.EndDateTimeUtc = new SmartDate(new DateTime(XmlHelper.GetAttributeAsLong(appointmentNode, "endDateTimeUtc", 0L) * 600000000));
            appt.Importance = (Importance)XmlHelper.GetAttributeAsInt(appointmentNode, "importance", (int)(Importance.Normal));
            appt.Location = XmlHelper.GetAttributeAsString(appointmentNode, "location", string.Empty);
            appt.ReminderInterval = new TimeSpan(XmlHelper.GetAttributeAsLong(appointmentNode, "reminderInterval", 0L) * 600000000);
            appt.Key = XmlHelper.GetAttributeAsString(appointmentNode, "key", string.Empty);
            appt.DataKey = XmlHelper.GetAttributeAsString(appointmentNode, "dataKey", string.Empty);
            appt.Status = (ActivityStatus)XmlHelper.GetAttributeAsInt(appointmentNode, "status", (int)(ActivityStatus.Normal));
            appt.ShowTimeAs = (ShowTimeAs)XmlHelper.GetAttributeAsInt(appointmentNode, "showTimeAs", (int)(ShowTimeAs.Busy));
            appt.Subject = XmlHelper.GetAttributeAsString(appointmentNode, "subject", string.Empty);
            appt.ResourceKey = XmlHelper.GetAttributeAsString(appointmentNode, "resourceKey", "-999");
            appt.RecurrenceKey = XmlHelper.GetAttributeAsString(appointmentNode, "recurrenceKey", "-999");
            if (appointmentNode.Attributes.GetNamedItem("originalStartDateTimeUtc") != null)
            {
                appt.SetValue("VarianceKey", new Guid(appointmentNode.Attributes.GetNamedItem("varianceKey").Value));
                appt.SetValue("OriginalStartDateTimeUtc", new SmartDate(new DateTime(XmlHelper.GetAttributeAsLong(appointmentNode, "originalStartDateTimeUtc", 0L) * 600000000)));
                appt.SetValue("Kind", 3);
            }
            else if (appointmentNode.Attributes.GetNamedItem("varianceKey") != null)
            {
                appt.SetValue("VarianceKey", new Guid(appointmentNode.Attributes.GetNamedItem("varianceKey").Value));
            }
            return appt;
        }
        private Resource CreateResourceFromNode(XmlNode resourceNode)
        {
            if (resourceNode == null) throw new ArgumentException("A reference to a valid XmlNode must be passed in.", "resourceNode");
            Resource resource = new Resource();
            resource.DataKey = XmlHelper.GetAttributeAsString(resourceNode, "dataKey", String.Empty);
            resource.Description = XmlHelper.GetAttributeAsString(resourceNode, "description", String.Empty);
            resource.EmailAddress = XmlHelper.GetAttributeAsString(resourceNode, "emailAddress", String.Empty);
			if (XmlHelper.GetAttributeAsBoolean(resourceNode, "enableEmailReminders", false))
			{
				resource.EnableEmailReminders = Infragistics.WebUI.Shared.DefaultableBoolean.True;
			}
            resource.Name = XmlHelper.GetAttributeAsString(resourceNode, "name", String.Empty);
            resource.Key = XmlHelper.GetAttributeAsString(resourceNode, "key", String.Empty);
            resource.EnableReminders = (DefaultableBoolean)XmlHelper.GetAttributeAsInt(resourceNode, "enableReminders", (int)(DefaultableBoolean.NotSet));
            return resource;
        }
        private Recurrence CreateRecurrenceFromNode(XmlNode appointmentNode, XmlNode recurrenceNode)
        {
            Recurrence recur;
            if (recurrenceNode == null) throw new ArgumentException("A reference to a valid XmlNode must be passed in.", "recurrenceNode");
            if (appointmentNode != null)
            {
                Appointment appt = this.CreateAppointmentFromNode(appointmentNode);
                appt.CreateRecurrence();
                recur = appt.Recurrence;
            }
            else
            {
                recur = new Recurrence(null);
            }

            recur.Key = XmlHelper.GetAttributeAsString(recurrenceNode, "recurrenceID", String.Empty);
            if (appointmentNode != null)
            {
                appointmentNode.Attributes.GetNamedItem("recurrenceKey").Value = recur.Key;
            }
            recur.Period = (RecurrencePeriod)(XmlHelper.GetAttributeAsInt(recurrenceNode, "period", (int)(RecurrencePeriod.Weekly)));
            recur.PeriodMultiple = XmlHelper.GetAttributeAsInt(recurrenceNode, "periodMultiple", 1);
            recur.DayOfWeekMaskUtc = (RecurrenceDayOfWeekMask)XmlHelper.GetAttributeAsInt(recurrenceNode, "dayOfWeekMaskUtc", (int)(RecurrenceDayOfWeekMask.None));
            recur.MonthOfYear = XmlHelper.GetAttributeAsInt(recurrenceNode, "monthOfYear", 1);
            recur.DayOfMonth = XmlHelper.GetAttributeAsInt(recurrenceNode, "dayOfMonth", 0);
            recur.EndDateUtc = new SmartDate(new DateTime(XmlHelper.GetAttributeAsLong(recurrenceNode, "endDateUtc", 0L) * 600000000));
            recur.LastReminderDateTimeUtc = new SmartDate(new DateTime(XmlHelper.GetAttributeAsLong(recurrenceNode, "lastReminderDateTimeUtc", 0L) * 600000000));

            return recur;
        }
        #endregion
        #endregion
        #region OnInitialize
        protected virtual void OnInitializeActivity(Activity activity, IList activities, Resource organizer)
        {
            if (activity != null && organizer != null && !this.WebScheduleInfo.EnableMultiResourceView)
            {
                if (activity.ResourceKey != organizer.Key)
                {
                    activity.ResourceKey = organizer.Key;
                }
                activities.Add(activity);
            }
            else
            {
                activities.Add(activity);
            }
        }
        protected virtual void OnInitializeResource(Resource resource, IList resources)
        {
            if (resource != null && resources != null)
            {
                if (IsUniqueResource(resource, resources))
                {
                    resources.Add(resource);
                }
            }
        }
        protected virtual void OnInitializeReminder(Appointment reminder, IList reminders, Resource organizer)
        {
            if (reminder != null)
            {
                if (IsReminderInsideOfWindow(reminder))
                {
                    reminder.ResourceKey = organizer.Key;
                    reminders.Add(reminder);
                }
            }
        }
        #endregion
        #region Utility Methods
        protected bool IsReminderInsideOfWindow(Appointment reminder)
        {
            return (reminder.StartDateTimeUtc.Subtract(reminder.ReminderInterval) < SmartDate.Now.ToUniversalTime());
        }
        protected bool IsUniqueResource(Resource resource, IList resources)
        {
            if (resources == null || resources.Count == 0) return true;
            foreach (Resource existingResource in resources)
            {
                if (resource.DataKey == existingResource.DataKey)
                    return false;
            }
            return true;
        }

        class XmlHelper
        {
            public static XmlNode UpdateAttribute(XmlDocument doc, XmlNode node, string attribute, object val)
            {
                XmlAttribute attrib = null;
                attrib = node.Attributes[attribute];
                if (attrib == null)
                {
                    attrib = doc.CreateAttribute(attribute);
                    node.Attributes.Append(attrib);
                }
                attrib.Value = System.Convert.ToString(val);
                return node;
            }
            public static string GetAttributeAsString(XmlNode node, string attribute, string defaultIfNull)
            {
                return (string)GetAttributeAsType(node, attribute, typeof(System.String), defaultIfNull);
            }
            public static bool GetAttributeAsBoolean(XmlNode node, string attribute, bool defaultIfNull)
            {
                return (bool)GetAttributeAsType(node, attribute, typeof(System.Boolean), defaultIfNull);
            }
            public static int GetAttributeAsInt(XmlNode node, string attribute, int defaultIfNull)
            {
                return (int)GetAttributeAsType(node, attribute, typeof(System.Int32), defaultIfNull);
            }
            public static long GetAttributeAsLong(XmlNode node, string attribute, long defaultIfNull)
            {
                return (long)GetAttributeAsType(node, attribute, typeof(System.Int64), defaultIfNull);
            }
            public static object GetAttributeAsType(XmlNode node, string attribute, Type type, object defaultIfNull)
            {
                if (node != null && attribute != null && attribute.Length > 0 && type != null)
                {
                    XmlAttribute attrib = node.Attributes[attribute];
                    if (attrib != null && attrib.Value != null)
                    {
                        try
                        {
                            object val = System.Convert.ChangeType(attrib.Value, type);
                            return val;
                        }
                        catch (FormatException) { }
                        catch (InvalidCastException) { }
                    }
                }
                return defaultIfNull;
            }
        }

        #endregion
    }
}
