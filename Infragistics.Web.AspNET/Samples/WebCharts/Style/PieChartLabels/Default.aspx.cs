using System;
using System.Web.UI;



using Infragistics.UltraChart.Shared.Styles;

public partial class Samples_WebCharts_Style_Pie_Chart_Labels_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected System.Data.OleDb.OleDbCommand oleDbSelectCommand1;
    protected System.Data.OleDb.OleDbCommand oleDbInsertCommand1;
    protected System.Data.OleDb.OleDbConnection oleDbConnection1;
    protected System.Data.OleDb.OleDbDataAdapter oleDbDataAdapter1;
    protected WebSamplesCS.WebCharts.ChartData chartData1;

    private void Page_Load(object sender, System.EventArgs e)
    {
        this.oleDbConnection1.ConnectionString = WebSamplesCS.Config.ChartMDBConnString;
        this.oleDbDataAdapter1.Fill(this.chartData1);
        this.UltraChart1.Data.DataSource = this.chartData1.PieData;
        this.UltraChart1.Data.DataBind();

        if (!Page.IsPostBack)
        {
            string[] lineDrawStyle = System.Enum.GetNames(typeof(LineDrawStyle));
            this.DropDownList1.Items.Clear();
            foreach (string s in lineDrawStyle)
            {
                this.DropDownList1.Items.Add(s);
            }

            string[] lineCapStyle = System.Enum.GetNames(typeof(LineCapStyle));
            this.DropDownList2.Items.Clear();
            foreach (string s in lineCapStyle)
            {
                this.DropDownList2.Items.Add(s);
            }

            this.DropDownList1.Items.FindByValue(System.Enum.GetName(typeof(LineDrawStyle), this.UltraChart1.PieChart.Labels.LeaderDrawStyle)).Selected = true;
            this.DropDownList2.Items.FindByValue(System.Enum.GetName(typeof(LineCapStyle), this.UltraChart1.PieChart.Labels.LeaderEndStyle)).Selected = true;
            this.WebNumericEdit1.ValueInt = this.UltraChart1.PieChart.Labels.LeaderLineThickness;
            this.CheckBox1.Checked = this.UltraChart1.PieChart.Labels.LeaderLinesVisible;
        }
    }

    private void Button1_Click(object sender, System.EventArgs e)
    {
        this.UltraChart1.PieChart.Labels.LeaderDrawStyle = (LineDrawStyle)System.Enum.Parse(typeof(LineDrawStyle), this.DropDownList1.SelectedItem.Value);
        this.UltraChart1.PieChart.Labels.LeaderEndStyle = (LineCapStyle)System.Enum.Parse(typeof(LineCapStyle), this.DropDownList2.SelectedItem.Value);

        this.UltraChart1.PieChart.Labels.LeaderLineThickness = this.WebNumericEdit1.ValueInt;
        this.UltraChart1.PieChart.Labels.LeaderLinesVisible = this.CheckBox1.Checked;
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
        this.oleDbSelectCommand1.CommandText = "SELECT Product, [Units Sold] FROM PieData";
        this.oleDbSelectCommand1.Connection = this.oleDbConnection1;
        // 
        // oleDbConnection1
        // 
        this.oleDbConnection1.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=ChartDataBase.mdb;";
        // 
        // oleDbInsertCommand1
        // 
        this.oleDbInsertCommand1.CommandText = "INSERT INTO PieData(Product, [Units Sold]) VALUES (?, ?)";
        this.oleDbInsertCommand1.Connection = this.oleDbConnection1;
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Product", System.Data.OleDb.OleDbType.VarWChar, 50, "Product"));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Units_Sold", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Units Sold", System.Data.DataRowVersion.Current, null));
        // 
        // oleDbDataAdapter1
        // 
        this.oleDbDataAdapter1.InsertCommand = this.oleDbInsertCommand1;
        this.oleDbDataAdapter1.SelectCommand = this.oleDbSelectCommand1;
        this.oleDbDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																										new System.Data.Common.DataTableMapping("Table", "PieData", new System.Data.Common.DataColumnMapping[] {
																																																				   new System.Data.Common.DataColumnMapping("Product", "Product"),
																																																				   new System.Data.Common.DataColumnMapping("Units Sold", "Units Sold")})});
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
