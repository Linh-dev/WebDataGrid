using System;
using Infragistics.UltraGauge.Resources;
using Infragistics.Web.UI.EditorControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    bool setGuage;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            setGuage = true;
            this.rangePicker_SelectedIndexChanged(this, EventArgs.Empty);
           
        }
    }

    protected void  editors_ValueChanged(object sender, TextEditorValueChangedEventArgs e)
    {
 	    RadialGaugeRange range = this.GetSelectedRange();
        range.StartValue = this.startValueEditor.ValueDouble;
        range.EndValue = this.endValueEditor.ValueDouble;
        range.InnerExtentStart = this.innerExtentStartEditor.ValueDouble;
        range.InnerExtentEnd = this.innerExtentEndEditor.ValueDouble;
        range.OuterExtent = this.outerExtentEditor.ValueDouble;
    }

    protected void rangePicker_SelectedIndexChanged(object sender, EventArgs e)
    {
        RadialGaugeRange range = this.GetSelectedRange();
        this.startValueEditor.ValueDouble = Convert.ToDouble(range.StartValue);
        if (setGuage == true)
        {
            this.endValueEditor.ValueDouble = Convert.ToDouble(10);
            setGuage = false;
        }
        else
        {
            this.endValueEditor.ValueDouble = Convert.ToDouble(range.EndValue);
        }
        this.innerExtentStartEditor.ValueDouble = range.InnerExtentStart;
        this.innerExtentEndEditor.ValueDouble = range.InnerExtentEnd;
        this.outerExtentEditor.ValueDouble = range.OuterExtent;
    }

    private RadialGaugeRange GetSelectedRange()
    {
        RadialGauge gauge = this.UltraGauge1.Gauges[0] as RadialGauge;

        switch (this.rangePicker.SelectedIndex)
        {
            case 0:
                return gauge.Scales[0].Ranges[0];
            case 1:
                return gauge.Scales[0].Ranges[1];
            default:
                return gauge.Scales[0].Ranges[2];
        }

    }
}