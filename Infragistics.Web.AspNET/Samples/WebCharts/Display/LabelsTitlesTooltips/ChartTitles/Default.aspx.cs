using System;
using System.Drawing;
using System.Web.UI;
using WebSamplesCS;

public partial class Samples_WebCharts_Display_Labels_Titles_Tooltips_Chart_Titles_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
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
        this.UltraChart1.Data.DataSource = this.chartData1.BubbleScatterData;
        this.UltraChart1.Data.DataBind();

        if (!Page.IsPostBack)
        {
            this.TextBox1.Text = this.UltraChart1.TitleLeft.Text;
            this.TextBox2.Text = this.UltraChart1.TitleRight.Text;
            this.TextBox3.Text = this.UltraChart1.TitleTop.Text;
            this.TextBox4.Text = this.UltraChart1.TitleBottom.Text;

            string[] stringAlignment = System.Enum.GetNames(typeof(StringAlignment));
            foreach (string s in stringAlignment)
            {
                this.DropDownList1.Items.Add(s);
            }

            this.TextBox5.Text = this.UltraChart1.TitleLeft.Font.Size.ToString();
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
        this.oleDbSelectCommand1.CommandText = "SELECT Crimerate, Latitude, Longitude FROM BubbleScatterData";
        this.oleDbSelectCommand1.Connection = this.oleDbConnection1;
        // 
        // oleDbConnection1
        // 
        this.oleDbConnection1.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=ChartDataBase.mdb;";
        // 
        // oleDbInsertCommand1
        // 
        this.oleDbInsertCommand1.CommandText = "INSERT INTO BubbleScatterData(Crimerate, Latitude, Longitude) VALUES (?, ?, ?)";
        this.oleDbInsertCommand1.Connection = this.oleDbConnection1;
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Crimerate", System.Data.OleDb.OleDbType.Double, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(15)), ((System.Byte)(0)), "Crimerate", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Latitude", System.Data.OleDb.OleDbType.Single, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(7)), ((System.Byte)(0)), "Latitude", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Longitude", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Longitude", System.Data.DataRowVersion.Current, null));
        // 
        // oleDbDataAdapter1
        // 
        this.oleDbDataAdapter1.InsertCommand = this.oleDbInsertCommand1;
        this.oleDbDataAdapter1.SelectCommand = this.oleDbSelectCommand1;
        this.oleDbDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																										new System.Data.Common.DataTableMapping("Table", "BubbleScatterData", new System.Data.Common.DataColumnMapping[] {
																																																							 new System.Data.Common.DataColumnMapping("Latitude", "Latitude"),
																																																							 new System.Data.Common.DataColumnMapping("Longitude", "Longitude"),
																																																							 new System.Data.Common.DataColumnMapping("Crimerate", "Crimerate")})});
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
        this.UltraChart1.TitleLeft.Text = this.TextBox1.Text;
        this.UltraChart1.TitleRight.Text = this.TextBox2.Text;
        this.UltraChart1.TitleTop.Text = this.TextBox3.Text;
        this.UltraChart1.TitleBottom.Text = this.TextBox4.Text;

        this.UltraChart1.TitleLeft.HorizontalAlign = (StringAlignment)System.Enum.Parse(typeof(StringAlignment), this.DropDownList1.SelectedItem.Value);
        this.UltraChart1.TitleRight.HorizontalAlign = (StringAlignment)System.Enum.Parse(typeof(StringAlignment), this.DropDownList1.SelectedItem.Value);
        this.UltraChart1.TitleTop.HorizontalAlign = (StringAlignment)System.Enum.Parse(typeof(StringAlignment), this.DropDownList1.SelectedItem.Value);
        this.UltraChart1.TitleBottom.HorizontalAlign = (StringAlignment)System.Enum.Parse(typeof(StringAlignment), this.DropDownList1.SelectedItem.Value);

        Font font = new Font(this.UltraChart1.TitleLeft.Font.FontFamily, Convert.ToSingle(this.TextBox5.Text));

        this.UltraChart1.TitleLeft.Font = font;
        this.UltraChart1.TitleRight.Font = font;
        this.UltraChart1.TitleTop.Font = font;
        this.UltraChart1.TitleBottom.Font = font;
    }
}