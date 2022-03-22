using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Organization_Column_Sorting_Single_Multi_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();

        if (!this.IsPostBack)
        {
            Sorting behavior = this.WebDataGrid1.Behaviors.Sorting;
            behavior.SortedColumns.Add(this.WebDataGrid1.Columns["CompanyName"],
                                       Infragistics.Web.UI.SortDirection.Ascending);
        }

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.DropDownList1.SelectedIndex == 0)
        {
            this.WebDataGrid1.Behaviors.Sorting.SortingMode = SortingMode.Single;
        }
        else
        {
            this.WebDataGrid1.Behaviors.Sorting.SortingMode = SortingMode.Multi;
        }
    }
}
