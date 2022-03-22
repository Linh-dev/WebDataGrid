<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebHierarchicalDataGrid_Display_Checkbox_Column_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" Height="400px"
        Width="100%" DataSourceID="WebHierarchicalDataSource1" AutoGenerateColumns="false"
        EnableAjax="true" EnableAjaxViewState="true" DataKeyFields="SupplierID" InitialDataBindDepth="0" InitialExpandDepth="0"
        AutoGenerateBands="false" OnInit="OnInit">
        <AjaxIndicator Enabled="True" />
        <Columns>
            <ig:BoundDataField DataFieldName="SupplierID" Key="Supplier ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_SupplierID %>" />
            <ig:BoundDataField DataFieldName="CompanyName" Key="Company" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Company %>" />
            <ig:BoundDataField DataFieldName="ContactName" Key="Contact" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Contact %>" />
            <ig:BoundDataField DataFieldName="City" Key="City" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_City %>" />
            <ig:BoundCheckBoxField DataFieldName="Region" Key="Region" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Region %>" />
            <ig:BoundDataField DataFieldName="Phone" Key="Phone" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Phone %>" />
        </Columns>
        <Bands>
            <ig:Band DataMember="ObjectDataSource1_Products" Key="Products" DataKeyFields="ProductID"
                AutoGenerateColumns="false">
                <Columns>
                    <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                    <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Product %>" />
                    <ig:BoundDataField DataFieldName="SupplierID" Key="SupplierID" Hidden="true" />
                    <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                    <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_UnitPrice %>" />
                    <ig:BoundCheckBoxField DataFieldName="Discontinued" Key="Discontinued" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Discontinued %>" />
                </Columns>
                <Behaviors>
                    <ig:EditingCore>
                        <Behaviors>
                            <ig:CellEditing>
                                <ColumnSettings>
                                    <ig:EditingColumnSetting ColumnKey="Product ID" ReadOnly="true" />
                                    <ig:EditingColumnSetting ColumnKey="Product" ReadOnly="true" />
                                    <ig:EditingColumnSetting ColumnKey="QuantityPerUnit" ReadOnly="true" />
                                    <ig:EditingColumnSetting ColumnKey="UnitPrice" ReadOnly="true" />
                                    <ig:EditingColumnSetting ColumnKey="Discontinued" ReadOnly="false" />
                                </ColumnSettings>
                            </ig:CellEditing>
                        </Behaviors>
                    </ig:EditingCore>
                </Behaviors>
            </ig:Band>
        </Bands>
    </ig:WebHierarchicalDataGrid>
    <div style="margin-top: 10px;">
        <asp:Button ID="SaveButton" runat="server" Text="<%$ Resources:WebHierarchicalDataGrid, SaveButton %>" />
    </div>
    <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
        <DataRelations>
            <ig:DataRelation ParentColumns="SupplierID" ParentDataViewID="AccessDataSource1_Suppliers"
                ChildColumns="SupplierID" ChildDataViewID="ObjectDataSource1_Products" />
        </DataRelations>
        <DataViews>
            <ig:DataView ID="AccessDataSource1_Suppliers" DataSourceID="AccessDataSource1" />
            <ig:DataView ID="ObjectDataSource1_Products" DataSourceID="ObjectDataSource1" />
        </DataViews>
    </ig:WebHierarchicalDataSource>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT SupplierID, CompanyName, ContactName, City, Region, Phone FROM Suppliers">
    </asp:AccessDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
        UpdateMethod="UpdateProduct"
        SelectMethod="GetProductsDataSource"  
        EnableCaching="false"
        TypeName="NorthwindDataSource" >
		<UpdateParameters>
			<asp:Parameter Name="ProductID" Type="Int32" />
			<asp:Parameter Name="ProductName" Type="String" />
			<asp:Parameter Name="SupplierID" Type="Int32" />
			<asp:Parameter Name="QuantityPerUnit" Type="String" />
			<asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="UnitsInStock" Type="Int16" />
			<asp:Parameter Name="UnitsOnOrder" Type="Int16" />
            <asp:Parameter Name="Discontinued" Type="Boolean" />
		</UpdateParameters>		
    </asp:ObjectDataSource>
</asp:Content>
