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
using Infragistics.WebUI.WebSchedule.UltraWebToolbar;

namespace Forms
{
	public partial class AppointmentAdd : System.Web.UI.Page
	{
        protected Forms.ComboBox combobox1;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            this.UltraWebTab1.Tabs.GetTab(0).ContentPane.UserControlUrl = "AppointmentAdd.ascx";
            this.UltraWebTab1.CssClass = "Fonts BackgroundTab";
            this.LocalizeStrings();
            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "AppointmentDialogScriptArray", this.GetJavascriptArray());
        }

        #region GetJavascriptArray

        private string GetJavascriptArray()
        {
            string array = "<script type='text/javascript'> \r\n var AppointmentDialogStrings = [" +
                                "'" + this.GetGlobalResourceObject("Strings", "JS_AppointmentDialog_Error_CantFindDateChooser") + "'," +             //0
                                "'" + this.GetGlobalResourceObject("Strings", "JS_AppointmentDialog_RecurrenceDescriptionLabel") + "'," +            //1
                                "'" + this.GetGlobalResourceObject("Strings", "JS_AppointmentDialog_Error_OccurrenceBeforeStartDate") + "'," +       //2
                                "'" + this.GetGlobalResourceObject("Strings", "JS_AppointmentDialog_Error_OccurrenceSkipPrevOccurrence") + "'," +    //3
                                "'" + this.GetGlobalResourceObject("Strings", "JS_AppointmentDialog_Error_OccurrenceAfterEndDay") + "'," +           //4
                                "'" + this.GetGlobalResourceObject("Strings", "JS_AppointmentDialog_Error_OccurrenceSkipNextOccurrence") + "'," +    //5
                                "'" + this.GetGlobalResourceObject("Strings", "JS_AppointmentDialog_ReccurrenceStatus") + "'," +                     //6
                                "'" + this.GetGlobalResourceObject("Strings", "OneWeek") + "'," +                                                    //7 
                                "'" + this.GetGlobalResourceObject("Strings", "Weeks") + "'," +                                                      //8
                                "'" + this.GetGlobalResourceObject("Strings", "OneDay") + "'," +                                                     //9
                                "'" + this.GetGlobalResourceObject("Strings", "Days") + "'," +                                                       //10
                                "'" + this.GetGlobalResourceObject("Strings", "OneHour") + "'," +                                                    //11
                                "'" + this.GetGlobalResourceObject("Strings", "Hours") + "'," +                                                      //12
                                "'" + this.GetGlobalResourceObject("Strings", "OneMinute") + "'," +                                                  //13
                                "'" + this.GetGlobalResourceObject("Strings", "Minutes") + "'," +                                                    //14
                                "'" + this.GetGlobalResourceObject("Strings", "OneMinuteOrLess") + "'" +                                             //15
                            "]; \r\n </script>";

            return array;
        }

        #endregion

        #region LocalizeStrings()

        private void LocalizeStrings()
        {
            TBarButton saveButton = this.UltraWebToolbar2.Items.FromKeyButton("Save");
            saveButton.Text = "<NOBR><img style='margin:0;' igimg='1' src= './Images/save.gif' align ='AbsMiddle' />&nbsp; " + this.GetGlobalResourceObject("Strings", "AppointmentDialog_Toolbar_SaveAndClose_Text") + " &nbsp;</NOBR>";
            saveButton.ToolTip = this.GetGlobalResourceObject("Strings", "AppointmentDialog_Toolbar_SaveAndClose_Tooltip").ToString();
            saveButton.Images.DefaultImage.AlternateText = this.GetGlobalResourceObject("Strings", "AppointmentDialog_Toolbar_SaveAndClose_AltText").ToString();

            TBarButton printButton = this.UltraWebToolbar2.Items.FromKeyButton("Print");
            printButton.ToolTip = this.GetGlobalResourceObject("Strings", "AppointmentDialog_Toolbar_Print_Tooltip").ToString();
            printButton.Images.DefaultImage.AlternateText = this.GetGlobalResourceObject("Strings", "AppointmentDialog_Toolbar_Print_AltText").ToString();

            TBarButton recurrenceButton = this.UltraWebToolbar2.Items.FromKeyButton("Recurrence");
            recurrenceButton.Text = "<NOBR><img style='margin:0;' igimg='1' src= './Images/recur.gif' align ='AbsMiddle'/>&nbsp; " + this.GetGlobalResourceObject("Strings", "AppointmentDialog_Toolbar_Recurrence_Text") + " &nbsp;</NOBR>";
            recurrenceButton.ToolTip = this.GetGlobalResourceObject("Strings", "AppointmentDialog_Toolbar_Recurrence_Tooltip").ToString();
            recurrenceButton.Images.DefaultImage.AlternateText = this.GetGlobalResourceObject("Strings", "AppointmentDialog_Toolbar_Recurrence_AltText").ToString();

            TBarButton deleteButton = this.UltraWebToolbar2.Items.FromKeyButton("Delete");
            deleteButton.ToolTip = this.GetGlobalResourceObject("Strings", "AppointmentDialog_Toolbar_Delete_Tooltip").ToString();
            deleteButton.Images.DefaultImage.AlternateText = this.GetGlobalResourceObject("Strings", "AppointmentDialog_Toolbar_Delete_AltText").ToString();

            TBarButton highButton = this.UltraWebToolbar2.Items.FromKeyButtonGroup("Importance").Buttons[0];
            highButton.ToolTip = this.GetGlobalResourceObject("Strings", "AppointmentDialog_Toolbar_HightPriority_Tooltip").ToString();
            highButton.Images.DefaultImage.AlternateText = this.GetGlobalResourceObject("Strings", "AppointmentDialog_Toolbar_HightPriority_AltText").ToString();

            TBarButton lowButton = this.UltraWebToolbar2.Items.FromKeyButtonGroup("Importance").Buttons[1];
            lowButton.ToolTip = this.GetGlobalResourceObject("Strings", "AppointmentDialog_Toolbar_LowPriority_Tooltip").ToString();
            lowButton.Images.DefaultImage.AlternateText = this.GetGlobalResourceObject("Strings", "AppointmentDialog_Toolbar_LowPriority_AltText").ToString();

            this.UltraWebTab1.Tabs.GetTab(0).Text = this.GetGlobalResourceObject("Strings", "AppointmentDialog_AppointmentTab_Text").ToString();
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
