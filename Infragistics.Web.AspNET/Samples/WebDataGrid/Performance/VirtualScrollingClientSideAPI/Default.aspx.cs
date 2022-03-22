using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Performance_Client_side_API_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
    }

    protected void EnableRadio_CheckedChanged(object sender, EventArgs e)
    {
        this.GetVirtualScrollingBehavior().Enabled = true;
    }

    protected void DisableRadio_CheckedChanged(object sender, EventArgs e)
    {
        this.GetVirtualScrollingBehavior().Enabled = false;
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

    private VirtualScrolling GetVirtualScrollingBehavior()
    {
        return this.WebDataGridView.Behaviors.GetBehavior<VirtualScrolling>();
    }
}
