<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
    <ig:HtmlScript ID="HtmlScript1" runat="server" Type="text/javascript" Src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="div1" class="wgDataBind">
        <div id="div2" class="ControlPanelHeader">
            <img src="/samplesbrowser/samplescommon/aspnet/Common/clientsideEvent.png" />
            <%= this.GetGlobalResourceObject("Strings","ClientEventsCaption") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <%= this.GetGlobalResourceObject("Strings","ClientEventsDescription") %><br />
            </div>
        </div>
    </div>
    <div id="wrapper" class="wgDataBind">
        <div style="height: 500px; padding-left: 10px; width: 350px; float: left;">
            <ig:WebExplorerBar GroupExpandBehavior="SingleExpanded" DataSourceID="ExplorerBarDataSource" 
                Width="300px" ID="WebExplorerBar1" runat="server">
                <ClientEvents Initialize="InitializeHandler" ItemClick="ItemClickHandler" ItemCollapsed="ItemCollapsedHandler"
                    ItemCollapsing="ItemCollapsingHandler" ItemExpanded="ItemExpandedHandler" ItemExpanding="ItemExpandingHandler"
                    ItemHovered="ItemHoveredHandler" ItemPopulated="ItemPopulatedHandler" ItemPopulating="ItemPopulatingHandler"
                    ItemSelected="ItemSelectedHandler" ItemSelecting="ItemSelectingHandler" ItemUnhovered="ItemUnhoveredHandler" />
                <DataBindings>
                    <ig:ExplorerBarItemBinding DataMember="Group" TextField="Name" />
                    <ig:ExplorerBarItemBinding DataMember="Feed" TextField="Name" ImageUrlField="ImageUrl" />
                </DataBindings>
            </ig:WebExplorerBar>
        </div>
    </div>
    <div class="ListOfEvents" style="float: left; width: 300px;">
        <img src="/samplesbrowser/samplescommon/aspnet/Common/Information16.png" align="middle">
       <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_ClientEvents_List")%>
        <ul>
            <li>Initialize </li>
            <li>ItemClick </li>
            <li>ItemPopulating, ItemPopulated </li>
            <li>ItemExpanding, ItemExpanded </li>
            <li>ItemHovered, ItemUnhovered </li>
            <li>ItemCollapsing, ItemCollapsed </li>
            <li>ItemSelecting, ItemSelected </li>
        </ul>
    </div>
    <asp:XmlDataSource runat="server" ID="ExplorerBarDataSource" XPath="/Data/RssFeeds/Group" />

    <script type="text/javascript">

        function InitializeHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebExplorerBar","ControlInitialized") %>');
        }

        function ItemCollapsedHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebExplorerBar","ItemCollapsed") %>' + args.getExplorerBarItem().get_text());
        }

        function ItemCollapsingHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebExplorerBar","ItemCollapsing") %>' + args.getExplorerBarItem().get_text());
        }

        function ItemExpandedHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebExplorerBar","ItemExpanded") %>' + args.getExplorerBarItem().get_text());
        }

        function ItemExpandingHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebExplorerBar","ItemExpanding") %>' + args.getExplorerBarItem().get_text());
        }

        function ItemHoveredHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebExplorerBar","ItemHovered") %>' + args.getExplorerBarItem().get_text());
        }

        function ItemPopulatedHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebExplorerBar","ItemPopulated") %>' + args.getExplorerBarItem().get_text());
        }

        function ItemPopulatingHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebExplorerBar","ItemPopulating") %>' + args.getExplorerBarItem().get_text());
        }

        function ItemSelectedHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebExplorerBar","ItemSelected") %>' + args.getNewSelectedItem().get_text());
        }

        function ItemSelectingHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebExplorerBar","ItemSelecting") %>' + args.getNewSelectedItem().get_text());
        }

        function ItemUnhoveredHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebExplorerBar","ItemUnhovered") %>' + args.getExplorerBarItem().get_text());
        }

        function ItemClickHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebExplorerBar","ItemClicked") %>' + args.getExplorerBarItem().get_text());
        }
        
    </script>
</asp:Content>

