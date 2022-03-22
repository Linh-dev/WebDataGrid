<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Filtering_a_Checkbox_Column_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="400px"
        Width="100%" DataSourceID="AccessDataSource1" AutoGenerateColumns="false"
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
            <ig:Filtering Alignment="Top" Visibility="Visible" Enabled="true" AnimationEnabled="true" />
        </Behaviors>
    </ig:WebDataGrid>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT ProductID, ProductName, SupplierID, QuantityPerUnit, UnitPrice, Discontinued FROM Products">
    </asp:AccessDataSource>
</asp:Content>