using System;

public partial class Samples_WebDataGrid_Organization_ExcelStyleFilteringBoundUnboudFields_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.SqlDataSource1.DataBind();
        this.WebDataGrid1.InitializeRow += new Infragistics.Web.UI.GridControls.InitializeRowEventHandler(WebDataGrid1_InitializeRow);
    }

    void WebDataGrid1_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
    {
		if (e.Row.Items.FindItemByKey("Total").Value == null)
		{
			decimal unitPrice = (decimal)e.Row.Items.FindItemByKey("UnitPrice").Value;
			decimal unitsInStock = (decimal)(short)e.Row.Items.FindItemByKey("UnitsInStock").Value;
			e.Row.Items.FindItemByKey("Total").Value = Decimal.Multiply(unitPrice, unitsInStock);
		}
    }
}