using System;
using System.Data;

public partial class Samples_WebCharts_Display_Heatmap_Charts_3D_Heatmap_Chart_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected System.Data.OleDb.OleDbCommand oleDbSelectCommand1;
    protected System.Data.OleDb.OleDbCommand oleDbInsertCommand1;
    protected System.Data.OleDb.OleDbConnection oleDbConnection1;
    protected System.Data.OleDb.OleDbDataAdapter oleDbDataAdapter1;
    protected WebSamplesCS.WebCharts.ChartData chartData1;

    private void Page_Load(object sender, System.EventArgs e)
    {
        this.UltraChart1.Data.DataSource = MakeData();
        this.UltraChart1.Data.DataBind();

        this.UltraChart1.BackgroundImageFileName = Server.MapPath("/SamplesBrowser/SamplesCommon/aspnet/WebCharts/Display/BubbleCharts/chart_gray_bg.jpg");
    }

    #region Create Chart Data
    /// <summary>
    /// Use the Sin and Cos functions to generate data for the heatmap chart
    /// </summary>
    /// <returns></returns>
    private DataTable MakeData()
    {
        int objectWeight = 12;
        string[] months = new string[12] { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };

        DataTable t = new DataTable();
        for (int i = 0; i < objectWeight; i++)
        { t.Columns.Add(months[i], typeof(System.Double)); }

        t.Columns.Add("Location", typeof(System.String));

        for (int i = 0; i < objectWeight; i++)
        {
            DataRow dr = t.NewRow();

            for (int j = 0; j < objectWeight; j++)
            {
                dr[j] = 1 - Math.Sin(i * ((2 * Math.PI) / objectWeight)) + Math.Sin(j * ((2 * Math.PI) / objectWeight));
            }

            dr["Location"] = DateTime.Now.Year + i;
            t.Rows.Add(dr);
        }

        return t;
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
        this.oleDbSelectCommand1 = new System.Data.OleDb.OleDbCommand();
        this.oleDbConnection1 = new System.Data.OleDb.OleDbConnection();
        this.oleDbInsertCommand1 = new System.Data.OleDb.OleDbCommand();
        this.oleDbDataAdapter1 = new System.Data.OleDb.OleDbDataAdapter();
        this.chartData1 = new WebSamplesCS.WebCharts.ChartData();
        ((System.ComponentModel.ISupportInitialize)(this.chartData1)).BeginInit();
        // 
        // oleDbSelectCommand1
        // 
        this.oleDbSelectCommand1.CommandText = "SELECT Location, MorningTemp, AfternoonTemp, EveningTemp, NightTemp FROM HeatData" +
            "";
        this.oleDbSelectCommand1.Connection = this.oleDbConnection1;
        // 
        // oleDbConnection1
        // 
		this.oleDbConnection1.ConnectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Password="""";User ID=Admin;Data Source=C:\Program Files\Infragistics\INFRAGISTCS 2006 VOLUME 1 CLR 1.0\ASP.NET\SAMPLES\Data\ChartDataBase.mdb;Mode=Share Deny None;Extended Properties="""";Jet OLEDB:System database="""";Jet OLEDB:Registry Path="""";Jet OLEDB:Database Password="""";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="""";Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don't Copy Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False";
        // 
        // oleDbInsertCommand1
        // 
        this.oleDbInsertCommand1.CommandText = "INSERT INTO HeatData(AfternoonTemp, EveningTemp, Location, MorningTemp, NightTemp" +
            ") VALUES (?, ?, ?, ?, ?)";
        this.oleDbInsertCommand1.Connection = this.oleDbConnection1;
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("AfternoonTemp", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "AfternoonTemp", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("EveningTemp", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "EveningTemp", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Location", System.Data.OleDb.OleDbType.VarWChar, 50, "Location"));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("MorningTemp", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "MorningTemp", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("NightTemp", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "NightTemp", System.Data.DataRowVersion.Current, null));
        // 
        // oleDbDataAdapter1
        // 
        this.oleDbDataAdapter1.InsertCommand = this.oleDbInsertCommand1;
        this.oleDbDataAdapter1.SelectCommand = this.oleDbSelectCommand1;
        this.oleDbDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																										new System.Data.Common.DataTableMapping("Table", "HeatData", new System.Data.Common.DataColumnMapping[] {
																																																					new System.Data.Common.DataColumnMapping("Location", "Location"),
																																																					new System.Data.Common.DataColumnMapping("MorningTemp", "MorningTemp"),
																																																					new System.Data.Common.DataColumnMapping("AfternoonTemp", "AfternoonTemp"),
																																																					new System.Data.Common.DataColumnMapping("EveningTemp", "EveningTemp"),
																																																					new System.Data.Common.DataColumnMapping("NightTemp", "NightTemp")})});
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