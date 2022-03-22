<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="WebHierarchicalDataSource1"
        AutoGenerateColumns="false" AutoGenerateBands="false" DataKeyFields="EmployeeID" Width="100%" Height="100%">
        <ExpandCollapseAnimation SlideOpenDirection="Auto" SlideOpenDuration="300" SlideCloseDirection="Auto"
            SlideCloseDuration="300" />
        <Columns>
            <ig:BoundDataField DataFieldName="EmployeeID" Key="EmployeeID" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_EmployeeID %>" />
            <ig:BoundDataField DataFieldName="LastName" Key="LastName" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_LastName %>" />
            <ig:BoundDataField DataFieldName="FirstName" Key="FirstName" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_FirstName %>" />
            <ig:BoundDataField DataFieldName="Region" Key="Region" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Region %>" />
            <ig:BoundDataField DataFieldName="Country" Key="Country" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Country %>" />
        </Columns>
        <Bands>
            <ig:Band DataMember="AccessDataSource2_Orders" Key="Orders" DataKeyFields="OrderID,CustomerID"
                AutoGenerateColumns="false">
                <Columns>
                    <ig:BoundDataField DataFieldName="OrderID" Key="OrderID" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_OrderID %>" />
                    <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_CustomerID %>" />
                    <ig:BoundDataField DataFieldName="OrderDate" Key="OrderDate" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_OrderDate %>"
                        DataFormatString="{0:MM/dd/yyyy}" Width="120px" />
                    <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_SupplierName %>" />
                    <ig:BoundDataField DataFieldName="Phone" Key="Phone" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_SupplierPhone %>" />
                </Columns>
                <Bands>
                    <ig:Band DataMember="AccessDataSource3_OrderDetails" Key="Details" AutoGenerateColumns="false"
                        DataKeyFields="ProductName">
                        <Columns>
                            <ig:BoundDataField DataFieldName="ProductName" Key="ProductName" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Product %>" />
                            <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                            <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_UnitPrice %>"
                                DataFormatString="{0:c2}" />
                            <ig:BoundDataField DataFieldName="Quantity" Key="Quantity" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Quantity %>" />
                            <ig:BoundDataField DataFieldName="Discount" Key="Discount" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Discount %>"
                                DataFormatString="{0:#.##%}" />
                        </Columns>
                    </ig:Band>
                </Bands>
            </ig:Band>
        </Bands>
    </ig:WebHierarchicalDataGrid>
    <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
        <DataRelations>
            <ig:DataRelation ParentColumns="EmployeeID" ParentDataViewID="AccessDataSource1_Employees"
                ChildColumns="EmployeeID" ChildDataViewID="AccessDataSource2_Orders" />
            <ig:DataRelation ParentColumns="OrderID" ParentDataViewID="AccessDataSource2_Orders"
                ChildColumns="OrderID" ChildDataViewID="AccessDataSource3_OrderDetails" />
        </DataRelations>
        <DataViews>
            <ig:DataView ID="AccessDataSource1_Employees" DataSourceID="AccessDataSource1" />
            <ig:DataView ID="AccessDataSource2_Orders" DataSourceID="AccessDataSource2" />
            <ig:DataView ID="AccessDataSource3_OrderDetails" DataSourceID="AccessDataSource3" />
        </DataViews>
    </ig:WebHierarchicalDataSource>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'
        SelectCommand="SELECT EmployeeID, LastName, FirstName, Region, Country FROM Employees">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'
        SelectCommand="SELECT top 20 Orders.OrderID, Orders.CustomerID, Orders.OrderDate, Shippers.CompanyName, Orders.EmployeeID, Shippers.Phone FROM Orders INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'
        SelectCommand="SELECT Products.ProductName, [Order Details].UnitPrice, [Order Details].Quantity, [Order Details].Discount, Products.QuantityPerUnit, [Order Details].OrderID FROM (Products INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID)">
    </asp:AccessDataSource>
</asp:Content>
