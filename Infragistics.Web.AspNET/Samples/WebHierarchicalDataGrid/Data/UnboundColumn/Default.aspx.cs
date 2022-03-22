using System;

public partial class Samples_WebHierarchicalDataGrid_Data_Unbound_Column_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void OnInit(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
        this.AccessDataSource2.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void WebDataGrid1_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
    {
		if (e.Row.Items.FindItemByKey("Total") == null)
		    return;
        decimal unitPrice = (decimal)e.Row.Items.FindItemByKey("UnitPrice").Value;
        decimal unitsOnOrder = (decimal)(short)e.Row.Items.FindItemByKey("UnitsOnOrder").Value;
        e.Row.Items.FindItemByKey("Total").Value = Decimal.Multiply(unitPrice, unitsOnOrder);
    }
}
