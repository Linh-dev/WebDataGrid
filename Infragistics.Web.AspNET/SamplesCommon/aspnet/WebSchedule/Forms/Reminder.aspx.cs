using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Forms
{
	/// <summary>
	/// Summary description for Reminder.
	/// </summary>
	public partial class Reminder : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label2;
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
            this.LocalizeStrings();
            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "ReminderDialogScriptArray", this.GetJavascriptArray());
        }

        #region GetJavascriptArray

        private string GetJavascriptArray()
        {
            string array = "<script type='text/javascript'> \r\n var ReminderDialogStrings = [" +                                
                                "'" + this.GetGlobalResourceObject("Strings","OneWeek") + "'," +                            //0
                                "'" + this.GetGlobalResourceObject("Strings","Weeks") + "'," +                              //1
                                "'" + this.GetGlobalResourceObject("Strings","OneDay") + "'," +                             //2
                                "'" + this.GetGlobalResourceObject("Strings","Days") + "'," +                               //3
                                "'" + this.GetGlobalResourceObject("Strings","OneHour") + "'," +                            //4
                                "'" + this.GetGlobalResourceObject("Strings","Hours") + "'," +                              //5
                                "'" + this.GetGlobalResourceObject("Strings","OneMinute") + "'," +                          //6
                                "'" + this.GetGlobalResourceObject("Strings","Minutes") + "'," +                            //7
                                "'" + this.GetGlobalResourceObject("Strings","OneMinuteOrLess") + "'," +                    //8
                                "'" + this.GetGlobalResourceObject("Strings","ReminderDialog_NoSubject") + "'," +           //9
                                "'" + this.GetGlobalResourceObject("Strings","ReminderDialog_LocationLabel") + "'," +       //10
                                "'" + this.GetGlobalResourceObject("Strings","JS_ReminderDialog_Overdue") + "'," +          //11
                                "'" + this.GetGlobalResourceObject("Strings","JS_ReminderDialog_Now") + "'" +               //12
                            "]; \r\n </script>";

            return array;
        }

        #endregion
        #region LocalizeStrings

        private void LocalizeStrings()
        {
            this.Title = this.GetGlobalResourceObject("Strings", "ReminderDialogTitle").ToString();
            this.Subject.InnerHtml = this.GetGlobalResourceObject("Strings","ReminderDialog_NoSubject").ToString();
            this.LocationLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "ReminderDialog_LocationLabel").ToString();
            this.TimeLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "ReminderDialog_TimeLabel").ToString();
            this.SubjectHeaderLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "ReminderDialog_SubjectHeader").ToString();
            this.DueInHeaderLable.InnerHtml = this.GetGlobalResourceObject("Strings", "ReminderDialog_DueInHeader").ToString();
            this.DismissAll.Value = this.GetGlobalResourceObject("Strings", "ReminderDialog_DimissAllButton").ToString();
            this.ClickSnoozeLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "ReminderDialog_ClickSnoozeLabel").ToString();
            this.OpenItem.Value = this.GetGlobalResourceObject("Strings", "ReminderDialog_OpenItemButton").ToString();
            this.Dismiss.Value = this.GetGlobalResourceObject("Strings", "ReminderDialog_DismissButton").ToString();
            this.Snooze.Value = this.GetGlobalResourceObject("Strings", "ReminderDialog_SnoozeButton").ToString();
            this.CloseButton.Value = this.GetGlobalResourceObject("Strings", "ReminderDialog_CloseButton").ToString();
            this.fiveMinutesOption.InnerHtml = "5 " + this.GetGlobalResourceObject("Strings","Minutes");
            this.tenMinutesOption.InnerHtml = "10 " + this.GetGlobalResourceObject("Strings","Minutes");
            this.fifteenMinutesOption.InnerHtml = "15 " + this.GetGlobalResourceObject("Strings","Minutes");
            this.oneHourOption.InnerHtml = "1 " + this.GetGlobalResourceObject("Strings","OneHour");
            this.twoHoursOption.InnerHtml = "2 " + this.GetGlobalResourceObject("Strings","Hours");
            this.fourHoursOption.InnerHtml = "4 " + this.GetGlobalResourceObject("Strings","Hours");
            this.eightHoursOption.InnerHtml = "8 " + this.GetGlobalResourceObject("Strings","Hours");
            this.oneDayOption.InnerHtml = "1 " + this.GetGlobalResourceObject("Strings","OneDay");
            this.twoDaysOption.InnerHtml = "2 " + this.GetGlobalResourceObject("Strings","Days");
            this.threeDaysOption.InnerHtml = "3 " + this.GetGlobalResourceObject("Strings","Days");
            this.oneWeekOption.InnerHtml = "1 " + this.GetGlobalResourceObject("Strings","OneWeek");
            this.twoWeeksOption.InnerHtml = "2 " + this.GetGlobalResourceObject("Strings","Weeks");
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
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion
	}
}

