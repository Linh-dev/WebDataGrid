using System;
using System.Collections.Generic;
using System.Web;
using System.Drawing;
using Infragistics.WebUI.Shared;

/// <summary>
/// Summary description for SydeBySideStyle
/// </summary>
public class SideBySideStyle
{
    public Color CaptionColor;
    public Color SelectedColor = System.Drawing.ColorTranslator.FromHtml("#e5cc88");
    public string ResourceName;
    public string ImageHeaderLeft = "defaultLeft.png";
    public string ImageHeaderRight = "defaultRight.png";
    public string ImageHeaderMiddle = "defaultMiddle.png";

    #region WebDayView
    public Style CaptionHeaderStyle = new Style();
    public Style ActivityEdgeBusyStyle = new Style();
    public Style ActivityEdgeFreeStyle = new Style();
    public Style ActivityEdgeLeftStyle = new Style();
    public Style ActivityEdgeOutofOfficeStyle = new Style();
    public Style ActivityEdgeStyle = new Style();
    public Style ActivityEdgeTentativeStyle = new Style();
    public Style ActivityHoverStyle = new Style();
    public Style AllDayEventAreaSelectedStyle = new Style();
    public Style AllDayEventAreaStyle = new Style();
    public Style AllDayEventSelectedStyle = new Style();
    public Style AllDayEventStyle = new Style();
    public Style MultiDayEventArrowLeftStyle = new Style();
    public Style MultiDayEventArrowRightStyle = new Style();
    public Style NonWorkingTimeSlotStyle = new Style();
    public Style TimeSlotLabelMinutesStyle = new Style();
    public Style TimeSlotLabelStyle = new Style();
    public Style TodayHeaderStyle = new Style();
    public Style WorkingTimeSlotStyle = new Style();
    public Style DayHeaderStyle = new Style();

    public string DayHeaderFormatString;
    #endregion

    #region WebMonthView
    public Style CompressedDayStyle = new Style();
    public Style MonthDayOfWeekHeaderStyle = new Style();
    public Style MonthStyle = new Style();
    public Style NavigationButtonNextStyle = new Style();
    public Style NavigationButtonPrevStyle = new Style();
    public Style OtherCompressedDayStyle = new Style();
    public Style OtherMonthDayHeaderStyle = new Style();
    public Style OtherMonthDayStyle = new Style();
    public Style WeekNumberStyle = new Style();
    #endregion

    #region WebScheduleViewBase
    public Style AppointmentStyle = new Style();
    public Style FadedAppointmentStyle = new Style();
    public Style NavigationButtonStyle = new Style();
    public Style ResourceButtonActiveStyle = new Style();
    public Style ResourceButtonStyle = new Style();
    public Style SelectedAppointmentStyle = new Style();
    #endregion

    #region DayOrientedScheduleView
    public Style ActiveDayHeaderStyle = new Style();
    public Style ActiveDayStyle = new Style();
    public Style DayStyle = new Style();
    public Style TodayStyle = new Style();
    #endregion

    public SideBySideStyle()
	{
		
	}

    public void Reset()
    {
        CaptionHeaderStyle.Reset();
        ActivityEdgeBusyStyle.Reset();
        ActivityEdgeFreeStyle.Reset();
        ActivityEdgeLeftStyle.Reset();
        ActivityEdgeOutofOfficeStyle.Reset();
        ActivityEdgeStyle.Reset();
        ActivityEdgeTentativeStyle.Reset();
        ActivityHoverStyle.Reset();
        AllDayEventAreaSelectedStyle.Reset();
        AllDayEventAreaStyle.Reset();
        AllDayEventSelectedStyle.Reset();
        AllDayEventStyle.Reset();
        MultiDayEventArrowLeftStyle.Reset();
        MultiDayEventArrowRightStyle.Reset();
        NonWorkingTimeSlotStyle.Reset();
        TimeSlotLabelMinutesStyle.Reset();
        TimeSlotLabelStyle.Reset();
        TodayHeaderStyle.Reset();
        WorkingTimeSlotStyle.Reset();

        CompressedDayStyle.Reset();
        MonthDayOfWeekHeaderStyle.Reset();
        MonthStyle.Reset();
        NavigationButtonNextStyle.Reset();
        NavigationButtonPrevStyle.Reset();
        OtherCompressedDayStyle.Reset();
        OtherMonthDayHeaderStyle.Reset();
        OtherMonthDayStyle.Reset();
        WeekNumberStyle.Reset();       

        AppointmentStyle.Reset();
        FadedAppointmentStyle.Reset();
        NavigationButtonStyle.Reset();
        ResourceButtonActiveStyle.Reset();
        ResourceButtonStyle.Reset();
        SelectedAppointmentStyle.Reset();
    }
}
