<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDropDown ID="wddTest" runat="server" DataSourceID="Linqdatasource1"
        Width="400px" DropDownContainerHeight="300px" DropDownContainerWidth="400px"
        EnableDropDownAsChild="false" EnableAutoFiltering="Client">
        <DropDownItemBinding ValueField="SupplierID" TextField="ContactName" />
    </ig:WebDropDown>
    <asp:LinqDataSource ID="Linqdatasource1" runat="server" Select="new(SupplierID,ContactName)"
        ContextTypeName="Infragistics.Web.SamplesBrowser.AspNET.AppCode.CLR35.Models.NorthwindDataContext" TableName="Suppliers">                                                                                 
    </asp:LinqDataSource>
</asp:Content>