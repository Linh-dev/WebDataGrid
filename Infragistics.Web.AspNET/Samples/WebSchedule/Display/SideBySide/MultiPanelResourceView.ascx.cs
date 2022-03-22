using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Infragistics.WebUI.WebSchedule;
using System.Web.UI.HtmlControls;
using System.Text;
using Infragistics.WebUI.Data;
using System.Data;
using System.Globalization;

public partial class MultiPanelResourceView : System.Web.UI.UserControl
{
    #region Public Properties

    protected string _appointmentFormPath;
    public string AppointmentFormPath
    {
        get { return this._appointmentFormPath; }
        set { this._appointmentFormPath = value; }
    }

    protected string _reminderFormPath;
    public string ReminderFormPath
    {
        get { return this._reminderFormPath; }
        set { this._reminderFormPath = value; }
    }

    protected string _styleSetName;
    public string StyleSetName
    {
        get { return this._styleSetName; }
        set { this._styleSetName = value; }
    }

    protected string _styleSetPath;
    public string StyleSetPath
    {
        get { return this._styleSetPath; }
        set { this._styleSetPath = value; }
    }

    protected Infragistics.WebUI.Shared.DefaultableBoolean _enableAppStyling;
    public Infragistics.WebUI.Shared.DefaultableBoolean EnableAppStyling
    {
        get { return this._enableAppStyling; }
        set { this._enableAppStyling = value; }
    }

    protected string _connectionString;
    /// <summary>
    /// Connection string for the WebSchedule Database
    /// </summary>
    /// <example>
    /// Provider=Microsoft.Jet.OLEDB.4.0; Data Source=C:\\WebScheduleSampleDirectory\\WebScheduleSample.mdb
    /// </example>
    public string ConnectionString
    {
        get
        {
            if (String.IsNullOrEmpty(this._connectionString))
                throw new ArgumentNullException("ConnectionString", "Connection string for the WebSchedule Database should not be null or empty");

            return this._connectionString;
        }
        set { this._connectionString = value; }
    }

    protected bool _hideSynchronizedScrollbarsh;
    public bool HideSynchronizedScrollbars
    {
        get { return this._hideSynchronizedScrollbarsh; }
        set { this._hideSynchronizedScrollbarsh = value; }
    }

    protected bool _hideViewModesMenu;
    public bool HideViewModesMenu
    {
        get { return this._hideViewModesMenu; }
        set { this._hideViewModesMenu = value; }
    }

    protected bool _enableScrollbarsSynchronization = true;
    public bool EnableScrollbarsSynchronization
    {
        get { return this._enableScrollbarsSynchronization; }
        set { this._enableScrollbarsSynchronization = value; }
    }

    protected bool _maintainScrollPositionOnPostback;
    public bool MaintainScrollPositionOnPostback
    {
        get { return this._maintainScrollPositionOnPostback; }
        set { this._maintainScrollPositionOnPostback = value; }
    }

    protected bool _disableActivityDialog = false;
    public bool DisableActivityDialog
    {
        get { return this._disableActivityDialog; }
        set { this._disableActivityDialog = value; }
    }

    protected bool _disableActivityUpdating = false;
    public bool DisableActivityUpdating
    {
        get { return this._disableActivityUpdating; }
        set { this._disableActivityUpdating = value; }
    }

    protected string _style;
    public string Style
    {
        get { return this.borderDiv.Style.Value; }
        set
        {
            this.borderDiv.Style.Value = value;
        }
    }

    protected Unit _viewHeight = new Unit("300px");
    public Unit ViewHeight
    {
        get { return this._viewHeight; }
        set
        {
            this._viewHeight = value;
        }
    }

    protected Unit _viewWidth = new Unit("100%");
    public Unit ViewWidth
    {
        get { return this._viewWidth; }
        set
        {
            this._viewWidth = value;
        }
    }

    #region Navigation Next Image
    private string _navigationNextImageNormalUrl;
    public string NavigationNextImageNormalUrl
    {
        get { return this._navigationNextImageNormalUrl; }
        set { this._navigationNextImageNormalUrl = value; }
    }

    private string _navigationNextImageHoverUrl;
    public string NavigationNextImageHoverUrl
    {
        get { return this._navigationNextImageHoverUrl; }
        set { this._navigationNextImageHoverUrl = value; }
    }
    #endregion

    #region Navigation Prev Image
    private string _navigationPrevImageNormalUrl;
    public string NavigationPrevImageNormalUrl
    {
        get { return this._navigationPrevImageNormalUrl; }
        set { this._navigationPrevImageNormalUrl = value; }
    }

    private string _navigationPrevImageHoverUrl;
    public string NavigationPrevImageHoverUrl
    {
        get { return this._navigationPrevImageHoverUrl; }
        set { this._navigationPrevImageHoverUrl = value; }
    }
    #endregion

    #region Caption Remove Image
    private string _captionRemoveImageNormalUrl;
    public string CaptionRemoveImageNormalUrl
    {
        get { return this._captionRemoveImageNormalUrl; }
        set { this._captionRemoveImageNormalUrl = value; }
    }

    private string _captionRemoveImageHoverUrl;
    public string CaptionRemoveImageHoverUrl
    {
        get { return this._captionRemoveImageHoverUrl; }
        set { this._captionRemoveImageHoverUrl = value; }
    }
    #endregion

    #region Caption Add Image
    private string _captionAddImageNormalUrl;
    public string CaptionAddImageNormalUrl
    {
        get { return this._captionAddImageNormalUrl; }
        set { this._captionAddImageNormalUrl = value; }
    }

    private string _captionAddImageHoverUrl;
    public string CaptionAddImageHoverUrl
    {
        get { return this._captionAddImageHoverUrl; }
        set { this._captionAddImageHoverUrl = value; }
    }
    #endregion

    public int VisibleDays
    {
        get { return this._visibleDays; }
        set
        {
            this._visibleDays = value;
        }
    }

    public SideBySideViewMode ViewMode
    {
        get
        {
            return this._viewMode;
        }
        set
        {
            this._viewMode = value;

            Type currentType = this.CreateView().GetType();

            foreach (SideBySideItem item in this._items)
            {
                if (item.View.GetType().BaseType != currentType)
                {
                    WebScheduleViewBase newdv = this.CreateView();
                    newdv.Height = this._viewHeight;
                    newdv.Width = this._viewWidth;
                    newdv.WebScheduleInfo = item.WebScheduleInfo;
                    newdv.CaptionHeaderVisible = item.View.CaptionHeaderVisible;
                    newdv.EnableAppStyling = this._enableAppStyling;
                    newdv.StyleSetName = this._styleSetName;
                    newdv.StyleSetPath = this._styleSetPath;

                    item.View = newdv;
                }
            }
        }
    }

