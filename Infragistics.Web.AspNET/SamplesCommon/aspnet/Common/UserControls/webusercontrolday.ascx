<%@ Control Language="c#" Inherits="TabbedPageSample.WebUserControlDay" CodeFile="WebUserControlDay.ascx.cs" %>
<ig_scheduledata:webscheduleoledbprovider id="WebScheduleOleDbProvider1" runat="server" WebScheduleInfoID="WebScheduleInfo1" ConnectionID="oleDbConnection1"></ig_scheduledata:webscheduleoledbprovider>
<ig_sched:webscheduleinfo id="WebScheduleInfo1" runat="server" EnableRecurringActivities="True" EnableSmartCallbacks="True" EnableProgressIndicator="False"></ig_sched:webscheduleinfo>
<ig_sched:webdayview id="WebDayView1" runat="server" Height="561px" Width="99.8%" VisibleDays="3" CaptionHeaderText="<%$ Resources:WebSchedule, MultipleResources_Label9 %>" WebScheduleInfoID="WebScheduleInfo1" NavigationAnimation="Linear" EnableAppStyling="True"></ig_sched:webdayview>
