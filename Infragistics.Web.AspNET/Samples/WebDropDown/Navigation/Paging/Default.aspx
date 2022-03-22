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
                                <igsb:LocalizedImage ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDropDown/Navigation/Paging/eng/wdd_DataPagingHeader.png" ID="imgDataPagingHeader"
                                    AlternateText="<%$ Resources:WebDropDown, DataPagingImgAlt %>" runat="server">
                                </igsb:LocalizedImage>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-left: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC; padding: 20px;">
                            <div style="border: 1px solid #EEEEEE; background-color: #FAFAFA; padding: 10px;
                                padding-left: 80px;">
                                <table width="80%" cellspacing="0" border="0" style="margin-left: 30px;">
                                    <tr style="height: 50px;">
                                        <td>
                                            <img src="/samplesbrowser/samplescommon/aspnet/WebDropDown/Navigation/Paging/heart.png" />
                                        </td>
                                        <td>
                                            <%= this.GetGlobalResourceObject("WebDropDown","DataPagingDataLabel") %>
                                        </td>
                                        <td>
                                            <ig:WebDropDown runat="server" ID="WebDropDown1" DataSourceID="DefaultDataSource"
                                                TextField="Company" PageSize="20" EnableDropDownAsChild="false" EnablePaging="true" Width="200px" DropDownContainerWidth="200px"
                                                DropDownContainerHeight="300px">
                                            </ig:WebDropDown>
                                        </td>
                                    </tr>
                                    <tr style="height: 50px;">
                                        <td>
                                            <img src="/samplesbrowser/samplescommon/aspnet/WebDropDown/Navigation/Paging/script_go.png" />
                                        </td>
                                        <td>
                                            <%= this.GetGlobalResourceObject("WebDropDown","DataPagingPageModeLabel") %>:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddPagingMode" AutoPostBack="true" runat="server" Width="200"
                                                OnSelectedIndexChanged="ddPagingMode_SelectedIndexChanged" />
                                        </td>
                                    </tr>
                                    <tr style="height: 50px;">
                                        <td>
                                            <img src="/samplesbrowser/samplescommon/aspnet/WebDropDown/Navigation/Paging/page_white_stack.png" />
                                        </td>
                                        <td>
                                            <%= this.GetGlobalResourceObject("WebDropDown","DataPagingPageSizeLabel") %>:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddPageSize" AutoPostBack="true" runat="server" Width="200" 
                                                OnSelectedIndexChanged="ddPageSize_SelectedIndexChanged">
                                                <asp:ListItem Value="5" Text="5" />
                                                <asp:ListItem Value="10" Text="10" />
                                                <asp:ListItem Value="20" Selected="True" Text="20" />
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <img src="/samplesbrowser/samplescommon/aspnet/WebDropDown/Navigation/Paging/wdd_AdvSearchFooter.png" alt="" /></div>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:AccessDataSource ID="DefaultDataSource" runat="server"
            SelectCommand="SELECT [CustomerID] AS Id, [CompanyName] AS Company, [ContactName] AS Contact, 
    [Address] AS Address, [City] AS City, [PostalCode] AS Zip, [Country] AS Country FROM [Customers]">
        </asp:AccessDataSource>
</asp:Content>
