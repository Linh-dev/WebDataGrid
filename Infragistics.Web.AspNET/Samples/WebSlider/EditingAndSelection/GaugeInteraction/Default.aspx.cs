using System;
using System.Drawing;
using Infragistics.UltraGauge.Resources;
using Infragistics.WebUI.UltraWebGauge;


public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RadialGaugeScale scale = ((RadialGauge)this.UltraGauge1.Gauges[0]).Scales[0];
        scale.Markers[0].Value = scale.MapInverse(new Point(0, 250));
    }

    protected void slider_valuechanged(object sender, Infragistics.Web.UI.EditorControls.SliderValueChangedEventArgs e)
    {
        RadialGauge rad = this.UltraGauge1.Gauges[0] as RadialGauge;
        rad.Scales[0].Markers[0].Value = double.Parse(this.UltraGauge1.ValueFromClient);
    }
    protected void UltraGauge1_AsyncRefresh(object sender, RefreshEventArgs e)
    {
        RadialGauge rad = this.UltraGauge1.Gauges[0] as RadialGauge;
        rad.Scales[0].Markers[0].Value = double.Parse(this.UltraGauge1.ValueFromClient);
    }
}
