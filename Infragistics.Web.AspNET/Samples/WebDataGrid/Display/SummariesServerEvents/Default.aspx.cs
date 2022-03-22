using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Display_Summaries_Server_Events_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected int counter = 0;

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.WebDataGrid1.SummaryCalculated += new SummaryCalculatedHandler(WebDataGrid1_SummaryCalculated);
        this.WebDataGrid1.CalculateCustomSummary += new CalculateCustomSummaryHandler(WebDataGrid1_CalculateCustomSummary);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.ProductsDataSource.DataBind();
        eventList.InnerHtml = "";
    }
    protected void WebDataGrid1_SummaryCalculated(object sender, SummaryEventArgs e)
    {
        double val = Convert.ToDouble(e.SummaryValue);
        Add(string.Format(this.GetGlobalResourceObject("WebDataGrid", "SummariesServer_SummaryCalculatedEventMessage").ToString(), e.ColumnSummaryInfo.ColumnKey, e.Summary.SummaryType, val.ToString("#.##")));
    }

    protected object WebDataGrid1_CalculateCustomSummary(object sender, CustomSummaryEventArgs e)
    {
        Add(string.Format(this.GetGlobalResourceObject("WebDataGrid","SummariesServer_CalculateCustomSummaryEventMessage").ToString(), e.ColumnSummaryInfo.ColumnKey, e.Summary.CustomSummaryName));

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

    protected void Add(string message)
    {
        counter++;
        eventList.InnerHtml += String.Format("<span class='outputValue' id='span_{0}'>{0}. {1}</span><br />", counter, message);
    }
}
