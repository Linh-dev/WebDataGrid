<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/WebDataTree/sampleWebtreeMenu.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
    <ig:HtmlScript ID="HtmlScript1" runat="server" Type="text/javascript" Src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel runat="server" ID="SampleUpdatePanel" ChildrenAsTriggers="true" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="div1" class="wgDataBind">
                <div id="div2" class="ControlPanelHeader">
                    <img src="/samplesbrowser/samplescommon/aspnet/Common/serversideEvent.png" />
                    <%= this.GetGlobalResourceObject("Strings","ServerEventsCaption") %></div>
                <div id="Div2" class="controlPanel">
                    <div id="Div3" class="controlPanelEventServer" runat="server">
                    <asp:Label ID="ServerMessage" runat="server"></asp:Label>
                    </div>
                </div>
            </div> 
            <div Class="controlPanel" Style="background-color:#ffffff; background-image:url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg); background-repeat:no-repeat; border:1px solid #EEEEEE; width:643px; height:400px; padding-left:20px; padding-top:18px;">               
            <ig:WebDataTree ID="WebDataTreeSample" runat="server"
                DataSourceID="TreeDataSource" Font-Size="Small"
                Height="400px" 
                Width="300px" 
                Style="float:left"
                InitialExpandDepth="1" 
                EnableConnectorLines="True" 
                EnableAjax="true" 
                EnableHotTracking="true" 
                NodeEditing-EnableOnF2="true" 
                NodeEditing-Enabled="true"
                NodeEditing-EnableOnDoubleClick="false"
                SelectionType="Single"
                OnNodeClick="WebDataTreeSample_NodeClick" 
                OnNodeCollapsed="WebDataTreeSample_NodeCollapsed" 
                OnNodeExpanded="WebDataTreeSample_NodeExpanded" 
                OnTextChanged="WebDataTreeSample_TextChanged">
                <AutoPostBackFlags NodeClick="On" NodeCollapsed="On" NodeExpanded="On" NodeEditingTextChanged="On" />
                <DataBindings>
                    <ig:DataTreeNodeBinding DataMember="Group" TextField="Name" ValueField="Name" ImageUrlField="ImageUrl" />
                    <ig:DataTreeNodeBinding DataMember="Feed" TextField="Name" ValueField="Name" ImageUrlField="ImageUrl" />
                </DataBindings>
            </ig:WebDataTree>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:XmlDataSource runat="server" ID="TreeDataSource" XPath="/Data/RssFeeds/Group" />
</asp:Content>
