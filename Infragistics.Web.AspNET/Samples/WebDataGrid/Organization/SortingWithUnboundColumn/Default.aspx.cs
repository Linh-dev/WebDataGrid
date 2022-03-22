using System;

public partial class Samples_WebDataGrid_Organization_Sorting_with_Unbound_Column_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
    }

    protected void WebDataGrid1_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
    {
        e.Row.Items.FindItemByKey("Total").Value = Decimal.Multiply((decimal)e.Row.Items.FindItemByKey("UnitPrice").Value, (decimal)(short)e.Row.Items.FindItemByKey("UnitsOnOrder").Value);
    }
}