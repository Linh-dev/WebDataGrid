using System;
using Infragistics.UltraChart.Data.Series;


public partial class Samples_WebCharts_Display_Composite_Charting_Data_Series_Visibility_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private void Page_Load(object sender, System.EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.chkSeriesA.Checked = true;
            this.chkSeriesB.Checked = true;
            this.chkSeriesC.Checked = true;
            this.chkSeriesD.Checked = true;
        }

        // Set whether the series should be checked based on the checkboxes.
        SeriesBase myBaseA = (SeriesBase)this.UltraChart1.CompositeChart.Series[0];
        myBaseA.Visible = this.chkSeriesA.Checked;
        SeriesBase myBaseB = (SeriesBase)this.UltraChart1.CompositeChart.Series[1];
        myBaseB.Visible = this.chkSeriesB.Checked;
        SeriesBase myBaseC = (SeriesBase)this.UltraChart1.CompositeChart.Series[2];
        myBaseC.Visible = this.chkSeriesC.Checked;
        SeriesBase myBaseD = (SeriesBase)this.UltraChart1.CompositeChart.Series[3];
        myBaseD.Visible = this.chkSeriesD.Checked;

        this.UltraChart1.Series.DataBind();
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
        this.chkSeriesA.CheckedChanged += new System.EventHandler(this.chkSeriesA_CheckedChanged);
        this.chkSeriesB.CheckedChanged += new System.EventHandler(this.chkSeriesB_CheckedChanged);
        this.chkSeriesC.CheckedChanged += new System.EventHandler(this.chkSeriesC_CheckedChanged);
        this.chkSeriesD.CheckedChanged += new System.EventHandler(this.chkSeriesD_CheckedChanged);
        this.Load += new System.EventHandler(this.Page_Load);
    }
    #endregion

    private void chkSeriesA_CheckedChanged(object sender, System.EventArgs e)
    {
        SeriesBase myBase = (SeriesBase)this.UltraChart1.CompositeChart.Series[0];
        if (this.chkSeriesA.Checked == true)
        {
            myBase.Visible = true;
            this.UltraChart1.InvalidateLayers();
        }
        else
        {
            myBase.Visible = false;
            this.UltraChart1.InvalidateLayers();
        }
    }

    private void chkSeriesB_CheckedChanged(object sender, System.EventArgs e)
    {
        SeriesBase myBase = (SeriesBase)this.UltraChart1.CompositeChart.Series[1];
        if (this.chkSeriesB.Checked == true)
        {
            myBase.Visible = true;
            this.UltraChart1.InvalidateLayers();
        }
        else
        {
            myBase.Visible = false;
            this.UltraChart1.InvalidateLayers();
        }
    }

    private void chkSeriesC_CheckedChanged(object sender, System.EventArgs e)
    {
        SeriesBase myBase = (SeriesBase)this.UltraChart1.CompositeChart.Series[2];
        if (this.chkSeriesC.Checked == true)
        {
            myBase.Visible = true;
            this.UltraChart1.InvalidateLayers();
        }
        else
        {
            myBase.Visible = false;
            this.UltraChart1.InvalidateLayers();
        }
    }

    private void chkSeriesD_CheckedChanged(object sender, System.EventArgs e)
    {
        SeriesBase myBase = (SeriesBase)this.UltraChart1.CompositeChart.Series[3];
        if (this.chkSeriesD.Checked == true)
        {
            myBase.Visible = true;
            this.UltraChart1.InvalidateLayers();
        }
        else
        {
            myBase.Visible = false;
            this.UltraChart1.InvalidateLayers();
        }
    }
}