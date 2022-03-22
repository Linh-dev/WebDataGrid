using System;
using Infragistics.Web.UI.NavigationControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected int Counter
    {
        get
        {
            return Convert.ToInt32(Session["Counter"]);
        }
        set
        {
            System.Diagnostics.Debug.WriteLine(String.Format("Set Value = {0}", value));
            Session["Counter"] = value;
        }
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.WebExplorerBar1.ItemClick += new ExplorerBarItemClickEventHandler(WebExplorerBar1_ExplorerBarItemClick);
        this.WebExplorerBar1.ItemSelected += new ExplorerBarItemSelectedEventHandler(WebExplorerBar1_ExplorerBarItemSelected);
        this.WebExplorerBar1.GroupBound += new ExplorerBarGroupEventHandler(WebExplorerBar1_GroupBound);
        this.WebExplorerBar1.ItemBound += new ExplorerBarItemEventHandler(WebExplorerBar1_ItemBound);
        this.ExplorerBarDataSource.DataFile = this.GetXmlLocation("SampleData.xml");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            eventList.InnerHtml = this.GetGlobalResourceObject("Strings","ServerEventsCaption").ToString();
        }
    }


    void WebExplorerBar1_ExplorerBarItemClick(object sender, ExplorerBarItemClickEventArgs e)
    {
        Add(String.Format("{0} - {1}", this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_ServerEvents_ItemClick"), e.Item.Text));
    }
    void WebExplorerBar1_ExplorerBarItemSelected(object sender, ExplorerBarItemSelectedEventArgs e)
    {
        if (e.OldSelectedItem == null)
            Add(String.Format("{0} - {1} ; {2}", this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_ServerEvents_ItemSelected"), this.GetGlobalResourceObject("WebExplorerBar", "WebExplorerBar_ServerEvents_NewSelectedItem") + e.NewSelectedItem.Text, this.GetGlobalResourceObject("WebExplorerBar", "WebExplorerBar_ServerEvents_OldSelectedItem") + " -1"));
        else
            Add(String.Format("{0} - {1}; {2}", this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_ServerEvents_ItemSelected"), this.GetGlobalResourceObject("WebExplorerBar", "WebExplorerBar_ServerEvents_NewSelectedItem") + e.NewSelectedItem.Text, this.GetGlobalResourceObject("WebExplorerBar", "WebExplorerBar_ServerEvents_OldSelectedItem") + e.OldSelectedItem.Text));

    }
    void WebExplorerBar1_GroupBound(object sender, ExplorerBarGroupEventArgs e)
    {
        Add(String.Format("{0} - {1}", this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_ServerEvents_GroupBound"), e.ExplorerBarGroup.Text));

    }
    void WebExplorerBar1_ItemBound(object senderWebExplorerBar_ServerEvents_ItemBound, ExplorerBarItemEventArgs e)
    {
        Add(String.Format("{0} - {1}", this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_ServerEvents_ItemBound"), e.ExplorerBarItem.Text));

    }
    protected void Add(string message)
    {
        Counter++;
        string str = String.Format("<br /><span class='outputValue' id='span_{0}'>{0}. {1}</span>", Counter, message);
        eventList.InnerHtml += str;
    }
}
