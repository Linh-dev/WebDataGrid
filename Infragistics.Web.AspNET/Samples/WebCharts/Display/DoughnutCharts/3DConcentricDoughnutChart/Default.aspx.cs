﻿using System;
using WebSamplesCS;

public partial class Samples_WebCharts_Display_Doughnut_Charts_3D_Concentric_Doughnut_Chart_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
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
        this.UltraChart1.Data.DataSource = this.chartData1.ConcentricPieData;
        this.UltraChart1.Data.DataBind();
        this.UltraChart1.DoughnutChart.Concentric = true;
        this.UltraChart1.DoughnutChart.Labels.Visible = false;

        this.UltraChart1.BackgroundImageFileName = Server.MapPath("/SamplesBrowser/SamplesCommon/aspnet/Common/ChartBg.jpg");
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
        this.oleDbSelectCommand1.CommandText = "SELECT Product, [Units Sold 2004], [Units Sold 2005], [Units Sold 2006] FROM Conc" +
            "entricPieData";
        this.oleDbSelectCommand1.Connection = this.oleDbConnection1;
        // 
        // oleDbConnection1
        // 
		this.oleDbConnection1.ConnectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Password="""";User ID=Admin;Data Source=C:\Program Files\Infragistics\INFRAGISTCS 2006 VOLUME 1 CLR 1.0\ASP.NET\SAMPLES\Data\ChartDataBase.mdb;Mode=Share Deny None;Extended Properties="""";Jet OLEDB:System database="""";Jet OLEDB:Registry Path="""";Jet OLEDB:Database Password="""";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="""";Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don't Copy Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False";
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
}