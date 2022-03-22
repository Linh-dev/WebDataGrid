<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/WebDataMenu/sampleWebDataMenu.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
    <ig:HtmlScript ID="HtmlScript1" runat="server" Type="text/javascript" Src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel runat="server" ID="SampleUpdatePanel" ChildrenAsTriggers="true"
        UpdateMode="Conditional">
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
            <ig:WebDialogWindow runat="server" ID="WebDialogWindow2" Height="300px" Width="675px"
                Modal="false" WindowState="Normal" Resizer-Enabled="true" Moveable="False" 
                Resizer-MaxWidth="720" Resizer-MaxHeight="400" Resizer-MinHeight="300" Resizer-MinWidth="200"
                BackColor="Transparent" Top="300px" Left="20px" CssClass="dialog-window">
                <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebDataMenu, SampleDataBindingCaption %>" >
                    <CloseBox Visible="False"></CloseBox>
                </Header>
                <ContentPane>
                    <Template>
                        <div style="height: 100%; width: 100%; background-image: url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg);">
                            <ig:WebDataMenu ID="WebDataMenuSample" runat="server" DataSourceID="MenuDataSource" EnableScrolling="false"
                                MaxDataBindDepth="1" Width="100%" StyleSetName="RedPlanet" OnDataBound="WebDataMenuSample_DataBound"
                                OnItemClick="WebDataMenu_ItemClick">
                                <GroupSettings Orientation="Horizontal" ExpandDirection="Down"/>
                                <DataBindings>
                                    <ig:DataMenuItemBinding DefaultText=" " TextField="Text" ValueField="Value" ImageUrlField="ImageUrl"
                                        ToolTipField="Text" />
                                </DataBindings>
                            </ig:WebDataMenu>
                            <asp:XmlDataSource runat="server" ID="MenuDataSource" XPath="/MenuData/CommunitySiteMenu/Menu" />
                        </div>
                    </Template>
                </ContentPane>
            </ig:WebDialogWindow>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
