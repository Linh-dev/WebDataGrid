using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Display_Summaries_Custom_Summary_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected object WebDataGrid1_CalculateCustomSummary(object sender, CustomSummaryEventArgs e)
    {
        double sum = 0.0;
        int n = 0;
        foreach (GridRecord gr in this.WebDataGrid1.Rows)
        {
            sum += Convert.ToDouble(gr.Items[2].Value);
            ++n;
        }

        //calculate the sum of squared deviations
        double mean = sum / n;
        sum = 0;
        foreach (GridRecord gr in this.WebDataGrid1.Rows)
        {
            sum += Math.Pow(mean - Convert.ToDouble(gr.Items[2].Value), 2);
        }

        sum = sum / (n - 1);

        return Math.Round(Math.Sqrt(sum), 2);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.ProductsDataSource.DataBind();
        if (!IsPostBack)
            AddRemoveCustomSummary(true);
    }

    protected void chkCustomSummaries_CheckedChanged(object sender, EventArgs e)
    {
        AddRemoveCustomSummary(chkCustomSummaries.Checked);
    }

    protected void AddRemoveCustomSummary(bool isAdd)
    {
        SummaryRow summaryRowBehavior = this.WebDataGrid1.Behaviors.SummaryRow;

        //returns the index where the st.dev summary option appears in the drop down
        int summarySettingIndex = -1;
        if (summaryRowBehavior.ColumnSettings["UnitPrice"] != null)
        {
            foreach (SummarySetting summarySetting in summaryRowBehavior.ColumnSettings["UnitPrice"].SummarySettings)
            {
                if (summarySetting.CustomSummaryName == "STDEV")
                {
                    summarySettingIndex = summaryRowBehavior.ColumnSettings["UnitPrice"].SummarySettings.IndexOf(summarySetting);
                    break;
                }
            }
        }

        //returns the index where the summary definition for the st.dev summary appears in the column
        int summaryIndex = -1;
        if (summaryRowBehavior.ColumnSummaries["UnitPrice"] != null)
        {
            foreach (Summary summary in summaryRowBehavior.ColumnSummaries["UnitPrice"].Summaries)
            {
                if (summary.CustomSummaryName == "STDEV")
                {
                    summaryIndex = summaryRowBehavior.ColumnSummaries["UnitPrice"].Summaries.IndexOf(summary);
                    break;
                }
            }
        }

        if (isAdd)
        {
            //setup settings menu
            SummaryRowSetting summaryRowSetting = new SummaryRowSetting(this.WebDataGrid1, "UnitPrice");
            SummarySetting customSummarySetting = new SummarySetting();
            customSummarySetting.SummaryType = SummaryType.Custom;
            customSummarySetting.CustomSummaryName = "STDEV";
            customSummarySetting.FormatString = "STDEV = {1}";
            summaryRowSetting.SummarySettings.Add(customSummarySetting);

            //setup summary logic
            ColumnSummaryInfo customColumnSummaryInfo = new ColumnSummaryInfo();
            customColumnSummaryInfo.ColumnKey = "UnitPrice";
            Summary customSummary = new Summary();
            customSummary.SummaryType = SummaryType.Custom;
            customSummary.CustomSummaryName = "STDEV";
            customColumnSummaryInfo.Summaries.Add(customSummary);

            //adding a column summary for UnitPrice column if not already added
            if (summaryRowBehavior.ColumnSummaries["UnitPrice"] == null)
                summaryRowBehavior.ColumnSummaries.Add(customColumnSummaryInfo);
            else
            {
                //add a summary
                if (summaryIndex == -1)
                    summaryRowBehavior.ColumnSummaries["UnitPrice"].Summaries.Add(customSummary);
            }
            //adding a column summaryRowSetting for the column if not already added
            if (summaryRowBehavior.ColumnSettings["UnitPrice"] == null)
                summaryRowBehavior.ColumnSettings.Add(summaryRowSetting);
            else
            {
                //add a summary summaryRowSetting for the column
                if (summarySettingIndex == -1)
                    summaryRowBehavior.ColumnSettings["UnitPrice"].SummarySettings.Add(customSummarySetting);
            }
        }
        else
        {
            //if summary settings have been added, remove them
            if (summaryRowBehavior.ColumnSettings["UnitPrice"] != null && summarySettingIndex != -1)
                summaryRowBehavior.ColumnSettings["UnitPrice"].SummarySettings.RemoveAt(summarySettingIndex);

            //if a summary definition has been added, remove them
            if (summaryRowBehavior.ColumnSummaries["UnitPrice"] != null && summaryIndex != -1)
                summaryRowBehavior.ColumnSummaries["UnitPrice"].Summaries.RemoveAt(summaryIndex);
        }
    }
}
