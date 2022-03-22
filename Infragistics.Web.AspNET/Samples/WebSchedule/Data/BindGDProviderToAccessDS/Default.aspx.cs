using System;
using System.Web.UI;
using Infragistics.WebUI.WebSchedule;

public partial class Samples_WebSchedule_Data_WebSchedule_GDProvider_DS_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        this.wsInfo.ActivityAdding += new ActivityAddingEventHandler(wsInfo_ActivityAdding);
        this.wsInfo.ActivityDeleting += new ActivityDeletingEventHandler(wsInfo_ActivityDeleting);
        this.wsInfo.ActivityUpdating += new ActivityUpdatingEventHandler(wsInfo_ActivityUpdating);

        this.wsInfo.VarianceAdding += new VarianceAddingEventHandler(wsInfo_VarianceAdding);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.activityDataSource.DataFile = this.GetMdbLocation("WebScheduleGenericDataProviderSample.mdb");
        this.resourceDataSource.DataFile = this.GetMdbLocation("WebScheduleGenericDataProviderSample.mdb");
        this.varianceDataSource.DataFile = this.GetMdbLocation("WebScheduleGenericDataProviderSample.mdb");
        this.WebMonthView1.Style.Add(HtmlTextWriterStyle.Overflow, "hidden");

        this.wsInfo.AppointmentFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx";
        this.wsInfo.ReminderFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/Reminder.aspx";

        if (!IsPostBack)
        {
            this.wsInfo.ActiveDayUtc = new Infragistics.WebUI.Shared.SmartDate(new DateTime(2009, 10, 6).ToUniversalTime());
            this.wsInfo.ActiveResourceName = "Darren Straube";
        }
    }

    protected void wsInfo_ActivityUpdating(object sender, CancelableActivityEventArgs e)
    {
        e.Cancel = true;
    }

    protected void wsInfo_ActivityDeleting(object sender, CancelableActivityEventArgs e)
    {
        e.Cancel = true;
    }

    protected void wsInfo_ActivityAdding(object sender, CancelableActivityEventArgs e)
    {
        e.Cancel = true;
    }

    protected void wsInfo_VarianceAdding(object sender, CancelableActivityEventArgs e)
    {
        e.Cancel = true;
    }

}