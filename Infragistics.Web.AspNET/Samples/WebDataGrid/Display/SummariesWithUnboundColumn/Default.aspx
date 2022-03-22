<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Display_Summaries_with_Unbound_Column_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" language="javascript">
        function WebDataGridView_ExitedEditMode(sender, evntArgs) {
            document.forms[0].submit();
        }
    </script>
</asp:Content> 

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="400px"
        Width="600px" DataSourceID="ObjectDataSource1" AutoGenerateColumns="false"
        EnableAjax="true" EnableAjaxViewState="true" DataKeyFields="ProductID" 
        oninitializerow="WebDataGrid1_InitializeRow">
        <AjaxIndicator Enabled="True" />
        <Columns>
            <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebDataGrid ,ProductID %>" />
            <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebDataGrid ,ProductName %>" />
            <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebDataGrid ,QuantityPerUnit %>" />
            <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" Header-Text="<%$ Resources:WebDataGrid ,UnitPrice %>" />
            <ig:BoundDataField DataFieldName="UnitsOnOrder" Key="UnitsOnOrder" Header-Text="<%$ Resources:WebDataGrid ,UnitsOnOrder %>" />
            <ig:UnboundField Key="Total" Header-Text="<%$ Resources:WebDataGrid ,UnboundColumn_Total %>" DataType="System.Decimal" DataFormatString="{0:F2}" />
        </Columns>
        <Behaviors>
            <ig:Activation />
            <ig:Selection RowSelectType="Multiple" CellClickAction="Row" />
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
        </Behaviors>
    </ig:WebDataGrid>
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
		</UpdateParameters>		
    </asp:ObjectDataSource>
</asp:Content>