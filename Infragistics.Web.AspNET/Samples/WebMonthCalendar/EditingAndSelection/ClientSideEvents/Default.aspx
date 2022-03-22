<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
 <ig:HtmlLink  runat="server" type="text/css" rel="Stylesheet" href="ControlPanel.css" /> 
    <ig:HtmlScript runat="server" Type="text/javascript" Src="ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
     <div id="Div1" class="wgDataBind">
        <div id="Div1" class="ControlPanelHeader">
            <img src="/samplesbrowser/samplescommon/aspnet/Common/clientsideEvent.png" />
            <%= this.GetGlobalResourceObject("Strings","ClientEventsCaption") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <%= this.GetGlobalResourceObject("Strings","ClientEventsDescription") %><br />
            </div>
        </div>
        <div padding-top:15px; ">
            <ig:WebMonthCalendar runat="server" ID="CalendarView" EnableWeekNumbers="true"
                ChangeMonthToDateClicked="true" EnableMonthDropDown="True" EnableYearDropDown="True">
                <ClientEvents KeyDown="keydown" ListAnimationStopped="listanimationstopped" ListClosed="listclosed"
                    ListClosing="listclosing" ListOpened="listopened" ListOpening="listopening" SelectionChanged="selectionchanged"
                    SelectionChanging="selectionchanging" />
            </ig:WebMonthCalendar>
        </div>
    </div>

    <script type="text/javascript">

        function keydown() {
            addLine('<%= this.GetGlobalResourceObject("WebMonthCalendar","ClientEvents_KeyDown") %>');
        }
        function listanimationstopped() {
            addLine('<%= this.GetGlobalResourceObject("WebMonthCalendar","ClientEvents_ListAnimationStopped") %>');
        }
        function listclosed() {
            addLine('<%= this.GetGlobalResourceObject("WebMonthCalendar","ClientEvents_ListClosed") %>');
        }
        function listclosing() {
            addLine('<%= this.GetGlobalResourceObject("WebMonthCalendar","ClientEvents_ListClosing") %>');
        }
        function listopened() {
            addLine('<%= this.GetGlobalResourceObject("WebMonthCalendar","ClientEvents_ListOpened") %>');
        }
        function listopening() {
            addLine('<%= this.GetGlobalResourceObject("WebMonthCalendar","ClientEvents_ListOpening") %>');
        }
        function selectionchanged() {
            addLine('<%= this.GetGlobalResourceObject("WebMonthCalendar","ClientEvents_SelectionChanged") %>');
        }
        function selectionchanging() {
            addLine('<%= this.GetGlobalResourceObject("WebMonthCalendar","ClientEvents_SelectionChanging") %>');
        }
    
    </script> 
</asp:Content>
