<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="OptionPanel">
        <div id="Icon2" style="position: relative; float: left; padding-right: 10px; margin-bottom: 10px;">
            <img src="/samplesbrowser/samplescommon/aspnet/Common/StyleSet.png" alt="Style Set" title="Style Set" width="60" height="61" /></div>
        <div id="DropDown" style="position: relative; float: left; padding-top: 20px; margin-bottom: 10px;">
            <%= this.GetGlobalResourceObject("Strings","SelectATheme")%>
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
    </div>
    <div class="date-picker-box">
        <div style="height: 20px">
            <img id="StyleImange" runat="server" src="/samplesbrowser/samplescommon/aspnet/Common/ThemeLabels/Default.png" /></div>
        <ig:WebDatePicker runat="server" ID="WebDatePicker1" DropDownCalendarID="WebMonthCalendar1"
            Width="220px">
        </ig:WebDatePicker>
        <ig:WebMonthCalendar runat="server" ID="WebMonthCalendar1"
            Width="220px" EnableWeekNumbers="true" EnableMonthDropDown="True" EnableYearDropDown="True">
        </ig:WebMonthCalendar>
    </div>
</asp:Content>

