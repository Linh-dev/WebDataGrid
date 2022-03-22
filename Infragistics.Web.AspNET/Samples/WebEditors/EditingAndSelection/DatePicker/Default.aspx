<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/css_form.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="350px" Width="500px"
            Modal="false" WindowState="Normal" Resizer-Enabled="false" Moveable="False" Top="100px"
            BackColor="Transparent" Left="20px" CssClass="dialog-window" >
            <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebEditors, WebDatePickerEditorName %>"
                 MinimizeBox-Visible="true">
                <MinimizeBox Visible="false"></MinimizeBox>
                <CloseBox Visible="False"></CloseBox>
            </Header>
            <ContentPane ScrollBars="Hidden">
                <Template>
                    <div style="padding: 20px;" class="css_form">
                        <label>
                            <%= this.GetGlobalResourceObject("WebEditors","WebDatePickerEditorLabel") %></label>
                        <br />
                        <ig:WebDatePicker ID="DeliveryDate" Width="150px" runat="server" DropDownCalendarID="CalendarView" />
                        <ig:WebMonthCalendar runat="server" ID="CalendarView" EnableWeekNumbers="true"
                            ChangeMonthToDateClicked="true" EnableMonthDropDown="True" EnableYearDropDown="True">
                        </ig:WebMonthCalendar>
                        <br />
                    </div>
                </Template>
            </ContentPane>
        </ig:WebDialogWindow>
    </div>
</asp:Content>
