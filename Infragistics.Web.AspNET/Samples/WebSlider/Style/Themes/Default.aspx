<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebSlider_Style_Application_Styling_Themes_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <div class="options">
        <img src="/samplesbrowser/samplescommon/aspnet/common/StyleSet.png"
            alt="Style Set" title="Style Set" width="60" height="61" />
        <label>
            <%= this.GetGlobalResourceObject("Strings","SelectATheme")%></label>  
            <asp:DropDownList ID="DDStyles" runat="server" AutoPostBack="True" CssClass="CSSform">
                <asp:ListItem>Appletini</asp:ListItem>
                <asp:ListItem>Caribbean</asp:ListItem>
                <asp:ListItem>Claymation</asp:ListItem>
                <asp:ListItem Selected="True">Default</asp:ListItem>
                <asp:ListItem>ElectricBlue</asp:ListItem>
                <asp:ListItem>Harvest</asp:ListItem>
                <asp:ListItem>LucidDream</asp:ListItem>
                <asp:ListItem>Nautilus</asp:ListItem>
                <asp:ListItem>Office2007Black</asp:ListItem>
                <asp:ListItem>Office2007Blue</asp:ListItem>
                <asp:ListItem>Office2007Silver</asp:ListItem>
                <asp:ListItem>Pear</asp:ListItem>
                <asp:ListItem>RedPlanet</asp:ListItem>
                <asp:ListItem>RubberBlack</asp:ListItem>
                <asp:ListItem>Trendy</asp:ListItem>
                <asp:ListItem>Windows7</asp:ListItem>
                <asp:ListItem>Office2010Blue</asp:ListItem>
            </asp:DropDownList>
    </div>
    <div class="result">
        <img id="StyleImage" runat="server" src="/samplesbrowser/samplescommon/aspnet/common/ThemeLabels/Default.png" />
        <ig:WebSlider ID="WebSlider1" runat="server" MaxValueAsString="200" MinValueAsString="0"
            ValueAsString="20" StyleSetName="Default">
            <ValueLabel Location="FloatTopOrLeft" />
        </ig:WebSlider>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
