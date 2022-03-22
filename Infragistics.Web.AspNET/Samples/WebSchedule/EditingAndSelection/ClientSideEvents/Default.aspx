<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
	CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
	<ig:HtmlLink ID="Htmllink2" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/webSample_style.css" />
	<script type="text/javascript">
		function WebScheduleInfo1_ActivityDialogEdit(oScheduleInfo, oEvent, oActivityEditProps) {
			if (oActivityEditProps.StartDate != null) {
				if ((oActivityEditProps.StartDate.Value.getDay() == 6) || (oActivityEditProps.StartDate.Value.getDay() == 0)) {
					oActivityEditProps.window.alert("Appointments cannot be set on a weekend day.");
					oEvent.cancel = true;
				}
			}
			if (oActivityEditProps.StartTime != null) {
				if (oActivityEditProps.StartTime.Value.getHours() < 9 || oActivityEditProps.StartTime.Value.getHours() > 16) {
					oActivityEditProps.window.alert("Appointments must be between 9am and 5pm.");
					oEvent.cancel = true;
				}
			}
			if (oActivityEditProps.Duration != null) {
				if (oActivityEditProps.Duration.Value > 120) {
					oActivityEditProps.window.alert("Appointments longer than 2 hours are not permitted.");
					oEvent.cancel = true;
				}
			}
		}

		function WebScheduleInfo1_ActivityUpdating(oScheduleInfo, oEvent, oActivityUpdateProps, oActivity, id) {
			if (oActivityUpdateProps.StartDateTime != null) {
				if ((oActivityUpdateProps.StartDateTime.getDay() == 6) || (oActivityUpdateProps.StartDateTime.getDay() == 0)) {
					alert("Appointments cannot be set on a weekend day.");
					oEvent.cancel = true;
				}
				if (oActivityUpdateProps.StartDateTime.getHours() < 9 || oActivityUpdateProps.StartDateTime.getHours() > 16) {
					alert("Appointments must be between 9am and 5pm - " + oActivityUpdateProps.StartDateTime + ".");
					oEvent.cancel = true;
				}
			}
			if (oActivityUpdateProps.Duration != null) {
				if (oActivityUpdateProps.Duration > 120) {
					alert("Appointments longer than 2 hours are not permitted.");
					oEvent.cancel = true;
				}
			}
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<div width="100%">
		<ig_sched:WebDayView ID="WebDayView1" Style="z-index: 103" runat="server" Height="400px"
			WebScheduleInfoID="WebScheduleInfo1" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black"
			Width="100%" NavigationAnimation="Linear" EnableAppStyling="True">
		</ig_sched:WebDayView>
		</table>
		<ig_scheduledata:WebScheduleOleDbProvider ID="WebScheduleOleDbProvider1" Style="z-index: 101"
			runat="server" WebScheduleInfoID="WebScheduleInfo1" ConnectionID="oleDbConnection1">
		</ig_scheduledata:WebScheduleOleDbProvider>
		<ig_sched:WebScheduleInfo ID="WebScheduleInfo1" Style="z-index: 101" runat="server"
			EnableRecurringActivities="True" EnableSmartCallbacks="True" EnableProgressIndicator="False">
			<ClientEvents ActivityDialogEdit="WebScheduleInfo1_ActivityDialogEdit" ActivityUpdating="WebScheduleInfo1_ActivityUpdating">
			</ClientEvents>
		</ig_sched:WebScheduleInfo>
</asp:Content>
