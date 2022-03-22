using System;
using System.Data;
using System.Web.UI;
using Infragistics.WebUI.WebSchedule;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private DataSet ds = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.WebMonthView1.Style.Add(HtmlTextWriterStyle.Overflow, "hidden");

        this.wsInfo.AppointmentFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx";
        this.wsInfo.ReminderFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/Reminder.aspx";

        if (!IsPostBack)
        {
            LoadData();
        }

        WebScheduleGenericProvider1.AppointmentBinding.DescriptionMember = "Description";
        WebScheduleGenericProvider1.AppointmentBinding.DataMember = "Appointments";
        WebScheduleGenericProvider1.ResourceBinding.DataMember = "Resources";

        WebScheduleGenericProvider1.ActivityDataSource = this.Session["ds"];
        WebScheduleGenericProvider1.VarianceDataSource = this.Session["ds"];

        WebScheduleGenericProvider1.ResourceDataSource = this.Session["ds"];
    }

    protected void LoadData()
    {
        ds = new DataSet("GenericDataProviderSample");

        DataTable appointmentsTable = new DataTable("Appointments");
        appointmentsTable.Columns.Add("ID", typeof(int));
        appointmentsTable.Columns.Add("StartDateTimeUtc", typeof(DateTime));
        appointmentsTable.Columns.Add("Duration", typeof(int));
        appointmentsTable.Columns.Add("Subject", typeof(string));
        appointmentsTable.Columns.Add("AllDayEvent", typeof(bool));
        appointmentsTable.Columns.Add("Location", typeof(string));
        appointmentsTable.Columns.Add("Description", typeof(string));
        appointmentsTable.Columns.Add("Status", typeof(int));
        appointmentsTable.Columns.Add("EnableReminders", typeof(bool));
        appointmentsTable.Columns.Add("ShowTimeAs", typeof(int));
        appointmentsTable.Columns.Add("Importance", typeof(int));
        appointmentsTable.Columns.Add("VarianceID", typeof(string));
        appointmentsTable.Columns.Add("RecurrencePattern", typeof(string));
        appointmentsTable.Columns.Add("RecurrenceID", typeof(int));
        appointmentsTable.Columns.Add("OriginalStartDateTimeUtc", typeof(DateTime));

        appointmentsTable.Columns.Add("ResourceKey", typeof(string));

        appointmentsTable.Rows.Add(
            CreateAppointment(1, DateTime.Today.AddHours(9), 3600, "Sales Expo", "NYC", "Description", false, "1")
            );

        appointmentsTable.Rows.Add(
            CreateAppointment(2, DateTime.Today.AddDays(3).AddHours(14), 4000, "Win 7 Rollout ", "US", "Description", false, "1")
            );

        appointmentsTable.Rows.Add(
            CreateAppointment(3, DateTime.Today.AddDays(5).AddHours(11), 4600, "Finalise Merger", "Milan", "Description", false, "1")
            );


        appointmentsTable.Rows.Add(
           CreateAppointment(4, DateTime.Today.AddDays(10).AddHours(13), 3600, "Tour Sites", "India", "Description", false, "2")
           );


        appointmentsTable.Rows.Add(
            CreateAppointment(5, DateTime.Today.AddDays(-3).AddHours(10), 4600, "Roadshow", "Abu Dhabi", "Description", false, "2")
            );

        appointmentsTable.Rows.Add(
            CreateAppointment(6, DateTime.Today.AddDays(-10).AddHours(13), 3200, "VC Golf", "Country Club", "Description", false, "2")
            );


        appointmentsTable.Rows.Add(
            CreateAppointment(7, DateTime.Today.AddDays(-10).AddHours(13), 3600, "Conf Call", "London", "Description", false, "3")
            );

        appointmentsTable.Rows.Add(
            CreateAppointment(8, DateTime.Today.AddDays(-5).AddHours(9), 3600 * 24 * 2, "DevReach Conference", "Sofia",
            "The fourth edition of the premier developer conference on Microsoft technologies in SEE", true, "3")
            );

        DataTable resourcesTable = new DataTable("Resources");

        resourcesTable.Columns.Add("ID", typeof(int));
        resourcesTable.Columns.Add("ResourceName", typeof(string));
        resourcesTable.Columns.Add("ResourceDescription", typeof(string));
        resourcesTable.Columns.Add("EmailAddress", typeof(string));

        resourcesTable.Rows.Add(new object[] { -999, "Unassigned", "Unassigned Resource", "unassigned@resources.com" });
        resourcesTable.Rows.Add(new object[] { 1, "Allyson Tuley", "Allyson Tuley", "aTuley@resources.com" });
        resourcesTable.Rows.Add(new object[] { 2, "Ted Redfern", "Ted Redfern", "tRedfern@resources.com" });
        resourcesTable.Rows.Add(new object[] { 3, "Jamie Gadomski", "Jamie Gadomski", "jGadomski@resources.com" });

        ds.Tables.Add(appointmentsTable);

        ds.Tables.Add(resourcesTable);

        this.Session["ds"] = ds;
    }

    protected object[] CreateAppointment(int id, DateTime startDateTime, int appointmentDuration,
        string appName, string location, string appDescription, bool allDayEvent, string resourceKey)
    {
        return new object[] 
                { 
                    id, 
                    startDateTime.ToUniversalTime(), 
                    appointmentDuration, 
                    appName, 
                    allDayEvent, 
                    location, 
                    appDescription, 
                    1, 
                    false, 
                    1, 
                    1, 
                    Guid.NewGuid().ToString(), 
                    "", 
                    null, 
                    null, 
                    resourceKey 
                };
    }


    protected void WebScheduleInfo1_ActivityAdding(object sender, CancelableActivityEventArgs e)
    {
        e.Activity.DataKey = new Random().Next();
    }

    protected void wsInfo_VarianceAdding(object sender, CancelableActivityEventArgs e)
    {
        e.Activity.DataKey = new Random().Next();
    }

}
