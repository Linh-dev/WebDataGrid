<%@ Page Title="SomeTitle" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Display_MultiColumnFooters_Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">   
<style type="text/css">
    .igg_IGFooterCaption 
    {
        text-align:center;
        font-weight: bold;
    }
</style>
    <ig:WebDataGrid ID="WebDataGridView" runat="server" DataKeyFields="SupplierID" AutoGenerateColumns="False"
        Width="100%" Height="500px" DefaultColumnWidth="100px" ShowFooter="True" DataSourceID="AccessDataSource1">
        <Columns>
            <ig:BoundDataField DataFieldName="SupplierID" Key="SupplierID">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderSupplierID  %>" />
                <Footer ColSpan="2" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany  %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="ContactName" Key="ContactName">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                <Footer />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="ContactTitle" Key="ContactTitle">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContactTitle %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Address" Key="Address">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
                <Footer ColSpan="3" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="City" Key="City">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Region" Key="Region">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderRegion %>" />
                <Footer ColSpan="2" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Country" Key="Country">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
            </ig:BoundDataField>
            </Columns>
    </ig:WebDataGrid>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT * FROM [Suppliers]"></asp:AccessDataSource>
</asp:Content>
