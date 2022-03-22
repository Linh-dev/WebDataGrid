using System;
using System.Web.UI;
using Infragistics.UltraChart.Shared.Styles;
using WebSamplesCS;


public partial class Samples_WebCharts_Display_Labels_Titles_Tooltips_Series_Label_Rotation_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
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
        this.UltraChart1.Data.DataSource = this.chartData1.BarColumnData;
        this.UltraChart1.Data.DataBind();

        if (!Page.IsPostBack)
        {
            string[] textOrientation = System.Enum.GetNames(typeof(TextOrientation));
            foreach (string s in textOrientation)
            {
                this.DropDownList1.Items.Add(s);
            }
            this.DropDownList1.SelectedIndex = this.DropDownList1.Items.IndexOf(this.DropDownList1.Items.FindByText(this.UltraChart1.Axis.X.Labels.SeriesLabels.Orientation.ToString()));

            this.TextBox1.Text = this.UltraChart1.Axis.X.Labels.SeriesLabels.OrientationAngle.ToString();

            this.CheckBox1.Checked = this.UltraChart1.Axis.X.Labels.SeriesLabels.Flip;
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
        this.oleDbSelectCommand1.CommandText = "SELECT ActiveX, Java, NET, [Week#] FROM BarColumnData";
        this.oleDbSelectCommand1.Connection = this.oleDbConnection1;
        // 
        // oleDbConnection1
        // 
        this.oleDbConnection1.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=ChartDataBase.mdb;";
        // 
        // oleDbDataAdapter1
        // 
        this.oleDbDataAdapter1.SelectCommand = this.oleDbSelectCommand1;
        this.oleDbDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																										new System.Data.Common.DataTableMapping("Table", "BarColumnData", new System.Data.Common.DataColumnMapping[] {
																																																						 new System.Data.Common.DataColumnMapping("Week#", "Week#"),
																																																						 new System.Data.Common.DataColumnMapping("ActiveX", "ActiveX"),
																																																						 new System.Data.Common.DataColumnMapping("Java", "Java"),
																																																						 new System.Data.Common.DataColumnMapping("NET", "NET")})});

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
        this.UltraChart1.Axis.X.Labels.SeriesLabels.Orientation = (TextOrientation)System.Enum.Parse(typeof(TextOrientation), this.DropDownList1.SelectedItem.Value);
        if (this.DropDownList1.SelectedItem.Value == "Custom")
        {
            this.UltraChart1.Axis.X.Labels.SeriesLabels.OrientationAngle = Convert.ToInt32(this.TextBox1.Text);
        }

        this.UltraChart1.Axis.X.Labels.SeriesLabels.Flip = this.CheckBox1.Checked;

    }
}