    public List<string> VisibleResources
    {
        get { return this._controlState.VisibleResources; }
        set { this._controlState.VisibleResources = value; }
    }

    public int LimitOfVisibleResources
    {
        get { return this._controlState.LimitOfVisibleResources; }
        set { this._controlState.LimitOfVisibleResources = value; }
    }

    public List<SideBySideStyle> SydeBySideStyles
    {
        get { return this._stylesList; }
        set { this._stylesList = value; }
    }

    public int ViewsCount
    {
        get { return this._items.Count; }
    }

    public bool HasSydeBySideStyles
    {
        get { return (this._stylesList != null && this._stylesList.Count > 0); }
    }

    private DateTime _activeDay = DateTime.Today;
    public DateTime ActiveDay
    {
        get { return this._activeDay; }
        set
        {
            this._activeDay = value;
        }
    }

    private string _controlPath;
    public string ControlPath
    {
        get { return _controlPath; }
    }

    #endregion

    #region Public Methods

    public void AddSideBySideView(string resourceName)
    {
        InitAccessDataSource();

        int UniqueID = new Random().Next();

        SideBySideItem item = new SideBySideItem();

        WebScheduleInfo scInfo = new WebScheduleInfo();
        scInfo.AppointmentFormPath = this.AppointmentFormPath;
        scInfo.ReminderFormPath = this.ReminderFormPath;
        scInfo.ID = String.Format("scInfo{0}__{1}", this._items.Count, UniqueID);
        scInfo.ActiveResourceName = resourceName;

        this.SetActiveDay(scInfo);

        item.WebScheduleInfo = scInfo;

        if (this._items.Count == 0)
        {
            scInfo.EnableMultiResourceView = true;
            scInfo.EnableMultiResourceCaption = false;
            this._controlState.MainWebScheduleInfoClientID = scInfo.ID;

            AttachToEvents(scInfo);
        }
        else
        {
            this._controlState.ResourcesSideBySide.Add(resourceName);
            scInfo.ActiveDayUtc = this._items[0].WebScheduleInfo.ActiveDayUtc;
        }

        WebScheduleViewBase wdv = CreateView();
        wdv.Height = this._viewHeight;
        wdv.Width = this._viewWidth;
        wdv.WebScheduleInfo = scInfo;
        wdv.EnableAppStyling = this._enableAppStyling;
        wdv.StyleSetName = this._styleSetName;
        wdv.StyleSetPath = this._styleSetPath;
        wdv.CaptionHeaderVisible = false;

        item.View = wdv;

        WebScheduleDbProvider provider = new WebScheduleOleDbProvider();
        provider.Connection = _connection;
        provider.ID = String.Format("wsOleDbProvider{0}__{1}", this._items.Count, UniqueID);
        provider.WebScheduleInfo = scInfo;

        item.WebScheduleDbProvider = provider;

        this._items.Add(item);
        item.WebScheduleInfo.DataBind();

        OnSideBySideItemCreated(resourceName);
    }

    public void RemoveSideBySideView(string resourceName)
    {
        if (this._controlState.ResourcesSideBySide.Contains(resourceName))
        {
            this._controlState.ResourcesSideBySide.Remove(resourceName);

            string resourceNameToLower = resourceName.ToLower();

            SideBySideItem currentItem = this._items.Find(delegate(SideBySideItem i)
            {
                return i.WebScheduleInfo.ActiveResourceName.ToLower() == resourceNameToLower;
            });

            if (currentItem != null)
                this._items.Remove(currentItem);

            OnSideBySideItemRemoved(resourceName);
        }
        else
        {
            //throw NotFoundException
        }
    }

    #endregion

    #region Public Events
    /// <summary>
    /// This event is fired when new SideBySide Resource is created
    /// </summary>
    public event EventHandler<SideBySideEventArgs> SideBySideItemCreated;
    /// <summary>
    /// This event is fired when SideBySide Resource is removed
    /// </summary>
    public event EventHandler<SideBySideEventArgs> SideBySideItemRemoved;
    #endregion

    #region Protected Fields

    protected SideBySideControlState _controlState = new SideBySideControlState();

    protected List<SideBySideItem> _items = new List<SideBySideItem>();
    protected List<SideBySide_ResourceCaptionUserControl> _resourceCaptionitems = new List<SideBySide_ResourceCaptionUserControl>();

    protected HtmlTable tbl = null;

    protected IDbConnection _connection = null;

    protected int _visibleDays = 2;

    protected SideBySideViewMode _viewMode;

    protected List<SideBySideStyle> _stylesList = new List<SideBySideStyle>();

    #endregion

    #region Protected Methods

