using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Organization_Column_Sorting_Client_Events_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.DefaultDataSource.DataBind();

        if (!this.IsPostBack)
        {
            Sorting behavior = this.WebDataGrid1.Behaviors.Sorting;
            behavior.SortedColumns.Add(this.WebDataGrid1.Columns["CompanyName"],
                                       Infragistics.Web.UI.SortDirection.Ascending);
        }
    }
}
