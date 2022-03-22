using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Infragistics.UltraChart.Resources.Appearance;
using Infragistics.UltraChart.Shared.Styles;
using Infragistics.UltraChart.Resources;
using Infragistics.UltraChart.Data.Series;
using Infragistics.UltraChart.Core.Layers;
using Infragistics.UltraChart.Core;
using Infragistics.UltraChart.Core.ColorModel;
using Infragistics.UltraChart.Data;
using Infragistics.UltraChart.Core.Primitives;

public partial class Samples_WebCharts_Display_Composite_Charting_Data_Series_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
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
            // Add session variables
            this.Page.Session.Add("SeriesType", "NumericSeries");
            this.Page.Session.Add("ChartType", "ColumnChart");

            // Fill drop down list with series types
            ListItem[] seriesTypes = new ListItem[] 
				{
					new ListItem("NumericSeries"), 
					new ListItem("XYSeries"), 
					new ListItem("XYZSeries"), 
					new ListItem("NumericTimeSeries"), 
					new ListItem("CandleSeries"), 
					new ListItem("GanttSeries"), 
				};

            this.DropDownList1.Items.AddRange(seriesTypes);
        }

        this.Page.Session["SeriesType"] = this.DropDownList1.SelectedItem;
        this.Page.Session["ChartType"] = this.Dropdownlist2.SelectedIndex;

        this.Dropdownlist2.Items.Clear();
        if (((ListItem)this.Page.Session["SeriesType"]).Text == "NumericSeries")
        {
            this.Dropdownlist2.Items.Add("ColumnChart");
            this.Dropdownlist2.Items.Add("StackColumnChart");
            this.Dropdownlist2.Items.Add("BarChart");
            this.Dropdownlist2.Items.Add("StackBarChart");
            this.Dropdownlist2.Items.Add("LineChart");
            this.Dropdownlist2.Items.Add("SplineChart");
            this.Dropdownlist2.Items.Add("AreaChart");
            this.Dropdownlist2.Items.Add("SplineAreaChart");
            this.Dropdownlist2.Items.Add("StackLineChart");
            this.Dropdownlist2.Items.Add("StackSplineChart");
            this.Dropdownlist2.Items.Add("StackAreaChart");
            this.Dropdownlist2.Items.Add("StackSplineAreaChart");
            this.Dropdownlist2.Items.Add("RadarChart");
            this.Dropdownlist2.Items.Add("PieChart");
            this.Dropdownlist2.Items.Add("DoughnutChart");
            this.Dropdownlist2.Items.Add("ParetoChart");
        }
        else if (((ListItem)this.Page.Session["SeriesType"]).Text == "XYSeries")
        {
            this.Dropdownlist2.Items.Add("ScatterChart");
            this.Dropdownlist2.Items.Add("PolarChart");
        }
        else if (((ListItem)this.Page.Session["SeriesType"]).Text == "XYZSeries")
        {
            this.Dropdownlist2.Items.Add("BubbleChart");
        }
        else if (((ListItem)this.Page.Session["SeriesType"]).Text == "NumericTimeSeries")
        {
            this.Dropdownlist2.Items.Add("StepLineChart");
            this.Dropdownlist2.Items.Add("StepAreaChart");
        }
        else if (((ListItem)this.Page.Session["SeriesType"]).Text == "CandleSeries")
        {
            this.Dropdownlist2.Items.Add("CandleChart");
        }
        else if (((ListItem)this.Page.Session["SeriesType"]).Text == "GanttSeries")
        {
            this.Dropdownlist2.Items.Add("GanttChart");
        }

        int chartIndex = (int)this.Page.Session["ChartType"];
        if (chartIndex >= this.Dropdownlist2.Items.Count)
        {
            this.Dropdownlist2.SelectedIndex = 0;
        }
        else
        {
            this.Dropdownlist2.SelectedIndex = chartIndex;
        }

        // Set composite charts
        this.UltraChart1.ChartType = ChartType.Composite;

        // Create the ChartArea
        ChartArea myChartArea = new ChartArea();

        // Add the Chart Area to the ChartAreas collection
        this.UltraChart1.CompositeChart.ChartAreas.Add(myChartArea);

        // Create the ChartLayer
        ChartLayerAppearance chartLayer = new ChartLayerAppearance();

        // Set the ChartType
        chartLayer.ChartType = (ChartType)Enum.Parse(typeof(ChartType), this.Dropdownlist2.SelectedItem.Text);

        // Create an X axis
        AxisItem xAxis = new AxisItem();
        xAxis.axisNumber = AxisNumber.X_Axis;
        xAxis.DataType = AxisDataType.String;
        xAxis.Labels.ItemFormatString = "<ITEM_LABEL>";
        xAxis.Labels.Font = new Font("Verdana", 7);
        xAxis.LineThickness = 1;

        // Create an Y axis
        AxisItem yAxis = new AxisItem();
        yAxis.axisNumber = AxisNumber.Y_Axis;
        yAxis.Labels.ItemFormatString = "<DATA_VALUE:0.#>";
        yAxis.Labels.Font = new Font("Verdana", 7);
        yAxis.LineThickness = 1;

        // Set the ChartArea
        chartLayer.ChartArea = myChartArea;

        if (chartLayer.ChartType != ChartType.PieChart && chartLayer.ChartType != ChartType.DoughnutChart && chartLayer.ChartType != ChartType.RadarChart && chartLayer.ChartType != ChartType.PolarChart)
        {
            // Add the axes to the ChartArea
            myChartArea.Axes.Add(xAxis);
            myChartArea.Axes.Add(yAxis);

            // Set the axes
            chartLayer.AxisX = xAxis;
            chartLayer.AxisY = yAxis;
        }

        // Add the ChartLayer to the ChartLayers collection
        this.UltraChart1.CompositeChart.ChartLayers.Add(chartLayer);

        // Create Series
        ISeries series = null;

        // Numeric Series
        if (this.DropDownList1.SelectedItem.Value == "NumericSeries")
        {
            // Create a series
            NumericSeries numericSeries = new NumericSeries();

            // Fill Data Points
            numericSeries.Points.Add(new NumericDataPoint(10, "Point 1", false));
            numericSeries.Points.Add(new NumericDataPoint(16, "Point 2", false));
            numericSeries.Points.Add(new NumericDataPoint(12, "Point 3", false));
            numericSeries.Points.Add(new NumericDataPoint(18, "Point 4", false));
            numericSeries.Points.Add(new NumericDataPoint(14, "Point 5", false));
            numericSeries.Points.Add(new NumericDataPoint(19, "Point 6", false));

            if (chartLayer.ChartType == ChartType.StackColumnChart ||
                chartLayer.ChartType == ChartType.StackBarChart ||
                chartLayer.ChartType == ChartType.StackAreaChart ||
                chartLayer.ChartType == ChartType.StackLineChart ||
                chartLayer.ChartType == ChartType.StackSplineAreaChart ||
                chartLayer.ChartType == ChartType.StackSplineChart)
            {
                // Create a series
                NumericSeries numericSeries1 = new NumericSeries();

                // Fill Data Points
                numericSeries1.Points.Add(new NumericDataPoint(13, "Point 1", false));
                numericSeries1.Points.Add(new NumericDataPoint(18, "Point 2", false));
                numericSeries1.Points.Add(new NumericDataPoint(11, "Point 3", false));
                numericSeries1.Points.Add(new NumericDataPoint(17, "Point 4", false));
                numericSeries1.Points.Add(new NumericDataPoint(9, "Point 5", false));
                numericSeries1.Points.Add(new NumericDataPoint(15, "Point 6", false));
                numericSeries1.Label = "Numeric Series";
                // Add the series to the chart's Series collection.
                this.UltraChart1.Series.Add(numericSeries1);

                // Add the series to the ChartLayer's Series collection.
                chartLayer.Series.Add(numericSeries1);
            }

            // Series Label
            numericSeries.Label = "Numeric Series";
            series = numericSeries;
        }
        // XY Series
        else if (this.DropDownList1.SelectedItem.Value == "XYSeries")
        {
            // Create a series
            XYSeries xySeries = new XYSeries();

            // Add data points
            xySeries.Points.Add(new XYDataPoint(0, 320, "Point 1", false));
            xySeries.Points.Add(new XYDataPoint(60, 150, "Point 2", false));
            xySeries.Points.Add(new XYDataPoint(120, 280, "Point 3", false));
            xySeries.Points.Add(new XYDataPoint(180, 290, "Point 4", false));
            xySeries.Points.Add(new XYDataPoint(240, 190, "Point 5", false));
            xySeries.Points.Add(new XYDataPoint(320, 160, "Point 6", false));

            series = xySeries;

            // X Axis type
            xAxis.Labels.ItemFormatString = "<DATA_VALUE:0.#>";

        }
        // XYZ Seies
        else if (this.DropDownList1.SelectedItem.Value == "XYZSeries")
        {
            // Create a series
            XYZSeries xyzSeries = new XYZSeries();

            // Add data points
            xyzSeries.Points.Add(new XYZDataPoint(1, 16, 4, "Point 1", false));
            xyzSeries.Points.Add(new XYZDataPoint(4, 19, 3, "Point 2", false));
            xyzSeries.Points.Add(new XYZDataPoint(8, 13, 8, "Point 3", false));
            xyzSeries.Points.Add(new XYZDataPoint(14, 16, 4, "Point 4", false));
            xyzSeries.Points.Add(new XYZDataPoint(15, 14, 7, "Point 5", false));
            xyzSeries.Points.Add(new XYZDataPoint(18, 18, 5, "Point 6", false));

            series = xyzSeries;

            // X Axis type
            xAxis.Labels.ItemFormatString = "<DATA_VALUE:0.#>";

            // Set the ChartType
            chartLayer.ChartType = ChartType.BubbleChart;
        }
        // Candle Series
        else if (this.DropDownList1.SelectedItem.Value == "CandleSeries")
        {
            // Create a series
            CandleSeries candleSeries = new CandleSeries();

            // Add data points
            candleSeries.Points.Add(new CandleDataPoint(new DateTime(2005, 8, 1), 56, 78, 82, 43, 350, "Point 1", false));
            candleSeries.Points.Add(new CandleDataPoint(new DateTime(2005, 8, 2), 112, 134, 140, 100, 450, "Point 2", false));
            candleSeries.Points.Add(new CandleDataPoint(new DateTime(2005, 8, 3), 104, 88, 110, 80, 390, "Point 3", false));
            candleSeries.Points.Add(new CandleDataPoint(new DateTime(2005, 8, 4), 68, 92, 93, 60, 278, "Point 4", false));
            candleSeries.Points.Add(new CandleDataPoint(new DateTime(2005, 8, 5), 134, 120, 140, 70, 150, "Point 5", false));
            candleSeries.Points.Add(new CandleDataPoint(new DateTime(2005, 8, 6), 56, 78, 82, 43, 350, "Point 1", false));
            candleSeries.Points.Add(new CandleDataPoint(new DateTime(2005, 8, 7), 112, 134, 140, 100, 450, "Point 2", false));
            candleSeries.Points.Add(new CandleDataPoint(new DateTime(2005, 8, 8), 104, 88, 110, 80, 390, "Point 3", false));

            series = candleSeries;

            // Set X axis Label type to Date Data
            xAxis.SetLabelAxisType = SetLabelAxisType.DateData;
            xAxis.Labels.ItemFormatString = "<DATA_VALUE:MM/dd/yy>";

            // Create an Y2 axis
            AxisItem yAxis2 = new AxisItem();
            yAxis2.axisNumber = AxisNumber.Y2_Axis;
            yAxis2.Labels.ItemFormatString = "<DATA_VALUE:#.#>";
            yAxis2.RangeType = AxisRangeType.Custom;
            yAxis2.RangeMax = 1000;

            // Set the ChartType
            chartLayer.ChartType = ChartType.CandleChart;

            // Set Candle Chart Appearance
            ((CandleChartAppearance)chartLayer.ChartTypeAppearance).VolumeVisible = true;
            ((CandleChartAppearance)chartLayer.ChartTypeAppearance).NegativeRangeColor = Color.Red;
            ((CandleChartAppearance)chartLayer.ChartTypeAppearance).PositiveRangeColor = Color.Green;
            ((CandleChartAppearance)chartLayer.ChartTypeAppearance).VolumeColor = Color.Yellow;
            ((CandleChartAppearance)chartLayer.ChartTypeAppearance).OpenCloseVisible = true;

            // Add the second Y axes to the ChartArea
            myChartArea.Axes.Add(yAxis2);

            // Set the second Y axes
            chartLayer.AxisY2 = yAxis2;
        }
        // Numeric Time Series
        else if (this.DropDownList1.SelectedItem.Value == "NumericTimeSeries")
        {
            // Create a series
            NumericTimeSeries numericTimeSeries = new NumericTimeSeries();

            // Add data points
            numericTimeSeries.Points.Add(new NumericTimeDataPoint());
            numericTimeSeries.Points[0].TimeValue = new DateTime(2005, 8, 1);
            numericTimeSeries.Points[0].NumericValue = 56;

            numericTimeSeries.Points.Add(new NumericTimeDataPoint());
            numericTimeSeries.Points[1].TimeValue = new DateTime(2005, 8, 6);
            numericTimeSeries.Points[1].NumericValue = 26;

            numericTimeSeries.Points.Add(new NumericTimeDataPoint());
            numericTimeSeries.Points[2].TimeValue = new DateTime(2005, 8, 11);
            numericTimeSeries.Points[2].NumericValue = 76;

            numericTimeSeries.Points.Add(new NumericTimeDataPoint());
            numericTimeSeries.Points[3].TimeValue = new DateTime(2005, 8, 16);
            numericTimeSeries.Points[3].NumericValue = 69;

            numericTimeSeries.Points.Add(new NumericTimeDataPoint());
            numericTimeSeries.Points[4].TimeValue = new DateTime(2005, 8, 21);
            numericTimeSeries.Points[4].NumericValue = 23;

            series = numericTimeSeries;

            // Set X axis
            xAxis.Labels.Orientation = TextOrientation.VerticalLeftFacing;
            xAxis.Labels.ItemFormatString = "<ITEM_LABEL:MMM dd, yyyy>";

        }
        // Gantt Series
        else if (this.DropDownList1.SelectedItem.Value == "GanttSeries")
        {
            GanttDataSource ganttData = new GanttDataSource();
            GanttSeries ganttSeries = ganttData.Series.Add("Series A");
            ganttSeries.Label = "";
            GanttItem task1 = ganttSeries.Items.Add("Task 1");
            task1.Times.Add(DateTime.Parse("1/2/2004 12:00 PM"), DateTime.Parse("1/14/2004 12:00 PM"));
            task1.Times[0].ID = 0;
            task1.Times[0].LinkToID = 1;
            task1.Times[0].PercentComplete = 1;
            task1.Times[0].Owner = "Worker A";
            task1.Times.Add(DateTime.Parse("2/2/2004 12:00 PM"), DateTime.Parse("2/14/2004 12:00 PM"));
            task1.Times[1].ID = 0;
            task1.Times[1].LinkToID = 1;
            task1.Times[1].PercentComplete = 1;
            task1.Times[1].Owner = "Worker A";

            GanttItem task2 = ganttSeries.Items.Add("Task 2");
            task2.Times.Add(DateTime.Parse("1/14/2004 12:00 PM"), DateTime.Parse("2/22/2004 12:00 PM"));
            task2.Times[0].ID = 1;
            task2.Times[0].LinkToID = 2;
            task2.Times[0].PercentComplete = 80;
            task2.Times[0].Owner = "Worker B";

            GanttItem task3 = ganttSeries.Items.Add("Task 3");
            task3.Times.Add(DateTime.Parse("2/22/2004 12:00 PM"), DateTime.Parse("3/5/2004 12:00 PM"));
            task3.Times[0].ID = 2;
            task3.Times[0].LinkToID = 3;
            task3.Times[0].PercentComplete = 10;
            task3.Times[0].Owner = "Worker C";

            GanttItem task4 = ganttSeries.Items.Add("Task 4");
            task4.Times.Add(DateTime.Parse("3/5/2004 12:00 PM"), DateTime.Parse("3/15/2004 12:00 PM"));
            task4.Times[0].ID = 3;
            task4.Times[0].LinkToID = 0;
            task4.Times[0].PercentComplete = 30;
            task4.Times[0].Owner = "Worker D";

            task4.Times.Add(DateTime.Parse("1/5/2004 12:00 PM"), DateTime.Parse("3/1/2004 12:00 PM"));
            task4.Times[1].ID = 3;
            task4.Times[1].LinkToID = 0;
            task4.Times[1].PercentComplete = 80;
            task4.Times[1].Owner = "Worker D";

            series = ganttSeries;

            // Set X axis
            xAxis.Labels.Orientation = TextOrientation.VerticalLeftFacing;
            xAxis.Labels.ItemFormatString = "<ITEM_LABEL:MMM dd, yyyy>";

            // Set Y axis
            yAxis.Labels.ItemFormatString = "<ITEM_LABEL>";

            // Set the ChartType
            chartLayer.ChartType = ChartType.GanttChart;
        }

        // Set Fonts
        if (chartLayer.AxisX != null)
        {
            chartLayer.AxisX.Labels.Font = new Font("Times New Roman", 10);
        }
        if (chartLayer.AxisY != null)
        {
            chartLayer.AxisY.Labels.Font = new Font("Times New Roman", 10);
        }
        if (chartLayer.AxisY2 != null)
        {
            chartLayer.AxisY2.Labels.Font = new Font("Times New Roman", 10);
        }

        // Set Axis Type
        SetAxisTypes(chartLayer);

        // Add the series to the chart's Series collection.
        this.UltraChart1.Series.Add(series);

        // Add the series to the ChartLayer's Series collection.
        chartLayer.Series.Add(series);

    }

    /// <summary>
    /// Set AxisDataType and SetLabelAxisType for X, Y and Y2 axes.
    /// </summary>
    /// <param name="layer">Chart layer</param>
    private void SetAxisTypes(ChartLayerAppearance layer)
    {
        switch (layer.ChartType)
        {
            case ChartType.ColumnChart:
            case ChartType.StackColumnChart:
                layer.AxisX.DataType = AxisDataType.String;
                layer.AxisX.SetLabelAxisType = SetLabelAxisType.GroupBySeries;
                layer.AxisY.DataType = AxisDataType.Numeric;
                layer.AxisY.TickmarkStyle = AxisTickStyle.Smart;
                SetLabel(layer, true, false, false, true, true, false);
                break;
            case ChartType.BarChart:
            case ChartType.StackBarChart:
                layer.AxisY.DataType = AxisDataType.String;
                layer.AxisY.SetLabelAxisType = SetLabelAxisType.GroupBySeries;
                layer.AxisX.DataType = AxisDataType.Numeric;
                layer.AxisX.TickmarkStyle = AxisTickStyle.Smart;
                layer.AxisX.SetLabelAxisType = SetLabelAxisType.ContinuousData;
                layer.AxisX.Labels.ItemFormatString = "<DATA_VALUE:0.#>";
                SetLabel(layer, false, true, false, true, true, false);
                break;
            case ChartType.LineChart:
            case ChartType.SplineChart:
            case ChartType.AreaChart:
            case ChartType.SplineAreaChart:
            case ChartType.StackLineChart:
            case ChartType.StackSplineChart:
            case ChartType.StackAreaChart:
            case ChartType.StackSplineAreaChart:
                layer.AxisX.DataType = AxisDataType.String;
                layer.AxisX.SetLabelAxisType = SetLabelAxisType.ContinuousData;
                layer.AxisY.DataType = AxisDataType.Numeric;
                layer.AxisY.TickmarkStyle = AxisTickStyle.Smart;
                SetLabel(layer, true, false, false, true, true, false);
                break;
            case ChartType.BubbleChart:
            case ChartType.ScatterChart:
                layer.AxisX.DataType = AxisDataType.Numeric;
                layer.AxisY.DataType = AxisDataType.Numeric;
                layer.AxisX.TickmarkStyle = AxisTickStyle.Smart;
                layer.AxisY.TickmarkStyle = AxisTickStyle.Smart;
                SetLabel(layer, false, false, false, true, true, false);
                break;
            case ChartType.RadarChart:
            case ChartType.PieChart:
            case ChartType.DoughnutChart:
            case ChartType.PolarChart:
                this.UltraChart1.Axis.X.Labels.ItemFormatString = "<DATA_VALUE:0.#>";
                SetLabel(layer, false, false, false, false, false, false);
                break;
            case ChartType.CandleChart:
                layer.AxisX.DataType = AxisDataType.String;
                layer.AxisX.SetLabelAxisType = SetLabelAxisType.DateData;
                layer.AxisX.Labels.Orientation = TextOrientation.VerticalLeftFacing;
                layer.AxisY.DataType = AxisDataType.Numeric;
                layer.AxisY2.DataType = AxisDataType.Numeric;
                layer.AxisY.TickmarkStyle = AxisTickStyle.Smart;
                layer.AxisY2.TickmarkStyle = AxisTickStyle.Smart;
                SetLabel(layer, true, false, false, true, true, true);
                break;
            case ChartType.ParetoChart:
                // Create an Y2 axis
                AxisItem yAxis2 = new AxisItem();
                yAxis2.axisNumber = AxisNumber.Y2_Axis;
                yAxis2.Labels.ItemFormatString = "<DATA_VALUE:#.#>";
                yAxis2.RangeType = AxisRangeType.Custom;
                yAxis2.RangeMax = 1000;

                // Add the second Y axes to the ChartArea
                layer.ChartArea.Axes.Add(yAxis2);

                // Set the second Y axes
                layer.AxisY2 = yAxis2;

                layer.AxisX.DataType = AxisDataType.String;
                layer.AxisX.SetLabelAxisType = SetLabelAxisType.ContinuousData;
                layer.AxisY.DataType = AxisDataType.Numeric;
                layer.AxisY.TickmarkStyle = AxisTickStyle.Smart;
                layer.AxisY2.DataType = AxisDataType.Numeric;
                layer.AxisY2.TickmarkStyle = AxisTickStyle.Smart;
                SetLabel(layer, true, false, false, true, true, true);
                break;
            case ChartType.StepLineChart:
            case ChartType.StepAreaChart:
                layer.AxisX.DataType = AxisDataType.Time;
                layer.AxisY.DataType = AxisDataType.Numeric;
                SetLabel(layer, false, false, false, true, true, false);
                break;
            case ChartType.GanttChart:
                layer.AxisX.DataType = AxisDataType.Time;
                layer.AxisX.Labels.Orientation = TextOrientation.VerticalLeftFacing;
                layer.AxisY.DataType = AxisDataType.String;
                SetLabel(layer, false, false, false, true, true, false);
                break;
        }
    }

    /// <summary>
    /// Set Label control text
    /// </summary>
    /// <param name="layer">Chart Layer</param>
    /// <param name="l1">Label 1 set</param>
    /// <param name="l2">Label 2 set</param>
    /// <param name="l3">Label 3 set</param>
    /// <param name="l4">Label 4 set</param>
    /// <param name="l5">Label 5 set</param>
    /// <param name="l6">Label 6 set</param>
    private void SetLabel(ChartLayerAppearance layer, bool l1, bool l2, bool l3, bool l4, bool l5, bool l6)
    {
        this.Axis1.Text = "None";
        this.Axis2.Text = "None";
        this.Axis3.Text = "None";
        this.Axis4.Text = "None";
        this.Axis5.Text = "None";
        this.Axis6.Text = "None";

        if (l1)
        {
            this.Axis1.Text = layer.AxisX.SetLabelAxisType.ToString();
        }
        if (l2)
        {
            this.Axis2.Text = layer.AxisY.SetLabelAxisType.ToString();
        }
        if (l3)
        {
            this.Axis3.Text = layer.AxisY2.SetLabelAxisType.ToString();
        }
        if (l4)
        {
            this.Axis4.Text = layer.AxisX.DataType.ToString();
        }
        if (l5)
        {
            this.Axis5.Text = layer.AxisY.DataType.ToString();
        }
        if (l6)
        {
            this.Axis6.Text = layer.AxisY2.DataType.ToString();
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
