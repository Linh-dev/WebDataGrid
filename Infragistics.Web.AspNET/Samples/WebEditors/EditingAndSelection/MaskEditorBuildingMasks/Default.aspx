<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/css_form.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="170px" Width="500px"
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
                    <asp:UpdatePanel ID="UpdatePanel1" ChildrenAsTriggers="true" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
                            <div class="css_form">
                                <table  border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <label>
                                                <%=this.GetGlobalResourceObject("WebEditors","WebEditorMaskBuildInput") %></label>
                                        </td>
                                        <td>
                                            <ig:WebTextEditor ID="InputMask" Height="20px" runat="server">
                                                <AutoPostBackFlags ValueChanged="On" />
                                            </ig:WebTextEditor>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>
                                                <%=this.GetGlobalResourceObject("WebEditors","WebEditorMaskBuildAction") %></label>
                                        </td>
                                        <td>
                                            <ig:WebMaskEditor ID="DemoMaskEditor" Height="20px" runat="server" DisplayMode="Mask" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
    <div style="padding-top: 50px;">
        <%=this.GetGlobalResourceObject("WebEditors","WebEditorMaskBuildDesc2") %></div>
    <br />
</asp:Content>

