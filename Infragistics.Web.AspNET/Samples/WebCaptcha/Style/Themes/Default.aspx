<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Samples_WebCaptcha_Style_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="MainContent">
        <div style="float: left; padding-top: 4px;">
            <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_Styles_SelectTheme")%>
        </div>
        <div style="float: left; padding-left: 5px;">
            <ig:WebDropDown ID="WebDropDown1" runat="server" Width="200px" DropDownContainerWidth="200px"
                DropDownContainerHeight="200px">
                <AutoPostBackFlags SelectionChanged="On" />
                <Items>
                    <ig:DropDownItem Text="Appletini">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Caribbean">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Claymation">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Default">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="ElectricBlue">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Harvest">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="LucidDream">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Nautilus">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Office2007Black">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Office2007Blue">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Office2007Silver">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Pear">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="RedPlanet">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="RubberBlack">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Trendy">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Windows7">
                    </ig:DropDownItem>
                    <ig:DropDownItem Text="Office2010Blue">
                    </ig:DropDownItem>
                </Items>
            </ig:WebDropDown>
        </div>
    </div>
    <br/>
    <div style="height:220px;">   
        <div style="padding-bottom: 5px;">
            <img src="<%= string.Format("/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/{0}.png", this.WebCaptcha1.StyleSetName) %>" alt="<%= this.GetGlobalResourceObject("Strings", string.Format("{0}Style", this.WebCaptcha1.StyleSetName)) %>" />
        </div>
        <ig:WebCaptcha runat="server" Width="218px" ID="WebCaptcha1" StyleSetName="Appletini">
        </ig:WebCaptcha>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" Runat="Server">
</asp:Content>

