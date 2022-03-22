<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ Register TagPrefix="uc1" TagName="WebUserControlDay" Src="~/SamplesCommon/aspnet/Common/UserControls/WebUserControlDay.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <%--<ig:HtmlLink ID="Htmllink2" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/webSample_style.css" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebTab ID="WebTab1" runat="server" Height="600px" Width="100%">
        <Tabs>
            <ig:ContentTabItem Text="<%$ Resources:WebSchedule, MultipleResources_Label2 %>">
                <Template>
                    <ig_scheduledata:WebScheduleOleDbProvider WebScheduleInfoID="WebScheduleInfo1" ConnectionID="oleDbConnection1"
                        ID="Webscheduleoledbprovider1" runat="server">
                    </ig_scheduledata:WebScheduleOleDbProvider>
                    <ig_sched:WebScheduleInfo ID="Webscheduleinfo1" runat="server" EnableRecurringActivities="True"
                        EnableProgressIndicator="False" EnableSmartCallbacks="False">
                    </ig_sched:WebScheduleInfo>
                    <ig_sched:WebDayView ID="Webdayview1" WebScheduleInfoID="WebScheduleInfo1" runat="server"
                        Height="561px" Width="99.8%" VisibleDays="3" CaptionHeaderText="Javier Lamoreaux"
                        NavigationAnimation="Linear" EnableAppStyling="True">
                    </ig_sched:WebDayView>
                </Template>
            </ig:ContentTabItem>
            <ig:ContentTabItem Text="<%$ Resources:WebSchedule, MultipleResources_Label3 %>">
                <Template>
                    <ig_scheduledata:WebScheduleOleDbProvider WebScheduleInfoID="WebScheduleInfo2" ConnectionID="oleDbConnection1"
                        ID="WebScheduleOleDbProvider2" runat="server">
                    </ig_scheduledata:WebScheduleOleDbProvider>
                    <ig_sched:WebScheduleInfo ID="WebScheduleInfo2" runat="server" EnableRecurringActivities="True"
                        EnableProgressIndicator="False" EnableSmartCallbacks="False">
                    </ig_sched:WebScheduleInfo>
                    <ig_sched:WebDayView ID="WebDayView2" WebScheduleInfoID="WebScheduleInfo2" runat="server"
                        Height="561px" Width="99.8%" VisibleDays="3" CaptionHeaderText="<%$ Resources:WebSchedule, MultipleResources_Label3 %>"
                        NavigationAnimation="Linear" EnableAppStyling="True">
                    </ig_sched:WebDayView>
                </Template>
            </ig:ContentTabItem>
            <ig:ContentTabItem Text="<%$ Resources:WebSchedule, MultipleResources_Label4 %>">
                <Template>
                    <ig_scheduledata:WebScheduleOleDbProvider WebScheduleInfoID="WebScheduleInfo3" ConnectionID="oleDbConnection1"
                        ID="WebScheduleOleDbProvider3" runat="server">
                    </ig_scheduledata:WebScheduleOleDbProvider>
                    <ig_sched:WebScheduleInfo ID="WebScheduleInfo3" runat="server" EnableRecurringActivities="True"
                        EnableProgressIndicator="False" EnableSmartCallbacks="False">
                    </ig_sched:WebScheduleInfo>
                    <ig_sched:WebDayView ID="WebDayView3" WebScheduleInfoID="WebScheduleInfo3" runat="server"
                        Height="561px" Width="99.8%" VisibleDays="3" CaptionHeaderText="<%$ Resources:WebSchedule, MultipleResources_Label4 %>"
                        NavigationAnimation="Linear" EnableAppStyling="True">
                    </ig_sched:WebDayView>
                </Template>
            </ig:ContentTabItem>
            <ig:ContentTabItem Text="<%$ Resources:WebSchedule, MultipleResources_Label5 %>">
                <Template>
                    <uc1:WebUserControlDay ID="WebUserControlDay1" runat="server"></uc1:WebUserControlDay>
                </Template>
            </ig:ContentTabItem>
        </Tabs>
    </ig:WebTab>
    <p>
    </p>
    <table id="Table1" cellspacing="5" cellpadding="0" width="100%" border="0">
        <tr>
            <td rowspan="2" style="width: 40%">
                <asp:Button ID="Button2" runat="server" Text="<%$ Resources:WebSchedule, MultipleResources_Label6 %>"
                    Width="238px" OnClick="Button1_Click"></asp:Button>
            </td>
            <td rowspan="2" style="width: 30%">
                <asp:CheckBox ID="chkSmartCallbacks" AutoPostBack="True" runat="server" Style="vertical-align: top;"
                    OnCheckedChanged="chkSmartCallbacks_CheckChanged"></asp:CheckBox>
                <asp:Label ID="lblSmartCallbacks" Text="<%$ Resources:WebSchedule, MultipleResources_Label7 %>"
                    runat="server" Width="150px"></asp:Label>
            </td>
            <td colspan="2" align="right">
                <asp:Label ID="Label3" runat="server" Font-Size="9pt" Font-Names="Tahoma">
                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:WebSchedule, MultipleResources_Label8 %>"></asp:Label></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="One Day">One Day</asp:ListItem>
                    <asp:ListItem Value="Two Days">Two Days</asp:ListItem>
                    <asp:ListItem Value="Three Days" Selected="True">Three Days</asp:ListItem>
                    <asp:ListItem Value="Four Days">Four Days</asp:ListItem>
                    <asp:ListItem Value="Five Days">Five Days</asp:ListItem>
                    <asp:ListItem Value="Six Days">Six Days</asp:ListItem>
                    <asp:ListItem Value="Seven Days">Seven Days</asp:ListItem>
                    <asp:ListItem Value="Eight Days">Eight Days</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="width: 50px">
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="Default Format">Default Format</asp:ListItem>
                    <asp:ListItem Value="ddd, MMM d">ddd, MMM d</asp:ListItem>
                    <asp:ListItem Value="MMM d">MMM d</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
