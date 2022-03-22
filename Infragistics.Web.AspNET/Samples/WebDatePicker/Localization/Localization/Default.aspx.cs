using System;
using System.Globalization;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.CultureList.SelectedIndexChanged += new EventHandler(CultureList_SelectedIndexChanged);

        if (!IsPostBack)
            this.webDatePicker.DisplayModeFormat = this.webDatePicker.Culture.DateTimeFormat.LongDatePattern;
    }


    void CultureList_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (this.CultureList.SelectedValue)
        {
            case "de-DE":
                this.webMonthCalendar.FooterContent = "Heute: {0:d}";
                break;
            case "ja-JP":
                this.webMonthCalendar.FooterContent = "今日: {0:d}";
                break;
            case "es-MX":
                this.webMonthCalendar.FooterContent = "Hoy: {0:d}";
                break;
            case "uk-UA":
                this.webMonthCalendar.FooterContent = "Сьогодні: {0:d}";
                break;
            default:
                this.webMonthCalendar.FooterContent = "Today: {0:d}";
                break;
        }

        this.webDatePicker.Culture = new CultureInfo(this.CultureList.SelectedValue);
        this.webDatePicker.DisplayModeFormat = this.webDatePicker.Culture.DateTimeFormat.LongDatePattern;
        this.webMonthCalendar.Culture = this.webDatePicker.Culture;
    }
}