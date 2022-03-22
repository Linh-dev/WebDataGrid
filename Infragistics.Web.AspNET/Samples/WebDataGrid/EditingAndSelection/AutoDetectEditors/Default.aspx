<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Auto_Detect_Editors_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div class="OptionPanel">
                <div id="Icon" style="float: left;">
                    <img src="/samplesbrowser/samplescommon/aspnet/WebDataGrid/EditingAndSelection/AutoDetectEditors/DatabaseIcon.png" alt="Database" width="60" height="61" /></div>
                <div id="ComboBox">
                    <%= this.GetGlobalResourceObject("WebDataGrid","DataBindMessage") %>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                        <asp:ListItem Text="<%$ Resources:WebDataGrid, DataSourceAccess %>" Value="AccessDataSource"
                            Selected="True" />
                        <asp:ListItem Text="<%$ Resources:WebDataGrid, DataSourceDataTable %>" Value="DataTable" />
                        <asp:ListItem Text="<%$ Resources:WebDataGrid, DataSourceICollection %>"
                            Value="ICollection" />
                    </asp:DropDownList>
                </div>
                <br style="clear: both;" />
            </div>
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="425px" Width="100%" DataSourceID="AccessDataSource1"
                    DataKeyFields="OrderID" AutoGenerateColumns="True" OnRowUpdating="WebDataGrid1_RowUpdating">
                    <Behaviors>
                        <ig:EditingCore>
                            <Behaviors>
                                <ig:CellEditing Enabled="true">
                                </ig:CellEditing>
                            </Behaviors>
                        </ig:EditingCore>
                        <ig:Paging PageSize="10" PagerAppearance="Bottom" />
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT Max(Customers.CustomerID) as CustomerID, Max(Customers.CompanyName) as CompanyName, Max(Orders.OrderDate) as OrderDate, MAx(Orders.ShippedDate) as ShippedDate, SUM([Order Details].Quantity) as Quantity, SUM(Orders.Freight) as Freight, Orders.OrderID as OrderID FROM Shippers INNER JOIN (Products INNER JOIN ((Employees INNER JOIN (Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID) ON Employees.EmployeeID = Orders.EmployeeID) INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID) ON Products.ProductID = [Order Details].ProductID) ON Shippers.ShipperID = Orders.ShipVia WHERE (((Orders.ShippedDate)>#12/1/1997# And (Orders.ShippedDate)<#1/1/1998#)) Group by Orders.OrderID">
    </asp:AccessDataSource>
</asp:Content>
