<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ol style="margin-left: 5px;">
        <li>
            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties3_Description4 %>"></asp:Label></li>
        <li>
            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties3_Description5 %>"></asp:Label></li>
        <li>
            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties3_Description6 %>"></asp:Label></li>
    </ol>
    <br />
    <br />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <table style="width: 100%; height: 320px">
                <tr>
                    <td style="width: 50%">
                        <ig_sched:WebDayView ID="WebDayView1" runat="server" Width="100%" Height="360px"
                            WebScheduleInfoID="WebScheduleInfo1" EnableAppStyling="True">
                        </ig_sched:WebDayView>
                    </td>
                </tr>
            </table>
            <hr />
            <table width="100%">
                <tr>
                    <td align="right" style="font-size: smaller">
                        EnableSmartCallbacks
                    </td>
                    <td align="left" style="font-size: smaller">
                        <asp:DropDownList ID="ddSmartCallbacks" runat="server" AutoPostBack="True" OnSelectedIndexChanged="selectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td align="right" style="font-size: smaller">
                        ActiveDayClientSynchronization
                    </td>
                    <td align="left" style="font-size: smaller">
                        <asp:DropDownList ID="ddActiveDayClientSynchronization" runat="server" AutoPostBack="True"
                            OnSelectedIndexChanged="selectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td align="right" style="font-size: smaller">
                        TimeDisplayFormat
                    </td>
                    <td align="left" style="font-size: smaller">
                        <asp:DropDownList ID="ddTimeDisplayFormat" runat="server" AutoPostBack="True" OnSelectedIndexChanged="selectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <asp:Button ID="btnChangeWorkDay" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties3_Label1 %>"
                            OnClick="buttons_Click"></asp:Button>
                    </td>
                    <td align="left">
                        WorkDayStartTime
                    </td>
                    <td align="left">
                        <ig:WebDateTimeEditor ID="workDayStartTimeEditor" runat="server" Width="70px" EditModeFormat="t"
                            DisplayModeFormat="t">
                        </ig:WebDateTimeEditor>
                    </td>
                    <td align="right">
                        WorkDayEndTime
                    </td>
                    <td align="left">
                        <ig:WebDateTimeEditor ID="workDayEndTimeEditor" runat="server" EditModeFormat="t"
                            Width="70px" DisplayModeFormat="t">
                        </ig:WebDateTimeEditor>
                    </td>
                </tr>
            </table>
            <ig_scheduledata:WebScheduleOleDbProvider ID="WebScheduleOleDbProvider1" runat="server"
                Width="72px" WebScheduleInfoID="WebScheduleInfo1" Height="24px" ConnectionID="oleDbConnection1">
            </ig_scheduledata:WebScheduleOleDbProvider>
            <ig_sched:WebScheduleInfo ID="WebScheduleInfo1" runat="server" Width="64px" Height="24px"
                ActiveDayClientSynchronization="None" EnableRecurringActivities="True" EnableProgressIndicator="False">
            </ig_sched:WebScheduleInfo>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
