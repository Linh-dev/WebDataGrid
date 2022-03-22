using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Organization_Column_Sorting_Server_Events_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.DefaultDataSource.DataBind();

        if (!this.IsPostBack)
        {
            Sorting behavior = this.WebDataGridView.Behaviors.Sorting;
            behavior.SortedColumns.Add(this.WebDataGridView.Columns["CompanyName"],
                                       Infragistics.Web.UI.SortDirection.Ascending);
        }
    }

    protected void Sorting_ColumnSorted(object sender, SortingEventArgs e)
    {
        if (e.SortedColumns.Count > 0)
        {
            SortedColumnInfo column = e.SortedColumns[0];
            string headerText = this.WebDataGridView.Columns[column.ColumnKey].Header.Text;
            this.ServerMessage.Text = string.Format(this.GetGlobalResourceObject("WebDataGrid","Sorting_ServerSideEventMessage").ToString(), headerText, column.SortDirection.ToString());
        }
    }
}
