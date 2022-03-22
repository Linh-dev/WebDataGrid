using System;
using Infragistics.Web.UI.GridControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.SqlDataSource1.DataBind();
        this.SqlDataSource2.DataBind();
        base.OnPreInit(e);
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        this.WebHierarchicalDataGrid1.InitializeRow += new Infragistics.Web.UI.GridControls.InitializeRowEventHandler(WebHierarchicalDataGrid1_InitializeRow);
    }

    void WebHierarchicalDataGrid1_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
    {
        ContainerGridRecord childRow = (ContainerGridRecord)e.Row;
        if (childRow.Level == 1)
        {
            decimal unitPrice = (decimal)e.Row.Items.FindItemByKey("UnitPrice").Value;
            decimal unitsInStock = (decimal)(short)e.Row.Items.FindItemByKey("UnitsInStock").Value;
            e.Row.Items.FindItemByKey("Total").Value = Decimal.Multiply(unitPrice, unitsInStock);
        }
    }
}