    protected HtmlTable CreateControls()
    {
        if (this._items.Count < 1)
            this.AddSideBySideView("Unassigned");

        if (this.VisibleResources.Count == 0)
            this.BindItems();

        _resourceCaptionitems.Clear();

        ChangeMoveButtonsPeriod();

        HtmlTable tbl = new HtmlTable();
        HtmlTableRow tr2 = new HtmlTableRow();

        tbl.Style.Add(HtmlTextWriterStyle.Width, "100%");

        decimal d = 100m / (decimal)this._items.Count;
        decimal d2 = 100m / ((decimal)(this.VisibleResources.Count - this._items.Count + 1));

        int i = 0;

        foreach (SideBySideItem item in this._items)
        {
            HtmlTable subtbl = new HtmlTable();

            subtbl.Style.Add(HtmlTextWriterStyle.Width, "100%");
            subtbl.CellPadding = 0;
            subtbl.CellSpacing = 0;

            HtmlTableRow subtr1 = new HtmlTableRow();
            HtmlTableRow subtr2 = new HtmlTableRow();

            HtmlTableCell subcell1 = new HtmlTableCell();
            HtmlTableCell subcell2 = new HtmlTableCell();

            subtbl.Rows.Add(subtr1);
            subtbl.Rows.Add(subtr2);

            subtr1.Cells.Add(subcell1);
            subtr2.Cells.Add(subcell2);

            HtmlTableCell cell = new HtmlTableCell();
            cell.Style.Add(HtmlTextWriterStyle.Width, d + "%");

            SideBySideStyle style = GetStyleSafe(i, item.WebScheduleInfo.ActiveResourceName);

            if (i > 0)
            {
                string id = String.Format("{0}__SideBySideUC_{1}", this.ID, i);

                subcell1.Controls.Add(GetResourceCaptionControl(item, true, id, i, 100, item.WebScheduleInfo.ActiveResourceName, style, true));
            }
            else
            {
                #region Create Main Header

                HtmlTable __subtbl = new HtmlTable();
                __subtbl.Style.Add(HtmlTextWriterStyle.Width, "100%");
                __subtbl.CellPadding = 0;
                __subtbl.CellSpacing = 0;

                HtmlTableRow __subtr1 = new HtmlTableRow();
                               
                __subtbl.Rows.Add(__subtr1);

                int _i1 = 0;
                string cellWidth = String.Format("{0}%", 100m / (this.VisibleResources.Count - this._controlState.ResourcesSideBySide.Count));

                foreach (string resourceName in this.VisibleResources)
                {
                    if (this._controlState.ResourcesSideBySide.Contains(resourceName))
                        continue;

                    HtmlTableCell __subcell = new HtmlTableCell();

                    __subcell.Style.Add(HtmlTextWriterStyle.Width, cellWidth);

                    __subtr1.Cells.Add(__subcell);

                    bool isSelected = (resourceName.ToLower() == item.WebScheduleInfo.ActiveResourceName.ToLower());

                    string id = String.Format("{0}__MainSideBySideUC_{1}", this.ID, _i1);

                    UserControl uc = GetResourceCaptionControl(item, isSelected, id, _i1, 100, resourceName, style, false);

                    __subcell.Controls.Add(uc);
                    _resourceCaptionitems.Add(uc as SideBySide_ResourceCaptionUserControl);
                    _i1++;
                }

                subcell1.Controls.Add(__subtbl);

                if (_resourceCaptionitems.Count >= 1 && _resourceCaptionitems.Count < 2)
                    _resourceCaptionitems[0].IsMovable = false;

                #endregion
            }

            if (DisableActivityDialog)
                item.WebScheduleInfo.ClientEvents.ActivityDialogOpening = "DisableActivityDialogOpening";

            if (DisableActivityUpdating)
                item.WebScheduleInfo.ClientEvents.ActivityUpdating = "DisableActivityUpdating";

            //Div with border with the same color as the header
            HtmlGenericControl _div3 = new HtmlGenericControl("DIV");

            string borderColor = "#fff4bc";

            if (style.CaptionColor != System.Drawing.Color.Empty)
                borderColor = System.Drawing.ColorTranslator.ToHtml(style.CaptionColor);

            _div3.Style.Add(HtmlTextWriterStyle.BorderColor, borderColor);
            _div3.Style.Add(HtmlTextWriterStyle.BorderStyle, "solid");
            _div3.Style.Add(HtmlTextWriterStyle.BorderWidth, "2px");

            _div3.Controls.Add(item.View);
            _div3.Controls.Add(item.WebScheduleInfo);
            _div3.Controls.Add(item.WebScheduleDbProvider);

            subcell2.Controls.Add(_div3);

            cell.Controls.Add(subtbl);

            this.AddControlSafe(tr2, cell);

            i++;
        }

        tbl.Controls.Add(tr2);

        return tbl;
    }

    protected UserControl GetResourceCaptionControl(SideBySideItem item, bool isSelected, string id,
        int count, decimal width, string resourceName, SideBySideStyle style, bool isAdding)
    {
        SideBySide_ResourceCaptionUserControl control = (SideBySide_ResourceCaptionUserControl)this.LoadControl("ResourceCaptionUserControl.ascx");
        control.ID = id;
        control.Width = width;
        control.Title = resourceName;

        if (isAdding)
        {
            control.ImageUrl = this.CaptionAddImageNormalUrl;
            control.ImageHoverUrl = this.CaptionAddImageHoverUrl;
        }
        else
        {
            control.ImageUrl = this.CaptionRemoveImageNormalUrl;
            control.ImageHoverUrl = this.CaptionRemoveImageHoverUrl;
        }

        control.Caption = resourceName;
        control.Tag = item;

        control.IsSelected = isSelected;

        control.ButtonClick += new EventHandler(btn_OnButtonClick);
        control.ResourceButtonClick += new EventHandler(btn_ResourceButtonClick);

        if (HasSydeBySideStyles)
        {
            control.ResourceColor = style.CaptionColor;
            control.SelectedColor = style.SelectedColor;            

            ApplyStyles(item.View, style);
        }

        control.ImageHeaderLeftUrl = String.Format("{0}{1}", ControlPath, style.ImageHeaderLeft);
        control.ImageHeaderMiddleUrl = String.Format("{0}{1}", ControlPath, style.ImageHeaderMiddle);
        control.ImageHeaderRightUrl = String.Format("{0}{1}", ControlPath, style.ImageHeaderRight);

        return control;
    }

    protected WebScheduleViewBase CreateView()
    {
        WebScheduleViewBase view = null;

        switch (this.ViewMode)
        {
            case SideBySideViewMode.Day:
                view = new WebDayView();
                ((WebDayView)view).VisibleDays = 1;
                break;
            case SideBySideViewMode.Days:
                view = new WebDayView();
                ((WebDayView)view).VisibleDays = this.VisibleDays;
                break;
            case SideBySideViewMode.Month:
                view = new WebMonthView();
                ((WebMonthView)view).WeekendDisplayFormat = WeekendDisplayFormat.Full;
                break;
            default:
                throw new NotSupportedException();
        }

        return view;
    }

    protected string GetScrollSyncScript()
    {
        return SideBySideHelper.JS_SCRIPT_SCROLL_SYNC.Replace("[#HIDDEN]", this.scrollPos.ClientID);
    }

    protected void InitAccessDataSource()
    {
        if (_connection != null)
            return;

        _connection = new System.Data.OleDb.OleDbConnection(ConnectionString);

        //_accessSource = new AccessDataSource();
        //_accessSource.DataFile = ConnectionString;
        //_accessSource.SelectCommand = SelectCommandText;
        //_accessSource.ID = "InternalAccessDataSource1";

        //this.mainHolder.Controls.Add(_accessSource);
    }

