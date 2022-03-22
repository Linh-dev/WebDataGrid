using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.WebSlider1.ClientEvents.ValueChanged = "sliderValueChanged";
        this.TextBox1.Attributes.Add("onchange", String.Format("textBoxChanged('{0}');", this.TextBox1.ClientID));
        this.TextBox1.Attributes.Add("onkeypress", String.Format("return textBoxKeyPressed(event, '{0}');", this.TextBox1.ClientID));
    }
}
