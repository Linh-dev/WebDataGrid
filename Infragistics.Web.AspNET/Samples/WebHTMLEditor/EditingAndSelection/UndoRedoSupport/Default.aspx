<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css"
        rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="headerContainer" class="ControlPanelHeader" style="width: 340px;">
        <img alt="Client Side Events" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/clientSideEvent.png" />
        <%= this.GetGlobalResourceObject("WebHTMLEditor","Undo_Redo_Client_Events") %></div>
    <div id="countContainer" class="controlPanel" style="width: 330px;">
        <div id="eventList" class="controlPanelEvent">
            <%= this.GetGlobalResourceObject("WebHTMLEditor","Undo_Redo_EventsDescription") %><br />
        </div>
    </div>
    <ighedit:WebHtmlEditor Width="350px" Height="200px" ID="WebHtmlEditor1" SpellCheckerID="WebSpellChecker1"
        runat="server" ImageDirectory="/SamplesBrowser/SamplesCommon/aspnet/WebHtmlEditor/Display/GeneralProperties">
        <ClientSideEvents AfterAction="WebHtmlEditor1_AfterAction" />
        <DialogStyle Font-Size="8pt" Font-Names="sans-serif" BorderWidth="1px" ForeColor="Black"
            BorderStyle="Solid" BorderColor="Black" BackColor="#ECE9D8"></DialogStyle>
        <Toolbar>
            <ighedit:ToolbarButton runat="server" Type="Undo" />
            <ighedit:ToolbarButton runat="server" Type="Redo" />
        </Toolbar>
    </ighedit:WebHtmlEditor>
    <script type="text/javascript" language="javascript">
        function WebHtmlEditor1_AfterAction(oEditor, actID) {
            if (actID === "Undo") {
                addLine('<%= this.GetGlobalResourceObject("WebHTMLEditor","Action_Undo") %>');
            }
            else if (actID === "Redo") {
                addLine('<%= this.GetGlobalResourceObject("WebHTMLEditor","Action_Redo") %>');
            }
        }
    </script>
</asp:Content>