    protected void ApplayViewModesMenuStyles()
    {
        this.ViewModesMenuDiv.Visible = !HideViewModesMenu;

        switch (this.ViewMode)
        {
            case SideBySideViewMode.Day:
                btnDay.CssClass = "btnPressed";
                break;
            case SideBySideViewMode.Days:
                btnWeek.CssClass = "btnPressed";
                break;
            case SideBySideViewMode.Month:
                btnMonth.CssClass = "btnPressed";
                break;
        }

        if (btnDay.CssClass.ToLower() != "btnpressed")
        {
            btnDay.Attributes.Add("onmouseover", "this.className='btnOver'");
            btnDay.Attributes.Add("onmouseout", "this.className='btnNormal'");
            btnDay.Attributes.Add("onclick", "this.className='btnPressed'");
        }
        else
        {
            btnDay.Attributes.Add("onmouseover", "this.className='btnOver'");
            btnDay.Attributes.Add("onmouseout", "this.className='btnPressed'");
        }

        if (btnWeek.CssClass.ToLower() != "btnpressed")
        {
            btnWeek.Attributes.Add("onmouseover", "this.className='btnOver'");
            btnWeek.Attributes.Add("onmouseout", "this.className='btnNormal'");
            btnWeek.Attributes.Add("onclick", "this.className='btnPressed'");
        }
        else
        {
            btnWeek.Attributes.Add("onmouseover", "this.className='btnOver'");
            btnWeek.Attributes.Add("onmouseout", "this.className='btnPressed'");
        }

        if (btnMonth.CssClass.ToLower() != "btnpressed")
        {
            btnMonth.Attributes.Add("onmouseover", "this.className='btnOver'");
            btnMonth.Attributes.Add("onmouseout", "this.className='btnNormal'");
            btnMonth.Attributes.Add("onclick", "this.className='btnPressed'");
        }
        else
        {
            btnMonth.Attributes.Add("onmouseover", "this.className='btnOver'");
            btnMonth.Attributes.Add("onmouseout", "this.className='btnPressed'");
        }
    }

    protected void ApplyStyles(WebScheduleViewBase view, SideBySideStyle style)
    {
        ResetStyles(view);

        if (view is WebDayView)
        {
            WebDayView dw = view as WebDayView;

            #region Apply Day View Styles

            dw.CaptionHeaderStyle.CopyFrom(style.CaptionHeaderStyle);
            dw.AllDayEventStyle.CopyFrom(style.AllDayEventStyle);
            dw.MultiDayEventArrowLeftStyle.CopyFrom(style.MultiDayEventArrowLeftStyle);
            dw.MultiDayEventArrowRightStyle.CopyFrom(style.MultiDayEventArrowRightStyle);
            dw.TodayHeaderStyle.CopyFrom(style.TodayHeaderStyle);
            dw.DayHeaderStyle.CopyFrom(style.DayHeaderStyle);

            dw.ActivityEdgeBusyStyle.CopyFrom(style.ActivityEdgeBusyStyle);
            dw.ActivityEdgeFreeStyle.CopyFrom(style.ActivityEdgeFreeStyle);
            dw.ActivityEdgeLeftStyle.CopyFrom(style.ActivityEdgeLeftStyle);
            dw.ActivityEdgeOutofOfficeStyle.CopyFrom(style.ActivityEdgeOutofOfficeStyle);
            dw.ActivityEdgeStyle.CopyFrom(style.ActivityEdgeStyle);
            dw.ActivityEdgeTentativeStyle.CopyFrom(style.ActivityEdgeTentativeStyle);
            dw.ActivityHoverStyle.CopyFrom(style.ActivityHoverStyle);
            dw.AllDayEventAreaSelectedStyle.CopyFrom(style.AllDayEventAreaSelectedStyle);
            dw.AllDayEventAreaStyle.CopyFrom(style.AllDayEventAreaStyle);
            dw.AllDayEventSelectedStyle.CopyFrom(style.AllDayEventSelectedStyle);
            dw.NonWorkingTimeSlotStyle.CopyFrom(style.NonWorkingTimeSlotStyle);
            dw.TimeSlotLabelMinutesStyle.CopyFrom(style.TimeSlotLabelMinutesStyle);
            dw.TimeSlotLabelStyle.CopyFrom(style.TimeSlotLabelStyle);

            dw.WorkingTimeSlotStyle.CopyFrom(style.WorkingTimeSlotStyle);


            dw.DayHeaderFormatString = style.DayHeaderFormatString;
            #endregion
        }
        else if (view is WebMonthView)
        {
            WebMonthView mw = view as WebMonthView;

            #region Apply Month View Styles

            mw.CaptionHeaderStyle.CopyFrom(style.CaptionHeaderStyle);
            mw.AllDayEventStyle.CopyFrom(style.AllDayEventStyle);
            mw.MultiDayEventArrowLeftStyle.CopyFrom(style.MultiDayEventArrowLeftStyle);
            mw.MultiDayEventArrowRightStyle.CopyFrom(style.MultiDayEventArrowRightStyle);
            mw.TodayHeaderStyle.CopyFrom(style.TodayHeaderStyle);

            mw.CompressedDayStyle.CopyFrom(style.CompressedDayStyle);
            mw.MonthDayOfWeekHeaderStyle.CopyFrom(style.MonthDayOfWeekHeaderStyle);
            mw.MonthStyle.CopyFrom(style.MonthStyle);
            mw.NavigationButtonNextStyle.CopyFrom(style.NavigationButtonNextStyle);
            mw.NavigationButtonPrevStyle.CopyFrom(style.NavigationButtonPrevStyle);
            mw.OtherCompressedDayStyle.CopyFrom(style.OtherCompressedDayStyle);
            mw.OtherMonthDayHeaderStyle.CopyFrom(style.OtherMonthDayHeaderStyle);
            mw.OtherMonthDayStyle.CopyFrom(style.OtherMonthDayStyle);
            mw.WeekNumberStyle.CopyFrom(style.WeekNumberStyle);

            mw.DayHeaderStyle.CopyFrom(style.DayHeaderStyle);
            mw.ActiveDayHeaderStyle.CopyFrom(style.ActiveDayHeaderStyle);
            mw.ActiveDayStyle.CopyFrom(style.ActiveDayStyle);
            mw.DayStyle.CopyFrom(style.DayStyle);
            mw.TodayStyle.CopyFrom(style.TodayStyle);

            #endregion
        }

        view.AppointmentStyle.CopyFrom(style.AppointmentStyle);
        view.FadedAppointmentStyle.CopyFrom(style.FadedAppointmentStyle);
        view.NavigationButtonStyle.CopyFrom(style.NavigationButtonStyle);
        view.ResourceButtonActiveStyle.CopyFrom(style.ResourceButtonActiveStyle);
        view.ResourceButtonStyle.CopyFrom(style.ResourceButtonStyle);
        view.SelectedAppointmentStyle.CopyFrom(style.SelectedAppointmentStyle);

        view.EnableAppStyling = this._enableAppStyling;
        view.StyleSetName = this._styleSetName;
        view.StyleSetPath = this._styleSetPath;

        view.WebScheduleInfo.EnableAppStyling = this._enableAppStyling;
        view.WebScheduleInfo.StyleSetName = this._styleSetName;
        view.WebScheduleInfo.StyleSetPath = this._styleSetPath;
    }

