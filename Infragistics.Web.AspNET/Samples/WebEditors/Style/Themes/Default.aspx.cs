using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.ThemeList.SelectedIndexChanged += new EventHandler(ThemeList_SelectedIndexChanged);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.BasicCurrencyEditor.Value = 100.0d;
            this.BasicNumericEditor.Value = 50;
            this.BasicPercentEditor.Value = .25;
            this.BasicDateTimeEditor.Value = DateTime.Now;
        }
    }

    protected void ThemeList_SelectedIndexChanged(object sender, EventArgs e)
    {

        string selectedTheme = this.ThemeList.SelectedValue;

        this.SingleLineEditor.StyleSetName = selectedTheme;
        this.MultiLineEditor.StyleSetName = selectedTheme;
        this.BasicCurrencyEditor.StyleSetName = selectedTheme;
        this.BasicNumericEditor.StyleSetName = selectedTheme;
        this.BasicPercentEditor.StyleSetName = selectedTheme;
        this.BasicDateTimeEditor.StyleSetName = selectedTheme;
        this.PhoneNumberWithExtEditor.StyleSetName = selectedTheme;

    }
}