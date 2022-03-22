<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
	CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
	<ig:HtmlLink ID="Htmllink2" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/webSample_style.css" />
	<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<style type="text/css">
		legend
		{
			color: White;
			font-family: Segoe UI, Verdana, Helvetica, sans-serif;
			font-size: 12px;
			font-weight: bold;
			background-color: rgb(79, 79, 79);
			padding: 5px;
			margin: 5px;
		}
		fieldset
		{
			border-color: #bbb;
			border-width: 1px;
			border-style: solid;
			width: 100%;
		}
	</style>
	<table style="width: 100%; height: 400px">
		<tbody>
			<tr>
				<td>
					<table>
						<tbody>
							<tr>
								<td colspan="2">
									<asp:Label ID="Label9" runat="server" Text="<%$ Resources:WebSchedule, DayViewStyles_Label1 %>"></asp:Label>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<asp:DropDownList ID="ddStyleCollection" runat="server" Width="250px" OnSelectedIndexChanged="Page_Load">
									</asp:DropDownList>
								</td>
							</tr>
							<tr>
								<td>
									<asp:Button ID="btnChangeActiveDay" runat="server" Width="125px" Text="<%$ Resources:WebSchedule, DayViewStyles_Label2  %>"
										OnClick="buttons_Click"></asp:Button>
								</td>
								<td>
									<ig:WebDatePicker ID="dcActiveDay" runat="server" Height="24px" Width="125px" />
								</td>
							</tr>
							<tr>
								<td>
									<asp:Button ID="btnSetBackColor" runat="server" Width="125px" Text="<%$ Resources:WebSchedule, DayViewStyles_Label3  %>"
										OnClick="buttons_Click"></asp:Button>
								</td>
								<td>
									<asp:DropDownList ID="ddBackColor" runat="server" Width="125px">
									</asp:DropDownList>
								</td>
							</tr>
							<tr>
								<td>
									<asp:Button ID="btnSetForeColor" runat="server" Width="125px" Text="<%$ Resources:WebSchedule, DayViewStyles_Label4  %>"
										OnClick="buttons_Click"></asp:Button>
								</td>
								<td>
									<asp:DropDownList ID="ddForeColor" runat="server" Height="26px" Width="125px">
									</asp:DropDownList>
								</td>
							</tr>
							<tr>
								<td>
									<asp:Button ID="btnSetHeight" runat="server" Width="125px" Text="<%$ Resources:WebSchedule, DayViewStyles_Label5  %>"
										OnClick="buttons_Click"></asp:Button>
								</td>
								<td>
									<ig:WebNumericEditor ID="txtHeight" runat="server" DataMode="Int" Nullable="False"
										Width="125px">
										<Buttons SpinButtonsDisplay="OnRight" />
									</ig:WebNumericEditor>
								</td>
							</tr>
							<tr>
								<td>
									<asp:Button ID="btnSetWidth" runat="server" Width="125px" Text="<%$ Resources:WebSchedule, DayViewStyles_Label6  %>"
										OnClick="buttons_Click"></asp:Button>
								</td>
								<td>
									<ig:WebNumericEditor ID="txtWidth" runat="server" DataMode="Int" Nullable="False"
										Width="125px">
										<Buttons SpinButtonsDisplay="OnRight" />
									</ig:WebNumericEditor>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<fieldset>
										<legend>
											<asp:Literal ID="Literal2" Text="<%$ Resources:WebSchedule, DayViewStyles_Label7 %>"
												runat="server" /></legend>
										<table>
											<tr>
												<td>
													<asp:Label ID="Label10" runat="server" Text="<%$ Resources:WebSchedule, DayViewStyles_Label8 %>"></asp:Label>
												</td>
												<td>
													<asp:DropDownList ID="ddFontType" runat="server" Width="125px">
													</asp:DropDownList>
												</td>
												<td>
													<%=this.GetGlobalResourceObject("WebSchedule","DayViewStyles_Bold") %>
												</td>
												<td>
													<asp:CheckBox ID="ddFontBold" runat="server"></asp:CheckBox>
												</td>
											</tr>
											<tr>
												<td>
													<%=this.GetGlobalResourceObject("WebSchedule","WeekViewStyles_Label1") %>
												</td>
												<td>
													<asp:CheckBox ID="ddFontUnderline" runat="server"></asp:CheckBox>
												</td>
												<td>
													<%=this.GetGlobalResourceObject("WebSchedule","WeekViewStyles_Label2") %>
												</td>
												<td>
													<asp:CheckBox ID="ddFontItalic" runat="server"></asp:CheckBox>
												</td>
											</tr>
											<tr>
												<td colspan="4">
													<asp:Button ID="btnSetFontDetails" runat="server" Text="<%$ Resources:WebSchedule, DayViewStyles_Label9  %>">
													</asp:Button>
												</td>
											</tr>
										</table>
									</fieldset>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<fieldset>
										<legend>
											<asp:Literal ID="Literal1" Text="<%$ Resources:WebSchedule, DayViewStyles_Border %>"
												runat="server" />
										</legend>
										<table>
											<tr>
												<td>
													<%=this.GetGlobalResourceObject("WebSchedule","DayViewStyles_BorderColor") %>
												</td>
												<td>
													<asp:DropDownList ID="ddBorderColor" runat="server" Width="136px">
													</asp:DropDownList>
												</td>
											</tr>
											<tr>
												<td>
													<%=this.GetGlobalResourceObject("WebSchedule","DayViewStyles_BorderStyle") %>
												</td>
												<td>
													<asp:DropDownList ID="ddBorderStyle" runat="server" Width="136px">
													</asp:DropDownList>
												</td>
											</tr>
											<tr>
												<td>
													<%=this.GetGlobalResourceObject("WebSchedule","DayViewStyles_BorderWidth") %>
												</td>
												<td>
													<ig:WebNumericEditor ID="txtBorderWidth" runat="server" Width="136px" DataMode="Int"
														Nullable="False">
														<Buttons SpinButtonsDisplay="OnRight" />
													</ig:WebNumericEditor>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<asp:Button ID="btnApplyBorder" runat="server" Text="<%$ Resources:WebSchedule, DayViewStyles_Label10  %>">
													</asp:Button>
												</td>
											</tr>
										</table>
									</fieldset>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
				<td style="width: 75%;">
					<ig_sched:WebDayView ID="WebDayView1" runat="server" WebScheduleInfoID="WebScheduleInfo1"
						Height="500px" Width="100%" ActivityHeightMinimum="20" EnableAppStyling="True">
					</ig_sched:WebDayView>
				</td>
			</tr>
		</tbody>
	</table>
	<ig_sched:WebScheduleInfo ID="WebScheduleInfo1" runat="server" EnableRecurringActivities="True"
		EnableProgressIndicator="False" EnableSmartCallbacks="True">
	</ig_sched:WebScheduleInfo>
	<ig_scheduledata:WebScheduleOleDbProvider ID="WebScheduleOleDbProvider1" runat="server"
		WebScheduleInfoID="WebScheduleInfo1" ConnectionID="oleDbConnection1">
	</ig_scheduledata:WebScheduleOleDbProvider>
</asp:Content>
