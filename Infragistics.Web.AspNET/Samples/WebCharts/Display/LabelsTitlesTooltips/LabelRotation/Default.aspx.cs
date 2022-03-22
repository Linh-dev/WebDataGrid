using System;
using System.Web.UI;
using Infragistics.UltraChart.Shared.Styles;
using WebSamplesCS;

public partial class Samples_WebCharts_Display_Labels_Titles_Tooltips_Label_Rotation_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
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
        this.UltraChart1.Data.DataSource = this.chartData1.HeatData;
        this.UltraChart1.Data.DataBind();

        if (!Page.IsPostBack)
        {
            string[] textOrientation = System.Enum.GetNames(typeof(TextOrientation));
            foreach (string s in textOrientation)
            {
                this.DropDownList1.Items.Add(s);
            }

            this.WebNumericEdit1.ValueInt = this.UltraChart1.Axis.X.Labels.OrientationAngle;

            this.CheckBox1.Checked = this.UltraChart1.Axis.X.Labels.Flip;
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
        // 
        // oleDbSelectCommand1
        // 
        this.oleDbSelectCommand1.CommandText = "SELECT Location, MorningTemp, AfternoonTemp, EveningTemp, NightTemp FROM HeatData" +
            "";
        this.oleDbSelectCommand1.Connection = this.oleDbConnection1;
        // 
        // oleDbConnection1
        // 
        this.oleDbConnection1.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=ChartDataBase.mdb;";
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
        this.Button2.Click += new System.EventHandler(this.Button2_Click);
        this.Load += new System.EventHandler(this.Page_Load);
        ((System.ComponentModel.ISupportInitialize)(this.chartData1)).EndInit();

    }
    #endregion

    private void Button2_Click(object sender, System.EventArgs e)
    {
        this.UltraChart1.Axis.X.Labels.Orientation = (TextOrientation)System.Enum.Parse(typeof(TextOrientation), this.DropDownList1.SelectedItem.Value);
        if (this.DropDownList1.SelectedItem.Value == "Custom")
        {
            this.UltraChart1.Axis.X.Labels.OrientationAngle = this.WebNumericEdit1.ValueInt;
        }

        this.UltraChart1.Axis.X.Labels.Flip = this.CheckBox1.Checked;

    }
}