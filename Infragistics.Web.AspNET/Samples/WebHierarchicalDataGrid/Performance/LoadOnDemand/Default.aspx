<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" 
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<br />
<div style="width:100%">
     <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="WebHierarchicalDataSource1" 
        AutoGenerateColumns="false"
        AutoGenerateBands="false"
        InitialExpandDepth="0" 
        InitialDataBindDepth="0"
        Height="500" Width="100%" DataKeyFields="SupplierID">
         <ExpandCollapseAnimation SlideOpenDirection="Auto" SlideOpenDuration="300" SlideCloseDirection="Auto"
                SlideCloseDuration="300" />
        <Columns>
            <ig:BoundDataField DataFieldName="SupplierID" Key="Supplier ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_SupplierID %>" />
            <ig:BoundDataField DataFieldName="CompanyName" Key="Company" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Company %>"/>
            <ig:BoundDataField DataFieldName="ContactName" Key="Contact" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Contact %>"/>
            <ig:BoundDataField DataFieldName="Region" Key="Region" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Region %>" />
        </Columns>
       <Bands>
            <ig:Band DataMember="AccessDataSource2_Products" Key="Products" AutoGenerateColumns="false">
                <Columns>
                    <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                    <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Product %>" />
                    <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                </Columns>
            </ig:Band>
        </Bands>
    </ig:WebHierarchicalDataGrid>
    
    <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
        <DataRelations>
            <ig:DataRelation ParentColumns="SupplierID" ParentDataViewID="AccessDataSource1_Suppliers"
                ChildColumns="SupplierID" ChildDataViewID="AccessDataSource2_Products" />
        </DataRelations>
        <DataViews>
            <ig:DataView ID="AccessDataSource1_Suppliers" DataSourceID="AccessDataSource1" />
            <ig:DataView ID="AccessDataSource2_Products" DataSourceID="AccessDataSource2" />
        </DataViews>
    </ig:WebHierarchicalDataSource>
    
    <asp:AccessDataSource ID="AccessDataSource1" runat="server"
        SelectCommand="SELECT SupplierID, CompanyName, ContactName, Region FROM Suppliers">
    </asp:AccessDataSource>
    
    <asp:AccessDataSource ID="AccessDataSource2" runat="server"
        SelectCommand="SELECT ProductID, ProductName, SupplierID, QuantityPerUnit FROM Products">
    </asp:AccessDataSource>
</div>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" Runat="Server">
</asp:Content>

