using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            this.WebProgressBar1.StyleSetName = this.DDStyles.SelectedValue;
            Random rand = new Random();
            this.WebProgressBar1.Value = rand.Next(0, 100);
            this.StyleImange.Src = "/SamplesBrowser/SamplesCommon/aspnet/Common/ThemeLabels/" + this.DDStyles.SelectedValue + ".png";
        }
        else
        {
            this.StyleImange.Src = "/SamplesBrowser/SamplesCommon/aspnet/Common/ThemeLabels/Default.png";
        }
    }
}
