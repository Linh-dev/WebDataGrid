<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />	 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="350px" Width="340px"
        Modal="false" WindowState="Normal" Resizer-Enabled="false" Moveable="False" Top="80px"
        BackColor="Transparent" Left="20px" CssClass="dialog-window">
        <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebDatePicker, ControlName %>">
        </Header>
        <ContentPane ScrollBars="Hidden">
            <Template>
                <div style="padding: 40px; ">
                    <div class="label-dropdown">
                        <%=this.GetGlobalResourceObject("WebDatePicker","LocalizationCultureLabel")%>
                    </div>
                    <asp:DropDownList ID="CultureList" runat="server" AutoPostBack="true" >
                        <asp:ListItem Value="en-US" Text="<%$ Resources:WebDatePicker, LocalizationOptionEN_US %>" />
                        <asp:ListItem Value="en-GB" Text="<%$ Resources:WebDatePicker, LocalizationOptionEN_GB %>" />
                        <asp:ListItem Value="de-DE" Text="<%$ Resources:WebDatePicker, LocalizationOptionDE_DE %>" />
                        <asp:ListItem Value="ja-JP" Text="<%$ Resources:WebDatePicker, LocalizationOptionJP_JP %>" />
                        <asp:ListItem Value="es-MX" Text="<%$ Resources:WebDatePicker, LocalizationOptionES_MX %>" />
                        <asp:ListItem Value="uk-UA" Text="<%$ Resources:WebDatePicker, LocalizationOptionUK_UA %>" />
                    </asp:DropDownList>
                    <br />
                    <br>
                    
                    <ig:WebDatePicker runat="server" ID="webDatePicker" DropDownCalendarID="webMonthCalendar" Culture="en-US" Width="230px" />
                    <ig:WebMonthCalendar runat="server" ID="webMonthCalendar" Culture="en-us" FooterContent="Today: {0:d}"
                            EnableWeekNumbers="false"
                            ChangeMonthToDateClicked="true" 
                            EnableMonthDropDown="True"  
                            EnableYearDropDown="True">
                    </ig:WebMonthCalendar>
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
</asp:Content>

