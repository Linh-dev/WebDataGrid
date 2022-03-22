using System;
using System.Data;
using System.Data.OleDb;
using System.Drawing;
using Infragistics.UltraChart.Core.Layers;
using Infragistics.UltraChart.Resources.Appearance;
using Infragistics.UltraChart.Shared.Styles;


public partial class Samples_WebCharts_Display_Composite_Charting_Multi_Source_Data_Binding_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    /// <summary>
    /// Page Load
    /// </summary>
    /// <param name="sender">Sender objects</param>
    /// <param name="e">Event arguments</param>
    private void Page_Load(object sender, System.EventArgs e)
    {
        // Create OLE DB Connection
        OleDbConnection nwindConn = new OleDbConnection(WebSamplesCS.Config.NorthwindMDBConnString);
        //OleDbConnection nwindConn = new OleDbConnection(@"Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Registry Path=;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Database Password=;Data Source=""C:\Inetpub\wwwroot\ChartSamples\ChartDataBase.mdb"";Password=;Jet OLEDB:Engine Type=5;Jet OLEDB:Global Bulk Transactions=1;Provider=""Microsoft.Jet.OLEDB.4.0"";Jet OLEDB:System database=;Jet OLEDB:SFP=False;Extended Properties=;Mode=Share Deny None;Jet OLEDB:New Database Password=;Jet OLEDB:Create System Database=False;Jet OLEDB:Don't Copy Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair=False;User ID=Admin;Jet OLEDB:Encrypt Database=False");

        // Sets the SQL statement or stored procedure to execute at the data source.
        OleDbCommand selectCMD1 = new OleDbCommand("SELECT B.FirstName, COUNT(B.EmployeeID) AS EMPLOYEE FROM Orders A INNER JOIN Employees B ON A.EmployeeID = B.EmployeeID GROUP BY B.FirstName", nwindConn);
        OleDbCommand selectCMD2 = new OleDbCommand("SELECT DISTINCTROW Categories.CategoryName, Sum(Products.UnitsInStock) AS [Sum Of UnitsInStock] FROM Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID GROUP BY Categories.CategoryName", nwindConn);

        // Represents a set of data commands and a database connection that 
        // are used to fill the DataSet and update the data source.
        OleDbDataAdapter custDA1 = new OleDbDataAdapter();
        custDA1.SelectCommand = selectCMD1;
        OleDbDataAdapter custDA2 = new OleDbDataAdapter();
        custDA2.SelectCommand = selectCMD2;

        // Create two Data Tables
        DataTable custDT1 = new DataTable();
        DataTable custDT2 = new DataTable();
        custDA1.Fill(custDT1);
        custDA2.Fill(custDT2);

        // Create 'Orders' series from data table
        NumericSeries seriesOrders = new NumericSeries();
        seriesOrders.DataBind(custDT1, "EMPLOYEE", "FirstName");

        // Create 'Categories' series from data table
        NumericSeries seriesCategories = new NumericSeries();
        seriesCategories.DataBind(custDT2, "Sum Of UnitsInStock", "CategoryName");

        // Set composite charts
        this.UltraChart1.ChartType = ChartType.Composite;

        // Create the first ChartArea
        ChartArea myChartArea = new ChartArea();

        // Add the first Chart Area to the ChartAreas collection
        this.UltraChart1.CompositeChart.ChartAreas.Add(myChartArea);

        // Set the chart area position
        myChartArea.BoundsMeasureType = MeasureType.Percentage;
        myChartArea.Bounds = new Rectangle(0, 0, 100, 50);
        myChartArea.Border.Thickness = 0;

        // Create the second ChartArea
        ChartArea myChartArea2 = new ChartArea();

        // Set the chart area position
        myChartArea2.BoundsMeasureType = MeasureType.Percentage;
        myChartArea2.Bounds = new Rectangle(0, 43, 100, 50);
        myChartArea2.Border.Thickness = 0;

        // Add the second Chart Area to the ChartAreas collection
        this.UltraChart1.CompositeChart.ChartAreas.Add(myChartArea2);

        // Create an X axis
        AxisItem xAxis = new AxisItem();
        xAxis.axisNumber = AxisNumber.X_Axis;
        xAxis.Labels.Orientation = TextOrientation.VerticalLeftFacing;
        xAxis.DataType = AxisDataType.String;
        xAxis.SetLabelAxisType = SetLabelAxisType.GroupBySeries;
        xAxis.Labels.ItemFormatString = "<ITEM_LABEL>";
        xAxis.Extent = 90;
        xAxis.Labels.Font = new Font("Verdana", 7);
        xAxis.LineThickness = 1;

        // Create an Y axis
        AxisItem yAxis = new AxisItem();
        yAxis.axisNumber = AxisNumber.Y_Axis;
        yAxis.DataType = AxisDataType.Numeric;
        yAxis.SetLabelAxisType = SetLabelAxisType.GroupBySeries;
        yAxis.Labels.ItemFormatString = "<DATA_VALUE:#.#>";
        yAxis.TickmarkStyle = AxisTickStyle.Smart;
        xAxis.Labels.Font = new Font("Verdana", 7);
        xAxis.LineThickness = 1;

        // Add the axes to the first ChartArea
        myChartArea.Axes.Add(xAxis);
        myChartArea.Axes.Add(yAxis);

        // Add the axes to the second ChartArea
        myChartArea2.Axes.Add(xAxis);
        myChartArea2.Axes.Add(yAxis);

        // Create the first ChartLayer
        ChartLayerAppearance chartLayer = new ChartLayerAppearance();

        // Set the ChartType
        chartLayer.ChartType = ChartType.ColumnChart;

        // Set the ChartArea
        chartLayer.ChartArea = myChartArea;

        // Set the axes
        chartLayer.AxisX = xAxis;
        chartLayer.AxisY = yAxis;

        // Add the first ChartLayer to the ChartLayers collection
        this.UltraChart1.CompositeChart.ChartLayers.Add(chartLayer);

        // Add the first series to the chart's Series collection.
        this.UltraChart1.Series.Add(seriesOrders);
        seriesOrders.Label = "Orders";

        // Add the first series to the ChartLayer's Series collection.
        chartLayer.Series.Add(seriesOrders);

        // Create the second ChartLayer
        ChartLayerAppearance chartLayer2 = new ChartLayerAppearance();

        // Set the ChartType
        chartLayer2.ChartType = ChartType.ColumnChart;

        // Set the ChartArea
        chartLayer2.ChartArea = myChartArea2;

        // Set the axes
        chartLayer2.AxisX = xAxis;
        chartLayer2.AxisY = yAxis;

        // Add the second ChartLayer to the ChartLayers collection
        this.UltraChart1.CompositeChart.ChartLayers.Add(chartLayer2);

        // Add the second series to the chart's Series collection.
        this.UltraChart1.Series.Add(seriesCategories);
        seriesCategories.Label = "Categories";

        // Add the second series to the ChartLayer's Series collection.
        chartLayer2.Series.Add(seriesCategories);

        this.WebDataGrid1.DataSource = custDT1;
        this.WebDataGrid2.DataSource = custDT2;

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
        this.UltraChart1.ChartDataClicked += new Infragistics.UltraChart.Shared.Events.ChartDataClickedEventHandler(this.UltraChart1_ChartDataClicked);
        this.Load += new System.EventHandler(this.Page_Load);

    }
    #endregion

    private void UltraChart1_ChartDataClicked(object sender, Infragistics.UltraChart.Shared.Events.ChartDataEventArgs e)
    {

    }


}
