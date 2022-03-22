<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="500px" Width="100%" DataSourceID="Orders"
        DataKeyFields="OrderID" AutoGenerateColumns="False">
        <Columns>
            <ig:BoundDataField DataFieldName="OrderID" Key="OrderID">
                <Header Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_OrderID %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="ContactName" Key="CustomerID" Width="130px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
            </ig:BoundDataField>
            <ig:BoundDataField Key="ShippedDate" DataFormatString="{0:d}">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderShippingDate %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="ShippingCompany" Key="ShipperID" Width="120px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderShippingCompany %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Freight" Key="Freight" Width="60px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderFreight %>" />
            </ig:BoundDataField>
        </Columns>
    </ig:WebDataGrid>
    <asp:Button runat="server" ID="btnExport" OnClick="btnExport_Click" Text="<%$ Resources:InfragisticsDocuments, EXPORT %>" />
    <asp:AccessDataSource ID="Orders" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT top 50 Orders.OrderID, Orders.ShippedDate,
	                        Customers.ContactName, Shippers.CompanyName as ShippingCompany, Orders.Freight
                            FROM Shippers INNER JOIN (Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID) 
                            ON Shippers.ShipperID = Orders.ShipVia"></asp:AccessDataSource>
</asp:Content>