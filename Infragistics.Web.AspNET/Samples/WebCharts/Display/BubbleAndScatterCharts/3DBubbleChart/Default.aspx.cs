using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Infragistics.UltraChart.Resources.Appearance;
using Infragistics.UltraChart.Core.Primitives;

public partial class Samples_WebCharts_Display_Bubble_And_Scatter_Charts_3D_Bubble_Chart_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private void Page_Load(object sender, System.EventArgs e)
    {
        this.UltraChart1.Series.Add(MakeData());
        this.UltraChart1.Data.DataBind();
    }

    #region Create Chart Data
    /// <summary>
    /// Use the Sin and Cos functions to generate data for the heatmap chart
    /// </summary>
    /// <returns></returns>
    private Infragistics.UltraChart.Data.Series.ISeries MakeData()
    {
        FourDimensionalNumericSeries series = new FourDimensionalNumericSeries();
        series.Points.Add(new FourDimensionalNumericDataPoint(8, 0, 2.36, 0, "", false));
        series.Points.Add(new FourDimensionalNumericDataPoint(16, 120, 25, 10, "", false));
        series.Points.Add(new FourDimensionalNumericDataPoint(32, -25, 100, 25, "", false));
        series.Points.Add(new FourDimensionalNumericDataPoint(64, -80, -100, 50, "", false));
        series.Points.Add(new FourDimensionalNumericDataPoint(128, 63, -12, 100, "", false));
        series.Points.Add(new FourDimensionalNumericDataPoint(2, 156, 75, -25, "", false));
        series.Points.Add(new FourDimensionalNumericDataPoint(4, -129, 166, -50, "", false));
        series.Points.Add(new FourDimensionalNumericDataPoint(8, -175, -86, -75, "", false));
        series.Points.Add(new FourDimensionalNumericDataPoint(16, 96, -177, -100, "", false));
        series.Points.Add(new FourDimensionalNumericDataPoint(32, 36, 111, -150, "", false));
        series.Points.Add(new FourDimensionalNumericDataPoint(8, -75, 69, 75, "", false));
        series.Points.Add(new FourDimensionalNumericDataPoint(16, -75, 69, 150, "", false));
        series.Points.Add(new FourDimensionalNumericDataPoint(32, -99, -50, 125, "", false));
        series.Points.Add(new FourDimensionalNumericDataPoint(64, 29, -143, 175, "", false));

        return series;
    }
    #endregion

    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        InitializeComponent();
        base.OnInit(e);
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        this.Load += new System.EventHandler(this.Page_Load);

    }
    #endregion
}
