<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Style_Paging_Custom_CSS_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDataGrid ID="WebDataGridView" runat="server" DataSourceID="AccessDataSource1"
        DataKeyFields="CustomerID" Width="700px" DefaultColumnWidth="90px" AutoGenerateColumns="true">
        <Behaviors>
            <ig:Paging PagerAppearance="Bottom" PageSize="10" PagerCssClass="igg_CustomPager"
                PageLinkCssClass="igg_PageLink" CurrentPageLinkCssClass="igg_CurrentPageLink"
                Enabled="true" />
        </Behaviors>
    </ig:WebDataGrid>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
