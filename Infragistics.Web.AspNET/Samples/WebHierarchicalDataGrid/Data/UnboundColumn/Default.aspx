<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebHierarchicalDataGrid_Data_Unbound_Column_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" Height="400px"
        Width="100%" DataSourceID="WebHierarchicalDataSource1" AutoGenerateColumns="false"
        EnableAjax="true" EnableAjaxViewState="true" DataKeyFields="SupplierID" InitialDataBindDepth="0" InitialExpandDepth="0"
        AutoGenerateBands="false" OnInit="OnInit" oninitializerow="WebDataGrid1_InitializeRow">
        <AjaxIndicator Enabled="True" />
        <Columns>
            <ig:UnboundCheckBoxField Key="Check" HeaderChecked="False" HeaderCheckBoxMode="TriState" />
            <ig:BoundDataField DataFieldName="SupplierID" Key="Supplier ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_SupplierID %>" />
            <ig:BoundDataField DataFieldName="CompanyName" Key="Company" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Company %>" />
            <ig:BoundDataField DataFieldName="ContactName" Key="Contact" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Contact %>" />
            <ig:BoundDataField DataFieldName="City" Key="City" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_City %>" />
            <ig:BoundDataField DataFieldName="Region" Key="Region" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Region %>" />
            <ig:BoundDataField DataFieldName="Phone" Key="Phone" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Phone %>" />
        </Columns>
        <Bands>
            <ig:Band DataMember="AccessDataSource2_Products" Key="Products" DataKeyFields="ProductID"
                AutoGenerateColumns="false">
                <Columns>
                    <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                    <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Product %>" />
                    <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                    <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_UnitPrice %>" />
                    <ig:BoundDataField DataFieldName="UnitsOnOrder" Key="UnitsOnOrder" Header-Text="<%$ Resources:WebDataGrid ,UnitsOnOrder %>" />
                    <ig:UnboundField Key="Total" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,UnboundColumn_Total %>" DataType="System.Decimal" DataFormatString="{0:F2}" />
                </Columns>
            </ig:Band>
        </Bands>
        <Behaviors>
            <ig:EditingCore>
                <Behaviors>
                    <ig:CellEditing CellEditingClientEvents-EnteringEditMode="WebHierarchicalDataGrid1_CellEditing_EnteringEditMode"></ig:CellEditing>
                </Behaviors>
            </ig:EditingCore>
        </Behaviors>
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
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        
        SelectCommand="SELECT [SupplierID], [CompanyName], [ContactName], [City], [Region], [Phone] FROM [Suppliers]" 
        DeleteCommand="DELETE FROM [Suppliers] WHERE [SupplierID] = ?" 
        InsertCommand="INSERT INTO [Suppliers] ([SupplierID], [CompanyName], [ContactName], [City], [Region], [Phone]) VALUES (?, ?, ?, ?, ?, ?)" 
        UpdateCommand="UPDATE [Suppliers] SET [CompanyName] = ?, [ContactName] = ?, [City] = ?, [Region] = ?, [Phone] = ? WHERE [SupplierID] = ?"
        >
        <DeleteParameters>
            <asp:Parameter Name="SupplierID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SupplierID" Type="Int32" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="ContactName" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Region" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="ContactName" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Region" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="SupplierID" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT ProductID, ProductName, SupplierID, QuantityPerUnit, UnitPrice, UnitsOnOrder FROM Products">
    </asp:AccessDataSource>

    <script type="text/javascript">
        function WebHierarchicalDataGrid1_CellEditing_EnteringEditMode(sender, eventArgs) {
            try{
                var cell = eventArgs.getCell();
                var columnKey = cell.get_column().get_key();
                // Cancel editing for all columns except "Check" UnboundCheckbox column
                if (columnKey != "Check") {
                    eventArgs.set_cancel(true); 
                }
            }
            catch (ex) { }
        }
    </script>
</asp:Content>
