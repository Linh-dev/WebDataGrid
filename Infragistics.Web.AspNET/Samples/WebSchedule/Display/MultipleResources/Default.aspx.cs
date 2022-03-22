using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml;
using Infragistics.WebUI.WebSchedule;
using WebScheduleSamples;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private XmlDocument WebScheduleData
    {
        get
        {
            if (Session["WsDataMultipleResources"] == null)
            {
                Session["WsDataMultipleResources"] =
                    Util.GenerateDocument(GenerationSampleDataMode.MultipleResourcesMode);
            }
            return (XmlDocument)Session["WsDataMultipleResources"];
        }
    }

    private string TypeView
    {
        get { return Session["TypeView"] as string; }
        set { Session["TypeView"] = value; }
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        this.wsInfo.ResourcesFetched += new Infragistics.WebUI.WebSchedule.ResourcesFetchedEventHandler(wsInfo_ResourcesFetched);
        AttachEvents(buttonDay, buttonDays, buttonMonth);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.TypeView = "day";
            this.wsInfo.EnableSmartCallbacks = this.chkSmartCallbacks.Checked;
        }

        this.wsInfo.AppointmentFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx";
        this.wsInfo.ReminderFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/Reminder.aspx";


        ////Custom XML Provider
        Infragistics.WebUI.Data.WebScheduleXMLDataProvider theCustomProvider
               = new Infragistics.WebUI.Data.WebScheduleXMLDataProvider(this.WebScheduleData);
        Page.Controls.Add(theCustomProvider);

        theCustomProvider.WebScheduleInfo = this.wsInfo;

        ApplayStylesNormal(buttonDay, buttonDays, buttonMonth);

        ApplayStylesSelected();

        this.viewHolder.Controls.Add(GetView());
    }

    protected void wsInfo_ResourcesFetched(object sender, EventArgs e)
    {
        int maxCount = this.wsInfo.VisibleResources.Count;
        for (int i = maxCount - 1; i > 5; i--)
        {
            this.wsInfo.VisibleResources.RemoveAt(i);
        }
    }

    protected void chkSmartCallbacks_CheckChanged(object sender, System.EventArgs e)
    {
        this.wsInfo.EnableSmartCallbacks = this.chkSmartCallbacks.Checked;
    }

    protected void bclick_ServerClick(object sender, EventArgs e)
    {
        if (sender == buttonDay)
        {
            this.TypeView = "day";
        }
        else if (sender == buttonDays)
        {
            this.TypeView = "days";
        }
        else if (sender == buttonMonth)
        {
            this.TypeView = "month";
        }

        ApplayStylesNormal(buttonDay, buttonDays, buttonMonth);
        ApplayStylesSelected();

        ReCreate();
    }

    protected void ApplayStylesNormal(params HtmlButton[] buttons)
    {
        foreach (HtmlButton b in buttons)
        {
            b.Attributes.Add("class", "btnNormal");
            b.Attributes.Add("onmouseover", "this.className='btnHover'");
            b.Attributes.Add("onmouseout", "this.className='btnNormal'");
        }
    }

    protected void AttachEvents(params HtmlButton[] buttons)
    {
        foreach (HtmlButton b in buttons)
            b.ServerClick += new EventHandler(bclick_ServerClick);

    }

    protected void ApplayStylesSelected()
    {
        HtmlButton b = null;
        if (this.TypeView == "day")
            b = buttonDay;
        else if (this.TypeView == "days")
            b = buttonDays;
        else if (this.TypeView == "month")
            b = buttonMonth;


        b.Attributes.Add("class", "btnHover");
        b.Attributes.Remove("onmouseover");
        b.Attributes.Remove("onmouseout");
    }

    protected void ReCreate()
    {
        this.viewHolder.Controls.Clear();
        this.viewHolder.Controls.Add(GetView());
    }

    protected WebScheduleViewBase GetView()
    {
        WebScheduleViewBase v = null;
        switch (this.TypeView)
        {
            case "day":
                v = new WebDayView();
                ((WebDayView)v).VisibleDays = 1;
                ((WebDayView)v).CaptionHeaderText = this.GetGlobalResourceObject("WebSchedule","WebSchedule_CaptionHeaderText").ToString();
                break;
            case "days":
                v = new WebDayView();
                ((WebDayView)v).VisibleDays = 5;
                ((WebDayView)v).CaptionHeaderText = this.GetGlobalResourceObject("WebSchedule","WebSchedule_CaptionHeaderText").ToString();
                break;
            case "month":
                v = new WebMonthView();

                v.Height = new Unit("100%");
                ((WebMonthView)v).NavigationAnimation = AnimationRate.Linear;
                ((WebMonthView)v).WeekendDisplayFormat = WeekendDisplayFormat.Full;
                ((WebMonthView)v).WeekNumbersVisible = false;
                break;
        }

        v.ID = "theView";
        v.WebScheduleInfo = wsInfo;
        v.Width = new Unit("100%");

        v.EnableAppStyling = Infragistics.WebUI.Shared.DefaultableBoolean.True;
        return v;
    }
}
