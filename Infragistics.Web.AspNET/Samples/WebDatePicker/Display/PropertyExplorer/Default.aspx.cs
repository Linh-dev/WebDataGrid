using System;
using System.Web.UI.WebControls;
using Infragistics.Web.UI.EditorControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            this.WebMonthCalendar1.HideOtherMonthDays = this.chkHideOtherMonthDays.Checked;
            this.WebMonthCalendar1.ChangeMonthToDateClicked = chkChangeMonthToDateClicked.Checked;
            this.WebMonthCalendar1.EnableYearDropDown = this.chkEnableYearDropDown.Checked;
            this.WebMonthCalendar1.EnableWeekNumbers = this.chkEnableWeekNumbers.Checked;
            this.WebMonthCalendar1.EnableMonthDropDown = this.chkEnableMonthDropDown.Checked;
            this.webDatePicker.OpenCalendarOnFocus = this.chkOpenCalendarOnFocus.Checked;
            this.webDatePicker.Nullable = this.cbNullable.Checked;

            this.webDatePicker.EditMode = (DatePickerEditMode)Enum.Parse(typeof(DatePickerEditMode), this.ddEditMode.SelectedValue);
            this.WebMonthCalendar1.FirstDayOfWeek = (FirstDayOfWeek)Enum.Parse(typeof(FirstDayOfWeek), this.ddFirstDayOfWeek.SelectedValue);

            this.webDatePicker.DisplayModeFormat = this.wteDisplayModeFormat.Text;
            this.webDatePicker.PromptChar = this.wtePromptChar.Text[0];
            this.webDatePicker.NullText = this.wteNullText.Text;

            this.webDatePicker.Buttons.CustomButtonDisplay = (ButtonDisplay)Enum.Parse(typeof(ButtonDisplay), this.ddCustomButtonDisplay.SelectedValue);
        }
        else
        {

            this.webDatePicker.EditModeFormat = this.wteDisplayModeFormat.Text;
            this.webDatePicker.PromptChar = this.wtePromptChar.Text[0];
            this.webDatePicker.NullText = this.wteNullText.Text;

            this.webDatePicker.Date = DateTime.Today;
            this.webDatePicker.Nullable = this.cbNullable.Checked;

            this.ddEditMode.DataSource = Enum.GetNames(typeof(DatePickerEditMode));
            this.ddEditMode.SelectedValue = DatePickerEditMode.KeyboardAndCalendar.ToString();

            this.ddFirstDayOfWeek.DataSource = Enum.GetNames(typeof(FirstDayOfWeek));
            this.ddFirstDayOfWeek.SelectedValue = FirstDayOfWeek.Sunday.ToString();

            this.ddCustomButtonDisplay.DataSource = Enum.GetNames(typeof(ButtonDisplay));
            this.ddCustomButtonDisplay.SelectedValue = ButtonDisplay.OnRight.ToString();

            DataBind();
        }
    }
}