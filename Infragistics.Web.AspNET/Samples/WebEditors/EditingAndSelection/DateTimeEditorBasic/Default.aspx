<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/css_form.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="350px" Width="500px"
        Modal="false" WindowState="Normal" Resizer-Enabled="false" Moveable="False" Top="100px"
        BackColor="Transparent" Left="20px" CssClass="dialog-window">
        <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebEditors, WebDateTimeEditorName %>"
            MinimizeBox-Visible="true">
            <MinimizeBox Visible="false"></MinimizeBox>
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane ScrollBars="Hidden">
            <Template>
                <div style="padding: 20px;" class="css_form">
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebDateTimeEditorBasicLabel") %></label>
                    <br />
                    <ig:WebDateTimeEditor ID="BasicDateTimeEditor" Height="20px" runat="server" />
                    <br />
                    <br />
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebDateTimeEditorRangeLabel") %></label>
                    <br />
                    <ig:WebDateTimeEditor ID="MinMaxDateTimeEditor" Height="20px" runat="server" DataMode="Date" MinValue="1/1/1970"
                        MaxValue="1/1/2100" />
                    <br />
                    <br />
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebDateTimeEditorPromptsLabel") %></label>
                    <br />
                    <ig:WebDateTimeEditor ID="WebDateTimeEditor1" Height="20px" runat="server" PromptChar="#" />
                    <br />
                    <br />
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebDateTimeEditorNullableLabel") %></label>
                    <br />
                    <ig:WebDateTimeEditor ID="NullableDateTimeEditor" Height="20px" runat="server" Nullable="true"
                        NullText="<%$ Resources:WebEditors, WebNumericEditorNullableShortDesc %>" />
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
</asp:Content>
