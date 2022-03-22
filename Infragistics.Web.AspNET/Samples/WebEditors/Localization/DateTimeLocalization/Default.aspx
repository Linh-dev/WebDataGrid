<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/css_form.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="280px" Width="500px"
        Modal="false" WindowState="Normal" Resizer-Enabled="false" Moveable="False" Top="100px"
        BackColor="Transparent" Left="20px" CssClass="dialog-window">
        <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebEditors, WebDateTimeEditorName %>"
             MinimizeBox-Visible="true">
            <MinimizeBox Visible="true"></MinimizeBox>
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane ScrollBars="Hidden">
            <Template>
                <div style="padding: 20px;" class="css_form">
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebDateTimeEditorLocalizationCulture") %></label>
                    <br />
                    <asp:DropDownList ID="CultureList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CultureList_SelectedIndexChanged"
                        CssClass="CSSform">
                        <asp:ListItem Value="en-US" Text="<%$ Resources:Strings, Culture_en_US %>" />
                        <asp:ListItem Value="en-GB" Text="<%$ Resources:Strings, Culture_en_GB %>" />
                        <asp:ListItem Value="bg-BG" Text="<%$ Resources:Strings, Culture_bg_BG %>" />
                        <asp:ListItem Value="fr-FR" Text="<%$ Resources:Strings, Culture_fr_FR %>" />
                        <asp:ListItem Value="de-DE" Text="<%$ Resources:Strings, Culture_de_DE %>" />
                        <asp:ListItem Value="ja-JP" Text="<%$ Resources:Strings, Culture_ja_JP %>" />
                    </asp:DropDownList>
                    <br />
                    <br />
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebDateTimeEditorLocalizationValue") %></label>
                    <br />
                    <ig:WebDateTimeEditor ID="DateTimeEditorLocalization" Height="20px" runat="server" />
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
</asp:Content>

