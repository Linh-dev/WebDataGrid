using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.UI;
using Infragistics.WebUI.WebSchedule;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.WebMonthView1.Style.Add(HtmlTextWriterStyle.Overflow, "hidden");

        this.wsInfo.AppointmentFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx";
        this.wsInfo.ReminderFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/Reminder.aspx";

        IList resources = null;
        ICollection appointments = null;

        if (!IsPostBack)
        {
            resources = GetResources();

            appointments = GetAppointments(resources);

            Session["WebSchdeuleObjects"] = new object[] { resources, appointments };
        }
        else
        {
            object[] objects = Session["WebSchdeuleObjects"] as object[];

            resources = objects[0] as IList;
            appointments = objects[1] as ICollection;
        }

        WebScheduleGenericProviderBindings();

        WebScheduleGenericProvider1.ActivityDataSource = appointments;
        WebScheduleGenericProvider1.VarianceDataSource = appointments;

        WebScheduleGenericProvider1.ResourceDataSource = resources;
    }

    protected void wsInfo_VarianceAdding(object sender, CancelableActivityEventArgs e)
    {
        e.Activity.DataKey = new Random().Next();
    }

    protected void wsInfo_ActivityAdding(object sender, CancelableActivityEventArgs e)
    {
        e.Activity.DataKey = new Random().Next();
    }

    protected void WebScheduleGenericProviderBindings()
    {
        WebScheduleGenericProvider1.AppointmentBinding.DescriptionMember = "Description";
        WebScheduleGenericProvider1.AppointmentBinding.DataKeyMember = "ID";
        WebScheduleGenericProvider1.AppointmentBinding.DurationMember = "Duration";
        WebScheduleGenericProvider1.AppointmentBinding.EnableReminderMember = "EnableReminders";
        WebScheduleGenericProvider1.AppointmentBinding.LocationMember = "Location";
        WebScheduleGenericProvider1.AppointmentBinding.OriginalStartDateTimeUtcMember = "OriginalStartDateTimeUtc";
        WebScheduleGenericProvider1.AppointmentBinding.RecurrenceKeyMember = "RecurrenceID";
        WebScheduleGenericProvider1.AppointmentBinding.ResourceKeyMember = "ResourceKey";
        WebScheduleGenericProvider1.AppointmentBinding.AllDayEventMember = "AllDayEvent";
        WebScheduleGenericProvider1.AppointmentBinding.RecurrencePatternMember = "RecurrencePattern";
        WebScheduleGenericProvider1.AppointmentBinding.ShowTimeAsMember = "ShowTimeAs";
        WebScheduleGenericProvider1.AppointmentBinding.StartDateTimeUtcMember = "StartDateTimeUtc";
        WebScheduleGenericProvider1.AppointmentBinding.StatusMember = "Status";
        WebScheduleGenericProvider1.AppointmentBinding.SubjectMember = "Subject";
        WebScheduleGenericProvider1.AppointmentBinding.VarianceKeyMember = "VarianceID";
        WebScheduleGenericProvider1.AppointmentBinding.ImportanceMember = "Importance";

        WebScheduleGenericProvider1.VarianceBinding.DescriptionMember = "Description";
        WebScheduleGenericProvider1.VarianceBinding.DataKeyMember = "ID";
        WebScheduleGenericProvider1.VarianceBinding.DurationMember = "Duration";
        WebScheduleGenericProvider1.VarianceBinding.EnableReminderMember = "EnableReminders";
        WebScheduleGenericProvider1.VarianceBinding.LocationMember = "Location";
        WebScheduleGenericProvider1.VarianceBinding.OriginalStartDateTimeUtcMember = "OriginalStartDateTimeUtc";
        WebScheduleGenericProvider1.VarianceBinding.RecurrenceKeyMember = "RecurrenceID";
        WebScheduleGenericProvider1.VarianceBinding.ResourceKeyMember = "ResourceKey";
        WebScheduleGenericProvider1.VarianceBinding.AllDayEventMember = "AllDayEvent";
        WebScheduleGenericProvider1.VarianceBinding.RecurrencePatternMember = "RecurrencePattern";
        WebScheduleGenericProvider1.VarianceBinding.ShowTimeAsMember = "ShowTimeAs";
        WebScheduleGenericProvider1.VarianceBinding.StartDateTimeUtcMember = "StartDateTimeUtc";
        WebScheduleGenericProvider1.VarianceBinding.StatusMember = "Status";
        WebScheduleGenericProvider1.VarianceBinding.SubjectMember = "Subject";
        WebScheduleGenericProvider1.VarianceBinding.VarianceKeyMember = "VarianceID";
        WebScheduleGenericProvider1.VarianceBinding.ImportanceMember = "Importance";

        WebScheduleGenericProvider1.ResourceBinding.DataKeyMember = "ID";
        WebScheduleGenericProvider1.ResourceBinding.NameMember = "ResourceName";
        WebScheduleGenericProvider1.ResourceBinding.DescriptionMember = "ResourceDescription";
        WebScheduleGenericProvider1.ResourceBinding.EmailAddressMember = "EmailAddress";
    }

    private IList GetAppointments(IList resources)
    {
        List<MyAppointment> appointments = new List<MyAppointment>();

        appointments.Add(
                 CreateAppointment(1, DateTime.Today.AddHours(9), 3600, "Sales Expo", "NYC", "Description", false, ((MyResource)resources[0]).ID.ToString())
                 );

        appointments.Add(
            CreateAppointment(2, DateTime.Today.AddDays(3).AddHours(14), 4000, "Win 7 Rollout ", "US", "Description", false, ((MyResource)resources[0]).ID.ToString())
            );

        appointments.Add(
            CreateAppointment(3, DateTime.Today.AddDays(5).AddHours(11), 4600, "Finalise Merger", "Milan", "Description", false, ((MyResource)resources[0]).ID.ToString())
            );


        appointments.Add(
           CreateAppointment(4, DateTime.Today.AddDays(10).AddHours(13), 3600, "Tour Sites", "India", "Description", false, ((MyResource)resources[1]).ID.ToString())
           );


        appointments.Add(
            CreateAppointment(5, DateTime.Today.AddDays(-3).AddHours(10), 4600, "Roadshow", "Abu Dhabi", "Description", false, ((MyResource)resources[1]).ID.ToString())
            );

        appointments.Add(
            CreateAppointment(6, DateTime.Today.AddDays(-10).AddHours(13), 3200, "VC Golf", "Country Club", "Description", false, ((MyResource)resources[1]).ID.ToString())
            );


        appointments.Add(
            CreateAppointment(7, DateTime.Today.AddDays(-15).AddHours(13), 3600, "Conf Call", "London", "Description", false, ((MyResource)resources[2]).ID.ToString())
            );

        appointments.Add(
            CreateAppointment(8, DateTime.Today.AddDays(-20).AddHours(9), 3600 * 24 * 2, "DevReach Conference", "Sofia",
            "The fourth edition of the premier developer conference on Microsoft technologies in SEE", true, ((MyResource)resources[2]).ID.ToString())
            );

        return appointments;
    }

    private IList GetResources()
    {
        List<MyResource> resources = new List<MyResource>();

        resources.Add(new MyResource(1, "Allyson Tuley", "Allyson Tuley", "aTuley@resources.com"));
        resources.Add(new MyResource(2, "Ted Redfern", "Ted Redfern", "tRedfern@resources.com"));
        resources.Add(new MyResource(3, "Jamie Gadomski", "Jamie Gadomski", "jGadomski@resources.com"));

        return resources;
    }

    protected MyAppointment CreateAppointment(int id, DateTime startDateTime, int appointmentDuration,
        string appName, string location, string appDescription, bool allDayEvent, string resourceID)
    {
        return new MyAppointment(
                    id,
                    startDateTime.ToUniversalTime(),
                    appointmentDuration,
                    appName,
                    allDayEvent,
                    location,
                    appDescription,
                    1,
                    false,
                    1,
                    1,
                    Guid.NewGuid().ToString(),
                    null,
                    -1,
                    null,
                    resourceID
                );
    }
}
