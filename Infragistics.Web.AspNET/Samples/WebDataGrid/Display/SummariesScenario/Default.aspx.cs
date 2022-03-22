using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Display_Summaries_Scenario_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{   

    protected void WebDataGrid1_SummaryCalculated(object sender, SummaryEventArgs e)
    {

        switch (e.ColumnSummaryInfo.ColumnKey)
        {
            case "ProductID":

                ApplyCssClass(e.Summary, "ProductID", e.SummaryValue, ProductSummaryValueField.Value);
                break;

            case "UnitPrice":

                ApplyCssClass(e.Summary, "UnitPrice", e.SummaryValue, PriceSummaryValueField.Value);
                break;

            case "UnitsInStock":

                ApplyCssClass(e.Summary, "UnitsInStock", e.SummaryValue, StockSummaryValueField.Value);
                break;

            case "UnitsOnOrder":

                ApplyCssClass(e.Summary, "UnitsOnOrder", e.SummaryValue, OrderSummaryValueField.Value);
                break;
        }

    }

    protected void ApplyCssClass(Summary summary, string columnKey, object newValue, object oldValue)
    {
        if (!IsPostBack)
            return;

        if (columnKey == "UnitPrice")
        {
            double variation = Math.Round(Convert.ToDouble(newValue) - Convert.ToDouble(oldValue), 2);
            if (variation != 0)
                summary.CssClass = (variation < 0) ? "SummaryRedCssClass" : "SummaryGreenCssClass";
            else
                summary.CssClass = "";
        }
        else
        {
            int variation = Convert.ToInt32(newValue) - Convert.ToInt32(oldValue);
            if (variation != 0)
                summary.CssClass = (variation < 0) ? "SummaryRedCssClass" : "SummaryGreenCssClass";
            else
                summary.CssClass = "";
        }
    }

    protected object WebDataGrid1_CalculateCustomSummary(object sender, CustomSummaryEventArgs e)
    {
        return null; //Must be handled for Custom Summaries
    }

    protected void WebDataGrid1_RowUpdated(object sender, RowUpdatedEventArgs e)
    {
        //Handled for PostBack to invoke Summary Styling        
    }
}
