using System;
using System.Web.UI;
using System.Xml;
using Infragistics.WebUI.Data;
using Infragistics.WebUI.Shared;
using Infragistics.WebUI.WebSchedule;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected System.Data.OleDb.OleDbConnection oleDbConnection1;
    WebScheduleXMLDataProvider theCustomProvider1;
    WebScheduleXMLDataProvider theCustomProvider2;
    WebScheduleXMLDataProvider theCustomProvider3;
    WebScheduleXMLDataProvider theCustomProvider4;

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

    #region OnLoad
    protected void Page_Load(object sender, System.EventArgs e)
    {
        this.oleDbConnection1.ConnectionString = WebSamplesCS.Config.WebScheduleMDBConnString;
        this.InitView();
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
        this.oleDbConnection1 = new System.Data.OleDb.OleDbConnection();
    }
    #endregion

    #region InitView
    //------------------
    // this function obtains references to WebSchedule-controls located on tabs and connect them to each other.
    private void InitView()
    {
        int days;
        if (this.DropDownList1.SelectedIndex == -1)
        {
            days = 3;
        }
        else
        {
            days = this.DropDownList1.SelectedIndex + 1;
        }
        string dayFormat = "";
        if (this.DropDownList2.SelectedIndex > 0)
        {
            dayFormat = this.DropDownList2.SelectedItem.Value;
        }
        //----------------
        // Controls located on the 1st tab
        WebScheduleInfo infoOnTab1 = this.WebTab1.Tabs[0].FindControl("WebScheduleInfo1") as WebScheduleInfo;
        WebDayView dayViewOnTab1 = this.WebTab1.Tabs[0].FindControl("WebDayView1") as WebDayView;

        //Instantiate the Custom provider and add it to the First tab
        theCustomProvider1 = new WebScheduleXMLDataProvider(this.WebScheduleData);
        theCustomProvider1.ID = "WebScheduleXMLDataProvider1";
        this.WebTab1.Tabs[0].Controls.Add(theCustomProvider1);

        WebScheduleXMLDataProvider dataOnTab1 = theCustomProvider1; 
        //----------------
        // Example to use object-properties to connect WebSchedule objects
        if (infoOnTab1 != null && dataOnTab1 != null && dayViewOnTab1 != null)
        {
            dataOnTab1.WebScheduleInfo = infoOnTab1;
            infoOnTab1.AppointmentFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx";
            infoOnTab1.ReminderFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/Reminder.aspx";
            infoOnTab1.DataFetch = dataOnTab1;
            infoOnTab1.DataUpdate = dataOnTab1;
            dayViewOnTab1.WebScheduleInfo = infoOnTab1;
            dayViewOnTab1.VisibleDays = days;
            dayViewOnTab1.DayHeaderFormatString = dayFormat;
            infoOnTab1.ActiveResourceName = "Javier Lamoreaux";
        }

        //----------------
        // Controls located on the 2nd Tab
        WebScheduleInfo infoOnTab2 = this.WebTab1.Tabs[1].FindControl("WebScheduleInfo2") as WebScheduleInfo;
        WebDayView dayViewOnTab2 = this.WebTab1.Tabs[1].FindControl("WebDayView2") as WebDayView;

        //Instantiate the Custom provider and add it to the second tab
        theCustomProvider2
            = new WebScheduleXMLDataProvider(this.WebScheduleData);
        theCustomProvider2.ID = "WebScheduleXMLDataProvider2";
        this.WebTab1.Tabs[1].Controls.Add(theCustomProvider2);

        //This is how we locate an instance of a control inside a particular tab
        WebScheduleXMLDataProvider dataOnTab2 = theCustomProvider2;
        //----------------
        // Example to use WebScheduleInfoID-properties to connect WebSchedule objects
        if (infoOnTab2 != null && dataOnTab2 != null && dayViewOnTab2 != null)
        {
            infoOnTab2.AppointmentFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx";
            infoOnTab2.ReminderFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/Reminder.aspx";
            dataOnTab2.WebScheduleInfoID = infoOnTab2.ID;
            dayViewOnTab2.WebScheduleInfoID = infoOnTab2.ID;
            dayViewOnTab2.VisibleDays = days;
            dayViewOnTab2.DayHeaderFormatString = dayFormat;
            infoOnTab2.ActiveResourceName = "Development Team";
        }

        // Controls located on the 3rd Tab
        WebScheduleInfo infoOnTab3 = this.WebTab1.Tabs[2].FindControl("WebScheduleInfo3") as WebScheduleInfo;
        WebDayView dayViewOnTab3 = this.WebTab1.Tabs[2].FindControl("WebDayView3") as WebDayView;

        //Instantiate the Custom provider and add it to the second tab
        theCustomProvider3
            = new WebScheduleXMLDataProvider(this.WebScheduleData);
        theCustomProvider3.ID = "WebScheduleXMLDataProvider3";
        this.WebTab1.Tabs[2].Controls.Add(theCustomProvider3);

        //Then we go and get a reference to the Control that is located within the tab itself:
        WebScheduleXMLDataProvider dataOnTab3 = theCustomProvider3;

        //----------------
        // Example to use WebScheduleInfoID-properties to connect WebSchedule objects
        if (infoOnTab3 != null && dataOnTab3 != null && dayViewOnTab3 != null)
        {
            infoOnTab3.AppointmentFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx";
            infoOnTab3.ReminderFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/Reminder.aspx";
            dataOnTab3.WebScheduleInfoID = infoOnTab3.ID;
            dayViewOnTab3.WebScheduleInfoID = infoOnTab3.ID;
            dayViewOnTab3.VisibleDays = days;
            dayViewOnTab3.DayHeaderFormatString = dayFormat;
            infoOnTab3.ActiveResourceName = "Unassigned";
        }

        //---------------------
        // Reference to WebUserControl located on the 4th tab
        Control webUserControlDay1 = this.WebTab1.Tabs[3].FindControl("WebUserControlDay1");
        if (webUserControlDay1 == null)
            return;
        //---------------------
        // Example to get references to WebSchedule objects located in the WebUserControl
        WebScheduleInfo infoOnTab4 = webUserControlDay1.FindControl("WebScheduleInfo1") as WebScheduleInfo;
        WebDayView dayViewOnTab4 = webUserControlDay1.FindControl("WebDayView1") as WebDayView;



        //Instantiate the Custom provider and add it to the second tab
        WebScheduleXMLDataProvider theCustomProvider4
            = new WebScheduleXMLDataProvider(this.WebScheduleData);
        theCustomProvider4.ID = "WebScheduleXMLDataProvider4";
        webUserControlDay1.Controls.Add(theCustomProvider4);

        WebScheduleXMLDataProvider dataOnTab4 = theCustomProvider4;
        //---------------------
        // Modify properties of WebDayView
        if (dayViewOnTab4 == null)
            return;


        dayViewOnTab4.VisibleDays = days;
        dayViewOnTab4.DayHeaderFormatString = dayFormat;
        dayViewOnTab4.DayHeaderFormatString = dayFormat;
        infoOnTab4.AppointmentFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx";
        infoOnTab4.ReminderFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/Reminder.aspx";


    }
    #endregion

    #region Enable smart callbacks
    public void chkSmartCallbacks_CheckChanged(object sender, System.EventArgs e)
    {
        bool enabledState = this.chkSmartCallbacks.Checked;

        Infragistics.WebUI.WebSchedule.WebScheduleInfo infoOnTabN = null;
        for (int n = 0; n < 3; ++n)
        {
            infoOnTabN = this.WebTab1.Tabs[n].FindControl("WebScheduleInfo" + (n + 1).ToString()) as WebScheduleInfo;
            if (infoOnTabN != null)
            {
                infoOnTabN.EnableSmartCallbacks = enabledState;
            }
        }

        Control webUserControlDay1 = this.WebTab1.Tabs[3].FindControl("WebUserControlDay1");
        if (webUserControlDay1 != null)
        {
            infoOnTabN = webUserControlDay1.FindControl("WebScheduleInfo1") as WebScheduleInfo;
            if (infoOnTabN != null)
            {
                infoOnTabN.EnableSmartCallbacks = enabledState;
            }
        }
    }
    #endregion

    #region Add appontment (Button1_Click)
    protected void Button1_Click(object sender, System.EventArgs e)
    {
        // References to WebSchedule objects located on the 1st tab
        WebScheduleInfo info = this.WebTab1.Tabs[0].FindControl("WebScheduleInfo1") as WebScheduleInfo;
        this.AddAppointment(info);

        //---------------------
        // References to WebSchedule objects located on the 2nd tab
        info = this.WebTab1.Tabs[1].FindControl("WebScheduleInfo2") as WebScheduleInfo;
        this.AddAppointment(info);

        //---------------------
        // References to WebSchedule objects located on the 3rd tab
        info = this.WebTab1.Tabs[2].FindControl("WebScheduleInfo3") as WebScheduleInfo;
        this.AddAppointment(info);
    }
    private void AddAppointment(WebScheduleInfo info)
    {
        if (info != null && info.DataUpdate != null)
        {
            IDataUpdate provider = info.DataUpdate;
            info.DataBind();
            Appointment app = new Appointment(info);
            app.StartDateTime = new SmartDate(DateTime.Now);
            app.Subject = "New Appointment";
            app.Location = "In The Code!";
            app.ResourceKey = info.ActiveResource.DataKey.ToString();
            provider.Update(new AddActivityContext(app, info.ActiveResource.Name));
            info.DataBind();
        }
    }
    #endregion
}
