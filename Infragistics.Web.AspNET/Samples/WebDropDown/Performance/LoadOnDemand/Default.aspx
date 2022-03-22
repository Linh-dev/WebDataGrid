<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="height: 400px;">
        <asp:UpdatePanel runat="server" ID="UpdatePanel1" ChildrenAsTriggers="True" UpdateMode="Always"
            RenderMode="Inline">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <div>
                                <igsb:LocalizedImage ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDropDown/Performance/LoadOnDemand/eng/LoadOnDemandHeaderBig.png" ID="imgLoadOnDemandHeaderBig"
                                    AlternateText="<%$ Resources:WebDropDown, LoadOnDemandImgAlt %>" runat="server">
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
                                            <%= this.GetGlobalResourceObject("WebDropDown","LoadOnDemandText") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ig:WebDropDown runat="server" ID="LoadOnDemand" DataSourceID="DefaultDataSource"
                                                LoadingItemsMessageText="<%$ Resources:WebDropDown, LoadOnDemandLoadingItems %>"
                                                TextField="Company" PageSize="20" EnableLoadOnDemand="true" Width="200px" DropDownContainerHeight="200px"
                                                DropDownContainerWidth="200px">
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
                                <img src="/samplesbrowser/samplescommon/aspnet/WebDropDown/Performance/LoadOnDemand/wdd_AdvSearchFooter.png" alt="" /></div>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:AccessDataSource ID="DefaultDataSource" runat="server"
        SelectCommand="SELECT [CustomerID] AS Id, [CompanyName] AS Company, [ContactName] AS Contact, 
    [Address] AS Address, [City] AS City, [PostalCode] AS Zip, [Country] AS Country FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>

