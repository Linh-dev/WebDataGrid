using System;
using System.Drawing;
using Infragistics.UltraGauge.Resources;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void UltraGauge1_AsyncRefresh(object sender, Infragistics.WebUI.UltraWebGauge.RefreshEventArgs e)
    {
        RadialGaugeScale scale = ((RadialGauge)this.UltraGauge1.Gauges[0]).Scales[0];
        double value = Convert.ToDouble(scale.MapInverse(new Point(e.HitTest.X, e.HitTest.Y)));
        if ((value > 0.0) && (value < 100.0))
        {
            scale.Markers[0].Value = scale.MapInverse(new Point(e.HitTest.X, e.HitTest.Y));
        }
        else
        {
            scale.Markers[0].Visible = false;
        }
    }
}