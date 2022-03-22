<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="outer-box">
     <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <div style="width: 300px; margin-top: 5px;">
                <div style="margin-left: 50%; height: 0px">
                    <div style="height: 130px;">
                    </div>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                            <img src="/samplesbrowser/samplescommon/aspnet/Common/ajax-loader.gif" alt="Loading..." style="" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
            </div>
            <div id="exporerBar">
                <ig:WebExplorerBar ID="WebExplorerBar1" GroupExpandBehavior="SingleExpanded" runat="server"
                    Width="400px" GroupContentsHeight="330px" ItemIndent="0">
                    <Groups>
                        <ig:ExplorerBarGroup Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Templates_News %>">
                            <Items>
                                <ig:ExplorerBarItem TemplateId="NewsTemp">
                                </ig:ExplorerBarItem>
                            </Items>
                        </ig:ExplorerBarGroup>
                        <ig:ExplorerBarGroup Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Templates_Sport %>">
                            <Items>
                                <ig:ExplorerBarItem TemplateId="SportTemp">
                                </ig:ExplorerBarItem>
                            </Items>
                        </ig:ExplorerBarGroup>
                        <ig:ExplorerBarGroup CssClass="WeatherGroup" Text="<%$ Resources:WebExplorerBar, WebExplorerBar_Templates_NBA %>">
                            <Items>
                                <ig:ExplorerBarItem TemplateId="NbaTemp">
                                </ig:ExplorerBarItem>
                            </Items>
                        </ig:ExplorerBarGroup>
                    </Groups>
                    <Templates>
                        <ig:ItemTemplate TemplateID="NewsTemp">
                            <Template>
                                <div class="EBContent">
                                    <div class="Y_Logo">
                                        <img src="/samplesbrowser/samplescommon/aspnet/WebExplorerBar/ynews.png" /></div>
                                    <div style="border-bottom: 1px solid #CCC;">
                                        <asp:Repeater ID="menu_repeater" DataSourceID="NewsDataSource" runat="server">
                                            <ItemTemplate>
                                                <div id="newsArticle" class="Article">
                                                    <div style="padding: 5px; padding-left: 0px; margin-top: 10px; margin-bottom: 10px;">
                                                        <a href=' <%# XPathBinder.Eval(Container.DataItem,"link") %>' style="text-decoration: none"
                                                            target="_frame"><span class="URLLinks">
                                                                <%# XPath("title") %>
                                                            </span></a>
                                                    </div>
                                                    <%# XPath("description") %>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </Template>
                        </ig:ItemTemplate>
                        <ig:ItemTemplate ID="ItemTemplate1" runat="server" TemplateID="SportTemp">
                            <Template>
                                <div class="EBContent">
                                    <div class="Y_Logo">
                                        <img src="/samplesbrowser/samplescommon/aspnet/WebExplorerBar/ysports.png" /></div>
                                    <div style="font-size: 11px; margin: 10px; text-decoration: none;">
                                        <div id="contentContainer">
                                            <asp:Repeater ID="sport_repeater" DataSourceID="SportDataSource" runat="server">
                                                <ItemTemplate>
                                                    <div id="sportArticle" class="Article">
                                                        <div style="padding: 5px; padding-left: 0px; margin-top: 10px; margin-bottom: 10px;">
                                                            <a href=' <%# XPathBinder.Eval(Container.DataItem,"link") %>' style="text-decoration: none"
                                                                target="_frame"><span class="URLLinks">
                                                                    <%# XPath("title") %>
                                                                </span></a>
                                                        </div>
                                                        <p>
                                                            <span id="sportDescription">
                                                                <%# XPath("description") %></span></p>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                            </Template>
                        </ig:ItemTemplate>
                        <ig:ItemTemplate TemplateID="NbaTemp">
                            <Template>
                                <div class="EBContent">
                                    <div class="Y_Logo">
                                        <img src="/samplesbrowser/samplescommon/aspnet/WebExplorerBar/yweather.png" /></div>
                                    <div id="contentContainer">
                                        <asp:Repeater ID="menu_repeater3" DataSourceID="NbaDataSource" runat="server">
                                            <ItemTemplate>
                                                <div style="font-weight: bold; font-size: 13px;">
                                                    <%# XPath("title")%></div>
                                                <span id="nbaArticle">
                                                    <%# XPath("description")%></span></a>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </Template>
                        </ig:ItemTemplate>
                    </Templates>
                </ig:WebExplorerBar>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </div>
    <asp:XmlDataSource runat="server" ID="NewsDataSource" XPath="rss/channel/item" DataFile="<%$ Resources: WebExplorerBar, WebExplorerBar_RssFeed_Topstories %>"/>
    <asp:XmlDataSource runat="server" ID="SportDataSource" XPath="rss/channel/item" DataFile="<%$ Resources: WebExplorerBar, WebExplorerBar_RssFeed_Sports %>" />
    <asp:XmlDataSource runat="server" ID="NbaDataSource" XPath="rss/channel/item" DataFile="<%$ Resources: WebExplorerBar, WebExplorerBar_RssFeed_Nba %>" />

    <script type="text/javascript">
        window.onload = getFeedContent;

        function getFeedContent() {
            getTopicArticle(document.getElementById("newsArticle"));
            getTopicArticle(document.getElementById("sportArticle"));
            setTarget(document.getElementById("nbaArticle"));
        }

        function getTopicArticle(content) {
            while (content != null) {
                for (var i = 0; i < content.childNodes.length; i++) {
                    if (content.childNodes[i].nodeName == "P")
                        setTarget(content.childNodes[i]);
                }
                content = content.nextSibling;
            }
        }

        function setTarget(container) {
            for (var i = 0; i < container.childNodes.length; i++) {
                if (container.childNodes[i].nodeName == "A")
                    container.childNodes[i].target = "_blank";
            }
        }
    </script>
</asp:Content>
