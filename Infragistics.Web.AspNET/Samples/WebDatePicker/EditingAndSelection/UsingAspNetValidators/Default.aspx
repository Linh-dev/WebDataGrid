<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
     <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
        function ClientValidate(source, agruments) {
            if ($find("<%= this.WebDatePicker1.ClientID %>").get_date().format("ddMMyyyy") ==
                $find("<%= this.WebDatePicker2.ClientID %>").get_date().format("ddMMyyyy")) {
                arguments[1].IsValid = true;
            } else {
                arguments[1].IsValid = false;
            }
        }
    </script>

    <br />
    <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="350px" Width="340px"
        Modal="false" WindowState="Normal" Resizer-Enabled="false" Moveable="False" Top="80px"
        BackColor="Transparent" Left="20px" CssClass="dialog-window">
        <Header CloseBox-Visible="false" CaptionText="WebDatePicker"
            MinimizeBox-Visible="true">
            <MinimizeBox Visible="false"></MinimizeBox>
            <CloseBox Visible="False"></CloseBox>
        </Header>
        <ContentPane ScrollBars="Hidden">
            <Template>
                <div style="padding: 40px;">
                    <div class="calendar_container">
                        <ig:WebDatePicker runat="server" ID="WebDatePicker1" StyleSetName="Claymation" Width="225px">
                        </ig:WebDatePicker>
                        <asp:RequiredFieldValidator ID="requiredFieldValidator_WebDatePicker1" ControlToValidate="WebDatePicker1"
                            runat="server" ErrorMessage="*" Display="Dynamic" ValidationGroup="ValidationGroup"><%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_Validation_RequiredFieldErrMsg") %>
                        </asp:RequiredFieldValidator>
                    </div>
                    <br style="clear: both;">
                    <br>
                    <div class="calender_container">
                        <ig:WebDatePicker runat="server" ID="WebDatePicker2" StyleSetName="Claymation" Width="225px">
                        </ig:WebDatePicker>
                        <asp:RequiredFieldValidator ID="requiredFieldValidator_WebDatePicker2" ControlToValidate="WebDatePicker2"
                            runat="server" ErrorMessage="*" Display="Dynamic" ValidationGroup="ValidationGroup"><%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_Validation_RequiredFieldErrMsg") %>
                        </asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CustomValidator_WebDatePicker2" runat="server" ControlToValidate="WebDatePicker2"
                            ClientValidationFunction="ClientValidate" ErrorMessage="<%$ Resources:WebDatePicker, WebDatePicker_Validation_CompareValidator_ErrMsg %>"
                            Display="Dynamic" ValidationGroup="ValidationGroup">
                        <%= this.GetGlobalResourceObject("WebDatePicker","WebDatePicker_Validation_CompareValidator_ErrMsg")%>
                        </asp:CustomValidator>
                    </div>
                    <br style="clear: both;">
                    <br>
                    <asp:Button runat="server" ID="btnSubmit" ValidationGroup="ValidationGroup" Text="<%$ Resources:WebDatePicker, WebDatePicker_Validation_SubmitButton %>"
                        OnClick="btnSubmit_Click" CausesValidation="true" />
                </div>
            </Template>
        </ContentPane>
    </ig:WebDialogWindow>
</asp:Content>

