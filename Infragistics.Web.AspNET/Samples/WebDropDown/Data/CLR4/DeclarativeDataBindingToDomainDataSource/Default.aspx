<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ Register TagPrefix="asp" Namespace="System.Web.DomainServices.WebControls" Assembly="System.Web.DomainServices.WebControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDropDown ID="wddTest" runat="server" DataSourceID="DomainDataSource1"
        EnablePaging="true" Width="400px" EnableDropDownAsChild="false" EnableAutoFiltering="Client">
        <DropDownItemBinding ValueField="ProductID" TextField="ProductName" />
    </ig:WebDropDown>

    <asp:DomainDataSource ID="DomainDataSource1" runat="server" DomainServiceTypeName="DomainDataSourceSample.LinqToSqlNorthwindDomainService"
        SelectMethod="GetProducts" EnableDelete="true" EnableInsert="true" EnableUpdate="true">
    </asp:DomainDataSource> 
</asp:Content>