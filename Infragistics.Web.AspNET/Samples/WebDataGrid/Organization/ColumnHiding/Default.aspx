<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Organization_Column_Hiding_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <ig:WebDataGrid ID="WebDataGridView" runat="server" DataSourceID="NorthWndDataSource"
        DataKeyFields="CustomerID" AutoGenerateColumns="False" Height="425" Width="100%">
        <Columns>
            <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderID  %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="ContactName" Key="Contact">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Address" Key="Address">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="City" Key="City" Hidden="true">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Country" Key="Country" Hidden="true">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
            </ig:BoundDataField>
        </Columns>
    </ig:WebDataGrid>
    <asp:AccessDataSource ID="NorthWndDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>