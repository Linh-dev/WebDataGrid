using System;
using System.Collections.Generic;
using Infragistics.Web.UI.ListControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        WebDropDown2.ItemsRequested += new DropDownItemsRequestedEventHandler(WebDropDown2_ItemsRequested);
        WebDropDown3.ItemsRequested += new DropDownItemsRequestedEventHandler(WebDropDown3_ItemsRequested);
        this.ExplorerBarDataSource.DataFile = this.GetXmlLocation("CountryStateCity.xml");
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            WebDropDown1.Items.Clear();

            WebDropDownDataCommand wddc = new WebDropDownDataCommand();
            IList<WebDropDownItem> list = wddc.GetData();

            WebDropDown1.DataSource = list;
            Session["DropDown1DS"] = list;

            WebExplorerBar1.DataSource = ExplorerBarDataSource;
            Session["ExplorerBarDS"] = ExplorerBarDataSource;

            WebDropDown1.DataSource = Session["DropDown1DS"];
            WebDropDown1.DataBind();
            WebDropDown1.CurrentValue = "";
        }

        WebExplorerBar1.DataSource = Session["ExplorerBarDS"];
        WebExplorerBar1.DataBind();
    }

    protected void WebDropDown2_ItemsRequested(object sender, Infragistics.Web.UI.ListControls.DropDownItemsRequestedEventArgs e)
    {
        string text = (string)e.Value;

        WebDropDownDataCommand wddc = new WebDropDownDataCommand();
        IList<WebDropDownItem> list = wddc.GetData(text);

        WebDropDown2.DataSource = list;
        WebDropDown2.Items.Clear();
        WebDropDown2.DataBind();
    }

    protected void WebDropDown3_ItemsRequested(object sender, Infragistics.Web.UI.ListControls.DropDownItemsRequestedEventArgs e)
    {
        string text = (string)e.Value;

        WebDropDownDataCommand wddc = new WebDropDownDataCommand();
        IList<WebDropDownItem> list = wddc.GetData(WebDropDown1.SelectedValue, text);

        WebDropDown3.DataSource = list;
        WebDropDown3.Items.Clear();
        WebDropDown3.DataBind();

    }
}