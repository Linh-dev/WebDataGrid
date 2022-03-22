using System;
using System.Web.UI;
using WebSamplesCS;

using Infragistics.UltraChart.Shared.Styles;

public partial class Samples_WebCharts_Display_Area_Charts_Area_Chart_Styles_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
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
        this.UltraChart1.Data.DataSource = this.chartData1.LineAreaData;
        this.UltraChart1.Data.DataBind();
        this.UltraChart1.BackgroundImageFileName = Server.MapPath("/SamplesBrowser/SamplesCommon/aspnet/Common/ChartBg.jpg");

        if (!Page.IsPostBack)
        {
            string[] lineDrawStyle = System.Enum.GetNames(typeof(LineDrawStyle));
            foreach (string s in lineDrawStyle)
            {
                this.DropDownList1.Items.Add(s);
            }
            string[] lineCapStyle = System.Enum.GetNames(typeof(LineCapStyle));
            foreach (string s in lineCapStyle)
            {
                this.DropDownList2.Items.Add(s);
                this.DropDownList3.Items.Add(s);
            }

            this.DropDownList1.Items.FindByValue(System.Enum.GetName(typeof(LineDrawStyle), this.UltraChart1.AreaChart.LineDrawStyle)).Selected = true;
            this.DropDownList2.Items.FindByValue(System.Enum.GetName(typeof(LineCapStyle), this.UltraChart1.AreaChart.LineStartCapStyle)).Selected = true;
            this.DropDownList3.Items.FindByValue(System.Enum.GetName(typeof(LineCapStyle), this.UltraChart1.AreaChart.LineEndCapStyle)).Selected = true;
            this.ThicknessSlider.Value = this.UltraChart1.AreaChart.LineThickness;
            this.CheckBox1.Checked = this.UltraChart1.AreaChart.MidPointAnchors;

        }
        this.UltraChart1.AreaChart.LineDrawStyle = (LineDrawStyle)System.Enum.Parse(typeof(LineDrawStyle), this.DropDownList1.SelectedItem.Value);
        this.UltraChart1.AreaChart.LineStartCapStyle = (LineCapStyle)System.Enum.Parse(typeof(LineCapStyle), this.DropDownList2.SelectedItem.Value);
        this.UltraChart1.AreaChart.LineEndCapStyle = (LineCapStyle)System.Enum.Parse(typeof(LineCapStyle), this.DropDownList3.SelectedItem.Value);
        this.UltraChart1.AreaChart.LineThickness = (int)this.ThicknessSlider.ValueAsDouble;
        this.UltraChart1.AreaChart.MidPointAnchors = this.CheckBox1.Checked; 
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
        this.oleDbSelectCommand1.CommandText = "SELECT StockName, Monday, Tuesday, Wednesday, Thursday, Friday FROM LineAreaData";
        this.oleDbSelectCommand1.Connection = this.oleDbConnection1;
        // 
        // oleDbConnection1
        // 
        this.oleDbConnection1.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=ChartDataBase.mdb;";
        // 
        // oleDbInsertCommand1
        // 
        this.oleDbInsertCommand1.CommandText = "INSERT INTO LineAreaData(Friday, Monday, StockName, Thursday, Tuesday, Wednesday)" +
            " VALUES (?, ?, ?, ?, ?, ?)";
        this.oleDbInsertCommand1.Connection = this.oleDbConnection1;
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Friday", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Friday", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Monday", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Monday", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("StockName", System.Data.OleDb.OleDbType.VarWChar, 50, "StockName"));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Thursday", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Thursday", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Tuesday", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Tuesday", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Wednesday", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Wednesday", System.Data.DataRowVersion.Current, null));
        // 
        // oleDbDataAdapter1
        // 
        this.oleDbDataAdapter1.InsertCommand = this.oleDbInsertCommand1;
        this.oleDbDataAdapter1.SelectCommand = this.oleDbSelectCommand1;
        this.oleDbDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																										new System.Data.Common.DataTableMapping("Table", "LineAreaData", new System.Data.Common.DataColumnMapping[] {
																																																						new System.Data.Common.DataColumnMapping("StockName", "StockName"),
																																																						new System.Data.Common.DataColumnMapping("Monday", "Monday"),
																																																						new System.Data.Common.DataColumnMapping("Tuesday", "Tuesday"),
																																																						new System.Data.Common.DataColumnMapping("Wednesday", "Wednesday"),
																																																						new System.Data.Common.DataColumnMapping("Thursday", "Thursday"),
																																																						new System.Data.Common.DataColumnMapping("Friday", "Friday")})});
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
}