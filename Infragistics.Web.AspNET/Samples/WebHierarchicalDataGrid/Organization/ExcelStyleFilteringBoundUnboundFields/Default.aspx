<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript">
        function cellValueChanged(sender, args) {
            var editingCore = sender.get_behaviors().get_editingCore();
            editingCore.commit();
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
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
        <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" Height="350px"
            DataMember="SQLDataSource_Suppliers" AutoGenerateBands="false" Width="100%"
            DataKeyFields="SupplierID" DataSourceID="WebHierarchicalDataSource1" AutoGenerateColumns="false"
            InitialDataBindDepth="-1" EnableAjax="true">
            <Columns>
                <ig:BoundDataField Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_CompanyName1 %>" 
                DataFieldName="CompanyName" Key="CompanyName">
                </ig:BoundDataField>
                <ig:BoundDataField Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_ContactName %>" 
                DataFieldName="ContactName" Key="ContactName">
                </ig:BoundDataField>
                <ig:BoundDataField Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_ContactTitle %>" 
                DataFieldName="ContactTitle" Key="ContactTitle">
                </ig:BoundDataField>
                <ig:UnboundCheckBoxField Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Selected %>" 
                Key="ContactChecked" HeaderChecked="false" Width="80px" HeaderCheckBoxMode="Off" CssClass="checkboxAlignment">
                </ig:UnboundCheckBoxField>
            </Columns>
            <Behaviors>
                <ig:Activation Enabled="true">
                </ig:Activation>
                <ig:EditingCore>
                    <EditingClientEvents CellValueChanged="cellValueChanged" />
                </ig:EditingCore>
                <ig:Filtering Enabled="true" EnableInheritance="true" FilterType="ExcelStyleFilter" />
            </Behaviors>
            <Bands>
                <ig:Band Key="Products" DataMember="SQLDataSource_Products" DataKeyFields="ProductID"
                    AutoGenerateColumns="false">
                    <Columns>
                        <ig:BoundDataField Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_ProductName %>" 
                        DataFieldName="ProductName" Key="ProductName" />
                        <ig:BoundDataField Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_UnitPrice2 %>" 
                        DataFieldName="UnitPrice" Key="UnitPrice" />
                        <ig:BoundDataField Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_UnitsInStock %>"
                         DataFieldName="UnitsInStock" Key="UnitsInStock" />
                        <ig:BoundCheckBoxField Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Discontinued %>" 
                        DataFieldName="Discontinued" Key="Discontinued" />
                        <ig:UnboundField Key="Total" Header-Text="<%$ Resources:WebHierarchicalDataGrid, UnboundColumn_Total %>" />
                    </Columns>
                    <Behaviors>
                        <ig:Filtering FilterType="ExcelStyleFilter">
                        </ig:Filtering>
                    </Behaviors>
                </ig:Band>
            </Bands>
        </ig:WebHierarchicalDataGrid>
        <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
            <DataRelations>
                <ig:DataRelation ParentColumns="SupplierID" ChildDataViewID="SQLDataSource_Products"
                    ChildColumns="SupplierID" ParentDataViewID="SQLDataSource_Suppliers" />
            </DataRelations>
            <DataViews>
                <ig:DataView ID="SQLDataSource_Products" DataSourceID="SqlDataSource1" />
                <ig:DataView ID="SQLDataSource_Suppliers" DataSourceID="SqlDataSource2" />
            </DataViews>
        </ig:WebHierarchicalDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%# this.GetSqlConnectionString("SamplesDB.mdf") %>'
            SelectCommand="SELECT [SupplierID], [ProductID], [ProductName], [UnitPrice], [UnitsInStock], [Discontinued] FROM nwd.Products">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%# this.GetSqlConnectionString("SamplesDB.mdf") %>'
            SelectCommand="SELECT [SupplierID], [CompanyName], [ContactName], [ContactTitle] FROM nwd.Suppliers">
        </asp:SqlDataSource>
</asp:Content>