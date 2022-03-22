<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
	CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
	<ig:HtmlLink ID="Htmllink2" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/webSample_style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<table id="Table1" style="width: 100%; height: 500px">
		<tr>
			<td style="vertical-align: top">
				<table id="Table2">
					<tr>
						<td>
							EnableSmartCallbacks
						</td>
						<td>
							<asp:DropDownList ID="ddSmartCallBacks" runat="server" Width="100px" AutoPostBack="True"
								OnSelectedIndexChanged="selectedIndexChanged">
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="Label17" runat="server" Width="140px" Font-Names="Arial" Font-Size="10pt">NavigationAnimation</asp:Label>
						</td>
						<td>
							<asp:DropDownList ID="ddNavigationAnimation" runat="server" Width="100px" AutoPostBack="True"
								OnSelectedIndexChanged="selectedIndexChanged">
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:WebSchedule, FullPage_Label13 %>" />
						</td>
						<td>
							<asp:DropDownList ID="styleSheetFileNameEditor" runat="server" Width="100px" AutoPostBack="True"
								OnSelectedIndexChanged="selectedIndexChanged">
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td style="height: 27px">
							<asp:Button ID="btnChangeActiveDay" runat="server" Width="175px" Text="<%$ Resources:WebSchedule, MonthViewGeneral_Label1 %>"
								OnClick="buttons_Click"></asp:Button>
						</td>
						<td style="height: 27px">
							<ig:WebDatePicker ID="dcActiveDay" runat="server" Width="100px" AllowNull="False" />
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="Label10" runat="server" Width="177px" Font-Names="Arial" Font-Size="10pt">CaptionFormatString</asp:Label>
						</td>
						<td>
							<asp:DropDownList ID="ddCaptionFormatString" runat="server" Width="100px" AutoPostBack="True"
								OnSelectedIndexChanged="selectedIndexChanged">
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="Label7" runat="server" Width="177px" Font-Names="Arial" Font-Size="10pt">FirstDayHeaderFormatString</asp:Label>
						</td>
						<td>
							<asp:DropDownList ID="ddFirstDayHeaderFormatString" runat="server" Width="100px"
								AutoPostBack="True" OnSelectedIndexChanged="selectedIndexChanged">
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="Label2" runat="server" Width="177px" Font-Names="Arial" Font-Size="10pt">DayHeaderFormatString</asp:Label>
						</td>
						<td>
							<asp:DropDownList ID="ddDayHeaderFormatString" runat="server" Width="100px" AutoPostBack="True"
								OnSelectedIndexChanged="selectedIndexChanged">
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="Label1" runat="server" Width="177px" Font-Names="Arial" Font-Size="10pt">TimeLabelFormatString</asp:Label>
						</td>
						<td>
							<asp:DropDownList ID="ddTimeLabelFormatString" runat="server" Width="100px" AutoPostBack="True"
								OnSelectedIndexChanged="selectedIndexChanged">
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="Label9" runat="server" Width="178px" Font-Names="Arial" Font-Size="10pt">WeekNumbersVisible</asp:Label>
						</td>
						<td>
							<asp:DropDownList ID="ddWeekNumbersVisible" runat="server" Width="100px" AutoPostBack="True"
								OnSelectedIndexChanged="selectedIndexChanged">
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="Label16" runat="server" Width="173px" Font-Names="Arial" Font-Size="10pt">CaptionHeaderVisible</asp:Label>
						</td>
						<td>
							<asp:DropDownList ID="ddCaptionHeaderVisible" runat="server" Width="100px" AutoPostBack="True"
								OnSelectedIndexChanged="selectedIndexChanged">
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td style="height: 1px">
							<asp:Label ID="DayOfWeekHeaderFormat" runat="server" Font-Names="Arial" Font-Size="10pt">DayOfWeekHeaderFormat</asp:Label>
						</td>
						<td style="height: 1px">
							<asp:DropDownList ID="ddDayOfWeekHeaderFormat" runat="server" Width="100px" AutoPostBack="True"
								OnSelectedIndexChanged="selectedIndexChanged">
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="Label3" runat="server" Width="168px" Font-Names="Arial" Font-Size="10pt">DayOfWeekHeaderVisible</asp:Label>
						</td>
						<td>
							<asp:DropDownList ID="ddDayOfWeekHeaderVisible" runat="server" Width="100px" AutoPostBack="True"
								OnSelectedIndexChanged="selectedIndexChanged">
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="Label4" runat="server" Font-Names="Arial" Font-Size="10pt">EnableAutoActivityDialog</asp:Label>
						</td>
						<td>
							<asp:DropDownList ID="ddEnableAutoActivityDialog" runat="server" Width="100px" AutoPostBack="True"
								OnSelectedIndexChanged="selectedIndexChanged">
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="Label6" runat="server" Font-Names="Arial" Font-Size="10pt">EnableViewState</asp:Label>
						</td>
						<td>
							<asp:DropDownList ID="ddEnableViewState" runat="server" Width="100px" AutoPostBack="True"
								OnSelectedIndexChanged="selectedIndexChanged">
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="Label8" runat="server" Width="112px" Font-Names="Arial" Font-Size="10pt">NavigationButtonsVisible</asp:Label>
						</td>
						<td>
							<asp:DropDownList ID="ddNavigationButtonsVisible" runat="server" Width="100px" AutoPostBack="True"
								OnSelectedIndexChanged="selectedIndexChanged">
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="Label5" runat="server" Width="175px" Font-Names="Arial" Font-Size="10pt">WeekendDisplayFormat</asp:Label>
						</td>
						<td>
							<asp:DropDownList ID="ddWeekendDisplayFormat" runat="server" Width="100px" AutoPostBack="True"
								OnSelectedIndexChanged="selectedIndexChanged">
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<asp:Button ID="btnSetPrevButtonImage" runat="server" Width="275px" Text="<%$ Resources:WebSchedule, MonthViewGeneral_Label2 %>"
								OnClick="buttons_Click"></asp:Button>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<asp:Button ID="btnSetNextButtonImage" runat="server" Height="24" Width="275px" Text="<%$ Resources:WebSchedule, MonthViewGeneral_Label3 %>"
								OnClick="buttons_Click"></asp:Button>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<asp:Button ID="btnSetReminderImage" runat="server" Width="275px" Text="<%$ Resources:WebSchedule, MonthViewGeneral_Label4 %>"
								OnClick="buttons_Click"></asp:Button>
						</td>
					</tr>
				</table>
			</td>
			<td style="width: 100%">
				<ig_sched:WebMonthView ID="WebMonthView2" runat="server" WebScheduleInfoID="WebScheduleInfo1"
					Height="500px" Width="100%" NavigationAnimation="Linear" EnableAppStyling="True">
				</ig_sched:WebMonthView>
			</td>
		</tr>
	</table>
	<ig_sched:WebScheduleInfo ID="WebScheduleInfo1" runat="server" EnableProgressIndicator="False"
		EnableRecurringActivities="True" EnableSmartCallbacks="True">
	</ig_sched:WebScheduleInfo>
	<ig_scheduledata:WebScheduleOleDbProvider ID="WebScheduleOleDbProvider1" runat="server"
		WebScheduleInfoID="WebScheduleInfo1" ConnectionID="oleDbConnection1">
	</ig_scheduledata:WebScheduleOleDbProvider>
</asp:Content>
