<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
	CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ Register TagPrefix="uc1" TagName="WebUserControlDay" Src="~/SamplesCommon/aspnet/Common/UserControls/WebUserControlDay.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
	<ig:HtmlLink ID="Htmllink2" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/webSample_style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<ig_scheduledata:WebScheduleOleDbProvider ID="WebScheduleOleDbProvider1" runat="server"
		WebScheduleInfoID="WebScheduleInfo1" ConnectionID="oleDbConnection1">
	</ig_scheduledata:WebScheduleOleDbProvider>
	<ig_sched:WebScheduleInfo ID="WebScheduleInfo1" runat="server" EnableSmartCallbacks="True"
		EnableRecurringActivities="True" EnableProgressIndicator="False">
	</ig_sched:WebScheduleInfo>
	<ig:WebTab ID="WebTab1" runat="server" Width="100%">
		<Tabs>
			<ig:ContentTabItem Text="<%$ Resources:WebSchedule, SingleResources_Label1 %>">
				<Template>
					<ig_sched:WebDayView ID="WebDayView1" runat="server" Width="99.5%" CaptionHeaderText="<%$ Resources:WebSchedule, SingleResources_Label2 %>" EnableAppStyling="True">
					</ig_sched:WebDayView>
				</Template>
			</ig:ContentTabItem>
			<ig:ContentTabItem Text="<%$ Resources:WebSchedule, SingleResources_Label9 %>">
				<Template>
					<ig_sched:WebDayView ID="WebDayView2" runat="server"  Width="99.5%" CaptionHeaderText="<%$ Resources:WebSchedule, SingleResources_Label3 %>" EnableAppStyling="True"
						DayHeaderFormatString="ddd, MMM d" VisibleDays="5">
						<AllDayEventAreaStyle BorderWidth="0px">
						</AllDayEventAreaStyle>
					</ig_sched:WebDayView>
				</Template>
			</ig:ContentTabItem>
			<ig:ContentTabItem Text="<%$ Resources:WebSchedule, SingleResources_Label5 %>">
				<Template>
					<ig_sched:WebMonthView ID="WebMonthView1" runat="server" Width="99.5%" EnableAppStyling="True">
					</ig_sched:WebMonthView>
				</Template>
			</ig:ContentTabItem>
			<ig:ContentTabItem Text="<%$ Resources:WebSchedule, SingleResources_Label6 %>">
				<Template>
					<ig_sched:WebCalendarView ID="WebCalendarView1" runat="server"
						MonthDropDownVisible="False" YearDropDownVisible="False" EnableAppStyling="True">
					</ig_sched:WebCalendarView>
				</Template>
			</ig:ContentTabItem>
		</Tabs>
	</ig:WebTab>
	<p>
	</p>
	<asp:Label ID="Label4" runat="server" Font-Names="Tahoma" Font-Size="9pt" Text="<%$ Resources:WebSchedule, SingleResources_Label7 %>" />
	<asp:DropDownList ID="UserNameList" runat="server" AutoPostBack="True">
		<asp:ListItem Value="Javier Lamoreaux" Text="<%$ Resources:WebSchedule, SingleResources_JavierLamoreaux %>" />
		<asp:ListItem Value="Development Team" Text="<%$ Resources:WebSchedule, SingleResources_DevelopmentTeam %>" />
		<asp:ListItem Value="Unassigned" Text="<%$ Resources:WebSchedule, SingleResources_Unassigned %>" />
	</asp:DropDownList>
	<span style="text-align: right; width: 320px;">
		<asp:CheckBox ID="chkSmartCallbacks" AutoPostBack="True" runat="server" Width="320px"
			Text="<%$ Resources:WebSchedule, SingleResources_Label8 %>" OnCheckedChanged="chkSmartCallbacks_CheckChanged"
			Checked="True"></asp:CheckBox>
	</span>
</asp:Content>
