<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <ig:HtmlScript ID="HtmlScript1" runat="server" Type="text/javascript" Src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
     <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
     <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/WebDataMenu/sampleWebDataMenu.css" />
     <ig:HtmlLink ID="HtmlLink4" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/webSample_style.css" />
     <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="height: 500px; width: 700px; position: relative;">
        <div id="div1" class="wgDataBind">
            <div id="div2" class="ControlPanelHeader">
                <img src="/samplesbrowser/samplescommon/aspnet/Common/clientsideEvent.png" />
                <%= this.GetGlobalResourceObject("Strings","ClientEventsCaption") %>
            </div>
            <div id="countContainer" class="controlPanel">
                <div id="eventList" class="controlPanelEvent">
                    <%= this.GetGlobalResourceObject("Strings","ClientEventsDescription") %><br />
                </div>
            </div>
        </div>
        <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="300px" Width="675px"
            Modal="false" WindowState="Normal" Resizer-Enabled="false" Moveable="False" Top="270px"
            BackColor="Transparent" Left="20px" CssClass="dialog-window" >
            <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebDataMenu, SampleDataBindingCaption %>"
                MaximizeBox-Visible="true" MinimizeBox-Visible="true">
                <MaximizeBox Visible="false"></MaximizeBox>
                <MinimizeBox Visible="True"></MinimizeBox>
                <CloseBox Visible="False"></CloseBox>
            </Header>
            <ContentPane>
                <Template>
                    <div style="height: 100%; width: 100%; background-image: url(/SamplesBrowser/SamplesCommon/aspnet/Common/TreeBg.jpg);">
                        <ig:WebDataMenu ID="WebDataMenuSample" runat="server" DataSourceID="MenuDataSource" EnableScrolling="false"
                            MaxDataBindDepth="1" Width="100%" AccessKey="J" StyleSetName="RedPlanet">
                            <ClientEvents ItemHovered="hover" ItemUnhovered="unhover" ItemClick="itemClick" ItemCollapsed="icollapsed"
                                ItemCollapsing="icollapsing" ItemExpanded="iexpanded" ItemExpanding="iexpanding"
                                ItemSelected="iselected" ItemSelecting="iselecting" KeyDown="keypress" />
                            <GroupSettings Orientation="Horizontal" ExpandDirection="Down"/>
                            <DataBindings>
                                <ig:DataMenuItemBinding DefaultText=" " TextField="Text" ValueField="Value" ImageUrlField="ImageUrl"
                                    NavigateUrlFields="URL" TargetField="_blank" ToolTipField="Text" />
                            </DataBindings>
                        </ig:WebDataMenu>
                        <asp:XmlDataSource runat="server" ID="MenuDataSource" XPath="/MenuData/CommunitySiteMenu/Menu" />
                    </div>
                </Template>
            </ContentPane>
        </ig:WebDialogWindow>
    </div>

<script language="javascript" type="text/javascript">

    function itemClick(menu, eventArgs) {
        addLine('<%= this.GetGlobalResourceObject("WebDataMenu","ClientEventClicked") %>' + ": " + eventArgs.getItem().get_text());
    }

    function hover(menu, eventArgs) {
        addLine('<%= this.GetGlobalResourceObject("WebDataMenu","ClientEventHovered") %>' + ": " + eventArgs.getItem().get_text());
    }

    function unhover(menu, eventArgs) {
        addLine('<%= this.GetGlobalResourceObject("WebDataMenu","ClientEventUnhovered") %>' + ": " + eventArgs.getItem().get_text());
    }

    function iexpanding(menu, eventArgs, obj3) {
        addLine('<%= this.GetGlobalResourceObject("WebDataMenu","ClientEventExpanding") %>' + ": " + eventArgs.getItem().get_text());
    }

    function iexpanded(menu, eventArgs) {
        addLine('<%= this.GetGlobalResourceObject("WebDataMenu","ClientEventExpanded") %>' + ": " + eventArgs.getItem().get_text());
    }

    function icollapsing(menu, eventArgs) {
        addLine('<%= this.GetGlobalResourceObject("WebDataMenu","ClientEventCollapsing") %>' + ": " + eventArgs.getItem().get_text());
    }

    function icollapsed(menu, eventArgs) {
        addLine('<%= this.GetGlobalResourceObject("WebDataMenu","ClientEventCollapsed") %>' + ": " + eventArgs.getItem().get_text());
    }

    function iselecting(menu, eventArgs) {
        addLine('<%= this.GetGlobalResourceObject("WebDataMenu","ClientEventIsSelecting") %>' + ": " + eventArgs.getItem().get_text());
    }

    function iselected(menu, eventArgs) {
        addLine('<%= this.GetGlobalResourceObject("WebDataMenu","ClientEventIsSelected") %>' + ": " + eventArgs.getItem().get_text());
    }

    function keypress(menu, eventArgs) {
        addLine('<%= this.GetGlobalResourceObject("WebDataMenu","ClientEventKeyPress") %>' + ": " + eventArgs.getItem().get_text());
    }
        
</script>

</asp:Content>

