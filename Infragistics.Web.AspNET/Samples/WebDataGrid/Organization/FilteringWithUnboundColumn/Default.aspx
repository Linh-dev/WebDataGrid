<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Organization_Filtering_with_Unbound_Column_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="400px"
        Width="100%" DataSourceID="AccessDataSource1" AutoGenerateColumns="false"
        EnableAjax="true" EnableAjaxViewState="true" DataKeyFields="ProductID" 
        oninitializerow="WebDataGrid1_InitializeRow">
        <AjaxIndicator Enabled="True" />
        <Columns>
            <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebDataGrid ,ProductID %>" />
            <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebDataGrid ,ProductName %>" />
            <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebDataGrid ,QuantityPerUnit %>" />
            <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" Header-Text="<%$ Resources:WebDataGrid ,UnitPrice %>" />
            <ig:BoundDataField DataFieldName="UnitsOnOrder" Key="UnitsOnOrder" Header-Text="<%$ Resources:WebDataGrid ,UnitsOnOrder %>" />
            <ig:UnboundField Key="Total" Header-Text="<%$ Resources:WebDataGrid ,UnboundColumn_Total %>" DataType="System.Decimal" DataFormatString="{0:c2}" />
        </Columns>
        <Behaviors>
            <ig:Filtering Alignment="Top" Visibility="Visible" Enabled="true" AnimationEnabled="true" />
        </Behaviors>
    </ig:WebDataGrid>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT ProductID, ProductName, SupplierID, QuantityPerUnit, UnitPrice, UnitsOnOrder FROM Products">
    </asp:AccessDataSource>
</asp:Content>