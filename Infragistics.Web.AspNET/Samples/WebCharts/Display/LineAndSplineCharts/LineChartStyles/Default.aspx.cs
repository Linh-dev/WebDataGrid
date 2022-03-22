using System;
using System.Web.UI;
using Infragistics.UltraChart.Resources.Appearance;
using Infragistics.UltraChart.Shared.Styles;
using WebSamplesCS;


public partial class Samples_WebCharts_Display_Line_And_Spline_Charts_Line_Chart_Styles_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected System.Data.OleDb.OleDbCommand oleDbSelectCommand1;
    protected System.Data.OleDb.OleDbCommand oleDbInsertCommand1;
    protected System.Data.OleDb.OleDbCommand oleDbUpdateCommand1;
    protected System.Data.OleDb.OleDbCommand oleDbDeleteCommand1;
    protected System.Data.OleDb.OleDbConnection oleDbConnection1;
    protected System.Data.OleDb.OleDbDataAdapter oleDbDataAdapter1;
    protected WebSamplesCS.WebCharts.ChartData chartData1;

    private void Page_Load(object sender, System.EventArgs e)
    {
        this.oleDbConnection1.ConnectionString = Config.ChartMDBConnString;
        this.oleDbDataAdapter1.Fill(this.chartData1);
        this.UltraChart1.Data.DataSource = this.chartData1._3LinesData;
        LineAppearance App1 = new LineAppearance();
        this.UltraChart1.LineChart.LineAppearances.Add(App1);
        LineAppearance App2 = new LineAppearance();
        this.UltraChart1.LineChart.LineAppearances.Add(App2);
        LineAppearance App3 = new LineAppearance();
        this.UltraChart1.LineChart.LineAppearances.Add(App3);
        this.UltraChart1.Data.DataBind();

        if (!Page.IsPostBack)
        {
            // Populate the DrawStyle Drop-down lists with enums available for 
            // DrawStyle property
            string[] strDrawStyle = System.Enum.GetNames(typeof(LineDrawStyle));
            foreach (string s in strDrawStyle)
            {
                this.cmbDrawStyleMonday.Items.Add(s);
                this.cmbDrawStyleTuesday.Items.Add(s);
                this.cmbDrawStyleWednesday.Items.Add(s);
            }

            // Populate the EndStyles and StartStyles Drop-down lists with enums 
            // available for StartStyle and EndStyle property
            string[] strLineCapStyle = System.Enum.GetNames(typeof(LineCapStyle));
            foreach (string s in strLineCapStyle)
            {
                this.cmbEndStyleMonday.Items.Add(s);
                this.cmbStartStyleMonday.Items.Add(s);
                this.cmbEndStyleTuesday.Items.Add(s);
                this.cmbStartStyleTuesday.Items.Add(s);
                this.cmbEndStyleWednesday.Items.Add(s);
                this.cmbStartStyleWednesday.Items.Add(s);
            }

            // Populate the Icon Drop-down lists with enums available for 
            // SymbolIcon property
            string[] strIcon = System.Enum.GetNames(typeof(SymbolIcon));
            foreach (string s in strIcon)
            {
                this.cmbSymbolIconMonday.Items.Add(s);
                this.cmbSymbolIconTuesday.Items.Add(s);
                this.cmbSymbolIconWednesday.Items.Add(s);
            }

            /* Initialize each tabs controls */
            this.UltraChart1.LineChart.LineAppearances[0].LineStyle.DrawStyle = (LineDrawStyle)System.Enum.Parse(typeof(LineDrawStyle), this.cmbDrawStyleMonday.SelectedItem.Value);
            this.UltraChart1.LineChart.LineAppearances[0].LineStyle.EndStyle = (LineCapStyle)System.Enum.Parse(typeof(LineCapStyle), this.cmbEndStyleMonday.SelectedItem.Value);
            this.UltraChart1.LineChart.LineAppearances[0].LineStyle.StartStyle = (LineCapStyle)System.Enum.Parse(typeof(LineCapStyle), this.cmbStartStyleMonday.SelectedItem.Value);
            this.UltraChart1.LineChart.LineAppearances[0].LineStyle.MidPointAnchors = System.Boolean.Parse(this.cmbMidPointAnchorsMonday.SelectedItem.Value);
            this.numThicknessMonday.Value = this.UltraChart1.LineChart.LineAppearances[0].Thickness;
            this.UltraChart1.LineChart.LineAppearances[0].IconAppearance.Icon = (SymbolIcon)System.Enum.Parse(typeof(SymbolIcon), this.cmbSymbolIconMonday.SelectedItem.Value);

            this.UltraChart1.LineChart.LineAppearances[1].LineStyle.DrawStyle = (LineDrawStyle)System.Enum.Parse(typeof(LineDrawStyle), this.cmbDrawStyleTuesday.SelectedItem.Value);
            this.UltraChart1.LineChart.LineAppearances[1].LineStyle.EndStyle = (LineCapStyle)System.Enum.Parse(typeof(LineCapStyle), this.cmbEndStyleTuesday.SelectedItem.Value);
            this.UltraChart1.LineChart.LineAppearances[1].LineStyle.StartStyle = (LineCapStyle)System.Enum.Parse(typeof(LineCapStyle), this.cmbStartStyleTuesday.SelectedItem.Value);
            this.UltraChart1.LineChart.LineAppearances[1].LineStyle.MidPointAnchors = System.Boolean.Parse(this.cmbMidPointAnchorsTuesday.SelectedItem.Value);
            this.numThicknessTuesday.Value = this.UltraChart1.LineChart.LineAppearances[1].Thickness;
            this.UltraChart1.LineChart.LineAppearances[1].IconAppearance.Icon = (SymbolIcon)System.Enum.Parse(typeof(SymbolIcon), this.cmbSymbolIconTuesday.SelectedItem.Value);

            this.UltraChart1.LineChart.LineAppearances[2].LineStyle.DrawStyle = (LineDrawStyle)System.Enum.Parse(typeof(LineDrawStyle), this.cmbDrawStyleWednesday.SelectedItem.Value);
            this.UltraChart1.LineChart.LineAppearances[2].LineStyle.EndStyle = (LineCapStyle)System.Enum.Parse(typeof(LineCapStyle), this.cmbEndStyleWednesday.SelectedItem.Value);
            this.UltraChart1.LineChart.LineAppearances[2].LineStyle.StartStyle = (LineCapStyle)System.Enum.Parse(typeof(LineCapStyle), this.cmbStartStyleWednesday.SelectedItem.Value);
            this.UltraChart1.LineChart.LineAppearances[2].LineStyle.MidPointAnchors = System.Boolean.Parse(this.cmbMidPointAnchorsWednesday.SelectedItem.Value);
            this.numThicknessWednesday.Value = this.UltraChart1.LineChart.LineAppearances[2].Thickness;
            this.UltraChart1.LineChart.LineAppearances[2].IconAppearance.Icon = (SymbolIcon)System.Enum.Parse(typeof(SymbolIcon), this.cmbSymbolIconWednesday.SelectedItem.Value);
        }
    }

    private void btnMakeChanges_Click(object sender, System.EventArgs e)
    {
        this.UltraChart1.LineChart.LineAppearances[0].LineStyle.DrawStyle = (LineDrawStyle)System.Enum.Parse(typeof(LineDrawStyle), this.cmbDrawStyleMonday.SelectedItem.Value);
        this.UltraChart1.LineChart.LineAppearances[0].LineStyle.EndStyle = (LineCapStyle)System.Enum.Parse(typeof(LineCapStyle), this.cmbEndStyleMonday.SelectedItem.Value);
        this.UltraChart1.LineChart.LineAppearances[0].LineStyle.StartStyle = (LineCapStyle)System.Enum.Parse(typeof(LineCapStyle), this.cmbStartStyleMonday.SelectedItem.Value);
        this.UltraChart1.LineChart.LineAppearances[0].LineStyle.MidPointAnchors = System.Boolean.Parse(this.cmbMidPointAnchorsMonday.SelectedItem.Value);
        this.UltraChart1.LineChart.LineAppearances[0].Thickness = System.Int32.Parse(this.numThicknessMonday.Value.ToString());
        this.UltraChart1.LineChart.LineAppearances[0].IconAppearance.Icon = (SymbolIcon)System.Enum.Parse(typeof(SymbolIcon), this.cmbSymbolIconMonday.SelectedItem.Value);

        this.UltraChart1.LineChart.LineAppearances[1].LineStyle.DrawStyle = (LineDrawStyle)System.Enum.Parse(typeof(LineDrawStyle), this.cmbDrawStyleTuesday.SelectedItem.Value);
        this.UltraChart1.LineChart.LineAppearances[1].LineStyle.EndStyle = (LineCapStyle)System.Enum.Parse(typeof(LineCapStyle), this.cmbEndStyleTuesday.SelectedItem.Value);
        this.UltraChart1.LineChart.LineAppearances[1].LineStyle.StartStyle = (LineCapStyle)System.Enum.Parse(typeof(LineCapStyle), this.cmbStartStyleTuesday.SelectedItem.Value);
        this.UltraChart1.LineChart.LineAppearances[1].LineStyle.MidPointAnchors = System.Boolean.Parse(this.cmbMidPointAnchorsTuesday.SelectedItem.Value);
        this.UltraChart1.LineChart.LineAppearances[1].Thickness = System.Int32.Parse(this.numThicknessTuesday.Value.ToString());
        this.UltraChart1.LineChart.LineAppearances[1].IconAppearance.Icon = (SymbolIcon)System.Enum.Parse(typeof(SymbolIcon), this.cmbSymbolIconTuesday.SelectedItem.Value);

        this.UltraChart1.LineChart.LineAppearances[2].LineStyle.DrawStyle = (LineDrawStyle)System.Enum.Parse(typeof(LineDrawStyle), this.cmbDrawStyleWednesday.SelectedItem.Value);
        this.UltraChart1.LineChart.LineAppearances[2].LineStyle.EndStyle = (LineCapStyle)System.Enum.Parse(typeof(LineCapStyle), this.cmbEndStyleWednesday.SelectedItem.Value);
        this.UltraChart1.LineChart.LineAppearances[2].LineStyle.StartStyle = (LineCapStyle)System.Enum.Parse(typeof(LineCapStyle), this.cmbStartStyleWednesday.SelectedItem.Value);
        this.UltraChart1.LineChart.LineAppearances[2].LineStyle.MidPointAnchors = System.Boolean.Parse(this.cmbMidPointAnchorsWednesday.SelectedItem.Value);
        this.UltraChart1.LineChart.LineAppearances[2].Thickness = System.Int32.Parse(this.numThicknessWednesday.Value.ToString());
        this.UltraChart1.LineChart.LineAppearances[2].IconAppearance.Icon = (SymbolIcon)System.Enum.Parse(typeof(SymbolIcon), this.cmbSymbolIconWednesday.SelectedItem.Value);
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
        this.oleDbSelectCommand1 = new System.Data.OleDb.OleDbCommand();
        this.oleDbConnection1 = new System.Data.OleDb.OleDbConnection();
        this.oleDbInsertCommand1 = new System.Data.OleDb.OleDbCommand();
        this.oleDbDataAdapter1 = new System.Data.OleDb.OleDbDataAdapter();
        this.chartData1 = new WebSamplesCS.WebCharts.ChartData();
        ((System.ComponentModel.ISupportInitialize)(this.chartData1)).BeginInit();
        // 
        // oleDbSelectCommand1
        // 
        this.oleDbSelectCommand1.CommandText = "SELECT StockName, Monday, Tuesday, Wednesday FROM LineAreaData";
        this.oleDbSelectCommand1.Connection = this.oleDbConnection1;
        // 
        // oleDbConnection1
        // 
        this.oleDbConnection1.ConnectionString = WebSamplesCS.Config.ChartMDBConnString;
        // 
        // oleDbInsertCommand1
        // 
        this.oleDbInsertCommand1.CommandText = "INSERT INTO LineAreaData(Monday, StockName, Tuesday, Wednesday)" +
            " VALUES (?, ?, ?, ?)";
        this.oleDbInsertCommand1.Connection = this.oleDbConnection1;
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Monday", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Monday", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("StockName", System.Data.OleDb.OleDbType.VarWChar, 50, "StockName"));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Tuesday", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Tuesday", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Wednesday", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Wednesday", System.Data.DataRowVersion.Current, null));
        // 
        // oleDbDataAdapter1
        // 
        this.oleDbDataAdapter1.InsertCommand = this.oleDbInsertCommand1;
        this.oleDbDataAdapter1.SelectCommand = this.oleDbSelectCommand1;
        this.oleDbDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
                                                                                                        new System.Data.Common.DataTableMapping("Table", "_3LinesData", new System.Data.Common.DataColumnMapping[] {
                                                                                                                                                                                                                       new System.Data.Common.DataColumnMapping("StockName", "StockName"),
                                                                                                                                                                                                                       new System.Data.Common.DataColumnMapping("Monday", "Monday"),
                                                                                                                                                                                                                       new System.Data.Common.DataColumnMapping("Tuesday", "Tuesday"),
                                                                                                                                                                                                                       new System.Data.Common.DataColumnMapping("Wednesday", "Wednesday")})});
        // 
        // chartData1
        // 
        this.chartData1.DataSetName = "ChartData";
        this.chartData1.Locale = new System.Globalization.CultureInfo("en-US");
        this.chartData1.Namespace = "http://www.tempuri.org/ChartData.xsd";
        this.btnMakeChanges.Click += new System.EventHandler(this.btnMakeChanges_Click);
        ((System.ComponentModel.ISupportInitialize)(this.chartData1)).EndInit();
        this.Load += new System.EventHandler(this.Page_Load);
    }
    #endregion
}
