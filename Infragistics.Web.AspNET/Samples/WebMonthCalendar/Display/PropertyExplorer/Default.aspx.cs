using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


using Infragistics.Web.UI.EditorControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            this.WebMonthCalendar1.HideOtherMonthDays = this.chkHideOtherMonthDays.Checked;
            this.WebMonthCalendar1.ChangeMonthToDateClicked = chkChangeMonthToDateClicked.Checked;
            this.WebMonthCalendar1.EnableYearDropDown = this.chkEnableYearDropDown.Checked;
            this.WebMonthCalendar1.EnableWeekNumbers = this.chkEnableWeekNumbers.Checked;
            this.WebMonthCalendar1.EnableMonthDropDown = this.chkEnableMonthDropDown.Checked;

            this.WebMonthCalendar1.SelectionType = (CalendarSelectionType)Enum.Parse(typeof(CalendarSelectionType), this.ddSelectionType.SelectedValue);
            this.WebMonthCalendar1.FirstDayOfWeek = (FirstDayOfWeek)Enum.Parse(typeof(FirstDayOfWeek), this.ddFirstDayOfWeek.SelectedValue);
        }
        else
        {
            this.ddSelectionType.DataSource = Enum.GetNames(typeof(CalendarSelectionType));
            this.ddSelectionType.SelectedValue = CalendarSelectionType.Single.ToString();

            this.ddFirstDayOfWeek.DataSource = Enum.GetNames(typeof(FirstDayOfWeek));
            this.ddFirstDayOfWeek.SelectedValue = FirstDayOfWeek.Sunday.ToString();

            DataBind();
        }


    }
}
