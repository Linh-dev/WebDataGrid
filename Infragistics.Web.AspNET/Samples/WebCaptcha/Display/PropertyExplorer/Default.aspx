<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCaptcha_Display_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="/SamplesBrowser/SamplesCommon/aspnet/WebCaptcha/Display/JScript.js" type="text/javascript"></script>
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="SampleContainer">
        <div class="ProtectionModesInfo">
            <img src="/samplesbrowser/samplescommon/aspnet/WebCaptcha/Display/Information16.png" />
            <%= this.GetGlobalResourceObject("WebCaptcha","PropertyExplorerProtectionModes")%>:
            <ul>
                <li>
                    <%= this.GetGlobalResourceObject("WebCaptcha","PropertyExplorerCaptchaMode")%>
                </li>
                <li>
                    <%= this.GetGlobalResourceObject("WebCaptcha","PropertyExplorerTimeoutMode")%>
                </li>
                <li>
                    <%= this.GetGlobalResourceObject("WebCaptcha","PropertyExplorerInvisibleMode")%>
                </li>
            </ul>
        </div>
        <asp:UpdatePanel runat="server" ID="UpdatePanel1" ChildrenAsTriggers="True" UpdateMode="Always"
            >
            <ContentTemplate>
                <div style="margin-top: 15px; margin-left: 30px; width: 250px; height: 200px">
                    <ig:WebCaptcha ID="WebCaptcha1" runat="server">
                    <AudioButton AltText="<%$ Resources:WebCaptcha, PropertyExplorerAudio %>" />
                    <RefreshButton AltText="<%$ Resources:WebCaptcha, PropertyExplorerRefresh %>" />
                    </ig:WebCaptcha>
                    <asp:Label ID="LblValidation" runat="server" BackColor="Green" ForeColor="White"></asp:Label>
                </div>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <div style="position: absolute">
                             <img src="/SamplesBrowser/SamplesCommon/aspnet/common/ajax-loader.gif" alt='<%= this.GetGlobalResourceObject("WebCaptcha","PropertyExplorerLoading")%>'/>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:Panel ID="PropPanel" runat="server" Style="">
                    <table style="width: 50%;">
                        <tr class="itemRow">
                            <td class="FirstRow">
                               <%= this.GetGlobalResourceObject("WebCaptcha", "PropertyExplorerProtectionMode")%>:
                            </td>
                            <td>
                                <asp:DropDownList CssClass="PropDropDown" ID="ddProtectionMode" runat="server" AutoPostBack="true" />
                            </td>
                        </tr>
                    </table>
                    
                </asp:Panel>
				<asp:Panel ID="CaptchaModePanel" runat="server" CssClass="PropModePanel" Style="position : static">
                        <table style="width: 50%; margin-top: -1px;">
                            <tr class="altRow">
                                <td class="FirstRow">
                                   <%= this.GetGlobalResourceObject("WebCaptcha", "PropertyExplorerDictionaryMode")%>:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddDictionaryMode" CssClass="PropDropDown" runat="server" AutoPostBack="true" />
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="WordsModeProps" runat="server">
                            <table style="width: 100%; margin-top: -2px">
                                <tr class="itemRow">
                                    <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebCaptcha", "PropertyExplorerBackgroundNoise")%>:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddBackgroundNoise" CssClass="PropDropDown" runat="server" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebCaptcha", "PropertyExplorerLinesNoise")%>:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddLinesNoise" CssClass="PropDropDown" runat="server" AutoPostBack="true" />
                                    </td>
                                </tr>
                                <tr class="altRow">
                                    <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebCaptcha", "PropertyExplorerRandomFonts")%>:
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="CheckBoxRandomFonts" Text="<%$ Resources:WebCaptcha, PropertyExplorerEnable %>"
                                        AutoPostBack="true" Checked="false" runat="server" />
                                    </td>
                                    <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebCaptcha", "PropertyExplorerFontWarp")%>:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddFontWarping" runat="server" CssClass="PropDropDown" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr class="itemRow">
                                    <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebCaptcha", "PropertyExplorerBackgroundColor")%>:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddBackgroundColor" runat="server" CssClass="PropDropDown" AutoPostBack="true">
                                        <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerColor0 %>" Value="Red"></asp:ListItem>
                                        <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerColor1 %>" Value="Green"></asp:ListItem>
                                        <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerColor2 %>" Value="Blue"></asp:ListItem>
                                        <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerColor3 %>" Value="Gray"></asp:ListItem>
                                        <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerColor4 %>" Selected="True"
                                            Value="White"></asp:ListItem>
                                        <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerColor5 %>" Value="Black"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebCaptcha", "PropertyExplorerRotationNoise")%>:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddRotationNoise" runat="server" CssClass="PropDropDown" AutoPostBack="true" />
                                    </td>
                                </tr>
                                <tr class="altRow">
                                    <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebCaptcha", "PropertyExplorerTextColor")%>:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddTextColor" runat="server" CssClass="PropDropDown" AutoPostBack="true">
                                        <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerColor0 %>" Value="Red"></asp:ListItem>
                                        <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerColor1 %>" Value="Green"></asp:ListItem>
                                        <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerColor2 %>" Value="Blue"></asp:ListItem>
                                        <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerColor3 %>" Selected="True"
                                            Value="Gray"></asp:ListItem>
                                        <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerColor4 %>" Value="White"></asp:ListItem>
                                        <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerColor5 %>" Value="Black"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="textAlignR">
                                        <%= this.GetGlobalResourceObject("WebCaptcha", "PropertyExplorerCaseSensitivity")%>:
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="CheckBoxCaseSensitivity" Text="<%$ Resources:WebCaptcha, PropertyExplorerEnable %>" 
                                        AutoPostBack="true" Checked="false" runat="server" />
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="OffModeProps" CssClass="CaptchaOffMode" runat="server" Style="padding-bottom : 25px;">
                                <table style="width: 100%; margin-top: -3px; display : none;">
                                    <tr class="itemRow">
                                        <td class="textAlignR">
                                            <%= this.GetGlobalResourceObject("WebCaptcha", "PropertyExplorerTextLength")%>:
                                        </td>
                                        <td style="width: 25%;">
                                            <asp:DropDownList ID="ddTextLength" runat="server" CssClass="PropDropDown" AutoPostBack="true">
                                            <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerCharacters0 %>" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerCharacters1 %>" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerCharacters2 %>" Selected="True"
                                                Value="5"></asp:ListItem>
                                            <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerCharacters3 %>" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerCharacters4 %>" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerCharacters5 %>" Value="8"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="textAlignR" style="width: 25%;">
                                            <%= this.GetGlobalResourceObject("WebCaptcha", "PropertyExplorerUniqueChars")%>:
                                        </td>
                                        <td style="width: 25%;">
                                            <asp:CheckBox ID="CheckBoxUniqueChars" Text="<%$ Resources:WebCaptcha, PropertyExplorerEnable %>" 
                                            AutoPostBack="true" Checked="true" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </asp:Panel>
                    </asp:Panel>
				<asp:Panel ID="TimeoutModePanel" CssClass="PropModePanel" runat="server" Style="position : static">
                        <table style="width: 50%; margin-top: -1px;">
                            <tr class="altRow">
                                <td class="FirstRow">
                                  <%= this.GetGlobalResourceObject("WebCaptcha", "PropertyExplorerTimeout")%>:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddTimeoutSeconds" CssClass="PropDropDown" runat="server" AutoPostBack="true">
                                    <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerSeconds0 %>" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerSeconds1 %>" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerSeconds2 %>" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerSeconds3 %>" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerSeconds4 %>" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="<%$ Resources: WebCaptcha, PropertyExplorerSeconds5 %>" Value="13"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <asp:Button CssClass="SubmitBtn" ID="TimeoutSubmit" runat="server" Text="<%$ Resources: WebCaptcha, PropertyExplorerSubmit %>" />
                    </asp:Panel>
                    <asp:Panel ID="InvisibleModePanel" CssClass="PropModePanel" runat="server" Style="position : static">
                        <table style="width: 50%; margin-top: -1px;">
                            <tr class="altRow">
                                <td class="FirstRow">
                                    <%= this.GetGlobalResourceObject("WebCaptcha", "PropertyExplorerEdit")%>:
                                </td>
                                <td>
                                    <asp:CheckBox ID="CheckBoxFillInput" runat="server" AutoPostBack="true" onclick="fillInvisibleTextBox(this);" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <script type="text/javascript">
        var fadingInOpacity = 0;
        var opacity = 1;
        var alpha = 100;
        var previousProtectionIndex = -1;
        var previousDictionaryIndex = 0;

        function fillInvisibleTextBox(sender) {
            var textBox = $get("<%= WebCaptcha1.ClientID %>__textbox");
            if (sender.checked) {
                textBox.value = "test";
            }
            else {
                textBox.value = "";
            }
        }

        function PropertyFadeAnimation() {

            var ddProtectionMode = document.getElementById("<%=ddProtectionMode.ClientID %>");
            var InvPropsPanel = document.getElementById("<%=InvisibleModePanel.ClientID %>");
            var CaptchaPropsPanel = document.getElementById("<%=CaptchaModePanel.ClientID %>");
            var TimeoutPropsPanel = document.getElementById("<%=TimeoutModePanel.ClientID %>");


            if (previousProtectionIndex == -1) {
                InvPropsPanel.style.display = "none";
                TimeoutPropsPanel.style.display = "none";
                previousProtectionIndex = 0;
                return;
            }

            switch (ddProtectionMode.selectedIndex) {
                case 0:
                    switch (previousProtectionIndex) {
                        case 0:
                            InvPropsPanel.style.display = "none";
                            TimeoutPropsPanel.style.display = "none";
                            DictionaryModeChanged();
                            break;
                        case 1:
                            callFadeOut(TimeoutPropsPanel);
                            InvPropsPanel.style.display = "none";
                            FadingAnimationDictionary(true);
                            break;
                        case 2:
                            callFadeOut(InvPropsPanel);
                            TimeoutPropsPanel.style.display = "none";
                            FadingAnimationDictionary(true);
                            break;
                    }
                    previousProtectionIndex = 0;
                    break;
                case 1:
                    switch (previousProtectionIndex) {
                        case 0:
                            FadingAnimationDictionary(false);
                            InvPropsPanel.style.display = "none";
                            callFadeIn(TimeoutPropsPanel);
                            break;
                        case 1:
                            InvPropsPanel.style.display = "none";
                            CaptchaPropsPanel.style.display = "none";
                            break;
                        case 2:
                            callFadeOut(InvPropsPanel);
                            CaptchaPropsPanel.style.display = "none";
                            callFadeIn(TimeoutPropsPanel);
                            break;
                    }
                    previousProtectionIndex = 1;
                    break;
                case 2:
                    switch (previousProtectionIndex) {
                        case 0:
                            FadingAnimationDictionary(false);
                            TimeoutPropsPanel.style.display = "none";
                            callFadeIn(InvPropsPanel);
                            break;
                        case 1:
                            callFadeOut(TimeoutPropsPanel);
                            CaptchaPropsPanel.style.display = "none";
                            callFadeIn(InvPropsPanel);
                            break;
                        case 2:
                            TimeoutPropsPanel.style.display = "none";
                            CaptchaPropsPanel.style.display = "none";
                            break;
                    }
                    previousProtectionIndex = 2;
                    break;
            }
        }

        function DictionaryModeChanged() {
            var ddDictionaryMode = document.getElementById("<%=ddDictionaryMode.ClientID%>");

            if (previousDictionaryIndex == ddDictionaryMode.selectedIndex) {
                switch (previousDictionaryIndex) {
                    case 0:
                        break;
                    case 1:
                        document.getElementById("<%=OffModeProps.ClientID%>").style.display = "none";
                        break;
                    case 2:
                        document.getElementById("<%=OffModeProps.ClientID%>").style.display = "none";
                        document.getElementById("<%=WordsModeProps.ClientID%>").style.display = "none";
                        break;
                }
            }
            else
                FadingAnimationDictionary(ddDictionaryMode.selectedIndex);

        }


        function FadingAnimationDictionary(fadingIn) {

            var wordsPanelProps = document.getElementById("<%=WordsModeProps.ClientID%>");
            var offModePanelProps = document.getElementById("<%=OffModeProps.ClientID%>");
            var CaptchaPropsPanel = document.getElementById("<%=CaptchaModePanel.ClientID%>");
            var ddDictionaryMode = document.getElementById("<%=ddDictionaryMode.ClientID%>");



            switch (ddDictionaryMode.selectedIndex) {
                case 0:
                    switch (previousDictionaryIndex) {
                        case 0:
                            if (!fadingIn)
                                callFadeOut(CaptchaPropsPanel);
                            else
                                callFadeIn(CaptchaPropsPanel);
                            break;
                        case 1:
                            callFadeIn(offModePanelProps);
                            break;
                        case 2:
                            callFadeIn(wordsPanelProps);
                            break;
                    }
                    previousDictionaryIndex = 0;
                    break;
                case 1:
                    switch (previousDictionaryIndex) {
                        case 0:
                            callFadeOut(offModePanelProps);
                            break;
                        case 1:
                            if (!fadingIn) {
                                callFadeOut(CaptchaPropsPanel);
                                offModePanelProps.style.display = "none";
                            }
                            else {
                                callFadeIn(CaptchaPropsPanel);
                                offModePanelProps.style.display = "none";
                            }
                            break;
                        case 2:
                            callFadeIn(wordsPanelProps);
                            offModePanelProps.style.display = "none";
                            break;
                    }
                    previousDictionaryIndex = 1;
                    break;
                case 2:
                    switch (previousDictionaryIndex) {
                        case 0:
                            callFadeOut(wordsPanelProps);
                            break;
                        case 1:
                            callFadeOut(wordsPanelProps);
                            offModePanelProps.style.display = "none";
                            break;
                        case 2:
                            if (!fadingIn) {
                                callFadeOut(CaptchaPropsPanel);
                                wordsPanelProps.style.display = "none";
                                offModePanelProps.style.display = "none";
                            }
                            else {
                                callFadeIn(CaptchaPropsPanel);
                                wordsPanelProps.style.display = "none";
                                offModePanelProps.style.display = "none";
                            }
                            break;
                    }
                    previousDictionaryIndex = 2;
                    break;

            }

        }
    </script>
</asp:Content>
