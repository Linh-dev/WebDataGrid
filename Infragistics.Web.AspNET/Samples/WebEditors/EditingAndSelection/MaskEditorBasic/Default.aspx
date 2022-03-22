<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/css_form.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="550px" Width="500px"
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
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="text-align: left:">
                        <tr>
                            <td width="180" valign="top">
                                <label>
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicPhone") %></label>
                            </td>
                            <td valign="top">
                                <ig:WebMaskEditor ID="PhoneNumberEditor" Height="20px" runat="server" InputMask="<%$ Resources:WebEditors, WebEditorMaskBasicPhoneMask %>"
                                    DisplayMode="Mask" />
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                &nbsp;
                            </td>
                            <td valign="top" class="special_text">
                                <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicPhoneMask") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                <label>
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicPhoneExt")%></label>
                            </td>
                            <td valign="top">
                                <ig:WebMaskEditor ID="PhoneNumberWithExtEditor" Height="20px" runat="server" InputMask="<%$ Resources:WebEditors, WebEditorMaskBasicPhoneExtMask %>"
                                    DisplayMode="Mask" />
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                &nbsp;
                            </td>
                            <td valign="top" class="special_text">
                                <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicPhoneExtMask") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                <label>
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicSSN") %></label>
                            </td>
                            <td valign="top">
                                <ig:WebMaskEditor ID="WebMaskEditor1" Height="20px" runat="server" InputMask="###-##-####"
                                    DisplayMode="Mask" />
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                &nbsp;
                            </td>
                            <td valign="top" class="special_text">
                                <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicSSNMask") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                <label>
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicPostal") %></label>
                            </td>
                            <td valign="top">
                                <ig:WebMaskEditor ID="WebMaskEditor7" Height="20px" runat="server" InputMask="<%$ Resources:WebEditors, WebEditorMaskBasicPostalMask %>"
                                    DisplayMode="Mask" />
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                &nbsp;
                            </td>
                            <td valign="top" class="special_text">
                                <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicPostalMask") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                <label>
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicAlphaNumReq") %></label>
                            </td>
                            <td valign="top">
                                <ig:WebMaskEditor ID="WebMaskEditor2" Height="20px" runat="server" InputMask="AAAAAA"
                                    DisplayMode="Mask" />
                                <br />
                                <span class="special_text">
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicAlphaNumReqMask") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                &nbsp;
                            </td>
                            <td valign="top" class="special_text">
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                <label>
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicAlphaNumNoReq") %></label>
                            </td>
                            <td valign="top">
                                <ig:WebMaskEditor ID="WebMaskEditor3" Height="20px" runat="server" InputMask="aaaaaa"
                                    DisplayMode="Mask" />
                                <br />
                                <span class="special_text">
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicAlphaNumNoReqMask") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                &nbsp;
                            </td>
                            <td valign="top" class="special_text">
                             &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                <label>
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicLower")%></label>
                            </td>
                            <td valign="top">
                                <ig:WebMaskEditor ID="WebMaskEditor4" Height="20px" runat="server" InputMask="<aaaaaa"
                                    DisplayMode="Mask" />
                                <br />
                                <span class="special_text">
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicLowerMask") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                &nbsp;
                            </td>
                            <td valign="top" class="special_text">
                             &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                <label>
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicUpper") %></label>
                            </td>
                            <td valign="top">
                                <ig:WebMaskEditor ID="WebMaskEditor5" Height="20px" runat="server" InputMask=">aaaaaa"
                                    DisplayMode="Mask" /><br />
                                     <span class="special_text"><%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicUpperMask") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                &nbsp;
                            </td>
                            <td valign="top" class="special_text">
                                 &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                <label>
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskList") %></label>
                            </td>
                            <td valign="top">
                                <ig:WebMaskEditor ID="SelectStateEditor" Height="20px" runat="server" InputMask="<%$ Resources:WebEditors, WebEditorMaskListMask %>"
                                    CssClass="list">
                                    <Buttons SpinButtonsDisplay="OnRight" SpinWrap="true" ListOfValues="<%$ Resources:WebEditors, WebEditorMaskListEnumeration %>">
                                    </Buttons>
                                </ig:WebMaskEditor>
                            </td>
                        </tr>
                        <tr>
                            <td width="180" valign="top">
                                &nbsp;
                            </td>
                            <td valign="top" class="special_text">
                                <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskListMask") %></span>
                            </td>
                        </tr>
                    </table>
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
</asp:Content>
