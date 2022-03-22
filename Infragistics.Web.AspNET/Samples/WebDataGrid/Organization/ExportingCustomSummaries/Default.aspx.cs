using System;
using Infragistics.Web.UI.GridControls;
using Infragistics.Documents.Excel;

public partial class Samples_WebDataGrid_Organization_Exporting_Custom_Summaries_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.SqlDsProducts.DataBind();
    }

    protected object WebDataGrid1_CalculateCustomSummary(object sender, CustomSummaryEventArgs e)
    {
        switch (e.ColumnSummaryInfo.ColumnKey)
        {
            case "UnitPrice":
                return this.CalcStDev(2);
            case "UnitsInStock":
                return this.CalcStDev(3);
            case "UnitsOnOrder":
                return this.CalcStDev(4);
            default:
                return null;
        }
    }

    protected double CalcStDev(int colNumber)
    {
        double sum = 0.0;
        int n = 0;
        foreach (GridRecord gr in this.wdgProducts.Rows)
        {
            sum += Convert.ToDouble(gr.Items[colNumber].Value);
            ++n;
        }

        double mean = sum / n;
        sum = 0;
        foreach (GridRecord gr in this.wdgProducts.Rows)
        {
            sum += Math.Pow(mean - Convert.ToDouble(gr.Items[colNumber].Value), 2);
        }

        sum = sum / (n - 1);

        return Math.Round(Math.Sqrt(sum), 2);
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        eExporter.Export(wdgProducts);
    }

    protected void WebExcelExporter1_CellExporting(object sender, ExcelCellExportingEventArgs e)
    {
        if (e.IsSummaryCell && e.Summary != null)
        {
            if (e.Summary.CustomSummaryName == "STDEV")
            {
                int startExcelIndex = 2;
                int endExcelIndex = 78;
                string columnIndex = ExcelColumnIndex(e.CurrentColumnIndex);

                string formula = "=\"STDEV = \" & STDEV(" + columnIndex + startExcelIndex + ":" + columnIndex + endExcelIndex + ")";
                e.WorksheetCell.ApplyFormula(formula);
                e.WorksheetCell.CellFormat.Alignment = HorizontalCellAlignment.Right;
                e.WorksheetCell.CellFormat.Font.Bold = ExcelDefaultableBoolean.True;

                e.Cancel = true;
            }
        }
    }

    protected string ExcelColumnIndex(int currentColumnIndex)
    {
        string excelColumnIndex = "";

        switch (currentColumnIndex)
        {
            case 2:
                excelColumnIndex = "C";
                break;
            case 3:
                excelColumnIndex = "D";
                break;
            case 4:
                excelColumnIndex = "E";
                break;

        }
        return excelColumnIndex;
    }
}
