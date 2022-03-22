using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Performance_Configuring_Virtual_Scrolling_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
    }

    protected void VirtualRadio_CheckedChanged(object sender, EventArgs e)
    {
        this.GetVirtualScrollingBehavior().ScrollingMode = ScrollingMode.Virtual;
    }

    protected void DeferredRadio_CheckedChanged(object sender, EventArgs e)
    {
        this.GetVirtualScrollingBehavior().ScrollingMode =
            ScrollingMode.Deferred;
    }

    protected void RowCacheFactorList_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.GetVirtualScrollingBehavior().RowCacheFactor =
            double.Parse(this.RowCacheFactorList.SelectedValue);
    }

    protected void ThresholdFactorList_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.GetVirtualScrollingBehavior().ThresholdFactor =
            double.Parse(this.ThresholdFactorList.SelectedValue);

    }

    protected void DataFetchDelayList_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.GetVirtualScrollingBehavior().DataFetchDelay =
            int.Parse(this.DataFetchDelayList.SelectedValue);
    }

    private VirtualScrolling GetVirtualScrollingBehavior()
    {
        return this.WebDataGridView.Behaviors.GetBehavior<VirtualScrolling>();
    }
}
