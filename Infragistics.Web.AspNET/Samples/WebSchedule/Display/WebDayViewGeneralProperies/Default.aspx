<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="Htmllink2" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/webSample_style.css" />
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
	<style type="text/css">
		table.prop-table > tbody > tr > td { *width: 162px; /*Fix for IE7*/ }
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <ig_sched:WebScheduleInfo ID="WebScheduleInfo1" runat="server" EnableRecurringActivities="True"
            EnableSmartCallbacks="True" EnableProgressIndicator="False" EnableAppStyling="True">
        </ig_sched:WebScheduleInfo>
        <ig_scheduledata:WebScheduleOleDbProvider ID="WebScheduleOleDbProvider1" runat="server"
            ConnectionID="oleDbConnection1" WebScheduleInfoID="WebScheduleInfo1" EnableAppStyling="True">
        </ig_scheduledata:WebScheduleOleDbProvider>
        <table style="width: 100%; height: 510px">
            <tr>
                <td style="vertical-align: top;" colspan="1" rowspan="2">
                    <table class="prop-table">
                        <tr>
                            <td>
                                EnableSmartCallbacks
                            </td>
                            <td>
                                <asp:DropDownList ID="ddSmartCallBacks" runat="server" Width="100%" AutoPostBack="True"
                                    OnSelectedIndexChanged="selectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblNavigationAnimation" runat="server" Text="NavigationAnimation"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddNavigationAnimation" runat="server" Width="100%" AutoPostBack="True"
                                    OnSelectedIndexChanged="selectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:WebSchedule, FullPage_Label13 %>" />
                            </td>
                            <td>
                                <asp:DropDownList ID="styleSheetFileNameEditor" runat="server" Width="100%" AutoPostBack="True"
                                    OnSelectedIndexChanged="selectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr style="height: 16px">
                            <td>
                                <asp:Button ID="changeActiveDayButton" runat="server" Width="100%" Text="<%$ Resources:WebSchedule, DayViewGeneral_Label1 %>"
                                    OnClick="buttons_Click"></asp:Button>
                            </td>
                            <td>
                                <ig:WebDatePicker ID="dcActiveDay" runat="server" Height="16" Width="100%">
                                </ig:WebDatePicker>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="activityHeightMinimumButton" runat="server" Width="100%" Text="<%$ Resources:WebSchedule, DayViewGeneral_Label2 %>"
                                    OnClick="buttons_Click"></asp:Button>
                            </td>
                            <td>
                                <ig:WebNumericEditor ID="activityHeightMinimumEditor" Width="100%" runat="server"
                                    Nullable="False" DataMode="Int">
                                    <Buttons SpinButtonsDisplay="OnRight" />
                                </ig:WebNumericEditor>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="activityWidthMinimumButton" runat="server" Width="100%" Text="<%$ Resources:WebSchedule, DayViewGeneral_Label3 %>"
                                    OnClick="buttons_Click"></asp:Button>
                            </td>
                            <td>
                                <ig:WebNumericEditor ID="activityWidthMinimumEditor" Width="100%" runat="server"
                                    Nullable="False" DataMode="Int">
                                    <Buttons SpinButtonsDisplay="OnRight" />
                                </ig:WebNumericEditor>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="captionHeaderTextButton" runat="server" Width="100%" Text="<%$ Resources:WebSchedule, DayViewGeneral_Label4 %>"
                                    OnClick="buttons_Click"></asp:Button>
                            </td>
                            <td>
                                <ig:WebTextEditor ID="txtCaptionHeaderText" runat="server" Width="97%" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="dayHeaderFormatStringButton" runat="server" Width="100%" Text="<%$ Resources:WebSchedule, DayViewGeneral_Label5 %>"
                                    OnClick="buttons_Click"></asp:Button>
                            </td>
                            <td>
                                <asp:DropDownList ID="dayHeaderFormatStringEditor" Width="100%" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="visibleDaysButton" runat="server" Width="100%" Text="<%$ Resources:WebSchedule, DayViewGeneral_Label6 %>"
                                    OnClick="buttons_Click"></asp:Button>
                            </td>
                            <td>
                                <ig:WebNumericEditor ID="visibleDaysEditor" Width="100%" runat="server" Nullable="False"
                                    DataMode="Int">
                                    <Buttons SpinButtonsDisplay="OnRight" />
                                </ig:WebNumericEditor>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                NavigationButtonsVisible
                            </td>
                            <td>
                                <asp:DropDownList ID="ddNavigationButtonsVisible" runat="server" Width="100%" AutoPostBack="True"
                                    OnSelectedIndexChanged="selectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 15px">
                                TimeDisplayFormat
                            </td>
                            <td style="height: 15px">
                                <asp:DropDownList ID="ddTimeDisplayFormat" runat="server" Width="100%" AutoPostBack="True"
                                    OnSelectedIndexChanged="selectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 15px">
                                TimeSlotInterval
                            </td>
                            <td style="height: 15px">
                                <asp:DropDownList ID="ddTimeSlotInterval" runat="server" Width="100%" AutoPostBack="True"
                                    OnSelectedIndexChanged="selectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                TimeSlotAreaVisible
                            </td>
                            <td>
                                <asp:DropDownList ID="ddTimeSlotAreaVisible" runat="server" Width="100%" AutoPostBack="True"
                                    OnSelectedIndexChanged="selectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblTimeSlotLabelType" runat="server" Text="TimeSlotLabelType"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddTimeSlotLabelType" runat="server" Width="100%" AutoPostBack="True"
                                    OnSelectedIndexChanged="selectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                EnableActivityResizing
                            </td>
                            <td>
                                <asp:DropDownList ID="ddEnableActivityResizing" runat="server" Width="100%" AutoPostBack="True"
                                    OnSelectedIndexChanged="selectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 30px">
                                EnableActivityMoving
                            </td>
                            <td style="height: 30px">
                                <asp:DropDownList ID="ddEnableActivityMoving" runat="server" Width="100%" AutoPostBack="True"
                                    OnSelectedIndexChanged="selectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                EnableAutoActivityDialog
                            </td>
                            <td>
                                <asp:DropDownList ID="ddEnableAutoActivityDialog" runat="server" Width="100%" AutoPostBack="True"
                                    OnSelectedIndexChanged="selectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="reminderImageButton" runat="server" Width="100%" Text="<%$ Resources:WebSchedule, DayViewGeneral_Label7 %>"
                                    OnClick="buttons_Click"></asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="nextButtonImageButton" runat="server" Height="22px" Width="100%"
                                    Text="<%$ Resources:WebSchedule, DayViewGeneral_Label8 %>" OnClick="buttons_Click">
                                </asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="prevButtonImageButton" runat="server" Height="22px" Width="100%"
                                    Text="<%$ Resources:WebSchedule, DayViewGeneral_Label9 %>" OnClick="buttons_Click">
                                </asp:Button>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="height: 100%; width: 50%">
                    <ig_sched:WebDayView ID="WebDayView1" runat="server" Width="100%" Height="508px" WebScheduleInfoID="WebScheduleInfo1"
                        ActivityHeightMinimum="20" EnableAppStyling="True">
                    </ig_sched:WebDayView>
                </td>            </tr>
        </table>
    </div>
</asp:Content>
