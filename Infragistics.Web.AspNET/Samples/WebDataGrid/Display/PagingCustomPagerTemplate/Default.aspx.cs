using System;

public partial class Samples_WebDataGrid_Display_Paging_Custom_Pager_Template_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private CustomerPagerControl pagerControl;

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.AccessDataSource1.DataBind();
        pagerControl = WebDataGridView.Behaviors.Paging.PagerTemplateContainerBottom.FindControl("CustomerPager") as CustomerPagerControl;
        pagerControl.PageChanged += new EventHandler<PageChangedEventArgs>(currentPageControl_PageChanged);
    }

    void currentPageControl_PageChanged(object sender, PageChangedEventArgs e)
    {
        this.WebDataGridView.Behaviors.Paging.PageIndex = e.PageNumber;
    }

    protected void WebDataGridView_DataBound(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            pagerControl.SetupPageList(this.WebDataGridView.Behaviors.Paging.PageCount);
        }
        pagerControl.SetCurrentPageNumber(WebDataGridView.Behaviors.Paging.PageIndex);
    }
}
