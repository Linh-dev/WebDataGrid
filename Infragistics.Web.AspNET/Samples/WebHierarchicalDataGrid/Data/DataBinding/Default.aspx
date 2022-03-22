<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" 
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ Register Src="~/SamplesCommon/aspnet/Common/UserControls/DataSourceControl/DataSourceControl.ascx" TagName="DataSourceControl"
    TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:DataSourceControl ID="SelectedDataSource" runat="server" ExcludedDataSource="XML|CL|BL|DT" />

    <div style="padding: 10px;">
        <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" AutoGenerateColumns="false"
            AutoGenerateBands="true" InitialExpandDepth="0" InitialDataBindDepth="-1" Height="450"
            Width="100%" DataKeyFields="SupplierID">
            <ExpandCollapseAnimation SlideOpenDirection="Auto" SlideOpenDuration="300" SlideCloseDirection="Auto"
                SlideCloseDuration="300" />
            <Columns>
                <ig:BoundDataField DataFieldName="SupplierID" Key="SupplierID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_SupplierID %>" />
                <ig:BoundDataField DataFieldName="CompanyName" Key="Company" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Company %>"
                    Width="230px" />
                <ig:BoundDataField DataFieldName="ContactName" Key="Contact" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Contact %>"
                    Width="150px" />
                <ig:BoundDataField DataFieldName="Region" Key="Region" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Region %>"
                    Width="80px" />
            </Columns>
        </ig:WebHierarchicalDataGrid>
    </div>

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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" Runat="Server">
</asp:Content>

