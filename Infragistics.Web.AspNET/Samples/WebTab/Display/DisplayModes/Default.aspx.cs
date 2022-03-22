using System;
using Infragistics.Web.UI.LayoutControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.DropDownList1.SelectedIndex == 0)
        {
            this.WebTab1.DisplayMode = TabDisplayMode.MultiRow;
        }
        else if (this.DropDownList1.SelectedIndex == 1)
        {
            this.WebTab1.DisplayMode = TabDisplayMode.MultiRowAuto;
        }
        else if (this.DropDownList1.SelectedIndex == 2)
        {
            this.WebTab1.DisplayMode = TabDisplayMode.Scrollable;
        }
        else
        {
            this.WebTab1.DisplayMode = TabDisplayMode.SingleRow;
        }
    }
}
