using System;
using Infragistics.Web.UI.EditorControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CalendarCustomDay cday;

            if (DateTime.Now.Day >= 15)
            {
                cday = new CalendarCustomDay(DateTime.Now.AddDays(-5));
            }
            else
            {
                cday = new CalendarCustomDay(DateTime.Now.AddDays(+5));
            }

            cday.CssClass = "special_day";
            this.CalendarView.CustomDays.Add(cday);

        }
    }
}
