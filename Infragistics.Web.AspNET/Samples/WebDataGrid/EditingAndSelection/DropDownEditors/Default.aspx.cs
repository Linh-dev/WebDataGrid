using System;

public partial class Samples_WebDataGrid_Editing_and_Selection_DropDown_Editors_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        this.Orders.DataBind();
        this.Shippers.DataBind();
        this.Customers.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void WebDataGrid1_RowUpdating(object sender, Infragistics.Web.UI.GridControls.RowUpdatingEventArgs e)
    {
        // This samples does not support updating.
        e.Cancel = true;
    }
}
