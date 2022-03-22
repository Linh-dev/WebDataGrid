using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml;
using Infragistics.WebUI.WebSchedule;
using WebScheduleSamples;

public partial class Samples_WebSchedule_Display_Show_Hide_Resources_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private XmlDocument WebScheduleData
    {
        get
        {
            return Util.GenerateDocument(GenerationSampleDataMode.MultipleResourcesMode);
        }
    }

    private string TypeView
    {
        get { return ViewState["TypeView"] as string; }
        set { ViewState["TypeView"] = value; }
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
            this.TypeView = "day";

        ////Custom XML Provider
        Infragistics.WebUI.Data.WebScheduleXMLDataProvider theCustomProvider
               = new Infragistics.WebUI.Data.WebScheduleXMLDataProvider(this.WebScheduleData);
        Page.Controls.Add(theCustomProvider);

        theCustomProvider.WebScheduleInfo = this.wsInfo;

        ApplayStylesNormal(buttonDay, buttonDays, buttonMonth);

        ApplayStylesSelected();

        this.viewHolder.Controls.Add(GetView());

        //On Every PostBack Add Resources to the WebScheduleInfo.VisibleResources Collection
        if (IsPostBack)
        {
            bool changeActiveResourceName = false;
            foreach (ListItem li in VisibleResourcesCBList.Items)
            {
                if (li.Selected)
                {
                    Resource r = new Resource();
                    r.Key = li.Value;
                    r.Name = li.Text;
                    this.wsInfo.VisibleResources.Add(r);
                }
                else
                {
                    if (this.wsInfo.ActiveResourceName == li.Text)
                        changeActiveResourceName = true;
                }
            }

            if (changeActiveResourceName)
                this.wsInfo.ActiveResourceName = (this.wsInfo.VisibleResources.Count > 1) ? this.wsInfo.VisibleResources[1].Name : this.wsInfo.VisibleResources[0].Name;
        }
    }

    protected void chkSmartCallbacks_CheckChanged(object sender, System.EventArgs e)
    {
        this.wsInfo.EnableSmartCallbacks = this.chkSmartCallbacks.Checked;
    }

    protected void wsInfo_ResourcesFetched(object sender, EventArgs e)
    {
        int maxCount = this.wsInfo.VisibleResources.Count;

        //If the page is loading for the first time, we must fill the VisibleResourcesCBList List        
        if (!IsPostBack)
        {
            //This code block will be executed only when the page is loaded for the first time
            for (int i = 1; i < maxCount; i++)
            {
                ListItem li = new ListItem();
                li.Selected = (i <= 7) ? true : false;
                li.Text = this.wsInfo.VisibleResources[i].Name;
                li.Value = this.wsInfo.VisibleResources[i].Key;

                VisibleResourcesCBList.Items.Add(li);
            }

            bool changeActiveResourceName = false;
            foreach (ListItem li in VisibleResourcesCBList.Items)
            {
                if (!li.Selected)
                {
                    if (this.wsInfo.ActiveResourceName == li.Text)
                        changeActiveResourceName = true;

                    this.wsInfo.VisibleResources.Remove(this.wsInfo.VisibleResources[li.Value]);
                }
            }

            if (changeActiveResourceName)
                this.wsInfo.ActiveResourceName = (this.wsInfo.VisibleResources.Count > 1) ? this.wsInfo.VisibleResources[1].Name : this.wsInfo.VisibleResources[0].Name;
        }
        else
        {
            this.wsInfo.VisibleResources.Clear();
        }
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
        v.StyleSetName = "Default";

        return v;
    }

}
