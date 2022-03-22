using System;
using System.Web.UI;

public partial class Samples_WebCharts_Style_Concentric_Doughnut_Charts_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected System.Data.OleDb.OleDbCommand oleDbSelectCommand1;
    protected System.Data.OleDb.OleDbCommand oleDbInsertCommand1;
    protected System.Data.OleDb.OleDbConnection oleDbConnection1;
    protected System.Data.OleDb.OleDbDataAdapter oleDbDataAdapter1;
    protected WebSamplesCS.WebCharts.ChartData chartData1;

    private void Page_Load(object sender, System.EventArgs e)
    {
        this.oleDbDataAdapter1.Fill(this.chartData1);
        this.UltraChart1.Data.DataSource = this.chartData1.ConcentricPieData;
        this.UltraChart1.Data.DataBind();

        if (!Page.IsPostBack)
        {
            this.WebNumericEdit1.ValueDouble = this.UltraChart1.DoughnutChart.ConcentricSpacing;
            this.WebNumericEdit2.ValueInt = this.UltraChart1.DoughnutChart.InnerRadius;
            this.CheckBox1.Checked = this.UltraChart1.DoughnutChart.ShowConcentricLegend;

            this.UltraChart1.Legend.Visible = this.CheckBox1.Checked;
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
        this.oleDbSelectCommand1.CommandText = "SELECT Product, [Units Sold 2004], [Units Sold 2005], [Units Sold 2006] FROM Conc" +
            "entricPieData";
        this.oleDbSelectCommand1.Connection = this.oleDbConnection1;
        // 
        // oleDbConnection1
        // 
        this.oleDbConnection1.ConnectionString = WebSamplesCS.Config.ChartMDBConnString;
        // 
        // oleDbInsertCommand1
        // 
        this.oleDbInsertCommand1.CommandText = "INSERT INTO ConcentricPieData(Product, [Units Sold 2004], [Units Sold 2005], [Uni" +
            "ts Sold 2006]) VALUES (?, ?, ?, ?)";
        this.oleDbInsertCommand1.Connection = this.oleDbConnection1;
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Product", System.Data.OleDb.OleDbType.VarWChar, 50, "Product"));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Units_Sold_2004", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Units Sold 2004", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Units_Sold_2005", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Units Sold 2005", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Units_Sold_2006", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Units Sold 2006", System.Data.DataRowVersion.Current, null));
        // 
        // oleDbDataAdapter1
        // 
        this.oleDbDataAdapter1.InsertCommand = this.oleDbInsertCommand1;
        this.oleDbDataAdapter1.SelectCommand = this.oleDbSelectCommand1;
        this.oleDbDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																										new System.Data.Common.DataTableMapping("Table", "ConcentricPieData", new System.Data.Common.DataColumnMapping[] {
																																																							 new System.Data.Common.DataColumnMapping("Product", "Product"),
																																																							 new System.Data.Common.DataColumnMapping("Units Sold 2006", "Units Sold 2006"),
																																																							 new System.Data.Common.DataColumnMapping("Units Sold 2005", "Units Sold 2005"),
																																																							 new System.Data.Common.DataColumnMapping("Units Sold 2004", "Units Sold 2004")})});
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
        this.UltraChart1.DoughnutChart.ShowConcentricLegend = this.CheckBox1.Checked;
        this.UltraChart1.Legend.Visible = this.CheckBox1.Checked;

        this.UltraChart1.DoughnutChart.ConcentricSpacing = this.WebNumericEdit1.ValueDouble;
        this.UltraChart1.DoughnutChart.InnerRadius = this.WebNumericEdit2.ValueInt;
    }
}

