using System;
using System.Web.UI;
using System.Xml;
using WebScheduleSamples;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected System.Data.OleDb.OleDbConnection oleDbConnection1;

    protected void Page_Load(object sender, System.EventArgs e)
    {

        this.WebScheduleInfo1.AppointmentFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx";
        this.WebScheduleInfo1.ReminderFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/Reminder.aspx";

        this.oleDbConnection1.ConnectionString = WebSamplesCS.Config.WebScheduleMDBConnString;
        if (!IsPostBack)
        {
            this.WebDayView1.StyleSetPath = "/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/IGThemes/";
            this.WebDayView1.StyleSetName = "Default";

            this.styleSheetFileNameEditor.Items.AddRange(Util.StyleNamesListItems);

            this.activityHeightMinimumEditor.ValueInt = this.WebDayView1.ActivityHeightMinimum;
            this.activityWidthMinimumEditor.ValueInt = this.WebDayView1.ActivityWidthMinimum;
            this.visibleDaysEditor.ValueInt = this.WebDayView1.VisibleDays;

            this.dcActiveDay.Value = new DateTime(this.WebScheduleInfo1.ConvertUtcToTimeZoneTime(this.WebScheduleInfo1.ActiveDayUtc).Ticks);

            this.dayHeaderFormatStringEditor.Items.Add("");
            this.dayHeaderFormatStringEditor.Items.Add("MM/dd/yyyy");
            this.dayHeaderFormatStringEditor.Items.Add("dddd, MMMM dd yyyy");
            this.dayHeaderFormatStringEditor.Items.Add("yyyy-MM-dd");
            this.ddEnableActivityMoving.Items.Add("True");
            this.ddEnableActivityMoving.Items.Add("False");
            this.ddEnableAutoActivityDialog.Items.Add("True");
            this.ddEnableAutoActivityDialog.Items.Add("False");
            this.ddEnableActivityResizing.Items.Add("True");
            this.ddEnableActivityResizing.Items.Add("False");
            this.ddNavigationButtonsVisible.Items.Add("True");
            this.ddNavigationButtonsVisible.Items.Add("False");
            this.ddTimeSlotAreaVisible.Items.Add("True");
            this.ddTimeSlotAreaVisible.Items.Add("False");
            this.ddSmartCallBacks.Items.Add("True");
            this.ddSmartCallBacks.Items.Add("False");

            foreach (string mystring in System.Enum.GetNames(typeof(Infragistics.WebUI.WebSchedule.TimeDisplayFormat)))
            {
                this.ddTimeDisplayFormat.Items.Add(mystring);
            }
            foreach (string eAnimation in System.Enum.GetNames(typeof(Infragistics.WebUI.WebSchedule.AnimationRate)))
            {
                this.ddNavigationAnimation.Items.Add(eAnimation);
            }
            this.ddNavigationAnimation.SelectedIndex = 0;
            foreach (string mystring in System.Enum.GetNames(typeof(Infragistics.WebUI.WebSchedule.TimeSlotLabelType)))
            {
                this.ddTimeSlotLabelType.Items.Add(mystring);
            }
            foreach (string mystring in System.Enum.GetNames(typeof(Infragistics.WebUI.WebSchedule.TimeSlotInterval)))
            {
                this.ddTimeSlotInterval.Items.Add(mystring);
            }
            this.ddTimeSlotInterval.SelectedIndex = 10;
        }

        if (true)
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

    protected void selectedIndexChanged(object sender, EventArgs e)
    {
        if (sender == this.ddEnableActivityMoving)
        {
            this.WebDayView1.EnableActivityMoving = System.Boolean.Parse(this.ddEnableActivityMoving.SelectedItem.ToString());
        }
        else if (sender == this.ddSmartCallBacks)
        {
            this.WebScheduleInfo1.EnableSmartCallbacks = (this.ddSmartCallBacks.SelectedIndex == 0);
            this.ddNavigationAnimation.Enabled = this.lblNavigationAnimation.Enabled = this.WebScheduleInfo1.EnableSmartCallbacks;
        }
        else if (sender == this.ddNavigationAnimation)
        {
            this.WebDayView1.NavigationAnimation = (Infragistics.WebUI.WebSchedule.AnimationRate)Enum.Parse(typeof(Infragistics.WebUI.WebSchedule.AnimationRate), this.ddNavigationAnimation.SelectedItem.ToString());
        }
        else if (sender == this.ddEnableAutoActivityDialog)
        {
            this.WebDayView1.EnableAutoActivityDialog = System.Boolean.Parse(this.ddEnableAutoActivityDialog.SelectedItem.ToString());
        }
        else if (sender == this.ddEnableActivityResizing)
        {
            this.WebDayView1.EnableActivityResizing = System.Boolean.Parse(this.ddEnableActivityResizing.SelectedItem.ToString());
        }
        else if (sender == this.ddNavigationButtonsVisible)
        {
            this.WebDayView1.NavigationButtonsVisible = System.Boolean.Parse(this.ddNavigationButtonsVisible.SelectedItem.ToString());
        }
        else if (sender == this.ddTimeDisplayFormat)
        {
            this.WebDayView1.TimeDisplayFormat = (Infragistics.WebUI.WebSchedule.TimeDisplayFormat)Enum.Parse(typeof(Infragistics.WebUI.WebSchedule.TimeDisplayFormat), this.ddTimeDisplayFormat.SelectedItem.ToString());
        }
        else if (sender == this.ddTimeSlotInterval)
        {
            this.WebDayView1.TimeSlotInterval = (Infragistics.WebUI.WebSchedule.TimeSlotInterval)Enum.Parse(typeof(Infragistics.WebUI.WebSchedule.TimeSlotInterval), this.ddTimeSlotInterval.SelectedItem.ToString());
        }
        else if (sender == this.ddTimeSlotAreaVisible)
        {
            this.WebDayView1.TimeSlotLabelAreaVisible = System.Boolean.Parse(this.ddTimeSlotAreaVisible.SelectedItem.ToString());
            this.ddTimeSlotLabelType.Enabled = this.lblTimeSlotLabelType.Enabled = this.WebDayView1.TimeSlotLabelAreaVisible;
        }
        else if (sender == this.ddTimeSlotLabelType)
        {
            this.WebDayView1.TimeSlotLabelType = (Infragistics.WebUI.WebSchedule.TimeSlotLabelType)Enum.Parse(typeof(Infragistics.WebUI.WebSchedule.TimeSlotLabelType), this.ddTimeSlotLabelType.SelectedItem.ToString());
        }
        else if (sender == this.styleSheetFileNameEditor)
        {
            this.WebDayView1.StyleSetName = this.styleSheetFileNameEditor.SelectedItem.Text;
        }
    }

    protected void buttons_Click(object sender, EventArgs e)
    {
        if (sender == this.dayHeaderFormatStringButton)
        {
            if (this.dayHeaderFormatStringEditor.SelectedItem != null)
            {
                this.WebDayView1.DayHeaderFormatString = this.dayHeaderFormatStringEditor.SelectedItem.Text;
            }
        }
        else if (sender == this.changeActiveDayButton)
        {
            this.WebScheduleInfo1.ActiveDayUtc = this.WebScheduleInfo1.ConvertTimeZoneTimeToUtc(new Infragistics.WebUI.Shared.SmartDate(this.dcActiveDay.Value.ToString()));
        }
        else if (sender == this.prevButtonImageButton)
        {
            if (this.WebDayView1.PrevButtonImage.Url == "")
            {
                // value is at its default, so change it
                this.WebDayView1.PrevButtonImage.Url = "/SamplesBrowser/SamplesCommon/aspnet/WebSchedule/Display/WebDayViewGeneralProperties/prev_up.gif";
            }
            else
            {
                // change it back to default
                this.WebDayView1.PrevButtonImage.Url = "";
            }

        }
        else if (sender == this.nextButtonImageButton)
        {
            if (this.WebDayView1.NextButtonImage.Url == "")
            {
                // value is at its default, so change it
                this.WebDayView1.NextButtonImage.Url = "/SamplesBrowser/SamplesCommon/aspnet/WebSchedule/Display/WebDayViewGeneralProperties/next_up.gif";
            }
            else
            {
                // change it back to default
                this.WebDayView1.NextButtonImage.Url = "";
            }
        }
        else if (sender == this.reminderImageButton)
        {
            if (this.WebDayView1.ReminderImage.Url == "")
            {
                this.WebDayView1.ReminderImage.Url = "/SamplesBrowser/SamplesCommon/aspnet/WebSchedule/Display/WebDayViewGeneralProperties/ig_tblplus.gif";
            }
            else
            {
                this.WebDayView1.ReminderImage.Url = "";
            }
        }
        else if (sender == this.visibleDaysButton)
        {
            this.WebDayView1.VisibleDays = this.visibleDaysEditor.ValueInt;
        }
        else if (sender == this.captionHeaderTextButton)
        {
            this.WebDayView1.CaptionHeaderText = this.txtCaptionHeaderText.Text;
        }
        else if (sender == this.activityHeightMinimumButton)
        {
            this.WebDayView1.ActivityHeightMinimum = this.activityHeightMinimumEditor.ValueInt;
        }
        else if (sender == this.activityWidthMinimumButton)
        {
            this.WebDayView1.ActivityWidthMinimum = this.activityWidthMinimumEditor.ValueInt;
        }
    }

}
