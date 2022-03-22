<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/css_form.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="350px" Width="500px"
        Modal="false" WindowState="Normal" Resizer-Enabled="false" Moveable="False" Top="100px"
        BackColor="Transparent" Left="20px" CssClass="dialog-window">
        <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebEditors, WebDateTimeEditorName %>"
            MinimizeBox-Visible="true">
            <MinimizeBox Visible="false"></MinimizeBox>
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane ScrollBars="Hidden">
            <Template>
                <div style="padding: 20px;" class="css_form">
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebDateTimeEditorRestrictingByRange_MinDate") %></label>
                    <br />
                    <ig:WebDatePicker ID="minWebDatePicker" AutoPostBackFlags-ValueChanged="On"
                        runat="server" DropDownCalendarID="minWebMonthCalendar"
                        OnValueChanged="minWebDatePicker_ValueChanged" />
                    <ig:WebMonthCalendar runat="server" ID="minWebMonthCalendar"
                        EnableWeekNumbers="true" ChangeMonthToDateClicked="true" EnableMonthDropDown="True"
                        EnableYearDropDown="True">
                    </ig:WebMonthCalendar>
                    <br />
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebDateTimeEditorRestrictingByRange_MaxDate") %></label>
                    <br />
                    <ig:WebDatePicker ID="maxWebDatePicker" AutoPostBackFlags-ValueChanged="On"
                        runat="server" DropDownCalendarID="maxWebMonthCalendar"
                        OnValueChanged="maxWebDatePicker_ValueChanged" />
                    <ig:WebMonthCalendar runat="server" ID="maxWebMonthCalendar"
                        EnableWeekNumbers="true" ChangeMonthToDateClicked="true" EnableMonthDropDown="True"
                        EnableYearDropDown="True">
                    </ig:WebMonthCalendar>
                    <br />
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebDateTimeEditorRestrictingByRange_Label") %></label>
                    <br />
                    <ig:WebDateTimeEditor Height="20px" ID="MinMaxDateTimeEditor" runat="server" DataMode="Date"
                        Nullable="true" NullText="<%$ Resources:WebEditors, WebNumericEditorNullableShortDesc %>" />
                    <br />
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
</asp:Content>

