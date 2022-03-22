<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:HtmlLink  runat="server" type="text/css" rel="Stylesheet" href="Style.css" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <div>
        <div style="height: 50px; width: 600px; background-image: url(<%= this.GetGlobalResourceObject("WebProgressBar","WizardImage") %>);
            background-repeat: no-repeat;">
            <div style="position: relative; top: 15px; right: 20px; float: right;">
                <ig:WebProgressBar ID="wpbOne" Width="200px" Height="20px" runat="server" Value="0"
                    Minimum="0" Maximum="100" LabelAlignment="Running" StyleSetName="RedPlanet">
                </ig:WebProgressBar>
            </div>
        </div>
        <div class="form">
            <asp:UpdatePanel ID="upOne" runat="server">
                <ContentTemplate>
                    <asp:Wizard ID="wizOne" runat="server" CssClass="wizard">
                        <SideBarStyle CssClass="wizard_sidebar" />
                        <StepStyle CssClass="wizard_content" />
                        <StepNextButtonStyle CssClass="button" />
                        <StartNextButtonStyle CssClass="button" />
                        <StepPreviousButtonStyle CssClass="button" />
                        <FinishPreviousButtonStyle CssClass="button" />
                        <FinishCompleteButtonStyle CssClass="button" />
                        <WizardSteps>
                            <asp:WizardStep ID="WizardStep0" runat="server" StepType="Start" Title="<%$ Resources:WebProgressBar, WizardStep1 %>">
                                <%= this.GetGlobalResourceObject("WebProgressBar","WizardStep0Description") %>
                                <br />
                                <label for="<%=emailaddress.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardEmailLabel") %>:</label>
                                &nbsp;
                                <asp:TextBox runat="server" ID="emailaddress" Text="" /><br />
                                <label for="<%=password.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardPasswordLabel") %>:</label>
                                &nbsp;
                                <asp:TextBox runat="server" ID="password" Text="" TextMode="Password" /><br />
                                <label for="<%=password2.ClientID %>" style="white-space: nowrap;">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardPassword2Label")%>:</label>
                                &nbsp;
                                <asp:TextBox runat="server" ID="password2" Text="" TextMode="Password" /><br />
                            </asp:WizardStep>
                            <asp:WizardStep ID="WizardStep1" runat="server" StepType="Auto" Title="<%$ Resources:WebProgressBar, WizardStep2 %>">
                                <%= this.GetGlobalResourceObject("WebProgressBar","WizardStep1Description")%>
                                <br />
                                <label for="<%=name.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardNameLabel") %>:</label>
                                <asp:TextBox runat="server" ID="name" Text="" /><br />
                                <label for="<%=address.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardAddressLabel")%>:</label>
                                <asp:TextBox runat="server" ID="address" Text="" /><br />
                                <label for="<%=city.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardCityLabel")%>:</label>
                                <asp:TextBox runat="server" ID="city" Text="" /><br />
                                <label for="<%=state.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardStateLabel")%>:</label>
                                <asp:TextBox runat="server" ID="state" Text="" /><br />
                                <label for="<%=postalcode.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardPostalCodeLabel") %>:</label>
                                <asp:TextBox runat="server" ID="postalcode" Text="" /><br />
                            </asp:WizardStep>
                            <asp:WizardStep ID="WizardStep2" runat="server" StepType="Auto" Title="<%$ Resources:WebProgressBar, WizardStep3 %>">
                                <%= this.GetGlobalResourceObject("WebProgressBar","WizardStep2Description")%>
                                <br />
                                <label for="<%=phone.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardPhoneLabel") %>:</label>
                                <asp:TextBox runat="server" ID="phone" Text="" /><br />
                                <label for="<%=fax.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardFaxLabel") %>:</label>
                                <asp:TextBox runat="server" ID="fax" Text="" /><br />
                            </asp:WizardStep>
                            <asp:WizardStep ID="WizardStep3" runat="server" StepType="Finish" Title="<%$ Resources:WebProgressBar, WizardStep4 %>">
                                <%= this.GetGlobalResourceObject("WebProgressBar","WizardStep3Description")%>
                                <label for="<%=comments.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardCommentsLabel") %>:</label>
                                <asp:TextBox ID="comments" runat="server" TextMode="MultiLine" Height="125px" />
                                <br />
                            </asp:WizardStep>
                            <asp:WizardStep ID="WizardStep4" runat="server" StepType="Complete" Title="<%$ Resources:WebProgressBar, WizardStep5 %>">
                                <%= this.GetGlobalResourceObject("WebProgressBar","WizardStep4Description")%>
                                <label for="<%=lblEmail.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardEmailLabel") %>:</label>
                                <asp:Label ID="lblEmail" runat="server" /><br />
                                <label for="<%=lblName.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardNameLabel") %>:</label>
                                <asp:Label runat="server" ID="lblName" Text="" /><br />
                                <label for="<%=lblAddress.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardAddressLabel")%>:</label>
                                <asp:Label runat="server" ID="lblAddress" Text="" /><br />
                                <label for="<%=lblCity.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardCityLabel")%>:</label>
                                <asp:Label runat="server" ID="lblCity" Text="" /><br />
                                <label for="<%=lblState.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardStateLabel")%></label>
                                <asp:Label runat="server" ID="lblState" Text="" /><br />
                                <label for="<%=lblPostalCode.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardPostalCodeLabel") %>:</label>
                                <asp:Label runat="server" ID="lblPostalCode" Text="" /><br />
                                <label for="<%=lblPhone.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardPhoneLabel") %>:</label>
                                <asp:Label runat="server" ID="lblPhone" Text="" /><br />
                                <label for="<%=lblFax.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardFaxLabel") %>:</label>
                                <asp:Label runat="server" ID="lblFax" Text="" /><br />
                                <label for="<%=litComments.ClientID %>">
                                    <%= this.GetGlobalResourceObject("WebProgressBar","WizardCommentsLabel") %>:</label>
                                <p>
                                    <asp:Literal ID="litComments" runat="server" /></p>
                                <br />
                            </asp:WizardStep>
                        </WizardSteps>
                    </asp:Wizard>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="background-image: url(/SamplesBrowser/SamplesCommon/aspnet/WebProgressBar/Navigation/Wizard/wpb_WizFooter.png); background-repeat: repeat-x;
                height: 27px;">
            </div>
        </div>
    </div>

    <script type="text/javascript">

        var postbackElement;
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginRequest);
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoaded);

        function beginRequest(sender, args) {
            postbackElement = args.get_postBackElement();
        }

        function pageLoaded(sender, args) {

            if (typeof (postbackElement) === "undefined") {
                return;
            }
            else {

                if (postbackElement.id.toLowerCase().indexOf('sidebarbutton') > -1) {
                    return;
                }

                bar = $find('<%= wpbOne.ClientID %>');
                i = bar.get_progressValue();

                if (postbackElement.id.toLowerCase().indexOf('next') > -1) {
                    i = i + 25;
                }
                else if (postbackElement.id.toLowerCase().indexOf('previous') > -1) {
                    i = i - 25;
                }
                else if (postbackElement.id.toLowerCase().indexOf('finish') > -1) {
                    i = 100;
                }

                bar.set_progressValue(i);
            }
        }

    </script>
</asp:Content>
