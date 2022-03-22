namespace Forms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	/// <summary>
	///		Summary description for Appointment1.
	/// </summary>
	public partial class AppointmentAddUC : System.Web.UI.UserControl
	{
        protected System.Web.UI.WebControls.Label labelEndTime;
        protected Forms.ComboBox combobox1;
        protected Forms.ComboBox Combobox2;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            this.wdcStartTime.Attributes.CssStyle["height"] = " ";
            this.wdcStartTime.EditStyle.CustomRules = "height:;";
            this.wdcEndTime.Attributes.CssStyle["height"] = " ";
            this.wdcEndTime.EditStyle.CustomRules = "height:;";
            this.LocalizeStrings();
        }

        #region LocalizeStrings

        private void LocalizeStrings()
        {
            this.statusText.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_RecurrenceStatus").ToString();
            this.SubjectLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_Subject").ToString();
            this.LocationLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_Location").ToString();
            this.recurrenceDescriptionText.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_RecurrenceDescriptionText").ToString();
            this.StartTimeLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_StartTime").ToString();
            this.startdateLabel508.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_StartDate_Section508").ToString();
            this.startTimeLabel508.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_StartTime_Section508").ToString();
            this.AllDayEventLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_AllDayEvent").ToString();
            this.EndTimeLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_EndTime").ToString();
            this.endTimeLabel508.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_EndTime_Section508").ToString();
            this.endDateLabel508.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_EndDate_Section508").ToString();
            this.ReminderLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_Reminder").ToString();
            this.ReminderIntervalSection508.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ReminderInterval_Section508").ToString();
            this.ri_eightHours.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ReminderIntervalOption_EightHours").ToString();
            this.ri_fifteenMin.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ReminderIntervalOption_FifteenMinutes").ToString();
            this.ri_fiveMin.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ReminderIntervalOption_FiveMinutes").ToString();
            this.ri_fourHours.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ReminderIntervalOption_FourHours").ToString();
            this.ri_halfDay.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ReminderIntervalOption_HalfDay").ToString();
            this.ri_oneDay.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ReminderIntervalOption_OneDay").ToString();
            this.ri_oneHour.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ReminderIntervalOption_OneHour").ToString();
            this.ri_tenMin.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ReminderIntervalOption_TenMinutes").ToString();
            this.ri_thirtyMin.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ReminderIntervalOption_ThirtyMinutes").ToString();
            this.ri_twoDays.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ReminderIntervalOption_TowDays").ToString();
            this.ri_twoHours.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ReminderIntervalOption_TwoHours").ToString();
            this.ri_zeroMin.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ReminderIntervalOption_ZeroMinutes").ToString();
            this.ShowTimeAsLabel.Text = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ShowTimeAs").ToString();
            this.showTimeAsLabelSection508.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ShowTimeAs_Section508").ToString();
            this.showTimeAs_Free.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ShowTimeAs_Free").ToString();
            this.showTimeAs_Busy.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ShowTimeAs_Busy").ToString();
            this.showTimeAs_OutofOffice.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ShowTimeAs_OutofOffice").ToString();
            this.showTimeAs_Tentative.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_ShowTimeAs_Tentative").ToString();
            this.descriptionSection508.InnerHtml = this.GetGlobalResourceObject("Strings", "AppointmentDialog_Description_Section508").ToString();

        }

        #endregion

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
        ///		Required method for Designer support - do not modify
        ///		the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {

        }
        #endregion
	}
}
