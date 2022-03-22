<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebHierarchicalDataGrid_Display_Summaries_with_Unbound_Column_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" language="javascript">
        function WebDataGridView_ExitedEditMode(sender, evntArgs) {
            document.forms[0].submit();
        }
    </script>
</asp:Content> 

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" Height="400px"
        Width="100%" DataSourceID="WebHierarchicalDataSource1" AutoGenerateColumns="false"
        EnableAjax="true" EnableAjaxViewState="true" DataKeyFields="SupplierID" InitialDataBindDepth="0" InitialExpandDepth="0"
        AutoGenerateBands="false" OnInit="OnInit" oninitializerow="WebDataGrid1_InitializeRow">
        <AjaxIndicator Enabled="True" />
        <Columns>
            <ig:BoundDataField DataFieldName="SupplierID" Key="Supplier ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_SupplierID %>" />
            <ig:BoundDataField DataFieldName="CompanyName" Key="Company" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Company %>" />
            <ig:BoundDataField DataFieldName="ContactName" Key="Contact" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Contact %>" />
            <ig:BoundDataField DataFieldName="City" Key="City" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_City %>" />
            <ig:BoundDataField DataFieldName="Region" Key="Region" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Region %>" />
            <ig:BoundDataField DataFieldName="Phone" Key="Phone" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Phone %>" />
        </Columns>
        <Behaviors>
            <ig:Activation />
            <ig:Selection RowSelectType="Multiple" CellClickAction="Row" />
        </Behaviors>
        <Bands>
            <ig:Band DataMember="ObjectDataSource1_Products" Key="Products" DataKeyFields="ProductID"
                AutoGenerateColumns="false">
                <Columns>
                    <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                    <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Product %>" />
                    <ig:BoundDataField DataFieldName="SupplierID" Key="SupplierID" Hidden="true" />
                    <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                    <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_UnitPrice %>" />
                    <ig:BoundDataField DataFieldName="UnitsOnOrder" Key="UnitsOnOrder" Header-Text="<%$ Resources:WebDataGrid ,UnitsOnOrder %>" />
                    <ig:UnboundField Key="Total" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,UnboundColumn_Total %>" DataType="System.Decimal" DataFormatString="{0:F2}" />
                </Columns>
                <Behaviors>
                    <ig:SummaryRow>
                        <ColumnSummaries>
                            <ig:ColumnSummaryInfo ColumnKey="UnitPrice">
                                <Summaries>
                                    <ig:Summary SummaryType="Average" />
                                </Summaries>
                            </ig:ColumnSummaryInfo>
                            <ig:ColumnSummaryInfo ColumnKey="UnitsOnOrder">
                                <Summaries>
                                    <ig:Summary SummaryType="Sum" />
                                </Summaries>
                            </ig:ColumnSummaryInfo>
                           <ig:ColumnSummaryInfo ColumnKey="Total">
                                <Summaries>
                                    <ig:Summary SummaryType="Sum" />
                                </Summaries>
                            </ig:ColumnSummaryInfo>
                        </ColumnSummaries>
                    </ig:SummaryRow>
                    <ig:EditingCore>
                        <Behaviors>
                            <ig:CellEditing>
                                <CellEditingClientEvents ExitedEditMode="WebDataGridView_ExitedEditMode" />
                                <ColumnSettings>
                                    <ig:EditingColumnSetting ColumnKey="Product ID" ReadOnly="true" />
                                    <ig:EditingColumnSetting ColumnKey="Product" ReadOnly="true" />
                                    <ig:EditingColumnSetting ColumnKey="QuantityPerUnit" ReadOnly="true" />
                                    <ig:EditingColumnSetting ColumnKey="UnitPrice" ReadOnly="false" />
                                    <ig:EditingColumnSetting ColumnKey="UnitsOnOrder" ReadOnly="false" />
                                    <ig:EditingColumnSetting ColumnKey="Total" ReadOnly="true" />
                                </ColumnSettings>
                            </ig:CellEditing>
                        </Behaviors>
                    </ig:EditingCore>
                </Behaviors>
            </ig:Band>
        </Bands>
    </ig:WebHierarchicalDataGrid>
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