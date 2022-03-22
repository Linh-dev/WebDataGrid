using System;

public partial class Samples_WebSlider_Performance_Event_Handling_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.ServerOutput.Text = "";
    }

    protected void WebSlider1_ValueChanged(object sender, Infragistics.Web.UI.EditorControls.SliderValueChangedEventArgs e)
    {
        this.ServerOutput.Text += "WebSlider1:<br />Old:" + e.OldValue + ", New:" + e.NewValue;
    }

    protected void WebSlider2_ValueChanged(object sender, Infragistics.Web.UI.EditorControls.SliderValueChangedEventArgs e)
    {
        this.ServerOutput.Text += "<br />WebSlider2:<br />Old:" + e.OldValue + ", New:" + e.NewValue;
    }
}