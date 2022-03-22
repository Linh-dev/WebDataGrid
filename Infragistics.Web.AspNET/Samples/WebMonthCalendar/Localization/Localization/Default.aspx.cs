using System;
using System.Globalization;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.CultureList.SelectedIndexChanged += new EventHandler(CultureList_SelectedIndexChanged);
    }

    void CultureList_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (this.CultureList.SelectedValue)
        {
            case "de-DE":
                this.CalendarView.FooterContent = "Heute: {0:d}";
                break;
            case "ja-JP":
                this.CalendarView.FooterContent = "今日: {0:d}";
                break;
            case "es-MX":
                this.CalendarView.FooterContent = "Hoy: {0:d}";
                break;
            case "uk-UA":
                this.CalendarView.FooterContent = "Сьогодні: {0:d}";
                break;
            default:
                this.CalendarView.FooterContent = "Today: {0:d}";
                break;
        }
        this.CalendarView.Culture = new CultureInfo(this.CultureList.SelectedValue);

    }
}
