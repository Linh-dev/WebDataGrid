<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ Register TagPrefix="asp" Namespace="System.Web.DomainServices.WebControls" Assembly="System.Web.DomainServices.WebControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
 <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="WebHierarchicalDataSource1"
        AutoGenerateColumns="false" AutoGenerateBands="false" InitialExpandDepth="0"
        DataKeyFields="CategoryID" InitialDataBindDepth="3" Width="100%">
        <ExpandCollapseAnimation SlideOpenDirection="Auto" SlideOpenDuration="300" SlideCloseDirection="Auto"
            SlideCloseDuration="300" />
        <Columns>
            <ig:BoundDataField DataFieldName="CategoryID" Key="Category ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_CategoryID %>"
                Width="150px" />
            <ig:BoundDataField DataFieldName="CategoryName" Key="CategoryName" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_CategoryName %>"
                Width="150px" />
            <ig:BoundDataField DataFieldName="Description" Key="Description" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_CategoryDescription %>" />
        </Columns>
        <Bands>
            <ig:Band DataMember="dataSourceProductsView" Key="Products" DataKeyFields="ProductID"
                AutoGenerateColumns="false">
                <Columns>
                    <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                    <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Product %>" />
                    <ig:BoundDataField DataFieldName="UnitPrice" DataFormatString="{0:c2}" Key="UnitPrice"
                        Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_UnitPrice2 %>" />
                </Columns>
            </ig:Band>
        </Bands>
    </ig:WebHierarchicalDataGrid>
    <asp:DomainDataSource ID="dataSourceCategories" runat="server" DomainServiceTypeName="DomainDataSourceSample.LinqToSqlNorthwindDomainService"
        SelectMethod="GetCategories" EnableDelete="true" EnableInsert="true" EnableUpdate="true">
    </asp:DomainDataSource>
    <asp:DomainDataSource ID="dataSourceProducts" runat="server" DomainServiceTypeName="DomainDataSourceSample.LinqToSqlNorthwindDomainService"
        SelectMethod="GetProducts" EnableDelete="true" EnableInsert="true" EnableUpdate="true">
    </asp:DomainDataSource>
    <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
        <DataViews>
            <ig:DataView ID="dataSourceCategoriesView" DataSourceID="dataSourceCategories" />
            <ig:DataView ID="dataSourceProductsView" DataSourceID="dataSourceProducts" />
        </DataViews>
        <DataRelations>
            <ig:DataRelation ParentDataViewID="dataSourceCategoriesView" ParentColumns="CategoryID"
                ChildDataViewID="dataSourceProductsView" ChildColumns="CategoryID" />
        </DataRelations>
    </ig:WebHierarchicalDataSource>
</asp:Content>