using System;
using System.Data;

public partial class Samples_WebDataGrid_Display_Error_and_Empty_Data_Row_Template_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        this.WebDataGridView.DataSource = this.GetDataSource();
        this.WebDataGridView.InitializeRow += new Infragistics.Web.UI.GridControls.InitializeRowEventHandler(WebDataGridView_InitializeRow);

        if (!this.IsPostBack)
        {
            this.WebDataGridView.DataBind();
        }
    }

    void WebDataGridView_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
    {
        if (this.ShowErrorTemplate.Checked)
        {
            this.RaiseException();
        }
    }

    private DataTable GetDataSource()
    {
        DataTable dataSource = null;

        if (this.ShowEmptyTemplate.Checked)
        {
            dataSource = new NorthwindDataSource().GetDataTable();
        }
        else
        {
            dataSource = new NorthwindDataSource().GetCustomerDataSource();
        }

        return dataSource;
    }

    private void RaiseException()
    {
        throw new ApplicationException(this.GetGlobalResourceObject("WebDataGrid", "ErrorTemplateException").ToString());
    }
}
