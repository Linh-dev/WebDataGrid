<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="Htmllink2" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/webSample_style.css" />
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
        
        td { padding: 3px; }
    </style>
    <table style="width: 100%; height: 500px">
        <tr>
            <td>
                <table>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:WebSchedule, DayViewStyles_Label1 %>"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:DropDownList ID="ddStyleCollection" runat="server" Width="100%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnChangeActiveDay" runat="server" Width="150px" Text="<%$ Resources:WebSchedule, DayViewStyles_Label2 %>"
                                OnClick="buttons_Click"></asp:Button>
                        </td>
                        <td>
                            <ig:WebDatePicker ID="dcActiveDay" runat="server" Height="24px" Width="125px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 18px">
                            <asp:Button ID="btnSetBackColor" runat="server" Width="150px" Text="<%$ Resources:WebSchedule, DayViewStyles_Label3 %>"
                                OnClick="buttons_Click"></asp:Button>
                        </td>
                        <td style="height: 18px">
                            <asp:DropDownList ID="ddBackColor" runat="server" Width="125px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnSetForeColor" runat="server" Width="150px" Text="<%$ Resources:WebSchedule, DayViewStyles_Label4 %>"
                                OnClick="buttons_Click"></asp:Button>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddForeColor" runat="server" Height="26px" Width="125px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnSetHeight" runat="server" Width="150px" Text="<%$ Resources:WebSchedule, DayViewStyles_Label5 %>"
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
                            <asp:Button ID="btnSetWidth" runat="server" Width="150px" Text="<%$ Resources:WebSchedule, DayViewStyles_Label6 %>"
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
                        <td colspan="2" valign="middle">
                            <fieldset>
                                <legend>
                                    <asp:Literal Text="<%$ Resources:WebSchedule, DayViewStyles_Label7 %>" runat="server" /></legend>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="FontLabel1" runat="server" Text="<%$ Resources:WebSchedule, MonthViewStyles_Font_1 %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddFontType" runat="server" Width="125px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="FontLabel2" runat="server" Text="<%$ Resources:WebSchedule, MonthViewStyles_Font_2 %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="ddFontBold" runat="server"></asp:CheckBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="FontLabel3" runat="server" Text="<%$ Resources:WebSchedule, MonthViewStyles_Font_3 %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="ddFontUnderline" runat="server"></asp:CheckBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="FontLabel4" runat="server" Text="<%$ Resources:WebSchedule, MonthViewStyles_Font_4 %>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="ddFontItalic" runat="server"></asp:CheckBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <asp:Button ID="btnSetFontDetails" runat="server" Text="<%$ Resources:WebSchedule, DayViewStyles_Label9 %>"
                                                OnClick="buttons_Click"></asp:Button>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" valign="middle">
                            <fieldset>
                                <legend>
                                    <asp:Literal Text="<%$ Resources:WebSchedule, DayViewStyles_Border %>" runat="server" />
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
                                            <asp:Button ID="btnApplyBorder" runat="server" Text="<%$ Resources:WebSchedule, DayViewStyles_Label10 %>"
                                                OnClick="buttons_Click"></asp:Button>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 75%;">
                <ig_sched:WebMonthView ID="WebMonthView1" runat="server" WebScheduleInfoID="WebScheduleInfo1"
                    Width="100%" Height="500px" EnableAppStyling="True">
                </ig_sched:WebMonthView>
            </td>
        </tr>
    </table>
    <ig_scheduledata:WebScheduleOleDbProvider ID="WebScheduleOleDbProvider1" runat="server"
        WebScheduleInfoID="WebScheduleInfo1" ConnectionID="oleDbConnection1">
    </ig_scheduledata:WebScheduleOleDbProvider>
    <ig_sched:WebScheduleInfo ID="WebScheduleInfo1" runat="server" EnableSmartCallbacks="True"
        EnableRecurringActivities="True" EnableProgressIndicator="False">
    </ig_sched:WebScheduleInfo>
</asp:Content>
