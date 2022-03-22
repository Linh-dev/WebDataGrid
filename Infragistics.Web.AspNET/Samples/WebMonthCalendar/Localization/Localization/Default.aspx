<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <div>
        <span class="leftExpanedTitle">
            <%=this.GetGlobalResourceObject("WebMonthCalendar","LocalizationCultureLabel") %></span>
        <asp:DropDownList ID="CultureList" runat="server" AutoPostBack="true" CssClass="CSSform">
            <asp:ListItem Value="en-US" Text="<%$ Resources:WebMonthCalendar, LocalizationOptionEN_US %>" />
            <asp:ListItem Value="en-GB" Text="<%$ Resources:WebMonthCalendar, LocalizationOptionEN_GB %>" />
            <asp:ListItem Value="de-DE" Text="<%$ Resources:WebMonthCalendar, LocalizationOptionDE_DE %>" />
            <asp:ListItem Value="ja-JP" Text="<%$ Resources:WebMonthCalendar, LocalizationOptionJP_JP %>" />
            <asp:ListItem Value="es-MX" Text="<%$ Resources:WebMonthCalendar, LocalizationOptionES_MX %>" />
            <asp:ListItem Value="uk-UA" Text="<%$ Resources:WebMonthCalendar, LocalizationOptionUK_UA %>" />
        </asp:DropDownList>
        <br />
        <br />
        <div style="text-align: left;">
            <ig:WebMonthCalendar runat="server" ID="CalendarView" Culture="en-US" Width="250px"
                EnableWeekNumbers="true" ChangeMonthToDateClicked="true"
                EnableMonthDropDown="True" EnableYearDropDown="True" FooterContent="Today: {0:d}">
            </ig:WebMonthCalendar>
        </div>
    </div>
</asp:Content>
