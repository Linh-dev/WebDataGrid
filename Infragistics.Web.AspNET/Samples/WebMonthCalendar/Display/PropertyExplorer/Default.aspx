<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:htmllink runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
     <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Width="700" Modal="false" CssClass="igcalendar_PositionRelative"
        WindowState="Normal" Moveable="false" MaintainLocationOnScroll="true" Top="100px"
        Left="20px">
        <Header CloseBox-Visible="false">
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane>
            <Template>
                <asp:UpdatePanel runat="server" ID="UpdatePanel1" ChildrenAsTriggers="True" UpdateMode="Always"
                    RenderMode="Inline">
                    <ContentTemplate>
                        <div id="container">
                            <table id="propertyList" style="width: 100%;" cellspacing="0">
                                <td style="background: #fff url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg) no-repeat; border-right: solid 1px #89BD37">
                                    <div style="margin:40px">
                                        <ig:WebMonthCalendar runat="server" ID="WebMonthCalendar1" StyleSetName="Default"
                                            EnableWeekNumbers="true" ChangeMonthToDateClicked="true" EnableMonthDropDown="true"
                                            EnableYearDropDown="true" HideOtherMonthDays="false" SelectionType="Single">
                                        </ig:WebMonthCalendar>
                                    </div>
                                </td>
                                <td class="propertyPanel">
                                    <table style="width: 100%;" border="0">
                                        <tr class="altRow">
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebMonthCalendar","Basic_FirstDayOfTheWeek") %>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddFirstDayOfWeek" runat="server" AutoPostBack="true" />
                                            </td>
                                        </tr>
                                        <tr class="itemRow">
                                            <td class="textAlignR">
                                            <%= this.GetGlobalResourceObject("WebMonthCalendar","Basic_SelectionType") %>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddSelectionType" runat="server" AutoPostBack="true" />
                                            </td>
                                        </tr>
                                        <tr class="altRow">
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebMonthCalendar","Basic_EnableMonthDropDown") %>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkEnableMonthDropDown" runat="server" Checked="true" Text="" AutoPostBack="true" />
                                            </td>
                                        </tr>
                                        <tr class="itemRow">
                                            <td class="textAlignR">
                                            <%= this.GetGlobalResourceObject("WebMonthCalendar","Basic_EnableYearDropDown") %>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkEnableYearDropDown" runat="server" Checked="true" Text="" AutoPostBack="true" />
                                            </td>
                                        </tr>
                                        <tr class="altRow">
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebMonthCalendar","Basic_HideDaysForOtherMonths") %>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkHideOtherMonthDays" runat="server" Checked="false" Text="" AutoPostBack="true" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="textAlignR">
                                                <%= this.GetGlobalResourceObject("WebMonthCalendar","Basic_EnableWeekNumbers") %>
                                            </td>
                                            <td width="25%">
                                                <asp:CheckBox ID="chkEnableWeekNumbers" runat="server" Checked="true" Text="" AutoPostBack="true"
                                                    TextAlign="Right" />
                                            </td>
                                        </tr>
                                        <tr class="altRow">
                                            <td class="textAlignR">
                                            <%= this.GetGlobalResourceObject("WebMonthCalendar","Basic_ChangeMonthToDateClicked") %>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkChangeMonthToDateClicked" runat="server" Checked="true" Text=""
                                                    AutoPostBack="true" TextAlign="Right" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </table>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </Template>
        </ContentPane>
        </ig:WebDialogWindow>
</asp:Content>
