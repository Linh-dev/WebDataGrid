<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/css_form.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">  
    <script type="text/javascript">
        function MinMaxDateTimeEditor_MinValueChanged(sender, e) {

            var editor = GetEditor();
            editor.set_minValue(e.get_value());

            GetMinWebDatePicker().set_maxValue(GetMaxWebDatePicker().get_value());
            GetMaxWebDatePicker().set_minValue(GetMinWebDatePicker().get_value());

            RefreshEditorValue();
        }

        function MinMaxDateTimeEditor_MaxValueChanged(sender, e) {

            var editor = GetEditor();
            editor.set_maxValue(e.get_value());

            GetMinWebDatePicker().set_maxValue(GetMaxWebDatePicker().get_value());
            GetMaxWebDatePicker().set_minValue(GetMinWebDatePicker().get_value());

            RefreshEditorValue();
        }

        function RefreshEditorValue() {

            if (GetEditor().get_value() < GetMinWebDatePicker().get_value())
                GetEditor().set_value(GetMinWebDatePicker().get_value());
            else if (GetEditor().get_value() > GetMaxWebDatePicker().get_value())
                GetEditor().set_value(GetMaxWebDatePicker().get_value());
        }

        function GetEditor() {
            return $find("<%= this.MinMaxDateTimeEditor.ClientID %>");
        }

        function GetMaxWebDatePicker() {
            return $find("<%= this.maxWebDatePicker.ClientID %>");
        }

        function GetMinWebDatePicker() {
            return $find("<%= this.minWebDatePicker.ClientID %>");
        }
    </script>

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
                    <ig:WebDatePicker ID="minWebDatePicker" runat="server" DropDownCalendarID="minWebMonthCalendar"
                        ClientSideEvents-ValueChanged="MinMaxDateTimeEditor_MinValueChanged" />
                    <br />
                    <ig:WebMonthCalendar runat="server" ID="minWebMonthCalendar"
                        EnableWeekNumbers="true" ChangeMonthToDateClicked="true" EnableMonthDropDown="True"
                        EnableYearDropDown="True">
                    </ig:WebMonthCalendar>
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebDateTimeEditorRestrictingByRange_MaxDate") %></label>
                    <br />
                    <ig:WebDatePicker ID="maxWebDatePicker" runat="server" DropDownCalendarID="maxWebMonthCalendar"
                        ClientSideEvents-ValueChanged="MinMaxDateTimeEditor_MaxValueChanged" />
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
