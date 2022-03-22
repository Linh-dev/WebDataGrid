<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
<div style="height: 500px; overflow: auto;">
    <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="WebHierarchicalDataSource1"
        AutoGenerateColumns="false" AutoGenerateBands="false" OnInit="GridInit"
        DataKeyFields="EmployeeID">
        <ExpandCollapseAnimation SlideOpenDirection="Auto" SlideOpenDuration="300" SlideCloseDirection="Auto"
            SlideCloseDuration="300" />
        <Columns>
            <ig:BoundDataField DataFieldName="EmployeeID" Key="EmployeeID" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_EmployeeID %>" Width="100px"/>
            <ig:BoundDataField DataFieldName="LastName" Key="LastName" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_LastName %>"
                Width="125px" />
            <ig:BoundDataField DataFieldName="FirstName" Key="FirstName" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_FirstName %>"
                Width="125px" />
            <ig:BoundDataField DataFieldName="Title" Key="Title" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Title %>" Width="150px" />
        </Columns>
        <Bands>
            <ig:Band DataMember="AccessDataSource2_Orders" Key="Orders" AutoGenerateColumns="false"
                DataKeyFields="OrderID">
                <Columns>
                    <ig:BoundDataField DataFieldName="OrderID" Key="OrderID" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_OrderID %>" />
                    <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_CustomerID %>"
                        Width="95px" />
                    <ig:BoundDataField DataFieldName="OrderDate" Key="OrderDate" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_OrderDate %>"
                        DataFormatString="{0:MM/dd/yyyy}" Width="90px" />
                    <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_SupplierName %>"
                        Width="110px" />
                    <ig:BoundDataField DataFieldName="Phone" Key="Phone" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_SupplierPhone %>"
                        Width="110px" />
                </Columns>
                <Bands>
                    <ig:Band DataMember="AccessDataSource3_OrderDetails" Key="Details" DataKeyFields="OrderID,ProductID"
                        AutoGenerateColumns="false">
                        <Columns>
                            <ig:BoundDataField DataFieldName="ProductName" Key="ProductName" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Product %>" />
                            <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                            <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_UnitPrice %>"
                                DataFormatString="{0:c2}" Width="100px" />
                            <ig:BoundDataField DataFieldName="Quantity" Key="Quantity" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Quantity %>" Width="80px"/>
                            <ig:BoundDataField DataFieldName="Discount" Key="Discount" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Discount %>"
                                DataFormatString="{0:#.##%}" Width="70px"/>
                        </Columns>
                    </ig:Band>
                </Bands>
            </ig:Band>
            <ig:Band DataMember="AccessDataSource4_Employees" Key="EmployeesRegions" DataKeyFields="EmployeeID"
                AutoGenerateColumns="false">
                <Columns>
                    <ig:BoundDataField DataFieldName="City" Key="City" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_City %>" />
                    <ig:BoundDataField DataFieldName="Region" Key="Region" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Region %>" Width="120px" />
                    <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_PostalCode %>"
                        Width="120px" />
                    <ig:BoundDataField DataFieldName="Country" Key="Country" Header-Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_Country %>" Width="120px" />
                </Columns>
            </ig:Band>
        </Bands>
    </ig:WebHierarchicalDataGrid>
    </div>
    <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
        <DataRelations>
            <ig:DataRelation ParentColumns="EmployeeID" ParentDataViewID="AccessDataSource1_Employees"
                ChildColumns="EmployeeID" ChildDataViewID="AccessDataSource2_Orders" />
            <ig:DataRelation ParentColumns="OrderID" ParentDataViewID="AccessDataSource2_Orders"
                ChildColumns="OrderID" ChildDataViewID="AccessDataSource3_OrderDetails" />
            <ig:DataRelation ParentColumns="EmployeeID" ParentDataViewID="AccessDataSource1_Employees"
                ChildColumns="EmployeeID" ChildDataViewID="AccessDataSource4_Employees" />
        </DataRelations>
        <DataViews>
            <ig:DataView ID="AccessDataSource1_Employees" DataSourceID="AccessDataSource1" />
            <ig:DataView ID="AccessDataSource2_Orders" DataSourceID="AccessDataSource2" /> 
            <ig:DataView ID="AccessDataSource3_OrderDetails" DataSourceID="AccessDataSource3" />
            <ig:DataView ID="AccessDataSource4_Employees" DataSourceID="AccessDataSource4" />
        </DataViews>
    </ig:WebHierarchicalDataSource>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        SelectCommand="SELECT EmployeeID, LastName, FirstName, Title FROM Employees">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
        SelectCommand="SELECT top 20 Orders.OrderID, Orders.CustomerID, Orders.OrderDate, Shippers.CompanyName, Orders.EmployeeID, Shippers.Phone FROM Orders INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
        SelectCommand="SELECT Products.ProductID, Products.ProductName, [Order Details].UnitPrice, [Order Details].Quantity, [Order Details].Discount, Products.QuantityPerUnit, [Order Details].OrderID FROM (Products INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID)">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource4" runat="server" 
        SelectCommand="SELECT City, Region, PostalCode, Country, EmployeeID FROM Employees">
    </asp:AccessDataSource>
</asp:Content>
