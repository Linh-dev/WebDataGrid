using System;
using Infragistics.Web.UI.GridControls;
using System.Web.UI.WebControls;

public partial class Samples_WebHierarchicalDataGrid_Display_MultiColumnFooters_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        this.AccessDataSource1.DataBind();
        this.AccessDataSource2.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        GridField supplierIDField = WebHierarchicalDataGrid1.Columns["SupplierID"];
        supplierIDField.Footer.Text = String.Format("{0} {1} {2} {3}", this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_HeaderText_SupplierID"), this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_MultiColumnFooters_And"), this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_HeaderText_Company"), this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_MultiColumnFooters_Footer"));
        GridField contactNameField = WebHierarchicalDataGrid1.Columns["ContactName"];
        contactNameField.Footer.Text = String.Format("{0} {1}", this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_HeaderText_Contact"), this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_MultiColumnFooters_Footer"));
        GridField addressField = WebHierarchicalDataGrid1.Columns["Address"];
        addressField.Footer.Text = String.Format("{0}, {1} {2} {3} {4}", this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_HeaderText_StreetAddress"), this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_HeaderText_City"), this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_MultiColumnFooters_And"), this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_HeaderText_PostalCode"), this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_MultiColumnFooters_Footer"));
        Band productsBand = WebHierarchicalDataGrid1.Bands["Products"];
        GridField productNameField = productsBand.Columns["ProductName"];
        productNameField.Footer.Text = String.Format("{0}, {1} {2} {3} {4}", this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_HeaderText_ProductName"), this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_HeaderText_SupplierID"), this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_MultiColumnFooters_And"), this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_HeaderText_CategoryID"), this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_MultiColumnFooters_Footer"));
        GridField unitsInOrderField = productsBand.Columns["UnitsOnOrder"];
        unitsInOrderField.Footer.Text = String.Format("{0} {1} {2} {3}", this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_HeaderText_UnitsInOrder"), this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_MultiColumnFooters_And"), this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_HeaderText_ReorderLevel"), this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_MultiColumnFooters_Footer"));
    }
}