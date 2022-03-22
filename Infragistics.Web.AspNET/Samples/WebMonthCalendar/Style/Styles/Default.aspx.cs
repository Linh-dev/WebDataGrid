using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            this.StyleImange.Src = "/SamplesBrowser/SamplesCommon/aspnet/Common/ThemeLabels/" + this.DDStyles.SelectedValue + ".png";
            this.WebMonthCalendar1.StyleSetName = this.DDStyles.SelectedValue;
        }
    }
}
