using System;
using System.Web.UI;
using Infragistics.UltraChart.Resources.Appearance;
using Infragistics.UltraChart.Shared.Styles;
using WebSamplesCS;

public partial class Samples_WebCharts_Style_Axis_Label_Layouts_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected WebSamplesCS.WebCharts.ChartData chartData1;
    protected System.Data.OleDb.OleDbConnection oleDbConnection1;
    protected System.Data.OleDb.OleDbDataAdapter oleDbDataAdapter1;
    protected System.Data.OleDb.OleDbCommand oleDbDeleteCommand1;
    protected System.Data.OleDb.OleDbCommand oleDbInsertCommand1;
    protected System.Data.OleDb.OleDbCommand oleDbSelectCommand1;
    protected System.Data.OleDb.OleDbCommand oleDbUpdateCommand1;

    private void Page_Load(object sender, System.EventArgs e)
    {
        this.oleDbConnection1.ConnectionString = Config.ChartMDBConnString;
        this.oleDbDataAdapter1.Fill(this.chartData1);
        this.UltraChart1.Data.DataSource = this.chartData1.BarColumnData;
        this.UltraChart1.Data.DataBind();

        if (!Page.IsPostBack)
        {
            // populate dropdownlists
            string[] layoutBehaviors = System.Enum.GetNames(typeof(AxisLabelLayoutBehaviors));
            foreach (string behavior in layoutBehaviors)
            {
                this.chart1_axisXLabelsLayoutBehavior.Items.Add(behavior);
                this.chart1_axisXSeriesLabelsLayoutBehavior.Items.Add(behavior);
                this.chart1_axisYLabelsLayoutBehavior.Items.Add(behavior);
            }

            // initialize dropdownlists
            this.chart1_axisXLabelsLayoutBehavior.Items.FindByText(this.UltraChart1.Axis.X.Labels.Layout.Behavior.ToString()).Selected = true;
            this.chart1_axisXSeriesLabelsLayoutBehavior.Items.FindByText(this.UltraChart1.Axis.X.Labels.SeriesLabels.Layout.Behavior.ToString()).Selected = true;
            this.chart1_axisYLabelsLayoutBehavior.Items.FindByText(this.UltraChart1.Axis.Y.Labels.Layout.Behavior.ToString()).Selected = true;

            // initialize trackbars
            this.chart1_axisXExtent.Value = this.UltraChart1.Axis.X.Extent;
            this.chart1_axisYExtent.Value = this.UltraChart1.Axis.Y.Extent;


        }
        this.UltraChart1.Axis.X.Labels.Layout.BehaviorCollection.AddRange(this.GetCustomLayoutBehaviors());
        this.UltraChart1.Axis.X.Labels.SeriesLabels.Layout.BehaviorCollection.AddRange(this.GetCustomLayoutBehaviors());
        this.UltraChart1.Axis.Y.Labels.Layout.BehaviorCollection.AddRange(this.GetCustomLayoutBehaviors());

    }


    private AxisLabelLayoutBehavior[] GetCustomLayoutBehaviors()
    {
        // scale fonts down to 8pt if necessary.
        FontScalingAxisLabelLayoutBehavior fontScaling1 = new FontScalingAxisLabelLayoutBehavior();
        fontScaling1.MaximumSize = -1f;
        fontScaling1.MinimumSize = 8f;
        fontScaling1.EnableRollback = false;

        // if collisions are detected, try wrapping the text
        WrapTextAxisLabelLayoutBehavior wrapText1 = new WrapTextAxisLabelLayoutBehavior();
        wrapText1.EnableRollback = true;

        // try rotating to 30 degrees
        RotateAxisLabelLayoutBehavior rotation1 = new RotateAxisLabelLayoutBehavior();
        rotation1.RotationAngle = 30f;
        rotation1.EnableRollback = true;

        // failing that, try rotating to 60 degrees
        RotateAxisLabelLayoutBehavior rotation2 = new RotateAxisLabelLayoutBehavior();
        rotation2.RotationAngle = 60f;
        rotation2.EnableRollback = true;

        // try staggering the labels
        StaggerAxisLabelLayoutBehavior stagger1 = new StaggerAxisLabelLayoutBehavior();
        stagger1.EnableRollback = true;

        // since none of the above worked, scale the fonts down to 6pt
        FontScalingAxisLabelLayoutBehavior fontScaling2 = new FontScalingAxisLabelLayoutBehavior();
        fontScaling2.MaximumSize = -1f;
        fontScaling2.MinimumSize = 6f;
        fontScaling2.EnableRollback = false;

        // if collisions are still detected, just truncate the labels.
        ClipTextAxisLabelLayoutBehavior clipText1 = new ClipTextAxisLabelLayoutBehavior();
        clipText1.EnableRollback = false;

        return new AxisLabelLayoutBehavior[] { fontScaling1, wrapText1, rotation1, rotation2, stagger1, fontScaling2, clipText1 };
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
        this.chartData1 = new WebSamplesCS.WebCharts.ChartData();
        this.oleDbConnection1 = new System.Data.OleDb.OleDbConnection();
        this.oleDbDataAdapter1 = new System.Data.OleDb.OleDbDataAdapter();
        this.oleDbDeleteCommand1 = new System.Data.OleDb.OleDbCommand();
        this.oleDbInsertCommand1 = new System.Data.OleDb.OleDbCommand();
        this.oleDbSelectCommand1 = new System.Data.OleDb.OleDbCommand();
        this.oleDbUpdateCommand1 = new System.Data.OleDb.OleDbCommand();
        ((System.ComponentModel.ISupportInitialize)(this.chartData1)).BeginInit();
        this.Button1.Click += new System.EventHandler(this.Button1_Click);
        // 
        // chartData1
        // 
        this.chartData1.DataSetName = "ChartData";
        this.chartData1.Locale = new System.Globalization.CultureInfo("en-US");
        this.chartData1.Namespace = "http://www.tempuri.org/ChartData.xsd";
        // 
        // oleDbConnection1
        // 
        this.oleDbConnection1.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=ChartDataBase.mdb;";
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
        // oleDbDeleteCommand1
        // 
        this.oleDbDeleteCommand1.CommandText = "DELETE FROM BarColumnData WHERE ([Week#] = ?)";
        this.oleDbDeleteCommand1.Connection = this.oleDbConnection1;
        this.oleDbDeleteCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Original_Week#", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "Week#", System.Data.DataRowVersion.Original, null));
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
        // oleDbSelectCommand1
        // 
        this.oleDbSelectCommand1.CommandText = "SELECT ActiveX, Java, NET, [Week#] FROM BarColumnData";
        this.oleDbSelectCommand1.Connection = this.oleDbConnection1;
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
        ((System.ComponentModel.ISupportInitialize)(this.chartData1)).EndInit();

    }
    #endregion

    private void Button1_Click(object sender, System.EventArgs e)
    {
        this.UltraChart1.Axis.X.Labels.Layout.Behavior = (AxisLabelLayoutBehaviors)System.Enum.Parse(typeof(AxisLabelLayoutBehaviors), this.chart1_axisXLabelsLayoutBehavior.SelectedItem.Text);
        this.UltraChart1.Axis.X.Labels.SeriesLabels.Layout.Behavior = (AxisLabelLayoutBehaviors)System.Enum.Parse(typeof(AxisLabelLayoutBehaviors), this.chart1_axisXSeriesLabelsLayoutBehavior.SelectedItem.Text);
        this.UltraChart1.Axis.Y.Labels.Layout.Behavior = (AxisLabelLayoutBehaviors)System.Enum.Parse(typeof(AxisLabelLayoutBehaviors), this.chart1_axisYLabelsLayoutBehavior.SelectedItem.Text);
        this.UltraChart1.Axis.X.Extent = (int)this.chart1_axisXExtent.Value;
        this.UltraChart1.Axis.Y.Extent = (int)this.chart1_axisYExtent.Value;
    }
}
