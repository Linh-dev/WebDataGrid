<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
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
        <asp:CheckBox ID="chkDisable" runat="server" Text="<%$ Resources:WebDataTree, ClientEventsDisableHoverEvents %>"
            TextAlign="Right" /><br />
        <br />
        <div class="controlPanel" style="background-color: #ffffff; background-image: url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg);
            background-repeat: no-repeat; border: 1px solid #EEEEEE; width: 643px; height: 400px;
            padding-left: 20px; padding-top: 18px;">
            <ig:WebDataTree ID="WebDataTreeSample" runat="server" DataSourceID="TreeDataSource"
                Height="400px" Width="95%" Style="float: left" InitialExpandDepth="1" EnableConnectorLines="True"
                EnableAjax="true" EnableHotTracking="true" EnableExpandOnClick="true" NodeEditing-EnableOnF2="true"
                NodeEditing-Enabled="true" NodeEditing-EnableOnDoubleClick="true" SelectionType="Multiple"
                EnableCheckBoxes="true" EnableTriStateCheckBoxes="true" DragDropMode="Move" EnableDropInsertion="true"
                EnableDragging="true" EnableDropping="true" Font-Size="Small">
                <ClientEvents Initialize="InitializeHandler" NodeClick="NodeClickHandler" NodeCollapsed="NodeCollapsedHandler"
                    NodeCollapsing="NodeCollapsingHandler" NodeExpanded="NodeExpandedHandler" NodeExpanding="NodeExpandingHandler"
                    NodeHovered="NodeHoveredHandler" NodeUnhovered="NodeUnhoveredHandler" NodePopulated="NodePopulatedHandler"
                    NodePopulating="NodePopulatingHandler" CheckBoxSelectionChanged="NodeCheckBoxSelectionChangedHandler"
                    ActivationChanged="NodeActivationChangedHandler" ActivationChanging="NodeActivationChangingHandler"
                    SelectionChanged="NodeSelectionChangedHandler" SelectionChanging="NodeSelectionChangingHandler" />
                <DataBindings>
                    <ig:DataTreeNodeBinding DataMember="Group" TextField="Name" ValueField="Name" ImageUrlField="ImageUrl" />
                    <ig:DataTreeNodeBinding DataMember="Feed" TextField="Name" ValueField="Name" ImageUrlField="ImageUrl" />
                </DataBindings>
            </ig:WebDataTree>
            <asp:XmlDataSource runat="server" ID="TreeDataSource" XPath="/Data/RssFeeds/Group" />
        </div>
    </div>
    <script type="text/javascript">

        function InitializeHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebDataTree","ControlInitialized") %>');
        }

        function NodeCheckBoxSelectionChangedHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebDataTree","CheckBoxSelectionChanged") %>' + args.getNode().get_text());
        }

        function NodeClickHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebDataTree","NodeClicked") %>' + args.getNode().get_text());
        }

        function NodeCollapsedHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebDataTree","NodeCollapsed") %>' + args.getNode().get_text());
        }

        function NodeCollapsingHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebDataTree","NodeCollapsing") %>' + args.getNode().get_text());
        }

        function NodeExpandedHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebDataTree","NodeExpanded") %>' + args.getNode().get_text());
        }

        function NodeExpandingHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebDataTree","NodeExpanding") %>' + args.getNode().get_text());
        }

        function NodeHoveredHandler(sender, args) {
            if (!$get("<%= chkDisable.ClientID %>").checked)
                addLine('<%= this.GetGlobalResourceObject("WebDataTree","NodeHovered") %>' + args.getNode().get_text());
        }

        function NodeUnhoveredHandler(sender, args) {
            if (!$get("<%= chkDisable.ClientID %>").checked)
                addLine('<%= this.GetGlobalResourceObject("WebDataTree","NodeUnhovered") %>' + args.getNode().get_text());
        }

        function NodePopulatedHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebDataTree","NodePopulated") %>' + args.getNode().get_text());
        }

        function NodePopulatingHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebDataTree","NodePopulating") %>' + args.getNode().get_text());
        }


        function NodeActivationChangingHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebDataTree","ActivationChanging") %> ' + args.getNewActiveNode().get_text());
        }

        function NodeActivationChangedHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebDataTree","ActivationChanged") %> ' + args.getNewActiveNode().get_text());
        }

        function NodeSelectionChangingHandler(sender, args) {
            if (args.getNewSelectedNodes()[0] == null)
                return;
            else
                addLine('<%= this.GetGlobalResourceObject("WebDataTree","SelectionChanging") %> ' + args.getNewSelectedNodes()[0].get_text());
        }

        function NodeSelectionChangedHandler(sender, args) {
            if (args.getNewSelectedNodes()[0] == null)
                return;
            else
                addLine('<%= this.GetGlobalResourceObject("WebDataTree","SelectionChanged") %> ' + args.getNewSelectedNodes()[0].get_text());
        }
    </script>
</asp:Content>

