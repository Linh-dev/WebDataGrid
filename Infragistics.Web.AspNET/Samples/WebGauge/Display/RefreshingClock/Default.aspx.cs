using System;
using Infragistics.UltraGauge.Resources;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void intervalPicker_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.UltraGauge1.RefreshInterval = int.Parse(this.intervalPicker.SelectedItem.Text);
    }
    private void UpdateGauge()
    {
        RadialGauge gauge = this.UltraGauge1.Gauges[0] as RadialGauge;
        gauge.Scales[0].Markers[0].Value = DateTime.Now;
        gauge.Scales[1].Markers[0].Value = DateTime.Now.Minute;
        gauge.Scales[1].Markers[1].Value = DateTime.Now.Second;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.UpdateGauge();
    }

}