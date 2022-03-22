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
                                <igsb:LocalizedImage ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDropDown/EditingAndSelection/CustomPersistance/eng/CustomPersistenceBig.png" ID="imgCustomPersistenceBig"
                                    AlternateText="<%$ Resources:WebDropDown, CustomPersistImgAlt %>" runat="server">
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
                                            <%= this.GetGlobalResourceObject("WebDropDown","CustomPersistLabel") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ig:WebDropDown runat="server" ID="WebDropDown1" EnableAutoFiltering="Off" EnablePersistingCustomValues="true"
                                                EnableCustomValueSelection="true" EnableDropDownAsChild="false" EnableClosingDropDownOnBlur="true" EnableClosingDropDownOnSelect="true"
                                                EnableCustomValues="true" Width="200px">
                                                <DropDownItemBinding TextField="AccountType" ValueField="AccountTypeId" />
                                            </ig:WebDropDown>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <img src="/samplesbrowser/samplescommon/aspnet/WebDropDown/EditingAndSelection/CustomPersistance/wdd_AdvSearchFooter.png" alt="" /></div>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
