<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/css_form.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="350px" Width="500px"
        Modal="false" WindowState="Normal" Resizer-Enabled="false" Moveable="False" Top="100px"
        BackColor="Transparent" Left="20px" CssClass="dialog-window">
        <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebEditors,  ControlName%>"
            MinimizeBox-Visible="true">
            <MinimizeBox Visible="false"></MinimizeBox>
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane ScrollBars="Hidden">
            <Template>
                <div style="padding: 20px;" class="css_form">
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebNumericEditorBasicLabel") %></label>
                    <br />
                    <ig:WebPercentEditor Height="20px" ID="BasicPercentEditor" runat="server" />
                    <br />
                    <br />
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebPercentEditorMinMaxLabel") %></label>
                    <br />
                    <ig:WebPercentEditor Height="20px" ID="MinMaxPercentEditor" runat="server" MinValue="0"
                        MaxValue="1" />
                    <br />
                    <br />
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebNumericEditorNullableLabel") %></label>
                    <br />
                    <ig:WebPercentEditor Height="20px" ID="NullablePercentEditor" runat="server" Nullable="true"
                        NullText="<%$ Resources:WebEditors, WebNumericEditorNullableShortDesc %>" />
                    <br />
                    <br />
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebNumericEditorSpinBtnLabel") %></label>
                    <br />
                    <ig:WebPercentEditor Height="20px" ID="SpinButtonsPercentEditor" runat="server" ReadOnly="true"
                        CssClass="list">
                        <Buttons SpinButtonsDisplay="OnRight" ListOfValues="0|10|20|30|40|50" SpinOnArrowKeys="true"
                            SpinOnReadOnly="true" />
                    </ig:WebPercentEditor>
                    <br />
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
</asp:Content>
