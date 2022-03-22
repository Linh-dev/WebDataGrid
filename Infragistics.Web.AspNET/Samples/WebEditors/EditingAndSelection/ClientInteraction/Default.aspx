<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/css_form.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
    <ig:HtmlLink ID="HtmlLink4" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
    <ig:HtmlScript ID="HtmlScript1" runat="server" Type="text/javascript" Src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <div id="Div1" class="ControlPanelHeader">
        <img src="/samplesbrowser/samplescommon/aspnet/Common/config.png" />
        <%= this.GetGlobalResourceObject("WebEditors","WebTextEditorUsingBasicCPTitle") %>
    </div>
    <div id="Div2" class="controlPanel">
        <div id="Div3" class="controlPanelEvent">
            <div id="eventList">
                <div id="countContainer" class="controlPanelEventShort">
                    <span class="leftTitle">
                        <%= this.GetGlobalResourceObject("WebEditors","WebTextEditorUsingBasicCPStart") %></span><span id="selectionStartSpan">0</span>
                    <br />
                    <span class="leftTitle">
                        <%= this.GetGlobalResourceObject("WebEditors","WebTextEditorUsingBasicCPEnd") %></span><span id="selectionEndSpan">0</span>
                    <br />
                    <span class="leftTitle">
                        <%= this.GetGlobalResourceObject("WebEditors","WebTextEditorUsingBasicCPSelected") %></span><span id="selectedTextSpan"></span>
                    <br />
                    <span class="leftTitle">
                        <%= this.GetGlobalResourceObject("WebEditors","WebTextEditorUsingBasicCPStartText") %></span><span id="currentTextSpan"></span>
                </div>
            </div>
        </div>
        <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="360px" Width="650px"
            Modal="false" WindowState="Normal" Resizer-Enabled="false" Moveable="False" Top="280px"
            BackColor="Transparent" Left="20px" CssClass="dialog-window">
            <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebEditors,  ControlName%>"
                MinimizeBox-Visible="true">
                <MinimizeBox Visible="false"></MinimizeBox>
                <CloseBox Visible="False"></CloseBox>
            </Header>
            <ContentPane ScrollBars="Hidden">
                <Template>
                    <div style="padding: 20px;" class="css_form">
                        <table width="100%">
                            <tr>
                                <td valign="top">
                                    <label>
                                        <%= this.GetGlobalResourceObject("WebEditors","WebEditors_ClientInteraction_BasicSingleEditor")%></label>
                                    <br />
                                    <ig:WebTextEditor Height="20px" ID="BasicSingleEditor" runat="server">
                                        <ClientEvents Focus="showCaret" KeyUp="showCaret" MouseMove="mouseMoveEvt" TextChanged="showCaret" />
                                    </ig:WebTextEditor>
                                    <br />
                                    <br />
                                    <label>
                                        <%= this.GetGlobalResourceObject("WebEditors","WebEditors_ClientInteraction_PasswordEditor")%></label>
                                    <br />
                                    <ig:WebTextEditor Height="20px" ID="Password" runat="server" TextMode="Password"
                                        MaxLength="16" CssClass="loginControls">
                                        <ClientEvents Focus="showCaret" KeyUp="showCaret" MouseMove="mouseMoveEvt" Spin="showCaret"
                                            TextChanged="showCaret" />
                                    </ig:WebTextEditor>
                                    <br />
                                    <br />
                                    <label>
                                        <%= this.GetGlobalResourceObject("WebEditors","WebEditors_ClientInteraction_BasicDateTimeEditor")%></label>
                                    <br />
                                    <ig:WebDateTimeEditor Height="20px" ID="BasicDateTimeEditor" runat="server">
                                        <ClientEvents Focus="showCaret" KeyUp="showCaret" MouseMove="mouseMoveEvt" Spin="showCaret"
                                            TextChanged="showCaret" />
                                    </ig:WebDateTimeEditor>
                                    <br />
                                    <br />
                                    <label>
                                        <%= this.GetGlobalResourceObject("WebEditors","WebEditors_ClientInteraction_BasicNumericEditor") %></label>
                                    <br />
                                    <ig:WebNumericEditor Height="20px" ID="BasicNumericEditor" runat="server">
                                        <ClientEvents Focus="showCaret" KeyUp="showCaret" MouseMove="mouseMoveEvt" Spin="showCaret"
                                            TextChanged="showCaret" />
                                    </ig:WebNumericEditor>
                                    <br />
                                    <br />
                                </td>
                                <td valign="top">
                                    <label>
                                        <%= this.GetGlobalResourceObject("WebEditors","WebEditors_ClientInteraction_BasicPercentEditor")%></label>
                                    <br />
                                    <ig:WebPercentEditor Height="20px" ID="BasicPercentEditor" runat="server">
                                        <ClientEvents Focus="showCaret" KeyUp="showCaret" MouseMove="mouseMoveEvt" Spin="showCaret"
                                            TextChanged="showCaret" />
                                    </ig:WebPercentEditor>
                                    <br />
                                    <br />
                                    <label>
                                        <%= this.GetGlobalResourceObject("WebEditors","WebEditors_ClientInteraction_BasicCurrencyEditor")%></label>
                                    <br />
                                    <ig:WebCurrencyEditor Height="20px" ID="BasicCurrencyEditor" runat="server">
                                        <ClientEvents Focus="showCaret" KeyUp="showCaret" MouseMove="mouseMoveEvt" Spin="showCaret"
                                            TextChanged="showCaret" />
                                    </ig:WebCurrencyEditor>
                                    <br />
                                    <br />
                                    <label>
                                        <%= this.GetGlobalResourceObject("WebEditors","WebEditors_ClientInteraction_SpinButtonEditor")%></label>
                                    <br />
                                    <ig:WebTextEditor Height="20px" ID="SpinButtonEditor" runat="server" Width="150px"
                                        ReadOnly="true" CssClass="list">
                                        <ClientEvents Focus="showCaret" KeyUp="showCaret" MouseMove="mouseMoveEvt" Spin="showCaret"
                                            TextChanged="showCaret" />
                                        <Buttons SpinButtonsDisplay="OnRight" ListOfValues="Red|Blue|White|Green|Yellow"
                                            SpinWrap="True" SpinOnArrowKeys="true" SpinOnReadOnly="true">
                                        </Buttons>
                                    </ig:WebTextEditor>
                                    <br />
                                    <br />
                                    <label>
                                        <%= this.GetGlobalResourceObject("WebEditors","WebEditors_ClientInteraction_MaskedEditor")%></label>
                                    <br />
                                    <ig:WebMaskEditor Height="20px" ID="PhoneNumberWithExtEditor" runat="server" InputMask="<%$ Resources:WebEditors, WebEditorMaskBasicPhoneExtMask %>"
                                        DisplayMode="Mask">
                                        <ClientEvents Focus="showCaret" KeyUp="showCaret" MouseMove="mouseMoveEvt" Spin="showCaret"
                                            TextChanged="showCaret" />
                                    </ig:WebMaskEditor>
                                    <br />
                                    <span class="special_text">
                                        <%= this.GetGlobalResourceObject("WebEditors","WebEditorMaskBasicPhoneExtMask") %></span>
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </div>
                </Template>
            </ContentPane>
        </ig:WebDialogWindow>

        <script type="text/javascript">

            function mouseMoveEvt(editor, evtArgs) {
                if (editor.hasFocus())
                    showCaret(editor);
            }

            function showCaret(editor, evtArgs) {
                var text = editor.get_text();
                var selText = editor.getSelectedText();
                var selStart = editor.getSelection(true);
                var selEnd = editor.getSelection(false);
                $get('selectionStartSpan').innerHTML = selStart;
                $get('selectionEndSpan').innerHTML = selEnd;
                $get('selectedTextSpan').innerHTML = selText;
                $get('currentTextSpan').innerHTML = text;
            }
        </script>
</asp:Content>
