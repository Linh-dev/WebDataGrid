<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Display_Checkbox_Column_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="400px"
        Width="100%" DataSourceID="ObjectDataSource1" AutoGenerateColumns="false"
        EnableAjax="true" EnableAjaxViewState="true" DataKeyFields="ProductID" InitialDataBindDepth="0" InitialExpandDepth="0"
        AutoGenerateBands="false">
        <AjaxIndicator Enabled="True" />
        <Columns>
            <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebDataGrid ,ProductID %>" />
            <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebDataGrid ,ProductName %>" />
            <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebDataGrid ,QuantityPerUnit %>" />
            <ig:BoundCheckBoxField DataFieldName="UnitPrice" Key="UnitPrice" Header-Text="<%$ Resources:WebDataGrid ,UnitPrice %>" />
            <ig:BoundCheckBoxField DataFieldName="Discontinued" Key="Discontinued" Header-Text="<%$ Resources:WebDataGrid ,Discontinued %>" />
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
    </ig:WebDataGrid>
    <div style="margin-top: 10px;">
        <asp:Button ID="SaveButton" runat="server" Text="<%$ Resources:WebDataGrid, SaveButton %>" />
    </div>
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
