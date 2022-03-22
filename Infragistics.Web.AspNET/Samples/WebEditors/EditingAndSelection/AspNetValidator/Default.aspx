<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/css_form.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
        function ClientPasswordValidate(source, agruments) {
            if (arguments[1].Value.toString().length > 3) {
                arguments[1].IsValid = true;
            } else {
                arguments[1].IsValid = false;
            }
        }
    </script>

    <ig:WebDialogWindow runat="server" ID="RegistrationFormDialog" Height="300px" Width="650px"
        Modal="false" WindowState="Normal" Resizer-Enabled="false" Moveable="False" Top="100px"
        BackColor="Transparent" Left="20px" CssClass="dialog-window">
        <Header CloseBox-Visible="false" CaptionText="<%$ Resources:WebEditors, WebEditorValidationFormTitle %>"
            MinimizeBox-Visible="true">
            <MinimizeBox Visible="false"></MinimizeBox>
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane ScrollBars="Hidden">
            <Template>
                <div class="css_form" style="padding: 20px;">
                    <table border="0" cellspacing="5" cellpadding="0">
                        <tr>
                            <td>
                                <label>
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorValidationLabelUserName") %></label>
                            </td>
                            <td>
                                <ig:WebTextEditor ID="UserNameEditor" Height="20px" runat="server" />
                                <asp:RequiredFieldValidator ID="UserNameValidator" runat="server" ControlToValidate="UserNameEditor"
                                    ErrorMessage="*" Display="Dynamic"  ValidationGroup="RegistrationForm">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorValidationLabelEmail") %></label>
                            </td>
                            <td>
                                <ig:WebTextEditor ID="EmailEditor" Height="20px" runat="server" />
                                <asp:RequiredFieldValidator ID="EmailEditorRequiredValidator" runat="server" ControlToValidate="EmailEditor"
                                    ErrorMessage="*" Display="Dynamic" ValidationGroup="RegistrationForm">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="EmailEditorValidator" runat="server" ControlToValidate="EmailEditor"
                                    ErrorMessage="<%$ Resources:WebEditors, WebEditorValidationEmailErrMsg2 %>" Display="Dynamic"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" style="white-space:nowrap" ValidationGroup="RegistrationForm">
                        <%= this.GetGlobalResourceObject("WebEditors","WebEditorValidationEmailErrMsg2") %></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorValidationLabelEmail2") %></label>
                            </td>
                            <td>
                                <ig:WebTextEditor ID="EmailEditorTypeAgain" Height="20px" runat="server" />
                                <asp:RequiredFieldValidator ID="EmailEditorTypeAgainRequiredValidator" runat="server"
                                    ControlToValidate="EmailEditorTypeAgain" ErrorMessage="*" Display="Dynamic" ValidationGroup="RegistrationForm">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="EmailValidator" runat="server" ControlToValidate="EmailEditorTypeAgain"
                                    ControlToCompare="EmailEditor" ErrorMessage="<%$ Resources:WebEditors, WebEditorValidationEmailErrMsg %>"
                                    ValidationGroup="RegistrationForm" Display="Dynamic" style="white-space:nowrap"><%= this.GetGlobalResourceObject("WebEditors","WebEditorValidationEmailErrMsg") %> </asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorValidationLabelPassword") %></label>
                            </td>
                            <td>
                                <ig:WebTextEditor ID="PasswordEditor" Height="20px" runat="server" TextMode="Password" />
                                <asp:RequiredFieldValidator ID="PasswordEditorRequiredValidator" runat="server" ControlToValidate="PasswordEditor"
                                    ErrorMessage="*" Display="Dynamic" ValidationGroup="RegistrationForm">*</asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="PasswordEditorValidator" runat="server" ControlToValidate="PasswordEditor"
                                    ClientValidationFunction="ClientPasswordValidate" OnServerValidate="PasswordEditor_ServerValidate"
                                    ErrorMessage="<%$ Resources:WebEditors, WebEditorValidationPasswordErrMsg2 %>"
                                    Display="Dynamic" ValidationGroup="RegistrationForm" style="white-space:nowrap">
                        <%= this.GetGlobalResourceObject("WebEditors","WebEditorValidationPasswordErrMsg2") %></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    <%= this.GetGlobalResourceObject("WebEditors","WebEditorValidationLabelPassword2") %></label>
                            </td>
                            <td>
                                <ig:WebTextEditor ID="PasswordEditorTypeAgain" Height="20px" runat="server" TextMode="Password" />
                                <asp:RequiredFieldValidator ID="PasswordEditorTypeAgainRequiredValidator" runat="server"
                                    ControlToValidate="PasswordEditorTypeAgain" ErrorMessage="*" Display="Dynamic"
                                    ValidationGroup="RegistrationForm" style="white-space:nowrap">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="PasswordValidator" runat="server" ControlToValidate="PasswordEditorTypeAgain"
                                    ControlToCompare="PasswordEditor" ErrorMessage="<%$ Resources:WebEditors, WebEditorValidationPasswordErrMsg %>"
                                    Display="Dynamic" ValidationGroup="RegistrationForm" style="white-space:nowrap"><%= this.GetGlobalResourceObject("WebEditors","WebEditorValidationPasswordErrMsg")%>
                                </asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="cheat">
                                </label>
                            </td>
                            <td>
                                <asp:Button runat="server" ID="btnSubmit" ValidationGroup="RegistrationForm" Text="<%$ Resources:WebEditors, WebEditorValidationSubmitButton %>"
                                    CssClass="submit" CausesValidation="true" OnClick="btnSubmit_Click" />
                                <asp:Label runat="server" ID="lblStatus" ForeColor="Green"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
</asp:Content>
