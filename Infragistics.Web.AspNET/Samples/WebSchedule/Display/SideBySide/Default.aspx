<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<%-- Register the SideBySide UserControl in to the page --%>
<%@ Register Src="MultiPanelResourceView.ascx"
    TagName="SideBySideControl" TagPrefix="iguc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:htmllink runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
<ig:htmllink runat="server" type="text/css" rel="Stylesheet" href="ControlPanel.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="topContentContainer" style="margin-top: 25px; margin-bottom: 5px;">
                <div id="headerContainer" class="ControlPanelHeader">
                <img src="/samplesbrowser/samplescommon/aspnet/WebSchedule/Display/WebSchedule-SideBySide/config.png" alt="" />
                <label><%= this.GetGlobalResourceObject("WebSchedule","ControlPanel")%></label></div>
                <div id="Div1" class="controlPanel">
                    <div id="eventList" class="controlPanelEvent">
                        <table border="0">
                            <tr>
                                <td>
                                    HideScrollbarsCheckBox
                                </td>
                                <td width="50">
                                    <asp:CheckBox ID="hideScrollbarsCheckBox" Checked="true" runat="server" AutoPostBack="true" />
                                </td>
                                <td>
                                    SyncScrollBars
                                </td>
                                <td>
                                    <asp:CheckBox ID="syncScrollBarsCheckBox" Checked="true" runat="server" AutoPostBack="true" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Colors
                                </td>
                                <td>
                                    <asp:CheckBox ID="colorsCheckBox" Checked="true" runat="server" AutoPostBack="true" />
                                </td>
                                <td>
                                    HideViewModesMenu
                                </td>
                                <td>
                                    <asp:CheckBox ID="hideViewModesMenuCheckBox" Checked="false" runat="server" AutoPostBack="true" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <%-- Using the SideBySide UserControl --%>
            <iguc:sidebysidecontrol id="rView" runat="server" viewheight="400px" appointmentformpath="/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx"
                reminderformpath="/samplesbrowser/samplescommon/aspnet/webschedule/forms/Reminder.aspx" 
                enableappstyling="False" >
            </iguc:sidebysidecontrol>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                SelectCommand="SELECT * FROM [Activity]"></asp:AccessDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
