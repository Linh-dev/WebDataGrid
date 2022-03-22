<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" 
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
    <ig:HtmlScript ID="HtmlScript1" runat="server" Type="text/javascript" Src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="Div4" class="wgDataBind">
        <div id="headerContainer" class="ControlPanelHeader">
            <img src="/samplesbrowser/samplescommon/aspnet/Common/serversideEvent.png" />
            <%= this.GetGlobalResourceObject("Strings","ServerEventsCaption") %>
        </div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent" runat="server">
            </div>
        </div>
        <div style="height: 500px; padding-left: 10px; width: 350px; float: left;">
            <ig:WebExplorerBar DataSourceID="ExplorerBarDataSource" ID="WebExplorerBar1" runat="server"
                GroupExpandBehavior="SingleExpanded" Width="300px">
                <autopostbackflags itemclick="On" itemselected="Off" />
                <databindings>
                            <ig:ExplorerBarItemBinding DataMember="Group" TextField="Name" />
                            <ig:ExplorerBarItemBinding DataMember="Feed" TextField="Name" ImageUrlField="ImageUrl" />
                        </databindings>
            </ig:WebExplorerBar>
        </div>
        <div class="ListOfEvents" style="float: left; width: 300px;">
            <img src="/samplesbrowser/samplescommon/aspnet/Common/Information16.png" align="absmiddle">
            <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_ServerEvents_List")%>
            <ul>
                <li><%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_ServerEvents_ListGroupBound")%></li>
                <li><%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_ServerEvents_ListItemBound")%></li>
                <li><%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_ServerEvents_ListItemSelected")%></li>
                <li><%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_ServerEvents_ListItemClick")%></li>           
            </ul>
        </div>
        <asp:XmlDataSource runat="server" ID="ExplorerBarDataSource" XPath="/Data/RssFeeds/Group" />
    </div>
    <script type="text/javascript">
        window.onload = scrollToBottom;
        function scrollToBottom() {
            var objDiv = document.getElementById("<%= eventList.ClientID %>");
            objDiv.scrollTop = objDiv.scrollHeight;
        }
    </script>
</asp:Content>
