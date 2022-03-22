using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Display_Summaries_Client_Events_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.ProductsDataSource.DataBind();
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
        foreach (GridRecord gr in this.WebDataGrid1.Rows)
        {
            sum += Convert.ToDouble(gr.Items[colNumber].Value);
            ++n;
        }

        //calculate the sum of squared deviations
        double mean = sum / n;
        sum = 0;
        foreach (GridRecord gr in this.WebDataGrid1.Rows)
        {
            sum += Math.Pow(mean - Convert.ToDouble(gr.Items[colNumber].Value), 2);
        }

        sum = sum / (n - 1);

        return Math.Round(Math.Sqrt(sum), 2);
    }
}
