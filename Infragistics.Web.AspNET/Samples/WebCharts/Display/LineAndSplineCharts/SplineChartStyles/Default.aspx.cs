using System;
using Infragistics.UltraChart.Resources.Appearance;
using Infragistics.UltraChart.Shared.Styles;
using WebSamplesCS;

public partial class Samples_WebCharts_Display_Line_And_Spline_Charts_Spline_Chart_Styles_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
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
        App1.LineStyle.DrawStyle = LineDrawStyle.Solid;
        this.UltraChart1.SplineChart.LineAppearances.Add(App1);
        LineAppearance App2 = new LineAppearance();
        App2.LineStyle.DrawStyle = LineDrawStyle.Dash;
        this.UltraChart1.SplineChart.LineAppearances.Add(App2);
        LineAppearance App3 = new LineAppearance();
        App3.LineStyle.DrawStyle = LineDrawStyle.Dot;
        this.UltraChart1.SplineChart.LineAppearances.Add(App3);
        this.UltraChart1.Data.DataBind();
        if (!IsPostBack)
        {
            this.numSplineTensionMonday.Value = this.UltraChart1.SplineChart.LineAppearances[0].SplineTension;
            this.numSplineTensionTuesday.Value = this.UltraChart1.SplineChart.LineAppearances[1].SplineTension;
            this.numSplineTensionWednesday.Value = this.UltraChart1.SplineChart.LineAppearances[2].SplineTension;
        }
    }

    private void btnMakeChanges_Click(object sender, EventArgs e)
    {
        this.UltraChart1.SplineChart.LineAppearances[0].SplineTension = float.Parse(this.numSplineTensionMonday.Value.ToString());
        this.UltraChart1.SplineChart.LineAppearances[1].SplineTension = float.Parse(this.numSplineTensionTuesday.Value.ToString());
        this.UltraChart1.SplineChart.LineAppearances[2].SplineTension = float.Parse(this.numSplineTensionWednesday.Value.ToString());
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
		this.oleDbConnection1.ConnectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Password="""";User ID=Admin;Data Source=C:\Program Files\Infragistics\INFRAGISTCS 2006 VOLUME 1 CLR 1.0\ASP.NET\SAMPLES\Data\ChartDataBase.mdb;Mode=Share Deny None;Extended Properties="""";Jet OLEDB:System database="""";Jet OLEDB:Registry Path="""";Jet OLEDB:Database Password="""";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="""";Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don't Copy Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False";
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
        this.Load += new System.EventHandler(this.Page_Load);
        this.btnMakeChanges.Click += new EventHandler(btnMakeChanges_Click);
        ((System.ComponentModel.ISupportInitialize)(this.chartData1)).EndInit();
    }

    #endregion
}
