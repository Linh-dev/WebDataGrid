using System;

public partial class Samples_WebDataGrid_Data_Unbound_Column_Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
    }

    protected void WebDataGrid1_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
    {
        decimal unitPrice = (decimal)e.Row.Items.FindItemByKey("UnitPrice").Value;
        decimal unitsOnOrder = (decimal)(short)e.Row.Items.FindItemByKey("UnitsOnOrder").Value;
        e.Row.Items.FindItemByKey("Total").Value = Decimal.Multiply(unitPrice, unitsOnOrder);
    }
}
