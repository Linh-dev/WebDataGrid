<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Organization_Fixed_Column_Calculations_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDataGrid ID="WebDataGridView" runat="server" DataSourceID="GridDataSource"
        DataKeyFields="CustomerID" AutoGenerateColumns="False" Height="400px" Width="100%"
        S>
        <Columns>
            <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" Width="100px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderID  %>" />
            </ig:BoundDataField>
            <ig:BoundDataField Key="CompanyName" Width="150px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
            </ig:BoundDataField>
            <ig:BoundDataField Key="ShippedDate" Width="100px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderShippedDate %>" />
            </ig:BoundDataField>
            <ig:BoundDataField Key="Freight" Width="100px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderFreight %>" />
            </ig:BoundDataField>
            <ig:BoundDataField Key="Quantity" Width="100px">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderQuantity%>" />
            </ig:BoundDataField>
            <ig:TemplateDataField Key="QTYFGT" Width="150px">
                <HeaderTemplate>
                    <%= this.GetGlobalResourceObject("WebDataGrid","WebDataGrid_ColumnCalculationFixing_ColumnsCalc") %>
                </HeaderTemplate>
                <ItemTemplate>
                    <%# Calculate(DataBinder.Eval(Container, "DataItem.Freight"), DataBinder.Eval(Container, "DataItem.Quantity"))%>
                </ItemTemplate>
            </ig:TemplateDataField>
        </Columns>
        <Behaviors>
            <ig:ColumnFixing ShowLeftSeparator="true" ShowRightSeparator="true" AutoAdjustCells="true">
                <ColumnSettings>
                    <ig:ColumnFixingSetting ColumnKey="QTYFGT" ShowFixButton="false" />
                    <ig:ColumnFixingSetting ColumnKey="Freight" ShowFixButton="false" />
                    <ig:ColumnFixingSetting ColumnKey="Quantity" ShowFixButton="false" />
                </ColumnSettings>
            </ig:ColumnFixing>
        </Behaviors>
    </ig:WebDataGrid>
    <asp:AccessDataSource ID="GridDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT Max(Customers.CustomerID) as CustomerID, Max(Customers.CompanyName) as CompanyName, Max(Orders.OrderDate) as OrderDate, MAx(Orders.ShippedDate) as ShippedDate, SUM([Order Details].Quantity) as Quantity, SUM(Orders.Freight) as Freight, Orders.OrderID FROM Shippers INNER JOIN (Products INNER JOIN ((Employees INNER JOIN (Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID) ON Employees.EmployeeID = Orders.EmployeeID) INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID) ON Products.ProductID = [Order Details].ProductID) ON Shippers.ShipperID = Orders.ShipVia WHERE (((Orders.ShippedDate)>#12/1/1997# And (Orders.ShippedDate)<#1/1/1998#)) Group by Orders.OrderID">
    </asp:AccessDataSource>
</asp:Content>
