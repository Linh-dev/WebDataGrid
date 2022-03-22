<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <ig:WebDropDown ID="wddTest" runat="server" EnableDropDownAsChild="false" DataSourceID="SqlDataSource1" PageSize="4"
        Width="400px">
        <DropDownItemBinding ValueField="SupplierID" TextField="CompanyName" />
    </ig:WebDropDown>

    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%# this.GetConnectionString() %>'        
        SelectCommand="SELECT [SupplierID], [CompanyName] FROM [nwd].[Suppliers] ORDER By CompanyName">
    </asp:SqlDataSource>
</asp:Content>

