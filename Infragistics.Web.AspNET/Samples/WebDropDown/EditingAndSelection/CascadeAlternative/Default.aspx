<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" ChildrenAsTriggers="True" UpdateMode="Always"
        RenderMode="Inline">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div>
                            <igsb:LocalizedImage ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDropDown/EditingAndSelection/CascadeAlternative/eng/CascadeHeaderBig.png" ID="imgCascadeHeaderBig"
                                AlternateText="<%$ Resources:WebDropDown, CascadeImgAlt %>" runat="server">
                            </igsb:LocalizedImage>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="border-left: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC; padding: 20px;">
                        <div style="border: 1px solid #EEEEEE; background-color: #fafafa; padding: 10px;
                            padding-left: 150px;">
                            <table width="100%" cellspacing="0" border="0">
                                <tr style="height: 30px;">
                                    <td>
                                        <%= this.GetGlobalResourceObject("WebDropDown","CascadeCountryLabel") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <ig:WebDropDown ID="WebDropDownCountry" runat="server" EnableDropDownAsChild="false" DropDownAnimationDuration="500"
                                            Width="200px" DropDownContainerWidth="200px">
                                            <AutoPostBackFlags SelectionChanged="On" />
                                            <ClientEvents />
                                        </ig:WebDropDown>
                                    </td>
                                </tr>
                                <tr style="height: 30px;">
                                    <td>
                                        <%= this.GetGlobalResourceObject("WebDropDown","CascadeStateLabel") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <ig:WebDropDown ID="WebDropDownState" runat="server" Width="200px" EnableDropDownAsChild="false" DropDownContainerWidth="200px"
                                            DropDownContainerHeight="200px">
                                            <AutoPostBackFlags SelectionChanged="On" />
                                            <ClientEvents />
                                        </ig:WebDropDown>
                                    </td>
                                </tr>
                                <tr style="height: 30px;">
                                    <td>
                                        <%= this.GetGlobalResourceObject("WebDropDown","CascadeCityLabel") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <ig:WebDropDown ID="WebDropDownCity" runat="server" Width="200px" EnableDropDownAsChild="false" DropDownContainerWidth="200px"
                                            DropDownContainerHeight="200px">
                                        </ig:WebDropDown>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="/samplesbrowser/samplescommon/aspnet/WebDropDown/EditingAndSelection/CascadeAlternative/wdd_AdvSearchFooter.png" alt="" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
