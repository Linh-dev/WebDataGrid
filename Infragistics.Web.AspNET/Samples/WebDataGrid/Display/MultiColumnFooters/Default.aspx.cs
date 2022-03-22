using System;
using Infragistics.Web.UI.GridControls;
using System.Web.UI.WebControls;

public partial class Samples_WebDataGrid_Display_MultiColumnFooters_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        this.AccessDataSource1.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        GridField supplierIDField = WebDataGridView.Columns["SupplierID"];
        supplierIDField.Footer.Text = String.Format("{0} {1} {2} {3}", this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderSupplierID"), this.GetGlobalResourceObject("WebDataGrid", "MultiColumnFooters_And"), this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderCompany"), this.GetGlobalResourceObject("WebDataGrid", "MultiColumnFooters_Footer"));
        GridField contactNameField = WebDataGridView.Columns["ContactName"];
        contactNameField.Footer.Text = String.Format("{0} {1}", this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderContact"), this.GetGlobalResourceObject("WebDataGrid", "MultiColumnFooters_Footer"));
        GridField addressField = WebDataGridView.Columns["Address"];
        addressField.Footer.Text = String.Format("{0}, {1} {2} {3} {4}", this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderAddress"), this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderCity"), this.GetGlobalResourceObject("WebDataGrid", "MultiColumnFooters_And"), this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderPostalCode"), this.GetGlobalResourceObject("WebDataGrid", "MultiColumnFooters_Footer"));
        GridField regionField = WebDataGridView.Columns["Region"];
        regionField.Footer.Text = String.Format("{0} {1} {2} {3}", this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderRegion"), this.GetGlobalResourceObject("WebDataGrid", "MultiColumnFooters_And"), this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderCountry"), this.GetGlobalResourceObject("WebDataGrid", "MultiColumnFooters_Footer"));
    }
}