    protected void ResetStyles(WebScheduleViewBase view)
    {
        if (view is WebDayView)
        {
            WebDayView dw = view as WebDayView;

            #region Apply Day View Styles

            dw.CaptionHeaderStyle.Reset();
            dw.AllDayEventStyle.Reset();
            dw.MultiDayEventArrowLeftStyle.Reset();
            dw.MultiDayEventArrowRightStyle.Reset();
            dw.TodayHeaderStyle.Reset();
            dw.DayHeaderStyle.Reset();

            dw.ActivityEdgeBusyStyle.Reset();
            dw.ActivityEdgeFreeStyle.Reset();
            dw.ActivityEdgeLeftStyle.Reset();
            dw.ActivityEdgeOutofOfficeStyle.Reset();
            dw.ActivityEdgeStyle.Reset();
            dw.ActivityEdgeTentativeStyle.Reset();
            dw.ActivityHoverStyle.Reset();
            dw.AllDayEventAreaSelectedStyle.Reset();
            dw.AllDayEventAreaStyle.Reset();
            dw.AllDayEventSelectedStyle.Reset();
            dw.NonWorkingTimeSlotStyle.Reset();
            dw.TimeSlotLabelMinutesStyle.Reset();
            dw.TimeSlotLabelStyle.Reset();

            dw.WorkingTimeSlotStyle.Reset();

            dw.DayHeaderFormatString = null;

            #endregion
        }
        else if (view is WebMonthView)
        {
            WebMonthView mw = view as WebMonthView;

            #region Apply Month View Styles

            mw.CaptionHeaderStyle.Reset();
            mw.AllDayEventStyle.Reset();
            mw.MultiDayEventArrowLeftStyle.Reset();
            mw.MultiDayEventArrowRightStyle.Reset();
            mw.TodayHeaderStyle.Reset();

            mw.CompressedDayStyle.Reset();
            mw.MonthDayOfWeekHeaderStyle.Reset();
            mw.MonthStyle.Reset();
            mw.NavigationButtonNextStyle.Reset();
            mw.NavigationButtonPrevStyle.Reset();
            mw.OtherCompressedDayStyle.Reset();
            mw.OtherMonthDayHeaderStyle.Reset();
            mw.OtherMonthDayStyle.Reset();
            mw.WeekNumberStyle.Reset();

            mw.DayHeaderStyle.Reset();
            mw.ActiveDayHeaderStyle.Reset();
            mw.ActiveDayStyle.Reset();
            mw.DayStyle.Reset();
            mw.TodayStyle.Reset();

            #endregion
        }

        view.AppointmentStyle.Reset();
        view.FadedAppointmentStyle.Reset();
        view.NavigationButtonStyle.Reset();
        view.ResourceButtonActiveStyle.Reset();
        view.ResourceButtonStyle.Reset();
        view.SelectedAppointmentStyle.Reset();
    }

    protected SideBySideStyle GetStyleSafe(int index, string resourceName)
    {
        if (_stylesList == null || _stylesList.Count == 0)
            return new SideBySideStyle();

        //var style = _stylesList.Find(s => String.Compare(s.ResourceName, resourceName, true) == 0);
        SideBySideStyle style = null;

        foreach (SideBySideStyle s in _stylesList)
        {
            if (String.Compare(s.ResourceName, resourceName, true) == 0)
                style = s;
        }

        if (style != null)
            return style;

        return (_stylesList.Count > index) ? _stylesList[index] : _stylesList[new Random().Next(0, _stylesList.Count - 1)];
    }

    protected void ChangeMoveButtonsPeriod()
    {
        switch (this.ViewMode)
        {
            case SideBySideViewMode.Day:
                prevButton.OnClientClick = String.Format("move({0})", -1);
                nextButton.OnClientClick = String.Format("move({0})", 1);
                lPeriod.Text = _items[0].WebScheduleInfo.ActiveDayUtc.ToLocalTime().ToString("dd MMMM yyyy");
                break;

            case SideBySideViewMode.Days:
                prevButton.OnClientClick = String.Format("move({0})", (this.VisibleDays * -1));
                nextButton.OnClientClick = String.Format("move({0})", this.VisibleDays);

                lPeriod.Text = String.Format("{0} - {1}",
                    _items[0].WebScheduleInfo.ActiveDayUtc.ToLocalTime().ToString("dd"),
                    _items[0].WebScheduleInfo.ActiveDayUtc.ToLocalTime().AddDays(this.VisibleDays - 1).ToString("dd MMMM yyyy"));
                break;

            case SideBySideViewMode.Month:
                prevButton.OnClientClick = String.Format("move({0})", 30 * -1);
                nextButton.OnClientClick = String.Format("move({0})", 30);
                lPeriod.Text = _items[0].WebScheduleInfo.ActiveDayUtc.ToLocalTime().ToString("MMMM yyyy");
                break;
        }
    }

    protected void SetActiveDay(WebScheduleInfo info)
    {
        info.ActiveDayUtc = new Infragistics.WebUI.Shared.SmartDate(this._activeDay.ToUniversalTime());
    }

    protected void RecreateTable()
    {
        this.mainHolder.Controls.Remove(tbl);

        this.tbl = this.CreateControls();

        this.mainHolder.Controls.Add(tbl);
    }

