<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ol style="margin-left: 5px;">
        <li>
            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties2_Description2 %>"></asp:Label>
        </li>
        <li>
            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties2_Description3 %>"></asp:Label>
        </li>
        <li>
            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties2_Description4 %>"></asp:Label>
        </li>
        <li>
            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties2_Description5 %>"></asp:Label></li>
    </ol>
    <br />
    <br />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <table style="width: 100%; height: 460px">
                <tr>
                    <td style="width: 100%">
                        <ig_sched:WebMonthView ID="WebMonthView1" runat="server" Width="100%" WebScheduleInfoID="WebScheduleInfo1"
                            Height="100%" NavigationAnimation="Linear" EnableAppStyling="True">
                        </ig_sched:WebMonthView>
                    </td>
                    <td valign="top">
                        <table>
                            <tr>
                                <td>
                                    EnableSmartCallbacks
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddSmartCallbacks" runat="server" Width="100px" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblEnableProgressIndicator" runat="server" Text="EnableProgressIndicator"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddEnableProgressIndicator" runat="server" Width="100px" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    EnableReminders
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddEnableReminders" runat="server" Width="100px" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblDefaultReminderInterval" runat="server" Text="DefaultReminderInterval"></asp:Label></asp:Button>
                                </td>
                                <td>
                                    <ig:WebDateTimeEditor ID="defaultReminderIntervalEditor" runat="server" Width="100px"
                                        EditModeFormat="HH:mm:ss" DisplayModeFormat="HH:mm:ss">
                                        <AutoPostBackFlags ValueChanged="On" />
                                    </ig:WebDateTimeEditor>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    CultureInfo
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddCultureInfo" runat="server" Width="100px" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    TimeDisplayFormat
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddTimeDisplayFormat" runat="server" Width="100px" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    FirstDayOfWeek
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddFirstDayOfWeek" runat="server" Width="100px" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    AllowAllDayEvents
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddAllowAllDayEvents" runat="server" Width="100px" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    WeekRule
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddWeekRule" runat="server" Width="100px" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <ig_scheduledata:WebScheduleOleDbProvider ID="WebScheduleOleDbProvider1" runat="server"
                Width="72px" WebScheduleInfoID="WebScheduleInfo1" Height="24px" ConnectionID="oleDbConnection1">
            </ig_scheduledata:WebScheduleOleDbProvider>
            <ig_sched:WebScheduleInfo ID="WebScheduleInfo1" runat="server" Width="64px" Height="24px"
                FirstDayOfWeek="Monday" TimeDisplayFormat="Default" EnableSmartCallbacks="True"
                EnableRecurringActivities="True" EnableProgressIndicator="True">
            </ig_sched:WebScheduleInfo>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
