using System;
using System.Xml;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
        protected System.Data.OleDb.OleDbConnection oleDbConnection1;
	
		private XmlDocument WebScheduleData
		{
			get
			{
				if (Session["WebScheduleData"] == null)
				{
					Session["WebScheduleData"] = WebScheduleSamples.Util.GenerateDocument();
				}
				return (XmlDocument)Session["WebScheduleData"];
			}	
		}

		protected void Page_Load(object sender, System.EventArgs e)
		{
            this.WebScheduleInfo1.AppointmentFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx";
            this.WebScheduleInfo1.ReminderFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/Reminder.aspx";

            this.oleDbConnection1.ConnectionString = this.GetMdbConnectionString("WebScheduleSample.mdb");

			//The Custom Provider
			Infragistics.WebUI.Data.WebScheduleXMLDataProvider theCustomProvider 
				= new Infragistics.WebUI.Data.WebScheduleXMLDataProvider(this.WebScheduleData);
			Page.Controls.Add(theCustomProvider);
			theCustomProvider.WebScheduleInfo = this.WebScheduleInfo1;


            if (!IsPostBack)
            {
                this.workDayStartTimeEditor.Value = new DateTime(this.WebScheduleInfo1.WorkDayStartTime.Ticks);
                this.workDayEndTimeEditor.Value = new DateTime(this.WebScheduleInfo1.WorkDayEndTime.Ticks);

                foreach (string mystring in System.Enum.GetNames(typeof(Infragistics.WebUI.WebSchedule.TimeDisplayFormat)))
                {
                    this.ddTimeDisplayFormat.Items.Add(mystring);
                }

                foreach (string mystring in System.Enum.GetNames(typeof(Infragistics.WebUI.WebSchedule.ActiveDayClientSynchronization)))
                {
                    this.ddActiveDayClientSynchronization.Items.Add(mystring);
                }
                this.ddActiveDayClientSynchronization.SelectedIndex = 1;

                this.ddSmartCallbacks.Items.Add("True");
                this.ddSmartCallbacks.Items.Add("False");
                this.ddSmartCallbacks.SelectedIndex = 1;
            }
        }

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.oleDbConnection1 = new System.Data.OleDb.OleDbConnection();
		}
		#endregion

        public void selectedIndexChanged(object sender, EventArgs e)
        {
            if (sender == this.ddSmartCallbacks)
            {
                this.WebScheduleInfo1.EnableSmartCallbacks = (this.ddSmartCallbacks.SelectedIndex == 0);
            }
            else if (sender == this.ddTimeDisplayFormat)
            {
                this.WebScheduleInfo1.TimeDisplayFormat = (Infragistics.WebUI.WebSchedule.TimeDisplayFormat)Enum.Parse(typeof(Infragistics.WebUI.WebSchedule.TimeDisplayFormat), this.ddTimeDisplayFormat.SelectedItem.Text);
            }
            else if (sender == this.ddActiveDayClientSynchronization)
            {
                this.WebScheduleInfo1.ActiveDayClientSynchronization = (Infragistics.WebUI.WebSchedule.ActiveDayClientSynchronization)Enum.Parse(typeof(Infragistics.WebUI.WebSchedule.ActiveDayClientSynchronization), this.ddActiveDayClientSynchronization.SelectedItem.Text);
            }
        }


        public void buttons_Click(object sender, EventArgs e)
        {
            if (sender == this.btnChangeWorkDay)
            {
                this.WebScheduleInfo1.WorkDayEndTime.Hour = this.workDayEndTimeEditor.Date.Hour;
                this.WebScheduleInfo1.WorkDayEndTime.Minute = this.workDayEndTimeEditor.Date.Minute;

                this.WebScheduleInfo1.WorkDayStartTime.Hour = this.workDayStartTimeEditor.Date.Hour;
                this.WebScheduleInfo1.WorkDayStartTime.Minute = this.workDayStartTimeEditor.Date.Minute;
            }
        }
    }

