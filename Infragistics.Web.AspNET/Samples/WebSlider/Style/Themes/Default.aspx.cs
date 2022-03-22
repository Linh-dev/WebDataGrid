using System;

public partial class Samples_WebSlider_Style_Application_Styling_Themes_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            this.WebSlider1.StyleSetName = this.DDStyles.SelectedValue;
            Random rand = new Random();
            this.WebSlider1.Value = rand.Next(0, 200);
            this.StyleImage.Src = "/SamplesBrowser/SamplesCommon/aspnet/Common/ThemeLabels/" + this.DDStyles.SelectedValue + ".png";
        }
    }
}