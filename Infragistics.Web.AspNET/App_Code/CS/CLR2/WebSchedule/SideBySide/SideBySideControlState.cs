using System;
using System.Collections.Generic;
using System.Web;
using Infragistics.WebUI.WebSchedule;
using System.Web.UI.HtmlControls;

[Serializable]
public class SideBySideControlState
{
    public string ControlID;

    public int VisibleDays, LimitOfVisibleResources;

    public string ConnectionString;

    public string SelectCommandText;

    public bool HideSynchronizedScrollbars;

    public bool HideViewModesMenu;

    public bool EnableScrollbarsSynchronization;

    public bool MaintainScrollPositionOnPostback;

    public bool DisableActivityDialog;

    public bool DisableActivityUpdating;

    public List<WebDayViewState> States;

    public SideBySideViewMode ViewModeState;

    public string AppointmentFormPath;

    public string ReminderFormPath;

    public string MainWebScheduleInfoClientID;

    public DateTime ActiveDay;

    public List<string> VisibleResources = new List<string>();

    public List<string> ResourcesSideBySide = new List<string>();
}

[Serializable]
public class WebScheduleDataProviderState
{
    public string DataSourceID;
    public string ID;
    public WebScheduleInfoState WebScheduleInfo;
}

[Serializable]
public class WebScheduleInfoState
{
    public string AppointmentFormPath;
    public string ReminderFormPath;
    public string ID;
    public string WebScheduleProviderID;
    public string ActiveResourceName;
    public bool EnableMultiResourceView;
    public bool EnableMultiResourceCaption;
}

[Serializable]
public class WebDayViewState
{
    public WebScheduleDataProviderState WebScheduleProviderState;
    public WebScheduleInfoState WebScheduleInfo;
    public bool CaptionHeaderVisible;
    public int VisibleDays;
}