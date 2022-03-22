using System;
using System.Web.UI.WebControls;
using Infragistics.UltraChart.Shared.Styles;

public partial class Samples_WebCharts_Display_Visual_Appearance_Chart_Sizing_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.widthEditor.ValueInt = (int)this.UltraChart1.Width.Value;
            this.heightEditor.ValueInt = (int)this.UltraChart1.Height.Value;
        }
        switch (this.unitTypeEditor.SelectedIndex)
        {
            case 0:
                this.UltraChart1.Width = Unit.Pixel(this.widthEditor.ValueInt);
                this.UltraChart1.Height = Unit.Pixel(this.heightEditor.ValueInt);
                break;
            default:
                this.UltraChart1.Width = Unit.Percentage(this.widthEditor.ValueInt);
                this.UltraChart1.Height = Unit.Percentage(this.heightEditor.ValueInt);
                break;
        }
        switch (this.renderingTypeEditor.SelectedIndex)
        {
            case 0:
                this.UltraChart1.DeploymentScenario.RenderingType = RenderingType.Image;
                if (this.UltraChart1.Width.Type != UnitType.Pixel)
                {
                    this.Response.Write(this.GetGlobalResourceObject("WebCharts", "Sizing_Error"));
                }
                break;
            case 1:
                this.UltraChart1.DeploymentScenario.RenderingType = RenderingType.Flash;
                break;
            default:
                this.UltraChart1.DeploymentScenario.RenderingType = RenderingType.Svg;
                break;
        }
        this.UltraChart1.Data.DataSource = Infragistics.UltraChart.Data.DemoTable.Table();
        this.UltraChart1.Data.DataBind();
    }
}
