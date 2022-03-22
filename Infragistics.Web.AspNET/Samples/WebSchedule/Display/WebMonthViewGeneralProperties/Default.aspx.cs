using System;
using System.Web.UI;
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

        this.oleDbConnection1.ConnectionString = WebSamplesCS.Config.WebScheduleMDBConnString;
        if (!IsPostBack)
        {
            this.WebMonthView2.StyleSetPath = "/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/IGThemes/";
            this.WebMonthView2.StyleSetName = "Default";

            this.dcActiveDay.Value = new DateTime(this.WebScheduleInfo1.ConvertUtcToTimeZoneTime(this.WebScheduleInfo1.ActiveDayUtc).Ticks);

            foreach (string mystring in System.Enum.GetNames(typeof(System.Web.UI.WebControls.DayNameFormat)))
            {
                this.ddDayOfWeekHeaderFormat.Items.Add(mystring);
            }

            this.ddDayOfWeekHeaderVisible.Items.Add("True");
            this.ddDayOfWeekHeaderVisible.Items.Add("False");
            this.ddEnableAutoActivityDialog.Items.Add("True");
            this.ddEnableAutoActivityDialog.Items.Add("False");
            this.ddEnableViewState.Items.Add("True");
            this.ddEnableViewState.Items.Add("False");
            this.ddNavigationButtonsVisible.Items.Add("True");
            this.ddNavigationButtonsVisible.Items.Add("False");
            this.ddWeekNumbersVisible.Items.Add("True");
            this.ddWeekNumbersVisible.Items.Add("False");

            this.ddCaptionHeaderVisible.Items.Add("True");
            this.ddCaptionHeaderVisible.Items.Add("False");

            this.ddCaptionFormatString.Items.Add("MMMM yyyy");
            this.ddCaptionFormatString.Items.Add("MMM yy");
            this.ddCaptionFormatString.Items.Add("MM/yy");
            this.ddCaptionFormatString.SelectedIndex = 0;

            this.ddDayHeaderFormatString.Items.Add("dd");
            this.ddDayHeaderFormatString.Items.Add("MM/dd");
            this.ddDayHeaderFormatString.Items.Add("MMM dd");
            this.ddDayHeaderFormatString.SelectedIndex = 0;

            this.ddFirstDayHeaderFormatString.Items.Add("MMM dd");
            this.ddFirstDayHeaderFormatString.Items.Add("MM/dd");
            this.ddFirstDayHeaderFormatString.Items.Add("dd");
            this.ddFirstDayHeaderFormatString.SelectedIndex = 0;

            this.ddTimeLabelFormatString.Items.Add("hh:mm tt");
            this.ddTimeLabelFormatString.Items.Add("hh tt");
            this.ddTimeLabelFormatString.Items.Add("HH:mm");
            this.ddTimeLabelFormatString.SelectedIndex = 0;

            this.ddSmartCallBacks.Items.Add("True");
            this.ddSmartCallBacks.Items.Add("False");

            foreach (string eWeekendDisplayFormat in System.Enum.GetNames(typeof(Infragistics.WebUI.WebSchedule.WeekendDisplayFormat)))
            {
                this.ddWeekendDisplayFormat.Items.Add(eWeekendDisplayFormat);
            }

            foreach (string eAnimationRate in System.Enum.GetNames(typeof(Infragistics.WebUI.WebSchedule.AnimationRate)))
            {
                this.ddNavigationAnimation.Items.Add(eAnimationRate);
            }

            this.ddDayOfWeekHeaderFormat.SelectedIndex = 1;
            this.ddEnableAutoActivityDialog.SelectedItem.Value = "True";
            this.ddDayOfWeekHeaderVisible.SelectedItem.Value = "True";
            this.ddEnableViewState.SelectedItem.Value = "True";
            this.ddNavigationButtonsVisible.SelectedItem.Value = "True";
            this.ddWeekNumbersVisible.SelectedItem.Value = "True";
            this.ddWeekendDisplayFormat.SelectedItem.Value = "Compressed";
            this.ddNavigationAnimation.SelectedIndex = this.ddNavigationAnimation.Items.Count - 1;
            this.styleSheetFileNameEditor.Items.AddRange(WebScheduleSamples.Util.StyleNamesListItems);

            // Navigation animation effects are only supported by Internet Explorer.
            if (!this.WebMonthView2.Client.IsIE)
            {
                this.ddNavigationAnimation.Visible = false;
                this.Label17.Visible = false;
            }
        } //IsPostBack condition ends

        if (WebSamplesCS.Config.IsLockdownMode)
        {
            //The Custom Provider
            Infragistics.WebUI.Data.WebScheduleXMLDataProvider theCustomProvider
                = new Infragistics.WebUI.Data.WebScheduleXMLDataProvider(this.WebScheduleData);
            Page.Controls.Add(theCustomProvider);
            theCustomProvider.WebScheduleInfo = this.WebScheduleInfo1;
        }

        this.WebScheduleInfo1.ActiveResourceName = this.WebScheduleInfo1.VisibleResources.UnassignedResource.Name;
        this.WebScheduleInfo1.DataBind();
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

    protected void buttons_Click(object sender, EventArgs e)
    {
        if (sender == this.btnChangeActiveDay)
        {
            this.WebScheduleInfo1.ActiveDayUtc = this.WebScheduleInfo1.ConvertTimeZoneTimeToUtc(new Infragistics.WebUI.Shared.SmartDate(this.dcActiveDay.Value.ToString()));
        }
        else if (sender == this.btnSetPrevButtonImage)
        {
            if (this.WebMonthView2.PrevButtonImage.Url == "")
            {
                // value is at its default, so change it
                this.WebMonthView2.PrevButtonImage.Url = "/SamplesBrowser/SamplesCommon/aspnet/WebSchedule/Display/WebMonthViewGeneralProperties/prev_up.gif";
            }
            else
            {
                // change it back to default
                this.WebMonthView2.PrevButtonImage.Url = "";
            }
        }
        else if (sender == this.btnSetReminderImage)
        {
            if (this.WebMonthView2.ReminderImage.Url == "")
            {
                this.WebMonthView2.ReminderImage.Url = "/SamplesBrowser/SamplesCommon/aspnet/WebSchedule/Display/WebMonthViewGeneralProperties/exclamationpoint.gif";
            }
            else
            {
                this.WebMonthView2.ReminderImage.Url = "";
            }
        }
        else if (sender == this.btnSetNextButtonImage)
        {
            if (this.WebMonthView2.NextButtonImage.Url == "")
            {
                // value is at its default, so change it
                this.WebMonthView2.NextButtonImage.Url = "/SamplesBrowser/SamplesCommon/aspnet/WebSchedule/Display/WebMonthViewGeneralProperties/next_up.gif";
            }
            else
            {
                // change it back to default
                this.WebMonthView2.NextButtonImage.Url = "";
            }
        }

    }
    protected void selectedIndexChanged(object sender, EventArgs e)
    {
        if (sender == this.ddCaptionHeaderVisible)
        {
            this.WebMonthView2.CaptionHeaderVisible = System.Boolean.Parse(this.ddCaptionHeaderVisible.SelectedItem.ToString());

            // CaptionHeader contains the NavigationButtons, so it's
            // visibility supercedes NavigationButtonsVisible.
            this.ddNavigationButtonsVisible.SelectedIndex = (this.WebMonthView2.NavigationButtonsVisible) ? 0 : 1;
            this.ddNavigationButtonsVisible.Enabled = this.Label8.Enabled = this.WebMonthView2.CaptionHeaderVisible;

            // Hiding the CaptionHeader makes these property settings
            // have no visible effect.
            this.btnSetNextButtonImage.Enabled = this.WebMonthView2.CaptionHeaderVisible;
            this.btnSetPrevButtonImage.Enabled = this.WebMonthView2.CaptionHeaderVisible;
            this.ddCaptionFormatString.Enabled = this.Label10.Enabled = this.WebMonthView2.CaptionHeaderVisible;
        }
        else if (sender == this.ddSmartCallBacks)
        {
            this.WebScheduleInfo1.EnableSmartCallbacks = (this.ddSmartCallBacks.SelectedIndex == 0);

            // Navigation animation effects can only be used when
            // smart callbacks have been enabled.
            this.ddNavigationAnimation.Enabled = this.WebScheduleInfo1.EnableSmartCallbacks;
            this.Label17.Enabled = this.WebScheduleInfo1.EnableSmartCallbacks;
        }
        else if (sender == this.ddNavigationAnimation)
        {
            this.WebMonthView2.NavigationAnimation = (Infragistics.WebUI.WebSchedule.AnimationRate)Enum.Parse(typeof(Infragistics.WebUI.WebSchedule.AnimationRate), this.ddNavigationAnimation.SelectedItem.ToString());
        }
        else if (sender == this.ddDayOfWeekHeaderFormat)
        {
            this.WebMonthView2.DayOfWeekHeaderFormat = (System.Web.UI.WebControls.DayNameFormat)Enum.Parse(typeof(System.Web.UI.WebControls.DayNameFormat), this.ddDayOfWeekHeaderFormat.SelectedItem.ToString());
        }
        else if (sender == this.ddDayOfWeekHeaderVisible)
        {
            this.WebMonthView2.DayOfWeekHeadersVisible = System.Boolean.Parse(this.ddDayOfWeekHeaderVisible.SelectedItem.ToString());

            // Hiding the D.O.W. Headers makes the DayOfWeekHeaderFormat
            // irrelevant.
            this.ddDayOfWeekHeaderFormat.Enabled = this.DayOfWeekHeaderFormat.Enabled = this.WebMonthView2.DayOfWeekHeadersVisible;
        }
        else if (sender == this.ddEnableAutoActivityDialog)
        {
            this.WebMonthView2.EnableAutoActivityDialog = System.Boolean.Parse(this.ddEnableAutoActivityDialog.SelectedItem.ToString());
        }
        else if (sender == this.ddEnableViewState)
        {
            this.WebMonthView2.EnableViewState = System.Boolean.Parse(this.ddEnableViewState.SelectedItem.ToString());
        }
        else if (sender == this.ddNavigationButtonsVisible)
        {
            this.WebMonthView2.NavigationButtonsVisible = System.Boolean.Parse(this.ddNavigationButtonsVisible.SelectedItem.ToString());
        }
        else if (sender == this.ddWeekendDisplayFormat)
        {
            this.WebMonthView2.WeekendDisplayFormat = (Infragistics.WebUI.WebSchedule.WeekendDisplayFormat)Enum.Parse(typeof(Infragistics.WebUI.WebSchedule.WeekendDisplayFormat), this.ddWeekendDisplayFormat.SelectedItem.ToString());
        }
        else if (sender == this.ddWeekNumbersVisible)
        {
            this.WebMonthView2.WeekNumbersVisible = System.Boolean.Parse(this.ddWeekNumbersVisible.SelectedItem.ToString());
        }
        else if (sender == this.ddCaptionFormatString)
        {
            this.WebMonthView2.CaptionFormatString = this.ddCaptionFormatString.SelectedItem.Text;
        }
        else if (sender == this.ddDayHeaderFormatString)
        {
            this.WebMonthView2.DayHeaderFormatString = this.ddDayHeaderFormatString.SelectedItem.Text;
        }
        else if (sender == this.ddFirstDayHeaderFormatString)
        {
            this.WebMonthView2.FirstDayHeaderFormatString = this.ddFirstDayHeaderFormatString.SelectedItem.Text;
        }
        else if (sender == this.ddTimeLabelFormatString)
        {
            this.WebMonthView2.TimeLabelFormatString = this.ddTimeLabelFormatString.SelectedItem.Text;
        }
        else if (sender == this.styleSheetFileNameEditor)
        {
            this.WebMonthView2.StyleSetName = this.styleSheetFileNameEditor.SelectedItem.Text;}
    }

}
