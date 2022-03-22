<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Display_Cell_Column_Templates_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        tbody tr td.igg_ColumnHighlightOn
        {
            color: #006699;
            font-size: 12px;
            font-weight: bold;
            text-align: right;
            background-image: url(/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/Display/CellColumnTemplates/addNewRowBG.png);
            text-align: right;
        }
        tbody tr td.igg_ColumnHighlightOff
        {
            font-size: 12px;
            text-align: right;
        }
        tbody tr td.igg_AlignColumn
        {
            text-align: right;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="Div1" class="wgDataBind">
        <div id="Div2">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGridView" runat="server" DataSourceID="DefaultDataSource"
                    AutoGenerateColumns="False" Width="100%">
                    <Columns>
                        <ig:TemplateDataField Key="CompanyName">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container, "DataItem.CompanyName")%>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="ProductName">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderProduct %>" />
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container, "DataItem.CompanyName")%>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="OrderDate">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderOrderDate %>" />
                            <ItemTemplate>
                                <%# string.Format("{0:d}", DataBinder.Eval(Container, "DataItem.OrderDate")) %>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="ShippedDate">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderShippingDate %>" />
                            <ItemTemplate>
                                <%# string.Format("{0:d}", DataBinder.Eval(Container, "DataItem.ShippedDate"))%>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                        <ig:TemplateDataField Key="Freight" CssClass="igg_AlignColumn">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderFreight %>" />
                            <ItemTemplate>
                                <%# string.Format("{0:n2}", DataBinder.Eval(Container, "DataItem.Freight"))%>
                            </ItemTemplate>
                        </ig:TemplateDataField>
                        <ig:BoundDataField Key="Quantity">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderQuantity%>" />
                        </ig:BoundDataField>
                    </Columns>
                    <Behaviors>
                        <ig:Paging PagerAppearance="Bottom" PageSize="10" Enabled="true" />
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
    <asp:AccessDataSource ID="DefaultDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT Customers.CompanyName, Orders.OrderDate, Orders.ShippedDate, [Order Details].Quantity, Orders.Freight, Products.ProductName FROM Shippers INNER JOIN (Products INNER JOIN ((Employees INNER JOIN (Customers INNER JOIN Orders ON Customers.CustomerID=Orders.CustomerID) ON Employees.EmployeeID=Orders.EmployeeID) INNER JOIN [Order Details] ON Orders.OrderID=[Order Details].OrderID) ON Products.ProductID=[Order Details].ProductID) ON Shippers.ShipperID=Orders.ShipVia WHERE ((Orders.ShippedDate)>#12/1/1997# AND (Orders.ShippedDate) <#1/14/1998#)">
    </asp:AccessDataSource>
</asp:Content>
