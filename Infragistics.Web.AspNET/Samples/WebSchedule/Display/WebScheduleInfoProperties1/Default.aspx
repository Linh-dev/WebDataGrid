<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="Htmllink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="Htmllink2" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/webSample_style.css" />
    <ig:HtmlLink ID="Htmllink3" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/WebSchedule/Display/WebScheduleInfoProperties1/Styles.css" />
    <script type="text/javascript">
        //Two-way synchronization requires the recipient not trigger
        // another notify.
        var suppressNotification = false;

        // Called by ActiveDayChanged event to inform WebDateChooser of
        // the new ActiveDay.
        function notifyDateChooser_ActiveDayChanged(oInfo, oEvent, oDate) {
            if (!suppressNotification) {
                suppressNotification = true;

                var oDateChooser = $find('<%= dcActiveDay.ClientID %>');
                oDateChooser.set_value(oDate);

                suppressNotification = false;
            }
        }

        // Called by ValueChanged event to inform WebSchedule views of the
        // new ActiveDay.
        function notifyCalendarView_ActiveDayChanged(sender, eventArgs) {
            if (!suppressNotification) {
                suppressNotification = true;

                // WebScheduleInfo controls the ActiveDay of all WebSchedule
                // views on the page, including WebCalendarView1.
                var oInfo = ig_getWebScheduleInfoById('<%= WebScheduleInfo1.ClientID %>');
                oInfo.setActiveDay($find('<%= dcActiveDay.ClientID %>').get_value());

                suppressNotification = false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ol>
        <li>"<asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties1_Description2 %>"></asp:Label></li>
        <li>
            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties1_Description3 %>"></asp:Label>
            <ol type='a'>
                <li>
                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties1_Description4 %>"></asp:Label></li>
                <li>
                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties1_Description5 %>"></asp:Label></li>
            </ol>
        </li>
        <li>
            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties1_Description6 %>"></asp:Label></li>
        <li>
            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties1_Description7 %>"></asp:Label></li>
        <li>
            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties1_Description8 %>"></asp:Label></li>
    </ol>
    <br />
    <br />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <table id="Table1" align="center" width="100%">
                <tr>
                    <td style="width: 50%">
                        <ig_sched:WebCalendarView ID="WebCalendarView1" runat="server" Width="300px" StyleSetName="Office2007Black" Height="300px"
                            WebScheduleInfoID="WebScheduleInfo1" EnableAppStyling="True">
                        </ig_sched:WebCalendarView>
                    </td>
                    <td style="width: 50%">
                        <table id="Table2">
                            <tr>
                                <td>
                                    <igtxt:WebImageButton ID="btnResources" runat="server" Width="200px" Text="<%$ Resources:WebSchedule, InfoProperties1_ButtonCaption_1 %>"
                                        UseBrowserDefaults="False" DisplayMode="Block">
                                        <RoundedCorners MaxHeight="23" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/Common/Button-Styles/ig_butMac1.gif"
                                            MaxWidth="300" HoverImageUrl="/SamplesBrowser/SamplesCommon/aspnet/Common/Button-Styles/ig_butMac2.gif"
                                            RenderingType="FileImages" HeightOfBottomEdge="0" PressedImageUrl="/SamplesBrowser/SamplesCommon/aspnet/Common/Button-Styles/ig_butMac4.gif"
                                            WidthOfRightEdge="13"></RoundedCorners>
                                    </igtxt:WebImageButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ListBox ID="ListBox1" runat="server" Width="200px" Height="80px" Style="position: relative;
                                        top: 0; left: 0;"></asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <igtxt:WebImageButton ID="btnAppointments" runat="server"  Width="200px" Text="<%$ Resources:WebSchedule, InfoProperties1_ButtonCaption_2 %>"
                                        UseBrowserDefaults="False" DisplayMode="Block">
                                        <RoundedCorners MaxHeight="23" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/Common/Button-Styles/ig_butMac1.gif"
                                            MaxWidth="300" HoverImageUrl="/SamplesBrowser/SamplesCommon/aspnet/Common/Button-Styles/ig_butMac2.gif"
                                            RenderingType="FileImages" HeightOfBottomEdge="0" PressedImageUrl="/SamplesBrowser/SamplesCommon/aspnet/Common/Button-Styles/ig_butMac4.gif"
                                            WidthOfRightEdge="13"></RoundedCorners>
                                    </igtxt:WebImageButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ListBox ID="lstAppointments" runat="server" Width="200px" Height="150px" Style="position: relative;
                                        top: 0; left: 0;"></asp:ListBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table id="Table3" align="left">
                            <tr>
                                <td style="background-color: aliceblue; padding: 2px; margin: 2px;">
                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties1_Label3  %>"></asp:Label>
                                </td>
                                <td>
                                    <ig:WebDatePicker ID="dcActiveDay" runat="server" StyleSetName="Office2007Black" Width="150px">
                                        <ClientSideEvents ValueChanged="notifyCalendarView_ActiveDayChanged" />
                                    </ig:WebDatePicker>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: aliceblue; padding: 2px; margin: 2px;">
                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:WebSchedule, InfoProperties1_Label4  %>"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddResourceName" runat="server" Width="150px" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <igtxt:WebImageButton ID="btnCountAppointments" runat="server" Width="150px" Text="<%$ Resources:WebSchedule, InfoProperties1_ButtonCaption_3 %>"
                                        UseBrowserDefaults="False" DisplayMode="Block">
                                        <RoundedCorners MaxHeight="23" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/Common/Button-Styles/ig_butMac1.gif"
                                            MaxWidth="300" HoverImageUrl="/SamplesBrowser/SamplesCommon/aspnet/Common/Button-Styles/ig_butMac2.gif"
                                            RenderingType="FileImages" HeightOfBottomEdge="0" PressedImageUrl="/SamplesBrowser/SamplesCommon/aspnet/Common/Button-Styles/ig_butMac4.gif"
                                            WidthOfRightEdge="13"></RoundedCorners>
                                    </igtxt:WebImageButton>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAppointments" runat="server" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <ig_sched:WebScheduleInfo ID="WebScheduleInfo1" StyleSetName="Office2007Black" runat="server" EnableSmartCallbacks="True"
                EnableProgressIndicator="False" AppointmentFormPath="/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx"
                ReminderFormPath="/samplesbrowser/samplescommon/aspnet/webschedule/forms/Reminder.aspx">
                <ClientEvents ActiveDayChanged="notifyDateChooser_ActiveDayChanged"></ClientEvents>
            </ig_sched:WebScheduleInfo>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