    protected void RegisterScript()
    {
        StringBuilder sb = new StringBuilder();
        sb.AppendLine(" var scInfos = []; ");
        sb.AppendLine(" function initInfos() { ");
        sb.AppendLine(" scInfos = []; ");
        for (int i = 0; i < 1; i++)
        {
            WebScheduleInfo scInfo = this._items[i].WebScheduleInfo;
            sb.AppendFormat("scInfos[{0}] = ig_getWebScheduleInfoById('{1}');", i, scInfo.ClientID);
            sb.Append(Environment.NewLine);
        }
        sb.AppendLine(" }");
        sb.AppendLine(" function move(days) { ");
        sb.AppendLine(" initInfos();");
        sb.AppendLine(" for (var i = 0; i < scInfos.length; i++) {");
        sb.AppendLine(" var uniqueString = 'info' + i + '_' + scInfos[i].uniqueID;");
        sb.AppendLine(" scInfos[i].navigate(0,0,days,uniqueString);");
        sb.AppendLine(" } "); // end for
        sb.AppendLine(" } "); // end function
        sb.ToString();
        Page.ClientScript.RegisterClientScriptBlock(this.Page.GetType(), "ViewChangeDate", sb.ToString(), true);
    }

    protected void RegisterScrollSynchronizingScript()
    {
        if (_items.Count > 1 && this.ViewMode != SideBySideViewMode.Month)
        {
            StringBuilder sb = new StringBuilder();
            Control last = _items[_items.Count - 1].View;

            if (this.HideSynchronizedScrollbars)
            {
                for (int i = 0; i <= _items.Count - 2; i++)
                    sb.AppendLine("hideScrollDiv(document.getElementById('" + _items[i].View.ClientID + "'));");
            }

            //Fix for Views Height
            //for (int i = 0; i <= _items.Count - 1; i++)
            //    sb.AppendLine("fixScrollDivHeight(document.getElementById('" + _items[i].View.ClientID + "'));");
            //End Fix

            if (this.EnableScrollbarsSynchronization)
            {
                for (int i = 0; i <= _items.Count - 2; i++)
                    sb.AppendLine("scrollSynch(document.getElementById('" + _items[i].View.ClientID + "'), document.getElementById('" + last.ClientID + "'), 'both');");
            }

            if (MaintainScrollPositionOnPostback)
                sb.AppendLine(@"window.document.body.onload = 
                            function (){ scrollDivTo(document.getElementById('" + last.ClientID + "'))}");

            ScriptManager sManager = ScriptManager.GetCurrent(this.Page);

            if (sManager == null)
            {
                Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "ScrollSynchronizationScript", GetScrollSyncScript(), true);
                Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "AddScrollSynchronizationScript", sb.ToString(), true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ScrollSynchronizationScript", GetScrollSyncScript(), true);
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "AddScrollSynchronizationScript", sb.ToString(), true);
            }
        }
    }

    protected void BindItems()
    {
        foreach (SideBySideItem item in this._items)
        {
            item.WebScheduleInfo.DataBind();
        }
    }

    protected void AddControlSafe(Control container, Control c)
    {
        if (container.Controls.IndexOf(c) == -1)
            container.Controls.Add(c);
    }

    protected void GetLoopedStyle(Resource r)
    {
        System.Reflection.PropertyInfo loopedStylePInfo = r.GetType().GetProperty("LoopedStyle",
            System.Reflection.BindingFlags.NonPublic |
            System.Reflection.BindingFlags.GetProperty |
            System.Reflection.BindingFlags.Instance);

        if (loopedStylePInfo == null)
            return;

        Style LoopedStyle = loopedStylePInfo.GetValue(r, null) as Infragistics.WebUI.Shared.Style;

        if (LoopedStyle == null)
            return;

        System.Reflection.MemberInfo[] internalClassDefaultPInfo = LoopedStyle.GetType().GetMember("internalClassDefault",
             System.Reflection.BindingFlags.NonPublic |
            System.Reflection.BindingFlags.GetField |
            System.Reflection.BindingFlags.Instance);

        if (internalClassDefaultPInfo == null)
            return;

        object cssClassName = internalClassDefaultPInfo.GetValue(0);

    }

    protected void AttachToEvents(WebScheduleInfo scInfo)
    {
        scInfo.ResourcesFetched += new ResourcesFetchedEventHandler(scInfo_ResourcesFetched);
        scInfo.DataBinding += new EventHandler(scInfo_DataBinding);
        scInfo.ActiveResourceChanging += new ActiveResourceChangingEventHandler(scInfo_ActiveResourceChanging);
        scInfo.ActiveDayChanging += new ActiveDayChangingEventHandler(MultiPanelResourceView_ActiveDayChanging);
    }

    #region WebScheduleInfo Event Handlers

    protected void scInfo_ResourcesFetched(object sender, EventArgs e)
    {
        Trace.Write("Begin scInfo_ResourcesFetched");

        WebScheduleInfo info = sender as WebScheduleInfo;

        if (info == null)
            return;

        int countOfVisibleResources = (this.LimitOfVisibleResources == 0) ? (info.VisibleResources.Count * (-2)) : 0;

        bool showAll = this.VisibleResources.Count == 0;

        List<Resource> resourcesForRemove = new List<Resource>();

        foreach (Resource r in info.VisibleResources)
        {
            if (countOfVisibleResources >= this.LimitOfVisibleResources)
                break;

            if (this._controlState.ResourcesSideBySide.Contains(r.Name) &&
                String.Compare(r.Name, "unassigned", true) == -1)
            {
                resourcesForRemove.Add(r);
            }

            if (countOfVisibleResources >= this.LimitOfVisibleResources ||
                !this.VisibleResources.Contains(r.Name) && !showAll)
            {
                resourcesForRemove.Add(r);
            }

            if (showAll)
            {
                VisibleResources.Add(r.Name);
                countOfVisibleResources++;
            }
        }

        bool changeActiveResourceName = false;

        foreach (Resource r in resourcesForRemove)
        {
            if (info.ActiveResourceName.ToLower() == r.Name.ToLower())
                changeActiveResourceName = true;

            if (String.Compare(r.Name, "unassigned", true) == -1 &&
                info.VisibleResources.Contains(r))
                info.VisibleResources.Remove(r);
        }

        if (changeActiveResourceName || showAll)
        {
            info.ActiveResourceName = (info.VisibleResources.Count > 1) ? info.VisibleResources[1].Name : info.VisibleResources[0].Name;
            this.ReselectItem(info.ActiveResourceName.ToLower());
        }

        Trace.Write("End scInfo_ResourcesFetched");
    }

    protected void ReselectItem(string activeResourceName)
    {
        foreach (SideBySide_ResourceCaptionUserControl control in this._resourceCaptionitems)
        {
            control.IsSelected = (control.Caption.ToLower() == activeResourceName);

            if (control.IsSelected)
                break;
        }
    }

    protected void scInfo_DataBinding(object sender, EventArgs e)
    {
        WebScheduleInfo info = sender as WebScheduleInfo;

        if (info == null)
            return;

        foreach (Resource r in info.VisibleResources)
        {
            GetLoopedStyle(r);
        }
    }

    protected void scInfo_ActiveResourceChanging(object sender, ActiveResourceChangingEventArgs e)
    {
        WebScheduleInfo info = sender as WebScheduleInfo;
        
        if (info == null)
            return;

        Resource currentActiveResource = info.VisibleResources.GetResourceFromKey(e.ResourceDataKey);

        if (currentActiveResource == null)
            return;

        string newResource = currentActiveResource.Name.ToLower();

        foreach (SideBySide_ResourceCaptionUserControl btn in _resourceCaptionitems)
        {
            if (btn.Caption.ToLower() == newResource)
                btn.IsSelected = true;
            else
                btn.IsSelected = false;
        }
    }

    protected void MultiPanelResourceView_ActiveDayChanging(object sender, ActiveDayChangingEventArgs e)
    {
        for (int i = 1; i < this._items.Count; i++)
        {
            this._items[i].WebScheduleInfo.ActiveDayUtc = e.NewDate;
        }

        this._activeDay = e.NewDate.Value;
    }

    #endregion

    #region SideBySide_ResourceCaptionUserControl Event Handlers

    protected void btn_ResourceButtonClick(object sender, EventArgs e)
    {
        SideBySide_ResourceCaptionUserControl btn = sender as SideBySide_ResourceCaptionUserControl;

        if (btn == null)
            return;

        SideBySideItem item = btn.Tag as SideBySideItem;

        item.WebScheduleInfo.DataBind();
        item.WebScheduleInfo.ActiveResourceName = btn.Caption;
    }

    protected void btn_OnButtonClick(object sender, EventArgs e)
    {
        SideBySide_ResourceCaptionUserControl btn = sender as SideBySide_ResourceCaptionUserControl;

        if (btn == null)
            return;

        SideBySideItem item = btn.Tag as SideBySideItem;

        if (this._controlState.ResourcesSideBySide.Contains(btn.Caption))
        {
            RemoveSideBySideView(btn.Caption);
        }
        else
        {
            AddSideBySideView(btn.Caption);
        }
    }

    protected void OnSideBySideItemCreated(string resourceName)
    {
        if (SideBySideItemCreated == null)
            return;

        SideBySideEventArgs e = new SideBySideEventArgs(resourceName);

        SideBySideItemCreated(this, e);
    }

    protected void OnSideBySideItemRemoved(string resourceName)
    {
        if (SideBySideItemCreated == null)
            return;

        SideBySideEventArgs e = new SideBySideEventArgs(resourceName);

        SideBySideItemCreated(this, e);
    }

    #endregion

    protected void viewModesButtons_Click(object sender, EventArgs e)
    {
        if (sender == btnDay)
        {
            this.ViewMode = SideBySideViewMode.Day;
        }
        else if (sender == btnWeek)
        {
            if (Int32.Parse(ddlVisibleDaysCount.SelectedValue) == 1)
            {
                ddlVisibleDaysCount.SelectedIndex = 1;
            }

            this.VisibleDays = Int32.Parse(ddlVisibleDaysCount.SelectedValue);
            this.ViewMode = SideBySideViewMode.Days;
        }
        else if (sender == btnMonth)
        {
            this.ViewMode = SideBySideViewMode.Month;
        }
    }

    protected void ddlVisibleDaysCount_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Int32.Parse(ddlVisibleDaysCount.SelectedValue) > 1)
        {
            this.VisibleDays = Int32.Parse(ddlVisibleDaysCount.SelectedValue);
            this.ViewMode = SideBySideViewMode.Days;
        }
        else
        {
            this.VisibleDays = Int32.Parse(ddlVisibleDaysCount.SelectedValue);
            this.ViewMode = SideBySideViewMode.Day;
        }
    }

    #endregion

    #region Overrided Methods

    protected override void OnInit(EventArgs e)
    {
        this.Page.RegisterRequiresControlState(this);

        //string vDir = String.Format("{0}://{1}{2}", this.Request.Url.Scheme, this.Request.Url.Authority, this.TemplateSourceDirectory);
        string url = "/samplesbrowser/samplescommon/aspnet/webschedule/style/webschedulesidebyside/images/";//String.Format("/samplesbrowser/samplescommon/aspnet/webschedule/style/webschedulesidebyside/images/", vDir);

        _controlPath = url;

        this.NavigationNextImageNormalUrl = String.Format("{0}{1}", url, "black_right.png");
        this.NavigationNextImageHoverUrl = String.Format("{0}{1}", url, "orange_right.png");

        this.NavigationPrevImageNormalUrl = String.Format("{0}{1}", url, "black_left.png");
        this.NavigationPrevImageHoverUrl = String.Format("{0}{1}", url, "orange_left.png");

        this.CaptionAddImageNormalUrl = String.Format("{0}{1}", url, "arrowLeft.png");
        this.CaptionAddImageHoverUrl = String.Format("{0}{1}", url, "arrowLeft.png");

        this.CaptionRemoveImageNormalUrl = String.Format("{0}{1}", url, "arrowRight.png");
        this.CaptionRemoveImageHoverUrl = String.Format("{0}{1}", url, "arrowRight.png");

        base.OnInit(e);
    }

    protected override void OnLoad(EventArgs e)
    {
        if (!IsPostBack)
            this.InitAccessDataSource();

        this.prevButton.ImageUrl = this.NavigationPrevImageNormalUrl;
        this.nextButton.ImageUrl = this.NavigationNextImageNormalUrl;

        if (!String.IsNullOrEmpty(this.NavigationPrevImageHoverUrl))
        {
            this.prevButton.Attributes.Add("onmouseover", String.Format(SideBySideHelper.JS_SCRIPT, this.NavigationPrevImageHoverUrl));
            this.prevButton.Attributes.Add("onmouseout", String.Format(SideBySideHelper.JS_SCRIPT, this.NavigationPrevImageNormalUrl));
        }

        if (!String.IsNullOrEmpty(this.NavigationNextImageHoverUrl))
        {
            this.nextButton.Attributes.Add("onmouseover", String.Format(SideBySideHelper.JS_SCRIPT, this.NavigationNextImageHoverUrl));
            this.nextButton.Attributes.Add("onmouseout", String.Format(SideBySideHelper.JS_SCRIPT, this.NavigationNextImageNormalUrl));
        }

        base.OnLoad(e);
    }

    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);
        
        this.RecreateTable();
        this.RegisterScript();
        this.RegisterScrollSynchronizingScript();
        this.ApplayViewModesMenuStyles();
    }

    protected override void LoadControlState(object savedState)
    {
        _controlState = savedState as SideBySideControlState;

        this.ID = this._controlState.ControlID;

        this.AppointmentFormPath = this._controlState.AppointmentFormPath;
        this.ReminderFormPath = this._controlState.ReminderFormPath;
        this.VisibleResources = this._controlState.VisibleResources;
        this.LimitOfVisibleResources = this._controlState.LimitOfVisibleResources;
        this.VisibleDays = this._controlState.VisibleDays;
        this.ViewMode = this._controlState.ViewModeState;
        this.ActiveDay = this._controlState.ActiveDay;

        this.ConnectionString = this._controlState.ConnectionString;
        this.HideSynchronizedScrollbars = this._controlState.HideSynchronizedScrollbars;
        this.EnableScrollbarsSynchronization = this._controlState.EnableScrollbarsSynchronization;
        this.MaintainScrollPositionOnPostback = this._controlState.MaintainScrollPositionOnPostback;
        this.DisableActivityDialog = this._controlState.DisableActivityDialog;
        this.DisableActivityUpdating = this._controlState.DisableActivityUpdating;
        this.HideViewModesMenu = this._controlState.HideViewModesMenu;

        InitAccessDataSource();

        foreach (WebDayViewState dvState in this._controlState.States)
        {
            WebScheduleInfoState siState = dvState.WebScheduleInfo;
            WebScheduleDataProviderState pState = dvState.WebScheduleProviderState;

            SideBySideItem item = new SideBySideItem();

            WebScheduleInfo scInfo = new WebScheduleInfo();
            scInfo.AppointmentFormPath = siState.AppointmentFormPath;
            scInfo.ReminderFormPath = siState.ReminderFormPath;
            scInfo.ID = siState.ID;
            scInfo.ActiveResourceName = siState.ActiveResourceName;
            scInfo.EnableMultiResourceView = siState.EnableMultiResourceView;
            scInfo.EnableMultiResourceCaption = siState.EnableMultiResourceCaption;
            item.WebScheduleInfo = scInfo;

            this.SetActiveDay(scInfo);

            if (siState.ID == this._controlState.MainWebScheduleInfoClientID)
            {
                AttachToEvents(scInfo);                
            }

            WebScheduleViewBase wdv = this.CreateView();
            wdv.Height = this._viewHeight;
            wdv.Width = this._viewWidth;
            wdv.WebScheduleInfo = scInfo;
            wdv.EnableAppStyling = this._enableAppStyling;
            wdv.StyleSetName = this._styleSetName;
            wdv.StyleSetPath = this._styleSetPath;
            wdv.CaptionHeaderVisible = dvState.CaptionHeaderVisible;

            item.View = wdv;

            WebScheduleOleDbProvider provider = new WebScheduleOleDbProvider();
            provider.Connection = _connection;
            provider.ID = pState.ID;
            provider.WebScheduleInfo = scInfo;

            item.WebScheduleDbProvider = provider;

            this._items.Add(item);
        }
    }

    protected override object SaveControlState()
    {
        this._controlState.ControlID = this.ID;

        this._controlState.States = new List<WebDayViewState>();

        foreach (SideBySideItem item in this._items)
        {
            WebDayViewState dvState = new WebDayViewState();
            WebScheduleInfoState siState = new WebScheduleInfoState();
            WebScheduleDataProviderState pState = new WebScheduleDataProviderState();

            siState.AppointmentFormPath = item.WebScheduleInfo.AppointmentFormPath;
            siState.ReminderFormPath = item.WebScheduleInfo.ReminderFormPath;
            siState.ID = item.WebScheduleInfo.ID;
            siState.WebScheduleProviderID = item.WebScheduleDbProvider.UniqueID;

            siState.ActiveResourceName = item.WebScheduleInfo.ActiveResourceName;
            siState.EnableMultiResourceView = item.WebScheduleInfo.EnableMultiResourceView;
            siState.EnableMultiResourceCaption = item.WebScheduleInfo.EnableMultiResourceCaption;

            dvState.CaptionHeaderVisible = item.View.CaptionHeaderVisible;
            dvState.WebScheduleInfo = siState;

            pState.DataSourceID = item.WebScheduleDbProvider.DataSourceID;
            pState.WebScheduleInfo = siState;

            dvState.WebScheduleProviderState = pState;

            this._controlState.States.Add(dvState);
        }

        this._controlState.ConnectionString = this.ConnectionString;
        this._controlState.ViewModeState = this.ViewMode;
        this._controlState.VisibleDays = this.VisibleDays;
        this._controlState.ActiveDay = this.ActiveDay;
        this._controlState.AppointmentFormPath = this.AppointmentFormPath;
        this._controlState.ReminderFormPath = this.ReminderFormPath;
        this._controlState.VisibleResources = this.VisibleResources;
        this._controlState.LimitOfVisibleResources = this.LimitOfVisibleResources;

        this._controlState.HideSynchronizedScrollbars = this.HideSynchronizedScrollbars;
        this._controlState.EnableScrollbarsSynchronization = this.EnableScrollbarsSynchronization;
        this._controlState.MaintainScrollPositionOnPostback = this.MaintainScrollPositionOnPostback;
        this._controlState.DisableActivityDialog = this.DisableActivityDialog;
        this._controlState.DisableActivityUpdating = this.DisableActivityUpdating;
        this._controlState.HideViewModesMenu = this.HideViewModesMenu;

        return _controlState;
    }

    protected override void CreateChildControls()
    {
        try
        {
            tbl = this.CreateControls();
        }
        catch (NotSupportedException)
        {
            tbl = new HtmlTable();
        }

        this.mainHolder.Controls.Add(tbl);

        base.CreateChildControls();
    }

    #endregion
}
