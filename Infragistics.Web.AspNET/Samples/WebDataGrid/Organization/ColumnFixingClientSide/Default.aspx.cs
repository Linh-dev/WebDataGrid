using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Organization_Column_Fixing_Client_Side_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.GridDataSource.DataBind();
        if (!IsPostBack)
            this.WebDataGridView.Behaviors.ColumnFixing.FixedColumns.Add(new FixedColumnInfo("CompanyName"));
    }
}
