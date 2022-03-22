<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebHierarchicalDataGrid_Display_MultiColumnFooters_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
   <div style=" margin-top:30px; ">
    <ig:webhierarchicaldatagrid ID="WebHierarchicalDataGrid1" AutoGenerateColumns="False"
        DataSourceID="WebHierarchicalDataSource1" runat="server" Height="500px" ShowFooter="true"
        Width="100%" DefaultColumnWidth="100px" DataKeyFields="SupplierID">
        <Columns>
            <ig:BoundDataField DataFieldName="SupplierID" Key="SupplierID">
                <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_SupplierID  %>" />
                <Footer ColSpan="2" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName">
                <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Company  %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="ContactName" Key="ContactName">
                <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Contact %>" />
                <Footer />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="ContactTitle" Key="ContactTitle">
                <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Title %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Address" Key="Address">
                <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_StreetAddress %>" />
                <Footer ColSpan="3" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="City" Key="City">
                <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_City %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode">
                <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_PostalCode %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Region" Key="Region">
                <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Region %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Country" Key="Country">
                <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Country %>" />
            </ig:BoundDataField>
            </Columns>
        <Behaviors>
            <ig:Activation Enabled="true">
            </ig:Activation>
        </Behaviors>
        <Bands>
            <ig:Band Key="Products" DataMember="AccessDataSource2_Products" DataKeyFields="SupplierID" AutoGenerateColumns="false">
                <Columns>
                    <ig:BoundDataField DataFieldName="ProductID" Key="ProductID">
                        <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="ProductName" Key="ProductName">
                        <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_ProductName %>" />
                        <Footer ColSpan="3" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="SupplierID" Key="SupplierID">
                        <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_SupplierID %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="CategoryID" Key="CategoryID">
                        <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_CategoryID %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit">
                        <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice">
                        <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_UnitPrice2 %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="UnitsInStock" Key="UnitsInStock">
                        <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_UnitsInStock %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="UnitsOnOrder" Key="UnitsOnOrder">
                        <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_UnitsInOrder %>" />
                        <Footer ColSpan="2" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="ReorderLevel" Key="ReorderLevel">
                        <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_ReorderLevel %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="Discontinued" Key="Discontinued">
                        <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Discontinued %>" />
                    </ig:BoundDataField>
                </Columns>
            </ig:Band>
        </Bands>
        
    </ig:webhierarchicaldatagrid>
    
    <ig:webhierarchicaldatasource ID="WebHierarchicalDataSource1" runat="server">
            <DataRelations>
                <ig:DataRelation ParentColumns="SupplierID" ParentDataViewID="AccessDataSource1_Suppliers"
                    ChildColumns="SupplierID" ChildDataViewID="AccessDataSource2_Products" />
            </DataRelations>
            <DataViews>
                <ig:DataView ID="AccessDataSource1_Suppliers" DataSourceID="AccessDataSource1" />
                <ig:DataView ID="AccessDataSource2_Products" DataSourceID="AccessDataSource2" />
            </DataViews>
        </ig:webhierarchicaldatasource>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'   
            SelectCommand="SELECT [SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [HomePage] FROM [Suppliers]">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'      
            SelectCommand="SELECT [ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued] FROM [Products]">
        </asp:AccessDataSource>
        </div>
</asp:Content>