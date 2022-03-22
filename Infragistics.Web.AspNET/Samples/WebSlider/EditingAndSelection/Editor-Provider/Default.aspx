<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="330px" Width="100%" DataSourceID="DefaultDataSource"
                    DataKeyFields="OrderID" AutoGenerateColumns="False" OnRowUpdating="WebDataGrid1_RowUpdating" OnInit="InitTable">
                    <EditorProviders>
                        <ig:SliderProvider ID="QuantityValueProvider">
                            <EditorControl ID="EditorControl1" runat="server" MinValueAsString="0" MaxValueAsString="100"
                                ContentAlignment="Center" ValueType="Int" Width="200px" />
                        </ig:SliderProvider>
                    </EditorProviders>
                    <Columns>
                        <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID">
                            <Header Text="<%$ Resources:WebSlider, ColumnHeaderID  %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField Key="CompanyName">
                            <Header Text="<%$ Resources:WebSlider, ColumnHeaderCompany %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField Key="OrderDate" DataFormatString="{0:d}">
                            <Header Text="<%$ Resources:WebSlider, ColumnHeaderOrderDate %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField Key="ShippedDate" DataFormatString="{0:d}">
                            <Header Text="<%$ Resources:WebSlider, ColumnHeaderShippingDate %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField Key="Freight">
                            <Header Text="<%$ Resources:WebSlider, ColumnHeaderFreight %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField Key="Quantity">
                            <Header Text="<%$ Resources:WebSlider, ColumnHeaderQuantity%>" />
                        </ig:BoundDataField>
                    </Columns>
                    <Behaviors>
                        <ig:EditingCore>
                            <Behaviors>
                                <ig:CellEditing Enabled="true">
                                    <EditModeActions MouseClick="Single" />
                                    <ColumnSettings>
                                        <ig:EditingColumnSetting ColumnKey="CustomerID" ReadOnly="true" />
                                        <ig:EditingColumnSetting ColumnKey="CompanyName" ReadOnly="true" />
                                        <ig:EditingColumnSetting ColumnKey="OrderDate" ReadOnly="true" />
                                        <ig:EditingColumnSetting ColumnKey="ShippedDate" ReadOnly="true" />
                                        <ig:EditingColumnSetting ColumnKey="Freight" ReadOnly="true" />
                                        <ig:EditingColumnSetting ColumnKey="Quantity" EditorID="QuantityValueProvider" />
                                    </ColumnSettings>
                                </ig:CellEditing>
                            </Behaviors>
                        </ig:EditingCore>
                        <ig:Paging PageSize="10" PagerAppearance="Bottom" />
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
    <asp:AccessDataSource ID="DefaultDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT Max(Customers.CustomerID) as CustomerID, Max(Customers.CompanyName) as CompanyName, Max(Orders.OrderDate) as OrderDate, MAx(Orders.ShippedDate) as ShippedDate, SUM([Order Details].Quantity) as Quantity, SUM(Orders.Freight) as Freight, Orders.OrderID FROM Shippers INNER JOIN (Products INNER JOIN ((Employees INNER JOIN (Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID) ON Employees.EmployeeID = Orders.EmployeeID) INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID) ON Products.ProductID = [Order Details].ProductID) ON Shippers.ShipperID = Orders.ShipVia WHERE (((Orders.ShippedDate)>#12/1/1997# And (Orders.ShippedDate)<#1/14/1998#)) Group by Orders.OrderID">
    </asp:AccessDataSource>
</asp:Content>
