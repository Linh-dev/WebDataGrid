<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
	CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
	<ig:HtmlLink ID="Htmllink2" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/webSample_style.css" />
	<ig:HtmlLink ID="Htmllink1" runat="server" type="text/css" rel="Stylesheet" href="style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>
			<div class="fullPagePadding">
				<ol>
					<li>
						<asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebSchedule, FullPage_Description2 %>"></asp:Label>
					</li>
					<li>
						<asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebSchedule, FullPage_Description3 %>"></asp:Label>
					</li>
				</ol>
				<div id="fullPageOptions">
					<div class="fullPageFloatLeft">
						<span class="bold">
							<asp:Label ID="Label2" Text="<%$ Resources:WebSchedule, FullPage_Label12 %>" ToolTip=""
								Tag="" Key="" runat="server" /></span>
						<br />
						<asp:DropDownList runat="server" Width="120px" AutoPostBack="True" Font-Size="8pt"
							ID="ResourceList">
						</asp:DropDownList>
					</div>
					<div class="fullPageFloatLeft">
						<span class="bold">
							<asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:WebSchedule, FullPage_Label13 %>" />:</span><br />
						<asp:DropDownList runat="server" AutoPostBack="True" Font-Size="8pt" ID="DropDownList1"
							Width="120px">
						</asp:DropDownList>
					</div>
				</div>
				<br />
			</div>
			<div id="fullPageMenuNav" class="fullPagePadding">
				<ig:WebDataMenu ID="WebDataMenu1" runat="server" Width="100%" ActivateOnHover="false" OnItemClick="WebDataMenu1_ItemClick1">
					<GroupSettings Orientation="Horizontal" />
					<Items>
						<ig:DataMenuItem Key="newAppointmentTool" ToolTip="<%$ Resources:WebSchedule, FullPage_Label1 %>"
							Text="<%$ Resources:WebSchedule, FullPage_Label2 %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSchedule/Display/FullPageSample/new.bmp" />
						<ig:DataMenuItem IsSeparator="true" />
						<ig:DataMenuItem Key="printTool" ToolTip="<%$ Resources:WebSchedule, FullPage_Label3 %>"
							ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSchedule/Display/FullPageSample/print.bmp" />
						<ig:DataMenuItem Key="deleteTool" ToolTip="<%$ Resources:WebSchedule, FullPage_Label4 %>"
							ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSchedule/Display/FullPageSample/delete.gif" />
						<ig:DataMenuItem Key="changeColorTool" ToolTip="<%$ Resources:WebSchedule, FullPage_Label5 %>"
							ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebSchedule/Display/FullPageSample/coloring.bmp" />
						<ig:DataMenuItem IsSeparator="true" />
						<ig:DataMenuItem Key="todayTool" ToolTip="<%$ Resources:WebSchedule, FullPage_Label6 %>"
							Text="<%$ Resources:WebSchedule, FullPage_Label7 %>" />
						<ig:DataMenuItem IsSeparator="true" />
						<ig:DataMenuItem Key="LogOut" ToolTip="<%$ Resources:WebSchedule, FullPage_Label8 %>"
							Text="<%$ Resources:WebSchedule, FullPage_Label9 %>" Target="Default.aspx" />
					</Items>
					<ClientEvents ItemClick="WebDataMenu1_Click" />
				</ig:WebDataMenu>
			</div>
			<div id="fullPageContent">
				<div id="fullPageLeftCol">
					<ig_sched:WebCalendarView ID="WebCalendarView1" runat="server" Height="180px" Width="100%"
						WebScheduleInfoID="WebScheduleInfo1">
					</ig_sched:WebCalendarView>
					<br />
					<ig_sched:WebMonthView ID="WebMonthView1" runat="server" Height="460px" Width="100%"
						WebScheduleInfoID="WebScheduleInfo1" EnableAutoActivityDialogResolved="True" CssClass="fullPageTopPadding">
					</ig_sched:WebMonthView>
				</div>
				<div id="fullPageRightCol">
					<ig_sched:WebDayView ID="WebDayView1" runat="server" Height="732px" WebScheduleInfoID="WebScheduleInfo1"
						Width="100%" VisibleDays="3" DayHeaderFormatString="ddd">
					</ig_sched:WebDayView>
				</div>
			</div>
			<ig_scheduledata:WebScheduleOleDbProvider ID="WebScheduleOleDbProvider1" runat="server"
				ConnectionID="oleDbWebSchedule" WebScheduleInfoID="WebScheduleInfo1">
				<ResourceBinding EmailAddressMember="EmailAddress" DataKeyMember="ResourceID" DescriptionMember="ResourceDescription"
					NameMember="ResourceName" TimestampMember="_ts"></ResourceBinding>
				<AppointmentBinding SubjectMember="Subject" StartDateTimeUtcMember="StartDateTimeUtc"
					DurationMember="Duration" AllDayEventMember="AllDayEvent" TimestampMember="_ts"
					DataKeyMember="ActivityID" ImportanceMember="Importance" ReminderIntervalMember="ReminderInterval"
					DescriptionMember="ActivityDescription" LocationMember="Location" ShowTimeAsMember="ShowTimeAs"
					StatusMember="Status" EnableReminderMember="EnableReminder"></AppointmentBinding>
			</ig_scheduledata:WebScheduleOleDbProvider>
			<ig_sched:WebScheduleInfo ID="WebScheduleInfo2" runat="server" EnableReminders="False">
			</ig_sched:WebScheduleInfo>
			<ig_sched:WebScheduleInfo ID="WebScheduleInfo1" runat="server" EnableRecurringActivities="True"
				EnableSmartCallbacks="True">
			</ig_sched:WebScheduleInfo>
			<ig_scheduledata:WebScheduleOleDbProvider ID="WebScheduleOleDbProvider2" runat="server"
				ConnectionID="oleDbConnection1" WebScheduleInfoID="WebScheduleInfo1">
			</ig_scheduledata:WebScheduleOleDbProvider>
		</ContentTemplate>
	</asp:UpdatePanel>
	<script type="text/javascript">
		function WebDataMenu1_Click(sender, evt) {
			switch (evt.getItem().get_key()) {
				case "changeColorTool":
					// the event handler to change the stylesheet is on the server
					__doPostBack("<%= UpdatePanel1.ClientID  %>");
					break;
				case "todayTool":
					__doPostBack("<%= UpdatePanel1.ClientID  %>");
					break;
				case "newAppointmentTool":
					// create a new appointment
					var scheduleInfo = ig_getWebScheduleInfoById("<%= WebScheduleInfo1.ClientID %>");
					var dateTime = new Date();
					var appointment = scheduleInfo.getActivities().createActivity();
					var minutes = dateTime.getMinutes();
					if (minutes < 30)
						dateTime.setMinutes(30);
					else
						dateTime.setHours(dateTime.getHours() + 1, 0);
					appointment.setStartDateTime(dateTime);
					scheduleInfo.showAddAppointmentDialog(appointment, "");
					evt.set_cancel(true);
					break;
				case "printTool":
					window.print();
					evt.set_cancel(true);
					break;
				case "deleteTool":
					var monthView = ig_getWebMonthViewById("<%= WebMonthView1.ClientID %>");
					var dayView = ig_getWebDayViewById("<%= WebDayView1.ClientID %>");
					var scheduleInfo = ig_getWebScheduleInfoById("<%= WebScheduleInfo1.ClientID %>");
					var activity = monthView.getSelectedActivity();
					if (activity != null)
						scheduleInfo.deleteActivity(activity, "");
					activity = dayView.getSelectedActivity();
					if (activity != null)
						scheduleInfo.deleteActivity(activity, "");
					evt.set_cancel(true);
					break;
			}
		}
	</script>
</asp:Content>
