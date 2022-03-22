using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (!IsPostBack)
            this.webDatePicker.DisplayModeFormat = System.Globalization.CultureInfo.CurrentUICulture.DateTimeFormat.LongDatePattern;
    }
}