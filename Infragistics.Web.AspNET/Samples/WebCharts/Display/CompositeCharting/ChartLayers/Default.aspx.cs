using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Infragistics.UltraChart.Resources.Appearance;
using Infragistics.UltraChart.Shared.Styles;
using Infragistics.UltraChart.Resources;
using Infragistics.UltraChart.Data.Series;
using Infragistics.UltraChart.Core.Layers;
using Infragistics.UltraChart.Core;
using Infragistics.UltraChart.Core.ColorModel;
using Infragistics.UltraChart.Data;
using Infragistics.UltraChart.Core.Primitives;
using System.Drawing;

public partial class Samples_WebCharts_Display_Composite_Charting_Chart_Layers_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    /// <summary>
    /// Page Load
    /// </summary>
    /// <param name="sender">Sender objects</param>
    /// <param name="e">Event arguments</param>
    private void Page_Load(object sender, System.EventArgs e)
    {
        if (!IsPostBack)
        {
            // Fill drop down list with layers
            this.DropDownList1.Items.Add("Chart Area 1");
            this.DropDownList1.Items.Add("Chart Area 2");
            this.Dropdownlist2.Items.Add("Chart Area 1");
            this.Dropdownlist2.Items.Add("Chart Area 2");
            this.Dropdownlist3.Items.Add("Chart Area 1");
            this.Dropdownlist3.Items.Add("Chart Area 2");
            this.Dropdownlist4.Items.Add("Chart Area 1");
            this.Dropdownlist4.Items.Add("Chart Area 2");

            // Change default layers for 3th and 4th chart type
            Dropdownlist3.SelectedIndex = 1;
            Dropdownlist4.SelectedIndex = 1;
        }

        // Set composite charts
        this.UltraChart1.ChartType = ChartType.Composite;

        // Create an X axis
        AxisItem xAxis = new AxisItem();
        xAxis.axisNumber = AxisNumber.X_Axis;
        xAxis.DataType = AxisDataType.String;
        xAxis.SetLabelAxisType = SetLabelAxisType.ContinuousData;
        xAxis.Labels.ItemFormatString = "<ITEM_LABEL>";
        xAxis.Labels.Orientation = TextOrientation.Horizontal;
        xAxis.LineThickness = 1;
        xAxis.Labels.Font = new Font("Verdana", 7);

        // Create an Y axis
        AxisItem yAxis = new AxisItem();
        yAxis.axisNumber = AxisNumber.Y_Axis;
        yAxis.DataType = AxisDataType.Numeric;
        yAxis.SetLabelAxisType = SetLabelAxisType.GroupBySeries;
        yAxis.Labels.ItemFormatString = "<DATA_VALUE:#.#>";
        yAxis.TickmarkStyle = AxisTickStyle.Smart;
        yAxis.LineThickness = 1;
        yAxis.Labels.Font = new Font("Verdana", 7);

        // Create the first ChartArea
        ChartArea myChartArea1 = new ChartArea();
        myChartArea1.Border.Thickness = 0;
        myChartArea1.Bounds = new Rectangle(0, 0, 95, 55);
        myChartArea1.BoundsMeasureType = MeasureType.Percentage;

        // Add the first Chart Area to the ChartAreas collection
        this.UltraChart1.CompositeChart.ChartAreas.Add(myChartArea1);

        // Add the axes to the ChartArea
        myChartArea1.Axes.Add(xAxis);
        myChartArea1.Axes.Add(yAxis);

        // Create the second ChartArea
        ChartArea myChartArea2 = new ChartArea();
        myChartArea2.Border.Thickness = 0;
        myChartArea2.Bounds = new Rectangle(0, 45, 95, 55);
        myChartArea2.BoundsMeasureType = MeasureType.Percentage;

        // Add the second Chart Area to the ChartAreas collection
        this.UltraChart1.CompositeChart.ChartAreas.Add(myChartArea2);

        // Add the axes to the ChartArea
        myChartArea2.Axes.Add(xAxis);
        myChartArea2.Axes.Add(yAxis);

        // ****************************************************************
        // Area Chart
        // ****************************************************************
        // Create a series
        NumericSeries numericSeries1 = new NumericSeries();

        // Fill Data Points
        numericSeries1.Points.Add(new NumericDataPoint(10, "Point 1", false));
        numericSeries1.Points.Add(new NumericDataPoint(16, "Point 2", false));
        numericSeries1.Points.Add(new NumericDataPoint(12, "Point 3", false));
        numericSeries1.Points.Add(new NumericDataPoint(18, "Point 4", false));
        numericSeries1.Points.Add(new NumericDataPoint(14, "Point 5", false));
        numericSeries1.Points.Add(new NumericDataPoint(19, "Point 6", false));
        numericSeries1.PEs.Add(new PaintElement(Color.Green));

        // Add the series to the chart's Series collection.
        this.UltraChart1.Series.Add(numericSeries1);

        // Create the ChartLayer
        ChartLayerAppearance chartLayer1 = new ChartLayerAppearance();

        // Add the series to the ChartLayer's Series collection.
        chartLayer1.Series.Add(numericSeries1);

        // Set the ChartType
        chartLayer1.ChartType = ChartType.AreaChart;

        // Set the axes
        chartLayer1.AxisX = xAxis;
        chartLayer1.AxisY = yAxis;

        // Add the ChartLayer to the ChartLayers collection
        this.UltraChart1.CompositeChart.ChartLayers.Add(chartLayer1);

        if (this.DropDownList1.SelectedItem.Value == "Chart Area 1")
        {
            // Set the ChartArea
            chartLayer1.ChartArea = myChartArea1;
        }
        else
        {
            // Set the ChartArea
            chartLayer1.ChartArea = myChartArea2;
        }

        // ****************************************************************
        // Line Chart
        // ****************************************************************
        // Create a series
        NumericSeries numericSeries2 = new NumericSeries();

        // Fill Data Points
        numericSeries2.Points.Add(new NumericDataPoint(8, "Point 1", false));
        numericSeries2.Points.Add(new NumericDataPoint(5, "Point 2", false));
        numericSeries2.Points.Add(new NumericDataPoint(12, "Point 3", false));
        numericSeries2.Points.Add(new NumericDataPoint(8, "Point 4", false));
        numericSeries2.Points.Add(new NumericDataPoint(7, "Point 5", false));
        numericSeries2.Points.Add(new NumericDataPoint(8, "Point 6", false));
        numericSeries2.PEs.Add(new PaintElement(Color.Blue));

        // Add the series to the chart's Series collection.
        this.UltraChart1.Series.Add(numericSeries2);

        // Create the ChartLayer
        ChartLayerAppearance chartLayer2 = new ChartLayerAppearance();

        // Add the series to the ChartLayer's Series collection.
        chartLayer2.Series.Add(numericSeries2);

        // Set the ChartType
        chartLayer2.ChartType = ChartType.LineChart;

        // Set the axes
        chartLayer2.AxisX = xAxis;
        chartLayer2.AxisY = yAxis;

        // Add the ChartLayer to the ChartLayers collection
        this.UltraChart1.CompositeChart.ChartLayers.Add(chartLayer2);

        if (this.Dropdownlist2.SelectedItem.Value == "Chart Area 1")
        {
            // Set the ChartArea
            chartLayer2.ChartArea = myChartArea1;
        }
        else
        {
            // Set the ChartArea
            chartLayer2.ChartArea = myChartArea2;
        }

        // ****************************************************************
        // Spline Chart
        // ****************************************************************
        // Create a series
        NumericSeries numericSeries3 = new NumericSeries();

        // Fill Data Points
        numericSeries3.Points.Add(new NumericDataPoint(21, "Point 1", false));
        numericSeries3.Points.Add(new NumericDataPoint(25, "Point 2", false));
        numericSeries3.Points.Add(new NumericDataPoint(18, "Point 3", false));
        numericSeries3.Points.Add(new NumericDataPoint(28, "Point 4", false));
        numericSeries3.Points.Add(new NumericDataPoint(17, "Point 5", false));
        numericSeries3.Points.Add(new NumericDataPoint(5, "Point 6", false));
        numericSeries3.PEs.Add(new PaintElement(Color.Yellow));

        // Add the series to the chart's Series collection.
        this.UltraChart1.Series.Add(numericSeries3);

        // Create the ChartLayer
        ChartLayerAppearance chartLayer3 = new ChartLayerAppearance();

        // Add the series to the ChartLayer's Series collection.
        chartLayer3.Series.Add(numericSeries3);

        // Set the ChartType
        chartLayer3.ChartType = ChartType.SplineChart;

        // Set the axes
        chartLayer3.AxisX = xAxis;
        chartLayer3.AxisY = yAxis;

        // Add the ChartLayer to the ChartLayers collection
        this.UltraChart1.CompositeChart.ChartLayers.Add(chartLayer3);

        if (this.Dropdownlist3.SelectedItem.Value == "Chart Area 1")
        {
            // Set the ChartArea
            chartLayer3.ChartArea = myChartArea1;
        }
        else
        {
            // Set the ChartArea
            chartLayer3.ChartArea = myChartArea2;
        }

        // ****************************************************************
        // Spline Area Chart
        // ****************************************************************
        // Create a series
        NumericSeries numericSeries4 = new NumericSeries();

        // Fill Data Points
        numericSeries4.Points.Add(new NumericDataPoint(32, "Point 1", false));
        numericSeries4.Points.Add(new NumericDataPoint(21, "Point 2", false));
        numericSeries4.Points.Add(new NumericDataPoint(27, "Point 3", false));
        numericSeries4.Points.Add(new NumericDataPoint(17, "Point 4", false));
        numericSeries4.Points.Add(new NumericDataPoint(24, "Point 5", false));
        numericSeries4.Points.Add(new NumericDataPoint(25, "Point 6", false));
        numericSeries4.PEs.Add(new PaintElement(Color.Red));

        // Add the series to the chart's Series collection.
        this.UltraChart1.Series.Add(numericSeries4);

        // Create the ChartLayer
        ChartLayerAppearance chartLayer4 = new ChartLayerAppearance();

        // Add the series to the ChartLayer's Series collection.
        chartLayer4.Series.Add(numericSeries4);

        // Set the ChartType
        chartLayer4.ChartType = ChartType.SplineAreaChart;

        // Set the axes
        chartLayer4.AxisX = xAxis;
        chartLayer4.AxisY = yAxis;

        // Add the ChartLayer to the ChartLayers collection
        this.UltraChart1.CompositeChart.ChartLayers.Add(chartLayer4);

        if (this.Dropdownlist4.SelectedItem.Value == "Chart Area 1")
        {
            // Set the ChartArea
            chartLayer4.ChartArea = myChartArea1;
        }
        else
        {
            // Set the ChartArea
            chartLayer4.ChartArea = myChartArea2;
        }
    }

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
