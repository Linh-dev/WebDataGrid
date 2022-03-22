using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Display_Summaries_Row_Selectors_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.ProductsDataSource.DataBind();
    }

    protected void chkAddRemoveSummaries_CheckedChanged(object sender, EventArgs e)
    {
        WebDataGrid1.Behaviors.SummaryRow.ColumnSummaries.Clear();
        if (chkAddRemoveSummaries.Checked)
        {
            AddSummaries("ProductName");
            AddSummaries("UnitPrice");
            AddSummaries("UnitsInStock");
            AddSummaries("UnitsOnOrder");
        }
    }

    protected void AddSummaries(string columnKey)
    {
        ColumnSummaryInfo info = new ColumnSummaryInfo();
        info.ColumnKey = columnKey;
        info.Summaries.Add(SummaryType.Count);
        if (columnKey != "ProductName")
        {
            info.Summaries.Add(SummaryType.Max);
            info.Summaries.Add(SummaryType.Sum);
            info.Summaries.Add(SummaryType.Average);
            info.Summaries.Add(SummaryType.Min);
        }
        this.WebDataGrid1.Behaviors.SummaryRow.ColumnSummaries.Add(info);
    }
}
