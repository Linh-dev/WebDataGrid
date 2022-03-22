using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Infragistics.WebUI.WebSchedule;
using Infragistics.Web.UI.NavigationControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected Infragistics.WebUI.Data.WebScheduleOleDbProvider WebScheduleOleDBProvider1;
    protected System.Data.OleDb.OleDbConnection oleDbConnection1;
    protected const string WEBSCHEDULESTYPEPATH = "/SamplesBrowser/SamplesCommon/aspnet/Common/Webschedule/styles/";

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
        // WebDataMenu1.ItemClick += new Infragistics.Web.UI.NavigationControls.DataMenuItemEventHandler(WebDataMenu1_ItemClick);
        this.WebScheduleInfo1.AppointmentFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx";
        this.WebScheduleInfo1.ReminderFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/Reminder.aspx";
        {
            //The Custom Provider
            Infragistics.WebUI.Data.WebScheduleXMLDataProvider theCustomProvider
                = new Infragistics.WebUI.Data.WebScheduleXMLDataProvider(this.WebScheduleData);
            Page.Controls.Add(theCustomProvider);
            theCustomProvider.WebScheduleInfo = this.WebScheduleInfo1;
        }
        if (!this.IsPostBack)
        {
            this.WebDayView1.StyleSetPath = this.WebMonthView1.StyleSetPath = this.WebCalendarView1.StyleSetPath = "/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/IGThemes/";
            ICollection resources;
            Infragistics.WebUI.Data.WebScheduleXMLDataProvider theCustomProvider
                = new Infragistics.WebUI.Data.WebScheduleXMLDataProvider(this.WebScheduleData);
            resources = theCustomProvider.FetchResources();

            if (resources != null)
            {
                foreach (Resource currentResource in resources)
                {
                    this.ResourceList.Items.Add(currentResource.Name);
                }
            }
            this.Session["ResourceName"] = this.ResourceList.SelectedItem.Text;
        }

        this.ResourceList.SelectedIndexChanged += new EventHandler(this.ResourceList_SelectedIndexChanged);
        this.DropDownList1.SelectedIndexChanged += new EventHandler(this.DropDownList1_SelectedIndexChanged);

        string ResourceName = this.ResourceList.SelectedItem.Text;
        string UserName = this.ResourceList.SelectedItem.Text;
        if (UserName == null || UserName.Length == 0)
        {
            UserName = ResourceName;
            this.Session["LoggedOnUserName"] = UserName;
        }
        
        if (ResourceName != null)
        {
            if (!IsPostBack)
            {
                WebScheduleInfo1.ActiveResourceName = ResourceName;
                WebScheduleInfo1.LoggedOnUserName = UserName;

                this.DropDownList1.Items.AddRange(WebScheduleSamples.Util.StyleNamesListItems);
            }
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



    private void DropDownList1_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        SetStyle();
    }

    private void SetStyle()
    {
        string text = DropDownList1.SelectedItem.Text;
        this.WebDayView1.StyleSetName = this.WebMonthView1.StyleSetName = this.WebCalendarView1.StyleSetName = text;
    }



    private void ResourceList_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        string ResourceName = ResourceList.SelectedItem.Text;
        if (ResourceName.Length > 0)
        {
            WebScheduleInfo1.ActiveResourceName = ResourceName;
            this.Session["ResourceName"] = ResourceName;
        }
    }

    protected void WebDataMenu1_ItemClick1(object sender, DataMenuItemEventArgs e)
    {
        if (e.Item.Key == "changeColorTool")
        {
            this.DropDownList1.SelectedIndex = (this.DropDownList1.SelectedIndex + 1) % this.DropDownList1.Items.Count;
            this.SetStyle();
        }
        else if (e.Item.Key == "todayTool")
        {
            WebScheduleInfo1.ActiveDayUtc = Infragistics.WebUI.Shared.SmartDate.UtcNow;

            WebScheduleInfo1.ActiveDayUtc.Millisecond = 0;
            WebScheduleInfo1.ActiveDayUtc.Second = 0;
        }
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
}
