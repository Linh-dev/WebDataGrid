<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
        <script type="text/javascript">
            function CellValueChangedHandler(sender, args) {
                var editingCore = sender.get_behaviors().get_editingCore();
                editingCore.commit();
            }
            function DeleteRow() {
                var grid = $find('<%= this.WebHierarchicalDataGrid1.ClientID %>');
                var gridRows = grid.get_gridView().get_rows();

                var selectedRows = grid.get_gridView().get_behaviors().get_selection().get_selectedRows();
                for (var i = selectedRows.get_length() - 1; i >= 0; i--) {
                    var row = selectedRows.getItem(i);
                    gridRows.remove(row);
                }
            }
            $(window).load(function () {
                $("#sampleContainer").addClass("filteringDropDown");
            });
        </script>
         <style type="text/css">
            .filteringDropDown
            {
              overflow: visible !important;
            }
            .checkboxAlignment
            {
               text-align: center;
                }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" Height="350px"
        DataMember="SQLDataSource_Suppliers" AutoGenerateBands="false" Width="100%"  EnableAjax="true"
        DataKeyFields="SupplierID" DataSourceID="WebHierarchicalDataSource1" AutoGenerateColumns="false"
        InitialDataBindDepth="-1" >
        <Columns>
            <ig:TemplateDataField Key="DeleteItem" Width="60px">
                <ItemTemplate>
                    <asp:ImageButton runat="server" ID="DeleteItem" AlternateText="alt"
                        ImageUrl="<%$ Resources:WebDataGrid, DataEditing_DeleteRowImagePath %>"
                        OnClientClick="DeleteRow(); return false;" />
                </ItemTemplate>
            </ig:TemplateDataField>
            <ig:BoundDataField Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_CompanyName1 %>"
             DataFieldName="CompanyName" Key="CompanyName">
            </ig:BoundDataField>
            <ig:BoundDataField Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_ContactName %>"
             DataFieldName="ContactName" Key="ContactName">
            </ig:BoundDataField>
            <ig:BoundDataField Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_City %>" 
            DataFieldName="City" Key="City">
            </ig:BoundDataField>
        </Columns>
               <Behaviors>
                <ig:Activation Enabled="true">
                </ig:Activation>
                <ig:Selection RowSelectType="Single" CellClickAction="Row"/>
                <ig:EditingCore >
                    <EditingClientEvents CellValueChanged="CellValueChangedHandler" />
                    <Behaviors>
                        <ig:CellEditing EditModeActions-MouseClick="Double"> </ig:CellEditing>
                        <ig:RowAdding Alignment="Top" ></ig:RowAdding>
                        <ig:RowDeleting  Enabled="true" />
                    </Behaviors>
                </ig:EditingCore>
                <ig:Filtering Enabled="true" EnableInheritance="true" FilterType="ExcelStyleFilter">
                    <ColumnSettings>
                        <ig:ColumnFilteringSetting ColumnKey="DeleteItem" Enabled="false" />
                    </ColumnSettings>
                </ig:Filtering>
            </Behaviors>
        <Bands>
            <ig:Band Key="Products" DataMember="SQLDataSource_Products" DataKeyFields="SupplierID,ProductID" 
                AutoGenerateColumns="false"  Width="550px">
                <Columns>
                    <ig:BoundDataField Hidden="true" DataFieldName="ProductID" Key="ProductID" />
                    <ig:BoundDataField Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_ProductName %>" 
                        DataFieldName="ProductName" Key="ProductName"  Width="200px" />
                    <ig:BoundDataField Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_UnitPrice2 %>" 
                        DataFieldName="UnitPrice" Key="UnitPrice" />
                    <ig:BoundDataField Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_UnitsInStock %>" 
                        DataFieldName="UnitsInStock" Key="UnitsInStock" />
                    <ig:BoundCheckBoxField Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Discontinued %>"
                        DataFieldName="Discontinued" Key="Discontinued" />
                </Columns>
                <Behaviors>
                    <ig:EditingCore>
                        <EditingClientEvents CellValueChanged="CellValueChangedHandler" />
                        <Behaviors>
                            <ig:CellEditing EditModeActions-MouseClick="Double"> </ig:CellEditing>
                        </Behaviors>
                    </ig:EditingCore>
                    <ig:Filtering FilterType="ExcelStyleFilter">
                    </ig:Filtering>
                </Behaviors>
            </ig:Band>
        </Bands>
    </ig:WebHierarchicalDataGrid>

    <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
        <datarelations>
            <ig:DataRelation ParentColumns="SupplierID" ParentDataViewID="SQLDataSource_Suppliers" 
                             ChildColumns="SupplierID" ChildDataViewID="SQLDataSource_Products" />
        </datarelations>
        <dataviews>
            <ig:DataView ID="SQLDataSource_Products" DataSourceID="ObjectDataSource1" />
            <ig:DataView ID="SQLDataSource_Suppliers" DataSourceID="ObjectDataSource2" />
        </dataviews>
    </ig:WebHierarchicalDataSource>

        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
                SelectMethod="GetProductsDataSource" 
                UpdateMethod="UpdateProduct"
                InsertMethod="AddProduct"
                DeleteMethod="DeleteProduct"
                EnableCaching="false"
                TypeName="NorthwindDataSource" >
        <DeleteParameters>
            <asp:Parameter Name="ProductID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductID" Type="Int32" />
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="UnitsInStock" Type="Int16" />
            <asp:Parameter Name="QuantityPerUnit" Type="String" />
            <asp:Parameter Name="SupplierID" Type="Int32" />
            <asp:Parameter Name="UnitsOnOrder" Type="Int32" />
            <asp:Parameter Name="Discontinued" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProductID" Type="Int32" />
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="UnitsInStock" Type="Int16" />
            <asp:Parameter Name="QuantityPerUnit" Type="String" />            
            <asp:Parameter Name="SupplierID" Type="Int32" />
            <asp:Parameter Name="UnitsOnOrder" Type="Int32" />
            <asp:Parameter Name="Discontinued" Type="Boolean" />


        </UpdateParameters>
        </asp:ObjectDataSource>
        
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
            SelectMethod="GetSuppliersDataSource"
            InsertMethod="AddSupplier"
            UpdateMethod="UpdateSupplier"
            EnableCaching="false"
            DeleteMethod="DeleteSupplier"
            TypeName="NorthwindDataSource">
            <DeleteParameters>
                <asp:Parameter Name="SupplierID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SupplierID" Type="Int32" />
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="ContactName" Type="String" />
                <asp:Parameter Name="City" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SupplierID" Type="Int32" />
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="ContactName" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Region" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
</asp:Content>