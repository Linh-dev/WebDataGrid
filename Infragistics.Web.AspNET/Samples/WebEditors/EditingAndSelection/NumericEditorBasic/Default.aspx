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
                    <ig:WebNumericEditor Height="20px" ID="BasicNumericEditor" runat="server" />
                    <br />
                    <br />
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebNumericEditorMinMaxLabel") %></label>
                    <br />
                    <ig:WebNumericEditor Height="20px" ID="MinMaxNumericEditor" runat="server" DataMode="Decimal"
                        MinDecimalPlaces="0" MinValue="0" MaxValue="10" />
                    <br />
                    <br />
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebNumericEditorNullableLabel") %></label>
                    <br />
                    <ig:WebNumericEditor Height="20px" ID="NullableNumericyEditor" runat="server" Nullable="true"
                        NullText="<%$ Resources:WebEditors, WebNumericEditorNullableShortDesc %>" />
                    <br />
                    <br />
                    <label>
                        <%= this.GetGlobalResourceObject("WebEditors","WebNumericEditorSpinBtnLabel") %></label>
                    <br />
                    <ig:WebNumericEditor Height="20px" ID="SpinButtonsNumericEditor" runat="server" ReadOnly="true"
                        CssClass="list">
                        <Buttons SpinButtonsDisplay="OnRight" ListOfValues="0|1|2|3|4|5" SpinOnArrowKeys="true"
                            SpinOnReadOnly="true" SpinWrap="true" />
                    </ig:WebNumericEditor>
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
</asp:Content>
