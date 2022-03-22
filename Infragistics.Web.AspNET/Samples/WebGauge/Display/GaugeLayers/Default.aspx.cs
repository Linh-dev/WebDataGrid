using System;
using System.Drawing;
using Infragistics.UltraGauge.Resources;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            RadialGauge myRadialGauge = new RadialGauge();
            myRadialGauge.Key = "radial";
            myRadialGauge.Dial.BrushElement = new SolidFillBrushElement(Color.SkyBlue);
            myRadialGauge.Dial.StrokeElement.Color = Color.Navy;
            myRadialGauge.Scales.Add(new RadialGaugeScale());
            myRadialGauge.Scales[0].Axis = new NumericAxis(0.0, 10.0, 1.0);
            myRadialGauge.Scales[0].StartAngle = 110.0;
            myRadialGauge.Scales[0].EndAngle = 430.0;
            myRadialGauge.Scales[0].Labels.BrushElement = new SolidFillBrushElement(Color.Black);
            RadialGaugeNeedle needle1 = myRadialGauge.Scales[0].Markers.AddNeedle();
            needle1.BrushElement = new SolidFillBrushElement(Color.Black);
            needle1.Value = Math.PI;
            needle1.StartExtent = 0.0;
            needle1.MidExtent = 60.0;
            needle1.EndExtent = 80.0;
            needle1.Anchor.BrushElement = new SolidFillBrushElement(Color.White);
            needle1.Anchor.StrokeElement.Color = Color.Navy;

            LinearGauge myLinearGauge = new LinearGauge();
            myLinearGauge.Key = "linear";
            myLinearGauge.Orientation = LinearOrientation.Vertical;
            myLinearGauge.BrushElement = new SolidFillBrushElement(Color.White);
            myLinearGauge.BoundsMeasure = Measure.Percent;
            myLinearGauge.Bounds = new Rectangle(60, 30, 10, 40);
            myLinearGauge.Scales.Add(new LinearGaugeScale());
            myLinearGauge.Scales[0].Axis = new NumericAxis(0.0, 100.0, 20.0);
            myLinearGauge.Scales[0].StartExtent = 0.0;
            myLinearGauge.Scales[0].EndExtent = 100.0;
            myLinearGauge.Scales[0].InnerExtent = 0.0;
            myLinearGauge.Scales[0].OuterExtent = 100.0;
            myLinearGauge.Scales[0].StrokeElement.Color = Color.Black;
            myLinearGauge.Scales[0].MajorTickmarks.StrokeElement.Color = Color.Black;
            myLinearGauge.Scales[0].MajorTickmarks.ZPosition = LinearTickmarkZPosition.BelowMarkers;
            myLinearGauge.Scales[0].MajorTickmarks.StartExtent = 0.0;
            myLinearGauge.Scales[0].MajorTickmarks.EndExtent = 100.0;
            LinearGaugeBarMarker barMarker = myLinearGauge.Scales[0].Markers.AddBarMarker();
            barMarker.InnerExtent = 10.0;
            barMarker.OuterExtent = 90.0;
            barMarker.BrushElement = new SolidFillBrushElement(Color.Red);
            barMarker.Value = 72.0;

            SegmentedDigitalGauge myDigitalGauge = new SegmentedDigitalGauge();
            myDigitalGauge.Key = "digital";
            myDigitalGauge.BrushElement = new SolidFillBrushElement(Color.Black);
            myDigitalGauge.FontBrushElement = new SolidFillBrushElement(Color.Yellow);
            myDigitalGauge.UnlitBrushElement = new SolidFillBrushElement(Color.DimGray);
            myDigitalGauge.BoundsMeasure = Measure.Percent;
            myDigitalGauge.Bounds = new Rectangle(30, 70, 40, 10);
            myDigitalGauge.Text = "12345";
            myDigitalGauge.Digits = 5;

            this.UltraGauge1.Gauges.Add(myRadialGauge);
            this.UltraGauge1.Gauges.Add(myLinearGauge);
            this.UltraGauge1.Gauges.Add(myDigitalGauge);
        }
    }
    protected void checkChanged(object sender, EventArgs e)
    {
        this.UltraGauge1.Gauges.FromKey("radial").Visible = this.CheckBoxList1.Items.FindByValue("Radial").Selected;
        this.UltraGauge1.Gauges.FromKey("linear").Visible = this.CheckBoxList1.Items.FindByValue("Linear").Selected;
        this.UltraGauge1.Gauges.FromKey("digital").Visible = this.CheckBoxList1.Items.FindByValue("Digital").Selected;
    }
}