using System;
using System.Collections;
using System.Web.UI;
using System.Xml;
using Infragistics.WebUI.WebSchedule;

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
    protected void Page_Load(object sender, EventArgs e)
    {

        this.oleDbConnection1.ConnectionString = WebSamplesCS.Config.WebScheduleMDBConnString;
        if (!IsPostBack)
        {
            ICollection rc;

            Infragistics.WebUI.Data.WebScheduleXMLDataProvider theCustomProvider
                = new Infragistics.WebUI.Data.WebScheduleXMLDataProvider(this.WebScheduleData);
            Page.Controls.Add(theCustomProvider);
            rc = theCustomProvider.FetchResources();
            foreach (Resource resources in rc)
            {
                this.ResourceList.Items.Add(resources.Name);
            }

            this.GMTList.Items.FindByValue(System.TimeZone.CurrentTimeZone.GetUtcOffset(DateTime.Now).Hours.ToString()).Selected = true;
            this.WebDayView1.StyleSheetFileName = this.GetStyleSheetFileName("onyx", "ig_webdayview.css");
            this.WebCalendarView1.StyleSheetFileName = this.GetStyleSheetFileName("onyx", "ig_webcalendarview.css");
            this.WebMonthView1.StyleSheetFileName = this.GetStyleSheetFileName("onyx", "ig_webmonthview.css");
            //this.WebWeekView1.StyleSheetFileName = this.GetStyleSheetFileName("onyx", "ig_webweekview.css");

        }
        //Testing 
        string resource = this.ResourceList.SelectedItem.Value;
        string offset = this.GMTList.SelectedItem.Value;
        if (offset == null)
            offset = System.TimeZone.CurrentTimeZone.GetUtcOffset(DateTime.Now).Hours.ToString();

        if (resource != null)
            this.WebScheduleInfo1.ActiveResourceName = resource;

        this.GMTList.Items.FindByValue(offset).Selected = true;
        //The Custom Provider
        {
            Infragistics.WebUI.Data.WebScheduleXMLDataProvider theCustomProvider = new Infragistics.WebUI.Data.WebScheduleXMLDataProvider(this.WebScheduleData);
            Page.Controls.Add(theCustomProvider);
            theCustomProvider.WebScheduleInfo = this.WebScheduleInfo1;
        }
        this.WebScheduleInfo1.AppointmentFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx";
        this.WebScheduleInfo1.ReminderFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/Reminder.aspx";

        this.oleDbConnection1.ConnectionString = WebSamplesCS.Config.WebScheduleMDBConnString;
        this.WebScheduleInfo1.TimeZoneOffset = TimeSpan.FromHours(double.Parse(GMTList.SelectedItem.Value));


        this.Literal1.Text += "<table border='1'>";
        this.Literal1.Text += "<tr><td style='FONT-WEIGHT: bold'> Server Today: </td> <td>" + DateTime.Today.ToString() + "</td>";
        this.Literal1.Text += "<td style='FONT-WEIGHT: bold'> Server Now:   </td> <td>" + DateTime.Now.ToString() + "</td>";
        this.Literal1.Text += "<td style='FONT-WEIGHT: bold'>Server UTC Offset: </td> <td>" + System.TimeZone.CurrentTimeZone.GetUtcOffset(System.DateTime.Now).ToString() + "</td></tr>";
        this.Literal1.Text += "<tr style='background-color:gainsboro'><td style='FONT-WEIGHT: bold'> UTC Today:    </td> <td>" + this.WebScheduleInfo1.UtcToday.ToString() + "</td>";
        this.Literal1.Text += "<td style='FONT-WEIGHT: bold'> UTC Now:	   </td> <td colspan='3'>" + this.WebScheduleInfo1.UtcNow.ToString() + "</td></tr>";
        this.Literal1.Text += "<tr><td style='FONT-WEIGHT: bold'>TimeZone Today:</td> <td>" + this.WebScheduleInfo1.ConvertUtcToTimeZoneTime(this.WebScheduleInfo1.UtcToday).ToString() + "</td>";
        this.Literal1.Text += "<td style='FONT-WEIGHT: bold'>TimeZone Now: </td> <td>" + this.WebScheduleInfo1.ConvertUtcToTimeZoneTime(this.WebScheduleInfo1.UtcNow).ToString() + "</td>";
        this.Literal1.Text += "<td style='FONT-WEIGHT: bold'>TimeZone UTC Offset: </td> <td>" + this.WebScheduleInfo1.TimeZoneOffsetResolved().ToString() + "</td></tr>";
        this.Literal1.Text += "<tr style='background-color:gainsboro'> <td style='FONT-WEIGHT: bold'> ActiveDay UTC: </td> <td>" + this.WebScheduleInfo1.ActiveDayUtc.ToString() + "</td>";
        this.Literal1.Text += "<td style='FONT-WEIGHT: bold' > ActiveDay TimeZone: </td> <td colspan='3'>" + this.WebScheduleInfo1.ConvertUtcToTimeZoneTime(this.WebScheduleInfo1.ActiveDayUtc).ToString() + "</td></tr>";
        this.Literal1.Text += "</table>";
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
        this.ID = "LandingP";

    }
    #endregion
    protected void WebWeekView1_Init(object sender, System.EventArgs e)
    {

    }
    public string GetStyleSheetFileName(string styleName, string fileName)
    {

        return "/SamplesBrowser/SamplesCommon/aspnet/Common/Webschedule/styles/" + styleName + "/" + fileName;
    }
    public string GetStyleSheetFileName(string styleName, string fileName, bool fileNameIncludesPath)
    {
        if (fileNameIncludesPath)
        {
            string[] tokens = fileName.Split('/');
            if (tokens != null && tokens.Length > 2)
            {
                string currentStyle = tokens[tokens.Length - 2];
                return fileName.Replace(currentStyle, styleName);
            }
        }
        return this.GetStyleSheetFileName(styleName, fileName);
    }
    protected void ResourceListSelectionChanged(object sender, EventArgs e)
    {
        Session["Resource"] = this.ResourceList.SelectedValue;
    }
    protected void GMTListSelectionChanged(object sender, EventArgs e)
    {
        Session["Offset"] = this.GMTList.SelectedValue;

    }
}
