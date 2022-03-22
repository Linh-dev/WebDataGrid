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
using WebSamplesCS;
using Infragistics.UltraChart.Shared.Styles;

public partial class Samples_WebCharts_Display_Series_Data_Empty_Data_Style_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
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
        this.UltraChart1.Data.DataSource = this.chartData1.BarColumnData;
        this.chartData1.BarColumnData[0].SetJavaNull();
        this.chartData1.BarColumnData[1].SetActiveXNull();
        this.chartData1.BarColumnData[2].SetNETNull();
        this.UltraChart1.Data.DataBind();
        this.UltraChart1.ColumnChart.NullHandling = NullHandling.InterpolateSimple;
        if (!Page.IsPostBack)
        {
            string[] legendDisplays = System.Enum.GetNames(typeof(LegendEmptyDisplayType));
            this.legendStyleEditor.Items.Clear();
            foreach (string s in legendDisplays)
            {
                this.legendStyleEditor.Items.Add(s);
            }
            this.legendStyleEditor.SelectedIndex = 0;
        }

        this.UltraChart1.Data.EmptyStyle.ShowInLegend = this.showInLegend.Checked;
        this.UltraChart1.Data.EmptyStyle.EnablePoint = this.enablePoint.Checked;
        this.UltraChart1.Data.EmptyStyle.EnablePE = this.enablePE.Checked;
        this.UltraChart1.Data.EmptyStyle.EnableLineStyle = this.enableLineStyle.Checked;
        this.UltraChart1.Data.EmptyStyle.Text = this.emptyTextEditor.Text;
        this.UltraChart1.Data.EmptyStyle.LegendDisplayType = (LegendEmptyDisplayType)System.Enum.Parse(typeof(LegendEmptyDisplayType), this.legendStyleEditor.SelectedItem.ToString());

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
        this.oleDbUpdateCommand1 = new System.Data.OleDb.OleDbCommand();
        this.oleDbDeleteCommand1 = new System.Data.OleDb.OleDbCommand();
        this.oleDbDataAdapter1 = new System.Data.OleDb.OleDbDataAdapter();
        this.chartData1 = new WebSamplesCS.WebCharts.ChartData();
        ((System.ComponentModel.ISupportInitialize)(this.chartData1)).BeginInit();
        // 
        // oleDbSelectCommand1
        // 
        this.oleDbSelectCommand1.CommandText = "SELECT ActiveX, Java, NET, [Week#] FROM BarColumnData";
        this.oleDbSelectCommand1.Connection = this.oleDbConnection1;
        // 
        // oleDbConnection1
        // 
        this.oleDbConnection1.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=ChartDataBase.mdb;";
        // 
        // oleDbInsertCommand1
        // 
        this.oleDbInsertCommand1.CommandText = "INSERT INTO BarColumnData(ActiveX, Java, NET, [Week#]) VALUES (?, ?, ?, ?)";
        this.oleDbInsertCommand1.Connection = this.oleDbConnection1;
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("ActiveX", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "ActiveX", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Java", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Java", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("NET", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "NET", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Week#", System.Data.OleDb.OleDbType.VarWChar, 50, "Week#"));
        // 
        // oleDbUpdateCommand1
        // 
        this.oleDbUpdateCommand1.CommandText = "UPDATE BarColumnData SET ActiveX = ?, Java = ?, NET = ?, [Week#] = ? WHERE ([Week" +
            "#] = ?)";
        this.oleDbUpdateCommand1.Connection = this.oleDbConnection1;
        this.oleDbUpdateCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("ActiveX", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "ActiveX", System.Data.DataRowVersion.Current, null));
        this.oleDbUpdateCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Java", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Java", System.Data.DataRowVersion.Current, null));
        this.oleDbUpdateCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("NET", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "NET", System.Data.DataRowVersion.Current, null));
        this.oleDbUpdateCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Week#", System.Data.OleDb.OleDbType.VarWChar, 50, "Week#"));
        this.oleDbUpdateCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Original_Week#", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "Week#", System.Data.DataRowVersion.Original, null));
        // 
        // oleDbDeleteCommand1
        // 
        this.oleDbDeleteCommand1.CommandText = "DELETE FROM BarColumnData WHERE ([Week#] = ?)";
        this.oleDbDeleteCommand1.Connection = this.oleDbConnection1;
        this.oleDbDeleteCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Original_Week#", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "Week#", System.Data.DataRowVersion.Original, null));
        // 
        // oleDbDataAdapter1
        // 
        this.oleDbDataAdapter1.DeleteCommand = this.oleDbDeleteCommand1;
        this.oleDbDataAdapter1.InsertCommand = this.oleDbInsertCommand1;
        this.oleDbDataAdapter1.SelectCommand = this.oleDbSelectCommand1;
        this.oleDbDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																										new System.Data.Common.DataTableMapping("Table", "BarColumnData", new System.Data.Common.DataColumnMapping[] {
																																																						 new System.Data.Common.DataColumnMapping("Week#", "Week#"),
																																																						 new System.Data.Common.DataColumnMapping("ActiveX", "ActiveX"),
																																																						 new System.Data.Common.DataColumnMapping("Java", "Java"),
																																																						 new System.Data.Common.DataColumnMapping("NET", "NET")})});
        this.oleDbDataAdapter1.UpdateCommand = this.oleDbUpdateCommand1;
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