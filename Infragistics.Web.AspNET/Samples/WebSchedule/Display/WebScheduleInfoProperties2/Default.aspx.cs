using System;
using System.Globalization;
using System.Xml;
using Infragistics.Web.UI.EditorControls;

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
			
			if(!IsPostBack)
			{
				
				this.defaultReminderIntervalEditor.Value = new DateTime(this.WebScheduleInfo1.DefaultReminderInterval.Ticks);
				foreach(string mystring in System.Enum.GetNames(typeof(Infragistics.WebUI.WebSchedule.FirstDayOfWeek)))
				{
					this.ddFirstDayOfWeek.Items.Add(mystring);
				}
				this.ddFirstDayOfWeek.SelectedIndex = 1;
				
				foreach(string mystring in System.Enum.GetNames(typeof(Infragistics.WebUI.WebSchedule.TimeDisplayFormat)))
				{
					this.ddTimeDisplayFormat.Items.Add(mystring);
				}
				this.ddTimeDisplayFormat.SelectedIndex = 2;

				foreach (string mystring in System.Enum.GetNames(typeof(System.Globalization.CalendarWeekRule)))
				{
					this.ddWeekRule.Items.Add(mystring);
				}
				this.ddWeekRule.SelectedIndex = 2;

				foreach (CultureInfo myculture in CultureInfo.GetCultures(CultureTypes.AllCultures))
				{
					if (!myculture.IsNeutralCulture)
					{
						string localeID = myculture.ToString();
						this.ddCultureInfo.Items.Add(localeID);

						if (localeID == CultureInfo.CurrentCulture.ToString())
							this.ddCultureInfo.SelectedIndex = this.ddCultureInfo.Items.Count - 1;
					}
				}

				this.ddEnableReminders.Items.Add("True");
				this.ddEnableReminders.Items.Add("False");
				this.ddAllowAllDayEvents.Items.Add("True");
				this.ddAllowAllDayEvents.Items.Add("False");
				this.ddEnableProgressIndicator.Items.Add("True");
				this.ddEnableProgressIndicator.Items.Add("False");
				this.ddEnableProgressIndicator.SelectedIndex = (this.WebScheduleInfo1.EnableProgressIndicator) ? 0 : 1;
				this.ddSmartCallbacks.Items.Add("True");
				this.ddSmartCallbacks.Items.Add("False");
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
			this.ddEnableReminders.SelectedIndexChanged += new System.EventHandler(this.selectedIndexChanged);
			this.ddTimeDisplayFormat.SelectedIndexChanged += new System.EventHandler(this.selectedIndexChanged);
			this.ddFirstDayOfWeek.SelectedIndexChanged += new System.EventHandler(this.selectedIndexChanged);
			this.ddAllowAllDayEvents.SelectedIndexChanged += new System.EventHandler(this.selectedIndexChanged);
			this.ddSmartCallbacks.SelectedIndexChanged += new System.EventHandler(this.selectedIndexChanged);
			this.ddEnableProgressIndicator.SelectedIndexChanged += new System.EventHandler(this.selectedIndexChanged);
			this.ddWeekRule.SelectedIndexChanged += new System.EventHandler(this.selectedIndexChanged);
			this.ddCultureInfo.SelectedIndexChanged += new System.EventHandler(this.selectedIndexChanged);            
			this.defaultReminderIntervalEditor.ValueChanged += new TextEditorValueChangedEventHandler(defaultReminderIntervalEditor_ValueChanged);
		}

		#endregion
		protected void selectedIndexChanged(object sender, EventArgs e)
		{
			if (sender == this.ddSmartCallbacks)
			{
				this.WebScheduleInfo1.EnableSmartCallbacks = (this.ddSmartCallbacks.SelectedIndex == 0);
				this.ddEnableProgressIndicator.Enabled = this.WebScheduleInfo1.EnableSmartCallbacks;
				this.lblEnableProgressIndicator.Enabled = this.WebScheduleInfo1.EnableSmartCallbacks;
			}
			else if (sender == this.ddEnableProgressIndicator)
			{
				this.WebScheduleInfo1.EnableProgressIndicator = (this.ddEnableProgressIndicator.SelectedIndex == 0);
			}
			else if (sender == this.ddAllowAllDayEvents)
			{
				this.WebScheduleInfo1.AllowAllDayEvents=System.Boolean.Parse(this.ddAllowAllDayEvents.SelectedItem.ToString());
			}
			else if (sender == this.ddEnableReminders)
			{
				this.WebScheduleInfo1.EnableReminders=System.Boolean.Parse(this.ddEnableReminders.SelectedItem.ToString());
				this.defaultReminderIntervalEditor.Enabled = this.WebScheduleInfo1.EnableReminders;
				this.lblDefaultReminderInterval.Enabled = this.WebScheduleInfo1.EnableReminders;
			}
			else if (sender == this.ddFirstDayOfWeek)
			{
				this.WebScheduleInfo1.FirstDayOfWeek=(Infragistics.WebUI.WebSchedule.FirstDayOfWeek)Enum.Parse(typeof(Infragistics.WebUI.WebSchedule.FirstDayOfWeek),this.ddFirstDayOfWeek.SelectedItem.Text);
			}
			else if (sender == this.ddTimeDisplayFormat)
			{
				this.WebScheduleInfo1.TimeDisplayFormat=(Infragistics.WebUI.WebSchedule.TimeDisplayFormat)Enum.Parse(typeof(Infragistics.WebUI.WebSchedule.TimeDisplayFormat),this.ddTimeDisplayFormat.SelectedItem.Text);
			}
			else if (sender == this.ddWeekRule)
			{
				this.WebScheduleInfo1.WeekRule = (System.Globalization.CalendarWeekRule)Enum.Parse(typeof(System.Globalization.CalendarWeekRule), this.ddWeekRule.SelectedItem.Text);
			}
			else if (sender == this.ddCultureInfo)
			{
				CultureInfo mycultureinfo = new CultureInfo(this.ddCultureInfo.SelectedItem.ToString());
				this.WebScheduleInfo1.CultureInfo = mycultureinfo;
			}
		}

		//private void reminderIntervalChanged(object sender, Infragistics.WebUI.WebDataInput.ValueChangeEventArgs e)
		//{
		//    this.WebScheduleInfo1.DefaultReminderInterval = System.TimeSpan.Parse(this.defaultReminderIntervalEditor.Text);
		//}

		void defaultReminderIntervalEditor_ValueChanged(object sender, TextEditorValueChangedEventArgs e)
		{
			this.WebScheduleInfo1.DefaultReminderInterval = System.TimeSpan.Parse(this.defaultReminderIntervalEditor.Text);
		}
	}

