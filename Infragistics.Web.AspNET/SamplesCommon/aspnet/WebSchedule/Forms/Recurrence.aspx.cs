using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Forms
{
    /// <summary>
    /// Summary description for Recurrence.
    /// </summary>
    public partial class Recurrence : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.RadioButton RadioButton1;
        protected System.Web.UI.WebControls.RadioButtonList RadioButtonList1;

        private void Page_Load(object sender, System.EventArgs e)
        {
            this.wdcEndTime.AllowNull = this.wdcStartTime.AllowNull = this.wdcEndRecurrence.AllowNull = false;
            this.wdcStartTime.Attributes.CssStyle["height"] = " ";
            this.wdcStartTime.EditStyle.CustomRules = "height:;";
            this.wdcEndTime.Attributes.CssStyle["height"] = " ";
            this.wdcEndTime.EditStyle.CustomRules = "height:;";
            this.wdcEndRecurrence.Attributes.CssStyle["height"] = " ";
            this.wdcEndRecurrence.EditStyle.CustomRules = "height:;";
            this.LocalizeStrings();
            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "RecurrenceDialogScriptArray", this.GetJavascriptArray());
        }

        #region GetJavascriptArray

        private string GetJavascriptArray()
        {
            string array = "<script type='text/javascript'> \r\n var RecurrenceDialogStrings = [" +
                                "'" + this.GetGlobalResourceObject("Strings", "JS_RecurrenceDialog_InvalidPattern") + "'," +
                                "'" + this.GetGlobalResourceObject("Strings", "JS_RecurrenceDialog_LooseDataConfirmation") + "'" +
                            "]; \r\n </script>";

            return array;
        }

        #endregion

        #region LocalizeStrings
        private void LocalizeStrings()
        {
            this.AppointmentTimeLegend.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_AppointmentTimeLegend").ToString();
            this.StartLabel.InnerHtml = this.StartLabel2.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Start_Label").ToString();
            this.EndDateLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_EndDateLabel").ToString();
            this.EndTimeLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_EndTimeLabel").ToString();
            this.RecurrencePatternLegend.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_RecurrencePatterLegend").ToString();
            this.radDaily.Value = this.radDailySection508.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Daily").ToString();
            this.radWeekly.Value = this.radWeeklySection508.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Weekly").ToString();
            this.radMonthly.Value = this.radMonthlySection508.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Monthly").ToString();
            this.radYearly.Value = this.radYearlySection508.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Yearly").ToString();
            this.EveryLabel.InnerHtml = this.yearlyEveryLabel.InnerHtml = this.radDayOf.Value = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Every").ToString();
            this.DaysLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Days").ToString();
            this.EveryWeekDayLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_EveryWeekDay").ToString();
            this.RecursEveryLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_RecursEvery").ToString();
            this.WeeksOnLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_WeeksOn").ToString();
            this.monthlySundayOption.Attributes["title"] = this.yearlySundayOption.Attributes["title"] = this.cbSundaySection508.InnerHtml = this.monthlySundayOption.InnerHtml = this.yearlySundayOption.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Sunday").ToString();
            this.monthlyMondayOption.Attributes["title"] = this.yearlyMondayOption.Attributes["title"] = this.cbMondaySection508.InnerHtml = this.monthlyMondayOption.InnerHtml = this.yearlyMondayOption.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Monday").ToString();
            this.monthlyTuesdayOption.Attributes["title"] = this.yearlyTuesdayOption.Attributes["title"] = this.cbTuesdaySection508.InnerHtml = this.monthlyTuesdayOption.InnerHtml = this.yearlyTuesdayOption.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Tuesday").ToString();
            this.monthlyWednesdayOption.Attributes["title"] = this.yearlyWednesdayOption.Attributes["title"] = this.cbWednesdaySection508.InnerHtml = this.monthlyWednesdayOption.InnerHtml = this.yearlyWednesdayOption.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Wednesday").ToString();
            this.monthlyThursdayOption.Attributes["title"] = this.yearlyThursdayOption.Attributes["title"] = this.cbThursdaySection508.InnerHtml = this.monthlyThursdayOption.InnerHtml = this.yearlyThursdayOption.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Thursday").ToString();
            this.monthlyFridayOption.Attributes["title"] = this.yearlyFridayOption.Attributes["title"] = this.cbFridaySection508.InnerHtml = this.monthlyFridayOption.InnerHtml = this.yearlyFridayOption.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Friday").ToString();
            this.monthlySaturdayOption.Attributes["title"] = this.yearlySaturdayOption.Attributes["title"] = this.cbSaturdaySection508.InnerHtml = this.monthlySaturdayOption.InnerHtml = this.yearlySaturdayOption.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Saturday").ToString();
            this.DayLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Day").ToString();
            this.radXOf.Value = this.TheLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_The").ToString();
            this.monthlyFirstOption.Attributes["title"] = this.yearlyFirstOption.Attributes["title"] = this.monthlyFirstOption.InnerHtml = this.yearlyFirstOption.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_First").ToString();
            this.monthlySecondOption.Attributes["title"] = this.yearlySecondOption.Attributes["title"] = this.monthlySecondOption.InnerHtml = this.yearlySecondOption.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Second").ToString();
            this.monthlyThirdOption.Attributes["title"] = this.yearlyThirdOption.Attributes["title"] = this.monthlyThirdOption.InnerHtml = this.yearlyThirdOption.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Third").ToString();
            this.monthlyFourthOption.Attributes["title"] = this.yearlyFourthOption.Attributes["title"] = this.monthlyFourthOption.InnerHtml = this.yearlyFourthOption.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Fourth").ToString();
            this.monthlyLastOption.Attributes["title"] = this.yearlyLastOption.Attributes["title"] = this.monthlyLastOption.InnerHtml = this.yearlyLastOption.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Last").ToString();
            this.monthlyDayOption.Attributes["title"] = this.yearlyDayOption.Attributes["title"] = this.monthlyDayOption.InnerHtml = this.yearlyDayOption.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_day_lowercase").ToString();
            this.monthlyWeekDayOption.Attributes["title"] = this.yearlyWeekdayOption.Attributes["title"] = this.monthlyWeekDayOption.InnerHtml = this.yearlyWeekdayOption.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Weekday").ToString();
            this.monthlyWeekEndDayOption.Attributes["title"] = this.yearlyWeekendDayOption.Attributes["title"] = this.monthlyWeekEndDayOption.InnerHtml = this.yearlyWeekendDayOption.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_WeekendDay").ToString();
            this.OfEveryLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_OfEvery").ToString();
            this.MonthsLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Months").ToString();
            this.yearlyJanuaryOption.Attributes["title"] = this.yearlyJanuaryOption2.Attributes["title"] = this.yearlyJanuaryOption.InnerHtml = this.yearlyJanuaryOption2.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_January").ToString();
            this.yearlyFebruaryOption.Attributes["title"] = this.yearlyFebruaryOption2.Attributes["title"] = this.yearlyFebruaryOption.InnerHtml = this.yearlyFebruaryOption2.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_February").ToString();
            this.yearlyMarchOption.Attributes["title"] = this.yearlyMarchOption2.Attributes["title"] = this.yearlyMarchOption.InnerHtml = this.yearlyMarchOption2.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_March").ToString();
            this.yearlyAprilOption.Attributes["title"] = this.yearlyAprilOption2.Attributes["title"] = this.yearlyAprilOption.InnerHtml = this.yearlyAprilOption2.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_April").ToString();
            this.yearlyMayOption.Attributes["title"] = this.yearlyMayOption2.Attributes["title"] = this.yearlyMayOption.InnerHtml = this.yearlyMayOption2.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_May").ToString();
            this.yearlyJuneOption.Attributes["title"] = this.yearlyJuneOption2.Attributes["title"] = this.yearlyJuneOption.InnerHtml = this.yearlyJuneOption2.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_June").ToString();
            this.yearlyJulyOption.Attributes["title"] = this.yearlyJulyOption2.Attributes["title"] = this.yearlyJulyOption.InnerHtml = this.yearlyJulyOption2.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_July").ToString();
            this.yearlyAugustOption.Attributes["title"] = this.yearlyAugustOption2.Attributes["title"] = this.yearlyAugustOption.InnerHtml = this.yearlyAugustOption2.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_August").ToString();
            this.yearlySeptemberOption.Attributes["title"] = this.yearlySeptemberOption2.Attributes["title"] = this.yearlySeptemberOption.InnerHtml = this.yearlySeptemberOption2.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_September").ToString();
            this.yearlyOctoberOption.Attributes["title"] = this.yearlyOctoberOption2.Attributes["title"] = this.yearlyOctoberOption.InnerHtml = this.yearlyOctoberOption2.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_October").ToString();
            this.yearlyNovemberOption.Attributes["title"] = this.yearlyNovemberOption2.Attributes["title"] = this.yearlyNovemberOption.InnerHtml = this.yearlyNovemberOption2.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_November").ToString();
            this.yearlyDecemberOption.Attributes["title"] = this.yearlyDecemberOption2.Attributes["title"] = this.yearlyDecemberOption.InnerHtml = this.yearlyDecemberOption2.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_December").ToString();
            this.RangeOfRecurrenceLegend.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_RangeofRecurrence").ToString();
            this.NoEndDateLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_NoEndDate").ToString();
            this.EndAfterLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_EndAfter").ToString();
            this.OccurrencesLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Occurrences").ToString();
            this.EndByLabel.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_EndBy").ToString();
            this.buttonOK.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_OkButton").ToString();
            this.buttonCancel.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_CancelButton").ToString();
            this.buttonRemoveRecurrence.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_RemoveRecurrenceButton").ToString();
            this.Section508_1.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_1").ToString();
            this.Section508_2.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_2").ToString();
            this.Section508_3.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_3").ToString();
            this.Section508_4.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_4").ToString();
            this.Section508_5.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_5").ToString();
            this.Section508_6.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_6").ToString();
            this.Section508_7.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_7").ToString();
            this.Section508_8.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_8").ToString();
            this.Section508_9.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_9").ToString();
            this.Section508_10.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_10").ToString();
            this.Section508_11.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_11").ToString();
            this.Section508_12.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_12").ToString();
            this.Section508_13.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_13").ToString();
            this.Section508_14.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_14").ToString();
            this.Section508_15.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_15").ToString();
            this.Section508_16.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_16").ToString();
            this.Section508_17.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_17").ToString();
            this.Section508_18.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_18").ToString();
            this.Section508_19.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_19").ToString();
            this.Section508_20.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_20").ToString();
            this.Section508_21.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_21").ToString();
            this.Section508_22.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_22").ToString();
            this.Section508_23.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_23").ToString();
            this.Section508_24.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_24").ToString();
            this.Section508_25.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_25").ToString();
            this.Section508_26.InnerHtml = this.GetGlobalResourceObject("Strings", "RecurrenceDialog_Section508_26").ToString();


        }
        #endregion

        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion
    }
}
