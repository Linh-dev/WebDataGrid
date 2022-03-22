using System;
using System.Reflection;
using Infragistics.UltraChart.Resources.Appearance;
using Infragistics.UltraChart.Shared.Styles;
using Infragistics.UltraChart.Core.Layers;
using System.Drawing;

public partial class Samples_WebCharts_Display_Legends_Composite_Chart_Legends_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private void Page_Load(object sender, System.EventArgs e)
    {
        if (!IsPostBack)
        {
            PropertyInfo[] colors = typeof(System.Drawing.Color).GetProperties();
            foreach (PropertyInfo p in colors)
            {
                this.Dropdownlist3.Items.Add(p.Name);
                this.Dropdownlist4.Items.Add(p.Name);
            }

            string[] legendPositions = System.Enum.GetNames(typeof(LegendLocation));
            foreach (string s in legendPositions)
            {
                this.Dropdownlist2.Items.Add(s);
            }
        }

        this.CreateCompositeChart();

        this.InsertCompositeChartLegends();
    }

    private void InsertCompositeChartLegends()
    {
        // Create Composite Chart Legend
        CompositeLegend legend = new CompositeLegend();
        legend.PE.Fill = Color.FromName(this.Dropdownlist3.SelectedItem.Text);
        legend.Border.Color = Color.FromName(this.Dropdownlist4.SelectedItem.Text);
        legend.Border.CornerRadius = 10;
        legend.PE.FillOpacity = 128;
        legend.PE.ElementType = PaintElementType.Gradient;
        legend.PE.FillGradientStyle = GradientStyle.ForwardDiagonal;
        legend.LabelStyle.Font = new Font("Times New Roman", 10);
        this.UltraChart1.CompositeChart.Legends.Add(legend);

        if (this.CheckBox1.Checked)
            legend.ChartLayers.Add(this.UltraChart1.CompositeChart.ChartLayers[0]);

        if (this.CheckBox2.Checked)
            legend.ChartLayers.Add(this.UltraChart1.CompositeChart.ChartLayers[1]);

        if (this.CheckBox3.Checked)
            legend.ChartLayers.Add(this.UltraChart1.CompositeChart.ChartLayers[2]);

        switch (this.Dropdownlist2.SelectedItem.Value)
        {
            case "Left":
                legend.BoundsMeasureType = MeasureType.Percentage;
                legend.Bounds = new Rectangle(0, 5, 25, 19);
                this.UltraChart1.CompositeChart.ChartAreas[0].BoundsMeasureType = MeasureType.Percentage;
                this.UltraChart1.CompositeChart.ChartAreas[0].Bounds = new Rectangle(20, 0, 70, 100);
                break;
            case "Right":
                legend.BoundsMeasureType = MeasureType.Percentage;
                legend.Bounds = new Rectangle(75, 5, 25, 19);
                this.UltraChart1.CompositeChart.ChartAreas[0].BoundsMeasureType = MeasureType.Percentage;
                this.UltraChart1.CompositeChart.ChartAreas[0].Bounds = new Rectangle(0, 0, 70, 100);
                break;
            case "Top":
                legend.BoundsMeasureType = MeasureType.Percentage;
                legend.Bounds = new Rectangle(40, 5, 36, 14);
                this.UltraChart1.CompositeChart.ChartAreas[0].BoundsMeasureType = MeasureType.Percentage;
                this.UltraChart1.CompositeChart.ChartAreas[0].Bounds = new Rectangle(0, 20, 100, 80);
                break;
            case "Bottom":
                legend.BoundsMeasureType = MeasureType.Percentage;
                legend.Bounds = new Rectangle(40, 70, 36, 14);
                this.UltraChart1.CompositeChart.ChartAreas[0].BoundsMeasureType = MeasureType.Percentage;
                this.UltraChart1.CompositeChart.ChartAreas[0].Bounds = new Rectangle(0, 0, 100, 80);
                break;
        }
    }

    /// <summary>
    /// Private method used to create the basic composite chart
    /// </summary>
    private void CreateCompositeChart()
    {
        this.UltraChart1.ChartType = ChartType.Composite;
        this.UltraChart1.BorderWidth = 0;

        //Create the chart area
        ChartArea myChartArea = new ChartArea();
        myChartArea.Border.Thickness = 0;
        this.UltraChart1.CompositeChart.ChartAreas.Add(myChartArea);

        // Create a Y axis
        AxisItem yAxis = new AxisItem();
        yAxis.axisNumber = AxisNumber.Y_Axis;
        yAxis.DataType = AxisDataType.Numeric;
        yAxis.SetLabelAxisType = SetLabelAxisType.GroupBySeries;
        yAxis.Labels.ItemFormatString = "<DATA_VALUE:0.#>";
        yAxis.Labels.Font = new Font("Verdana", 7);
        yAxis.TickmarkStyle = AxisTickStyle.Smart;
        yAxis.LineThickness = 1;
        myChartArea.Axes.Add(yAxis);

        #region Create the Column Chart
        // Create the X axis
        AxisItem xAxisForColumnChart = new AxisItem();
        xAxisForColumnChart.OrientationType = AxisNumber.X_Axis;
        xAxisForColumnChart.DataType = AxisDataType.String;
        xAxisForColumnChart.SetLabelAxisType = SetLabelAxisType.GroupBySeries;
        xAxisForColumnChart.Labels.ItemFormatString = "<ITEM_LABEL>";
        xAxisForColumnChart.Labels.Font = new Font("Verdana", 7);
        xAxisForColumnChart.LineThickness = 1;
        xAxisForColumnChart.Labels.SeriesLabels.Visible = false;

        //Create the chart layer
        myChartArea.Axes.Add(xAxisForColumnChart);
        ChartLayerAppearance columnLayer = new ChartLayerAppearance();
        columnLayer.ChartType = ChartType.ColumnChart;
        columnLayer.ChartArea = myChartArea;
        columnLayer.AxisX = xAxisForColumnChart;
        columnLayer.AxisY = yAxis;
        this.UltraChart1.CompositeChart.ChartLayers.Add(columnLayer);

        //Assign the series data
        NumericSeries columnSeries = this.GetNumericSeriesForColumnChart();
        this.UltraChart1.CompositeChart.Series.Add(columnSeries);
        columnLayer.Series.Add(columnSeries);


        #endregion

        #region Create the Scatter Chart
        // Create the X axis
        AxisItem xAxisForScatterChart = new AxisItem();
        xAxisForScatterChart.OrientationType = AxisNumber.X_Axis;
        xAxisForScatterChart.DataType = AxisDataType.Numeric;
        xAxisForScatterChart.TickmarkStyle = AxisTickStyle.Smart;
        xAxisForScatterChart.Labels.ItemFormatString = "<DATA_VALUE:0.#>";
        xAxisForScatterChart.Labels.Font = new Font("Verdana", 7);
        xAxisForScatterChart.LineThickness = 1;
        xAxisForScatterChart.Extent = 60;
        xAxisForScatterChart.Margin.Far.MarginType = LocationType.Percentage;
        xAxisForScatterChart.Margin.Near.Value = 2;
        xAxisForScatterChart.Margin.Far.Value = 2;

        //Create the chart layer
        myChartArea.Axes.Add(xAxisForScatterChart);
        ChartLayerAppearance scatterLayer = new ChartLayerAppearance();
        scatterLayer.ChartType = ChartType.ScatterChart;
        scatterLayer.ChartArea = myChartArea;
        scatterLayer.AxisX = xAxisForScatterChart;
        scatterLayer.AxisY = yAxis;
        this.UltraChart1.CompositeChart.ChartLayers.Add(scatterLayer);

        XYSeries xySeries1 = this.GetFirstXYSeriesForScatterChart();
        XYSeries xySeries2 = this.GetSecondXYSeriesForScatterChart();
        this.UltraChart1.CompositeChart.Series.Add(xySeries1);
        this.UltraChart1.CompositeChart.Series.Add(xySeries2);
        scatterLayer.Series.Add(xySeries1);
        scatterLayer.Series.Add(xySeries2);
        #endregion

        #region Create the Line Chart
        // Create the X axis
        AxisItem xAxisForLineChart = new AxisItem();
        xAxisForLineChart.OrientationType = AxisNumber.X2_Axis;
        xAxisForLineChart.DataType = AxisDataType.String;
        xAxisForLineChart.SetLabelAxisType = SetLabelAxisType.ContinuousData;
        xAxisForLineChart.Labels.Orientation = TextOrientation.VerticalRightFacing;
        xAxisForLineChart.Labels.ItemFormatString = "<ITEM_LABEL>";
        xAxisForLineChart.Labels.Font = new Font("Verdana", 7);
        xAxisForLineChart.LineThickness = 1;
        xAxisForLineChart.Labels.Layout.Behavior = AxisLabelLayoutBehaviors.Auto;
        xAxisForLineChart.Margin.Far.MarginType = LocationType.Percentage;
        xAxisForLineChart.Margin.Near.Value = 2;
        xAxisForLineChart.Margin.Far.Value = 2;

        //Create the chart layer
        myChartArea.Axes.Add(xAxisForLineChart);
        ChartLayerAppearance lineLayer = new ChartLayerAppearance();
        lineLayer.ChartType = ChartType.LineChart;
        lineLayer.ChartArea = myChartArea;
        lineLayer.AxisX = xAxisForLineChart;
        lineLayer.AxisY = yAxis;
        this.UltraChart1.CompositeChart.ChartLayers.Add(lineLayer);

        NumericSeries lineSeries = this.GetNumericSeriesForLineChart();
        this.UltraChart1.CompositeChart.Series.Add(lineSeries);
        lineLayer.Series.Add(lineSeries);
        #endregion

    }

    #region Data Series Generation Helper Methods
    private NumericSeries GetNumericSeriesForColumnChart()
    {
        // Create a series
        NumericSeries numericSeries1 = new NumericSeries();

        // Fill Data Points
        numericSeries1.Points.Add(new NumericDataPoint(10, "Point 1", false));
        numericSeries1.Points.Add(new NumericDataPoint(16, "Point 2", false));
        numericSeries1.Points.Add(new NumericDataPoint(12, "Point 3", false));
        numericSeries1.Points.Add(new NumericDataPoint(18, "Point 4", false));
        numericSeries1.Points.Add(new NumericDataPoint(14, "Point 5", false));
        numericSeries1.Points.Add(new NumericDataPoint(19, "Point 6", false));

        // Series Label
        numericSeries1.Label = "Column Chart 1";
        return numericSeries1;
    }

    private NumericSeries GetNumericSeriesForLineChart()
    {
        // Create a series
        NumericSeries numericSeries2 = new NumericSeries();

        // Fill Data Points

        numericSeries2.Points.Add(new NumericDataPoint(5, "Point 1", false));
        numericSeries2.Points.Add(new NumericDataPoint(10, "Point 2", false));
        numericSeries2.Points.Add(new NumericDataPoint(12, "Point 3", false));
        numericSeries2.Points.Add(new NumericDataPoint(11, "Point 4", false));
        numericSeries2.Points.Add(new NumericDataPoint(13, "Point 5", false));
        numericSeries2.Points.Add(new NumericDataPoint(17, "Point 6", false));

        // Series Label
        numericSeries2.Label = "Line 1";
        return numericSeries2;
    }

    private XYSeries GetFirstXYSeriesForScatterChart()
    {
        // Create a series
        XYSeries xySeries = new XYSeries();

        // Add data points
        xySeries.Points.Add(new XYDataPoint(1, 16, "Point 1", false));
        xySeries.Points.Add(new XYDataPoint(4, 12, "Point 2", false));
        xySeries.Points.Add(new XYDataPoint(8, 15, "Point 3", false));
        xySeries.Points.Add(new XYDataPoint(14, 13, "Point 4", false));
        xySeries.Points.Add(new XYDataPoint(15, 19, "Point 5", false));
        xySeries.Points.Add(new XYDataPoint(18, 16, "Point 6", false));

        xySeries.Label = "Set A";
        return xySeries;
    }
    private XYSeries GetSecondXYSeriesForScatterChart()
    {
        // Create a series
        XYSeries xySeries2 = new XYSeries();

        // Add data points
        xySeries2.Points.Add(new XYDataPoint(16, 1, "Point 1", false));
        xySeries2.Points.Add(new XYDataPoint(12, 4, "Point 2", false));
        xySeries2.Points.Add(new XYDataPoint(15, 8, "Point 3", false));
        xySeries2.Points.Add(new XYDataPoint(13, 14, "Point 4", false));
        xySeries2.Points.Add(new XYDataPoint(19, 15, "Point 5", false));
        xySeries2.Points.Add(new XYDataPoint(16, 18, "Point 6", false));

        xySeries2.Label = "Set B";
        return xySeries2;
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
        this.Button1.Click += new System.EventHandler(this.Button1_Click);
        this.Load += new System.EventHandler(this.Page_Load);

    }
    #endregion

    private void Button1_Click(object sender, System.EventArgs e)
    {
    }
}
