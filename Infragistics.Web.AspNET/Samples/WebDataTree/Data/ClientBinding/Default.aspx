<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:WebDataTree runat="server" Height="300" Width="300" ID="WebDataTree1" SelectionType="Single" 
        EnableConnectorLines="true" DataSourceID="whds">
        <DataBindings>
            <ig:DataTreeNodeBinding DataMember="Categories" TextField="CategoryName" ValueField="CategoryID" />
            <ig:DataTreeNodeBinding DataMember="Products" TextField="ProductName" ValueField="ProductID" />
        </DataBindings>
    </ig:WebDataTree>
    <ig:WebHierarchicalDataSource ID="whds" runat="server">
        <DataViews>
            <ig:DataView DataSourceID="CategoriesDS" ID="Categories" />
            <ig:DataView DataSourceID="ProductsDS" ID="Products" />
        </DataViews>
        <DataRelations>
            <ig:DataRelation ParentDataViewID="Categories" ParentColumns="CategoryID" ChildDataViewID="Products"
                ChildColumns="CategoryID" />
        </DataRelations>
    </ig:WebHierarchicalDataSource>
    <asp:AccessDataSource ID="CategoriesDS" runat="server"
        SelectCommand="SELECT Categories.CategoryID, Categories.CategoryName FROM Categories">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="ProductsDS" runat="server"
        SelectCommand="SELECT Products.ProductID, Products.ProductName, Products.CategoryID FROM Products">
    </asp:AccessDataSource>
</asp:Content>