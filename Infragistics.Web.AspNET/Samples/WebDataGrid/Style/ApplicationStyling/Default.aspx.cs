using System;

public partial class Samples_WebDataGrid_Style_Application_Styling_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();

        if (!this.IsPostBack)
        {
            this.WebDataGrid1.DataSourceID = "AccessDataSource1";
        }
        else
        {
            this.WebDataGrid1.DataSourceID = "";
            WebDataGrid1.StyleSetName = this.DDList1.SelectedValue;
            this.WebDataGrid1.DataSourceID = "AccessDataSource1";
        }
    }
}
