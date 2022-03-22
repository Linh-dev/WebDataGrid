<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebSchedule_Display_Show_Hide_Resources_Default" %>

<%@ Register TagPrefix="aspHtml" Namespace="System.Web.UI.HtmlControls" Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink runat="server" type="text/css" rel="Stylesheet" href="ControlPanel.css" />
    <ig:HtmlLink runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div>
                <div id="headerContainer" class="ControlPanelHeader">
                    <img src="/samplesbrowser/samplescommon/aspnet/Common/config.png" alt="" />
                    <label>
                        <%= this.GetGlobalResourceObject("WebSchedule","WebSchedule_SelectVisibleResources_Lable")%></label></div>
                <div id="countContainer" class="controlPanel">
                    <div id="eventList" class="controlPanelEvent">
                        <asp:CheckBoxList ID="VisibleResourcesCBList" runat="server" AutoPostBack="true"
                            CellPadding="3" CellSpacing="1" RepeatColumns="4" RepeatDirection="Horizontal">
                        </asp:CheckBoxList>
                    </div>
                </div>
            </div>
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <aspHtml:HtmlButton runat="server" ID="buttonDay" class="btnNormal">
                            <img src="/samplesbrowser/samplescommon/aspnet/WebSchedule/Style/ShowHideResources/images/OneDayView.png"
                                alt="" />
                            <%= this.GetGlobalResourceObject("WebSchedule", "WebSchedule_MultiDayEvtBanner_OneDayLabel")%>
                        </aspHtml:HtmlButton>
                    </td>
                    <td class="td">
                        <aspHtml:HtmlButton runat="server" ID="buttonDays" class="btnNormal">
                            <img src="/samplesbrowser/samplescommon/aspnet/WebSchedule/Style/ShowHideResources/images/FiveDayView.png"
                                alt="" />
                            <%= this.GetGlobalResourceObject("WebSchedule", "WebSchedule_MultipleResources_FiveDayLabel")%>
                        </aspHtml:HtmlButton>
                    </td>
                    <td class="td">
                        <aspHtml:HtmlButton runat="server" ID="buttonMonth" class="btnNormal">
                            <img src="/samplesbrowser/samplescommon/aspnet/WebSchedule/Style/ShowHideResources/images/MonthView.png"
                                alt="" />
                            <%= this.GetGlobalResourceObject("WebSchedule", "WebSchedule_MultipleResources_MonthLabel")%>
                        </aspHtml:HtmlButton>
                    </td>
                </tr>
            </table>
            <div style="height: 10px;">
            </div>
            <asp:PlaceHolder runat="server" ID="viewHolder" />
            <br />
            <asp:CheckBox ID="chkSmartCallbacks" AutoPostBack="True" runat="server" Style="vertical-align: top;"
                OnCheckedChanged="chkSmartCallbacks_CheckChanged"></asp:CheckBox>
            <asp:Label ID="lblSmartCallbacks" Text="<%$Resources:WebSchedule, WebSchedule_MultipleResources_EnableSmartCallbacksLabel %>"
                runat="server" Width="250px"></asp:Label>
            <ig_sched:WebScheduleInfo ID="wsInfo" runat="server" EnableRecurringActivities="True"
                EnableMultiDayEventArrows="True" EnableMultiResourceView="True" EnableAppStyling="True"
                EnableMultiResourceCaption="true" AppointmentFormPath="/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx"
                ReminderFormPath="/samplesbrowser/samplescommon/aspnet/webschedule/forms/Reminder.aspx">
                <ClientEvents ActivityDialogOpening="activitiyDialogOpening" />
            </ig_sched:WebScheduleInfo>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>
        function activitiyDialogOpening(scheduleInfo, evnt, oldDate, newDate) {
            evnt.cancel = true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
