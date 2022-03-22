using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Data_Dynamic_Columns_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.CreateColumns();
        this.WebDataGridView.DataSource = new NorthwindDataSource().GetCustomers();

        if (!this.IsPostBack)
        {
            this.WebDataGridView.DataBind();
        }
    }

    private void CreateColumns()
    {
        if (!this.IsPostBack)
        {
            this.AddColumn("CustomerID", this.GetGlobalResourceObject("WebDataGrid","ColumnHeaderId").ToString());
            this.AddColumn("CompanyName", this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderCompany").ToString());
            this.AddColumn("ContactName", this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderContact").ToString());
            this.AddColumn("Address", this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderAddress").ToString());
            this.AddColumn("City", this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderCity").ToString());
            this.AddColumn("PostalCode", this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderPostalCode").ToString());
            this.AddColumn("Country", this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderCountry").ToString());
        }
    }

    private void AddColumn(string fieldName, string headerText)
    {
        BoundDataField field = new BoundDataField(true);
        field.Key = "Key_" + fieldName;
        field.DataFieldName = fieldName;
        field.Header.Text = headerText;
        this.WebDataGridView.Columns.Add(field);
    }
}
