<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/WebDataTree/sampleWebtreeMenu.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <div style="background-image: url(/SamplesBrowser/SamplesCommon/aspnet/Common/LoadOnDemand.png); width: 675px; height: 96px;">
        <div style="font-weight: bold; margin-left: 110px; padding-top: 40px; font-size: small;
            color: #333;">
            <%= this.GetGlobalResourceObject("WebExplorerBar","WebExplorerBar_LoadOnDemand_Title") %>
        </div>
        <div style="margin-left: 105px; padding-top: 10px;">
            <asp:CheckBox ID="EnabledLoadOnDemand" runat="server" Text="<%$ Resources:WebDataTree, EnableCaption %>"
                Checked="True" AutoPostBack="True" />
        </div>
    </div>
    <br />
    <ig:WebExplorerBar MaxGroupHeight="200px" DataSourceID="whds"  
         InitialDataBindDepth="0" ID="WebExplorerBar1" runat="server" Width="300px">
        <DataBindings>
            <ig:ExplorerBarItemBinding DataMember="Categories" TextField="CategoryName" />
            <ig:ExplorerBarItemBinding DataMember="Products" TextField="ProductName" />
        </DataBindings>
    </ig:WebExplorerBar>
    <asp:AccessDataSource ID="CategoriesDS" runat="server"
        SelectCommand="SELECT Categories.CategoryID, Categories.CategoryName FROM Categories ">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="ProductsDS" runat="server"
        SelectCommand="SELECT Products.ProductID, Products.ProductName, Products.CategoryID FROM Products ">
    </asp:AccessDataSource>
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
</asp:Content>

