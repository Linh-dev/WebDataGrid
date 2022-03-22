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
using Microsoft.Win32;
using Infragistics.UltraChart.Shared.Styles;
using Infragistics.UltraChart.Resources.Appearance;
using ChartSamples;

public partial class Samples_WebCharts_Display_Chart_Customization_Custom_Gauge_Layer_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private Random _Random = new Random();
    /// <summary>
    /// Occurs before a form is displayed for the first time.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">An EventArgs that contains the event data.</param>
    private void Page_Load(object sender, System.EventArgs e)
    {

        int CMP = this._Random.Next(30, 100);
        int YTDP = this._Random.Next(40, 100);

        if (Request["CMP"] != null)
        {
            try
            {
                CMP = int.Parse(Request["CMP"]);
            }
            catch { }
        }

        if (Request["YTDP"] != null)
        {
            try
            {
                YTDP = int.Parse(Request["YTDP"]);
            }
            catch { }
        }

        // Creates a gauge layer appearance.
        GaugeLayer pl = new GaugeLayer();
        pl.Appearance = new GaugeAppearance();

        pl.Appearance.DialPE.Stroke = Color.Navy;
        pl.Appearance.DialPE.StrokeWidth = 3;

        pl.ChartComponent = this.UltraChart1;
        pl.Appearance.StartAngle = -45;
        pl.Appearance.EndAngle = 220;
        pl.Appearance.TextLoc = 85;
        pl.Appearance.TickStart = 65;
        pl.Appearance.TickEnd = 80;

        // Create Paint element No. 1
        PaintElement paintElement1 = new PaintElement();
        paintElement1.Fill = Color.Red;
        paintElement1.FillStopColor = Color.Pink;
        paintElement1.FillOpacity = 255;
        paintElement1.FillStopOpacity = 255;
        paintElement1.FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle.Vertical;
        paintElement1.ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType.Gradient;

        // Create Paint element No. 2
        PaintElement paintElement2 = new PaintElement();
        paintElement2.Fill = Color.Blue;
        paintElement2.FillStopColor = Color.SkyBlue;
        paintElement2.FillOpacity = 255;
        paintElement2.FillStopOpacity = 255;
        paintElement2.FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle.Horizontal;
        paintElement2.ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType.Gradient;

        // Create Paint element No. 3
        PaintElement paintElement3 = new PaintElement();
        paintElement3.Fill = Color.Green;
        paintElement3.StrokeWidth = 0;
        paintElement3.FillStopColor = Color.LimeGreen;
        paintElement3.FillOpacity = 255;
        paintElement3.FillStopOpacity = 255;
        paintElement3.FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle.Horizontal;
        paintElement3.ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType.Gradient;

        // Creates needle for Gauge
        Needle ndl2 = new Needle(CMP, new PaintElement(Color.Yellow));
        ndl2.PE.Stroke = Color.Navy;
        ndl2.PE.StrokeWidth = 14;
        ndl2.Length = 65;

        pl.Appearance.Needles.Add(ndl2);

        GaugeSection gs1 = new GaugeSection(10, paintElement1);
        GaugeSection gs2 = new GaugeSection(15, paintElement2);
        GaugeSection gs3 = new GaugeSection(75, paintElement3);


        this.UltraChart1.Layer.Add("GaugeLayer", pl);
        this.UltraChart1.UserLayerIndex = new string[] { "GaugeLayer" };

        this.UltraChart1.ChartType = ChartType.PieChart;
        this.UltraChart1.TitleTop.Text = "Current Month Profit";

        // Set Axes
        this.UltraChart1.Axis.Y.Labels.ItemFormatString = "<DATA_VALUE:0>";
        this.UltraChart1.Axis.Y.MinorGridLines.Visible = true;
        this.UltraChart1.Axis.Y.MinorGridLines.Thickness = 2;

        this.UltraChart1.Axis.Y.MajorGridLines.Thickness = 5;
        this.UltraChart1.Axis.Y.MajorGridLines.DrawStyle = LineDrawStyle.Solid;

        this.UltraChart1.Axis.Y.Labels.FontColor =
            this.UltraChart1.Axis.Y.MinorGridLines.Color =
            this.UltraChart1.Axis.Y.MajorGridLines.Color =
            this.UltraChart1.Axis.Y.LineColor = Color.Black;

        // Sets up state required by a charting component to display demonstration data. 
        this.UltraChart1.Data.DataSource = Infragistics.UltraChart.Data.DemoTable.Table();

        // Forces the chart data to be refreshed. 
        this.UltraChart1.Data.DataBind();

        // Create a Gauge Layer
        GaugeLayer pl1 = new GaugeLayer();
        pl1.Appearance = new GaugeAppearance();

        pl1.Appearance.DialPE.Stroke = Color.Navy;
        pl1.Appearance.DialPE.StrokeWidth = 3;

        pl1.ChartComponent = this.UltraChart1;
        pl1.Appearance.StartAngle = -45;
        pl1.Appearance.EndAngle = 220;
        pl1.Appearance.TextLoc = 85;
        pl1.Appearance.TickStart = 65;
        pl1.Appearance.TickEnd = 80;

        // Create a needle
        Needle ndl3 = new Needle(YTDP, new PaintElement(Color.Yellow));
        ndl3.PE.Stroke = Color.Navy;
        ndl3.PE.StrokeWidth = 14;
        ndl3.Length = 65;

        pl1.Appearance.Needles.Add(ndl3);

        this.UltraChart2.Layer.Add("GaugeLayer", pl1);
        this.UltraChart2.UserLayerIndex = new string[] { "GaugeLayer" };

        this.UltraChart2.ChartType = ChartType.PieChart;
        this.UltraChart2.TitleTop.Text = "Year to date profit.";

        // Set axes
        this.UltraChart2.Axis.Y.MinorGridLines.Visible = true;
        this.UltraChart2.Axis.Y.MinorGridLines.Thickness = 2;
        this.UltraChart2.Axis.Y.MinorGridLines.Color = Color.Yellow;

        this.UltraChart2.Axis.Y.Labels.ItemFormatString = "<DATA_VALUE:0>";
        this.UltraChart2.Axis.Y.MajorGridLines.Thickness = 5;
        this.UltraChart2.Axis.Y.MajorGridLines.DrawStyle = LineDrawStyle.Solid;
        this.UltraChart2.Axis.Y.MajorGridLines.Color = Color.Yellow;
        this.UltraChart2.Axis.Y.Labels.FontColor = Color.Yellow;
        this.UltraChart2.Axis.Y.LineColor = Color.Yellow;

        this.UltraChart2.Data.DataSource = Infragistics.UltraChart.Data.DemoTable.Table();
        this.UltraChart2.Data.DataBind();

        string dialImagesPath = this.Page.MapPath("/SamplesBrowser/SamplesCommon/aspnet/WebCharts/Display/ChartCustomization/Custom-Gauge-Layer/DialImages/");
        if (!this.IsPostBack)
        {
            System.IO.FileInfo[] dialImages = new System.IO.DirectoryInfo(dialImagesPath).GetFiles("*.gif");
            foreach (System.IO.FileInfo currentDialImage in dialImages)
            {
                this.DropDownList1.Items.Add(currentDialImage.Name);
            }
        }

        // Set appearance
        if (this.DropDownList1.SelectedIndex < 1)
        {
            pl1.Appearance.Sections.Add(gs1);
            pl1.Appearance.Sections.Add(gs2);
            pl1.Appearance.Sections.Add(gs3);
            pl.Appearance.Sections.Add(gs1);
            pl.Appearance.Sections.Add(gs2);
            pl.Appearance.Sections.Add(gs3);

            this.UltraChart1.Axis.Y.Visible =
                this.UltraChart1.Axis.Y.Labels.Visible =
                this.UltraChart1.Axis.Y.MajorGridLines.Visible =
                this.UltraChart1.Axis.Y.MinorGridLines.Visible = true;

            this.UltraChart2.Axis.Y.Visible =
                this.UltraChart2.Axis.Y.Labels.Visible =
                this.UltraChart2.Axis.Y.MajorGridLines.Visible =
                this.UltraChart2.Axis.Y.MinorGridLines.Visible = true;
        }
        else
        {
            this.UltraChart1.Axis.Y.Visible =
                this.UltraChart1.Axis.Y.Labels.Visible =
                this.UltraChart1.Axis.Y.MajorGridLines.Visible =
                this.UltraChart1.Axis.Y.MinorGridLines.Visible = false;

            this.UltraChart2.Axis.Y.Visible =
                this.UltraChart2.Axis.Y.Labels.Visible =
                this.UltraChart2.Axis.Y.MajorGridLines.Visible =
                this.UltraChart2.Axis.Y.MinorGridLines.Visible = false;

            pl.Appearance.DialPE = pl1.Appearance.DialPE =
                new PaintElement(new Bitmap(dialImagesPath + this.DropDownList1.SelectedItem.Text));
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
        this.Load += new System.EventHandler(this.Page_Load);

    }
    #endregion

}
