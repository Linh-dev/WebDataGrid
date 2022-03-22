<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <asp:UpdatePanel runat="server" ID="UpdatePanel1" ChildrenAsTriggers="True" UpdateMode="Always"
            RenderMode="Inline">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <div>
                                <igsb:LocalizedImage ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDropDown/EditingAndSelection/Validation/eng/ValidationHeaderBig.png" ID="imgValidationHeaderBig"
                                    AlternateText="<%$ Resources:WebDropDown, ValidationImgAlt %>" runat="server">
                                </igsb:LocalizedImage>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC; padding: 20px;">
                            <div style="border: 1px solid #EEEEEE; background-color: #FAFAFA; padding: 10px;
                                padding-left: 150px;">
                                <table width="80%" cellspacing="0" border="0" style="margin-left: 30px;">
                                    <tr style="height: 30px;">
                                        <td>
                                            <%= this.GetGlobalResourceObject("WebDropDown","ValidationRequiredFieldLabel") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ig:WebDropDown ID="DD" runat="server" Width="200px" EnableDropDownAsChild="false" DropDownContainerWidth="200px"
                                                DropDownContainerHeight="200px">
                                            </ig:WebDropDown>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="Button1" runat="server" Text="<%$ Resources:WebDropDown, ValidationSubmitLabel %>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rfvWebDropDown3" runat="server" Display="Dynamic"
                                                Text="<%$ Resources:WebDropDown, ValidationRequiredValidationFailed %>" ControlToValidate="DD" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <img src="/samplesbrowser/samplescommon/aspnet/WebDropDown/EditingAndSelection/Validation/wdd_AdvSearchFooter.png" alt="" /></div>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>

