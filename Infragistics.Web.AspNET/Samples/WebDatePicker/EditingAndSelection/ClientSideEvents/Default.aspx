<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
    <ig:HtmlScript ID="HtmlScript1" runat="server" Type="text/javascript" Src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="div1" class="wgDataBind" style="height: 350px;">
        <div id="div2" class="ControlPanelHeader">
            <img src="/samplesbrowser/samplescommon/aspnet/Common/clientsideEvent.png" />
            <%= this.GetGlobalResourceObject("Strings","ClientEventsCaption") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <%= this.GetGlobalResourceObject("Strings","ClientEventsDescription") %><br />
            </div>
        </div>
        <ig:WebDatePicker runat="server" ID="webDatePicker" Width="225px">
            <ClientSideEvents 
                CalendarOpened="WebDatePicker_CalendarOpened" 
                CalendarClosed="WebDatePicker_CalendarClosed"
                ValueChanged="WebDatePicker_ValueChanged" 
                CustomButtonClick="WebDatePicker_CustomButtonClick"
                Blur="WebDatePicker_Blur" 
                InvalidValueEntered="WebDatePicker_InvalidValueEntered"
                KeyDown="WebDatePicker_KeyDown" 
                KeyUp="WebDatePicker_KeyUp" 
                TextChanged="WebDatePicker_TextChanged"
                MouseDown="WebDatePicker_MouseDown"
                MouseUp="WebDatePicker_MouseUp" />
        </ig:WebDatePicker>
    </div>

    <script type="text/javascript">
        var listCount = 0;

        function WebDatePicker_CalendarOpened(webDatePicker, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_ClientInteraction_CalendarOpened") %>');
        }

        function WebDatePicker_CalendarClosed(webDatePicker, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_ClientInteraction_CalendarClosed") %>');
        }

        function WebDatePicker_CustomButtonClick(webDatePicker, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_ClientInteraction_CustomButtonClick") %>');
        }

        function WebDatePicker_ValueChanged(webDatePicker, evntArgs) {
            var str = '<%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_ClientInteraction_ValueChanged") %>';

            if (evntArgs.get_value() != null)
                str += " (" + evntArgs.get_value().format("dd/MM/yyyy") + ")";

            addLine(str);
        }

        function WebDatePicker_Blur(webDatePicker, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_ClientInteraction_Blur") %>');
        }

        function WebDatePicker_InvalidValueEntered(webDatePicker, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_ClientInteraction_InvalidValueEntered") %>');
        }

        function WebDatePicker_KeyDown(webDatePicker, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_ClientInteraction_KeyDown") %>');
        }

        function WebDatePicker_KeyUp(webDatePicker, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_ClientInteraction_KeyUp") %>');
        }

        function WebDatePicker_TextChanged(webDatePicker, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_ClientInteraction_TextChanged") %>');
        }

        function WebDatePicker_MouseDown(webDatePicker, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_ClientInteraction_MouseDown") %>');
        }

        function WebDatePicker_MouseUp(webDatePicker, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_ClientInteraction_MouseUp") %>');
        }

    </script>
</asp:Content>
