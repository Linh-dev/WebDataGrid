<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="220px" Width="400px"
            Modal="false" WindowState="Normal" Resizer-Enabled="false" Moveable="False" Top="100px"
            BackColor="Transparent" Left="20px" CssClass="dialog-window">
            <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebEditors,  ControlName%>"
                MinimizeBox-Visible="true">
                <MinimizeBox Visible="false"></MinimizeBox>
                <CloseBox Visible="False"></CloseBox>
            </Header>
            <ContentPane ScrollBars="Hidden">
                <Template>
                    <div style="padding: 20px;">
                        <br>
                        <span class="loginCaption">
                            <%= this.GetGlobalResourceObject("WebEditors","WebTextEditorPasswordUserLabel") %></span>
                        <ig:WebTextEditor ID="UserName" Height="20px" runat="server" TextMode="SingleLine" MaxLength="255"
                            CssClass="loginControls" />
                        <br>
                        <br>
                        <span class="loginCaption">
                            <%= this.GetGlobalResourceObject("WebEditors","WebTextEditorPasswordPasswordLabel") %></span>
                        <ig:WebTextEditor ID="Password" Height="20px" runat="server" TextMode="Password" MaxLength="16"
                            CssClass="loginControls" />
                        <br />
                        <br />
                        <asp:Button runat="server" ID="LoginCommand" Text="<%$ Resources:WebEditors, WebTextEditorPasswordLoginBtn %>"
                            CssClass="loginCommand" />
                    </div>
                </Template>
            </ContentPane>
        </ig:WebDialogWindow>
    </div>
</asp:Content>

