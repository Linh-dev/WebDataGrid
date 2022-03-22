using System;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSamplesCS;

public partial class Samples_WebCharts_Style_Changing_Candle_Chart_Colors_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected System.Data.OleDb.OleDbCommand oleDbSelectCommand1;
    protected System.Data.OleDb.OleDbCommand oleDbInsertCommand1;
    protected System.Data.OleDb.OleDbConnection oleDbConnection1;
    protected System.Data.OleDb.OleDbDataAdapter oleDbDataAdapter1;
    protected WebSamplesCS.WebCharts.ChartData chartData1;


    private void Page_Load(object sender, System.EventArgs e)
    {
        this.oleDbConnection1.ConnectionString = Config.ChartMDBConnString;
        this.oleDbDataAdapter1.Fill(this.chartData1);
        this.UltraChart1.Data.DataSource = this.chartData1.CandleData;
        this.UltraChart1.Data.DataBind();

        this.UltraChart1.CandleChart.HighLowVisible = true;
        this.UltraChart1.CandleChart.OpenCloseVisible = true;
        this.UltraChart1.CandleChart.VolumeVisible = true;

        if (!Page.IsPostBack)
        {
            PropertyInfo[] props = typeof(System.Drawing.Color).GetProperties();
            foreach (PropertyInfo p in props)
            {
                this.DropDownList1.Items.Add(p.Name);
                this.DropDownList2.Items.Add(p.Name);
                this.DropDownList3.Items.Add(p.Name);
                this.DropDownList4.Items.Add(p.Name);
            }


            ListItem listitem1 = this.DropDownList1.Items.FindByValue(this.UltraChart1.CandleChart.NegativeRangeColor.Name);
            if (listitem1 != null) { listitem1.Selected = true; }

            ListItem listitem2 = this.DropDownList2.Items.FindByValue(this.UltraChart1.CandleChart.PositiveRangeColor.Name);
            if (listitem2 != null) { listitem2.Selected = true; }

            ListItem listitem3 = this.DropDownList3.Items.FindByValue(this.UltraChart1.CandleChart.VolumeColor.Name);
            if (listitem3 != null) { listitem3.Selected = true; }

            ListItem listitem4 = this.DropDownList4.Items.FindByValue(this.UltraChart1.CandleChart.WickColor.Name);
            if (listitem4 != null) { listitem4.Selected = true; }

            this.WebNumericEdit1.ValueInt = this.UltraChart1.CandleChart.WickThickness;
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
        this.oleDbSelectCommand1 = new System.Data.OleDb.OleDbCommand();
        this.oleDbConnection1 = new System.Data.OleDb.OleDbConnection();
        this.oleDbInsertCommand1 = new System.Data.OleDb.OleDbCommand();
        this.oleDbDataAdapter1 = new System.Data.OleDb.OleDbDataAdapter();
        this.chartData1 = new WebSamplesCS.WebCharts.ChartData();
        ((System.ComponentModel.ISupportInitialize)(this.chartData1)).BeginInit();
        this.Button1.Click += new System.EventHandler(this.Button1_Click);
        // 
        // oleDbSelectCommand1
        // 
        this.oleDbSelectCommand1.CommandText = "SELECT StockClose, StockDate, StockHigh, StockLow, StockOpen, StockVolume FROM Ca" +
            "ndleData ORDER BY StockDate";
        this.oleDbSelectCommand1.Connection = this.oleDbConnection1;
        // 
        // oleDbConnection1
        // 
        this.oleDbConnection1.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=ChartDataBase.mdb;";
        // 
        // oleDbInsertCommand1
        // 
        this.oleDbInsertCommand1.CommandText = "INSERT INTO CandleData(StockClose, StockDate, StockHigh, StockLow, StockOpen, Sto" +
            "ckVolume) VALUES (?, ?, ?, ?, ?, ?)";
        this.oleDbInsertCommand1.Connection = this.oleDbConnection1;
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("StockClose", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "StockClose", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("StockDate", System.Data.OleDb.OleDbType.DBDate, 0, "StockDate"));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("StockHigh", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "StockHigh", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("StockLow", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "StockLow", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("StockOpen", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "StockOpen", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("StockVolume", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "StockVolume", System.Data.DataRowVersion.Current, null));
        // 
        // oleDbDataAdapter1
        // 
        this.oleDbDataAdapter1.InsertCommand = this.oleDbInsertCommand1;
        this.oleDbDataAdapter1.SelectCommand = this.oleDbSelectCommand1;
        this.oleDbDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																										new System.Data.Common.DataTableMapping("Table", "CandleData", new System.Data.Common.DataColumnMapping[] {
																																																					  new System.Data.Common.DataColumnMapping("StockDate", "StockDate"),
																																																					  new System.Data.Common.DataColumnMapping("StockOpen", "StockOpen"),
																																																					  new System.Data.Common.DataColumnMapping("StockHigh", "StockHigh"),
																																																					  new System.Data.Common.DataColumnMapping("StockLow", "StockLow"),
																																																					  new System.Data.Common.DataColumnMapping("StockClose", "StockClose"),
																																																					  new System.Data.Common.DataColumnMapping("StockVolume", "StockVolume")})});
        // 
        // chartData1
        // 
        this.chartData1.DataSetName = "ChartData";
        this.chartData1.Locale = new System.Globalization.CultureInfo("en-US");
        this.chartData1.Namespace = "http://www.tempuri.org/ChartData.xsd";
        this.Load += new System.EventHandler(this.Page_Load);
        ((System.ComponentModel.ISupportInitialize)(this.chartData1)).EndInit();

    }
    #endregion

    private void Button1_Click(object sender, System.EventArgs e)
    {
        if (this.DropDownList1.SelectedItem != null)
        { this.UltraChart1.CandleChart.NegativeRangeColor = System.Drawing.Color.FromName(this.DropDownList1.SelectedItem.Value); }

        if (this.DropDownList2.SelectedItem != null)
        { this.UltraChart1.CandleChart.PositiveRangeColor = System.Drawing.Color.FromName(this.DropDownList2.SelectedItem.Value); }

        if (this.DropDownList3.SelectedItem != null)
        { this.UltraChart1.CandleChart.VolumeColor = System.Drawing.Color.FromName(this.DropDownList3.SelectedItem.Value); }

        if (this.DropDownList4.SelectedItem != null)
        { this.UltraChart1.CandleChart.WickColor = System.Drawing.Color.FromName(this.DropDownList4.SelectedItem.Value); }

        this.UltraChart1.CandleChart.WickThickness = this.WebNumericEdit1.ValueInt;
    }
}
