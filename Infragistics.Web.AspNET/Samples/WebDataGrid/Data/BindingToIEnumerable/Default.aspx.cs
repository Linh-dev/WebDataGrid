using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Data_Binding_to_IEnumerable_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NorthwindDataSource nwindDataSource = new NorthwindDataSource();
        nwindDataSource.SetWebDataGridDataSource(this.WebDataGrid1, "IEnumerable");
        if (!IsPostBack)
        {
            BoundDataField boundField = new BoundDataField();
            boundField.Key = "EmployeeID";
            boundField.DataFieldName = "EmployeeID";
            boundField.Header.Text = this.GetGlobalResourceObject("WebDataGrid","EmployeeID").ToString();

            this.WebDataGrid1.Columns.Add(boundField);

            boundField = new BoundDataField();
            boundField.Key = "FirstName";
            boundField.DataFieldName = "FirstName";
            boundField.Header.Text = this.GetGlobalResourceObject("WebDataGrid","FirstName").ToString();

            this.WebDataGrid1.Columns.Add(boundField);

            boundField = new BoundDataField();
            boundField.Key = "LastName";
            boundField.DataFieldName = "LastName";
            boundField.Header.Text = this.GetGlobalResourceObject("WebDataGrid","LastName").ToString();

            this.WebDataGrid1.Columns.Add(boundField);

            boundField = new BoundDataField();
            boundField.Key = "Title";
            boundField.DataFieldName = "Title";
            boundField.Header.Text = this.GetGlobalResourceObject("WebDataGrid","Title").ToString();

            this.WebDataGrid1.Columns.Add(boundField);

            boundField = new BoundDataField();
            boundField.Key = "BirthDate";
            boundField.DataFieldName = "BirthDate";
            boundField.Header.Text = this.GetGlobalResourceObject("WebDataGrid", "BirthDate").ToString();

            this.WebDataGrid1.Columns.Add(boundField);

            boundField = new BoundDataField();
            boundField.Key = "City";
            boundField.DataFieldName = "City";
            boundField.Header.Text = this.GetGlobalResourceObject("WebDataGrid", "City").ToString();

            this.WebDataGrid1.Columns.Add(boundField);

            boundField = new BoundDataField();
            boundField.Key = "Country";
            boundField.DataFieldName = "Country";
            boundField.Header.Text = this.GetGlobalResourceObject("WebDataGrid", "Country").ToString();

            this.WebDataGrid1.Columns.Add(boundField);
        }
    }
}
