<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:htmllink runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
     <ig:WebDataMenu runat="server" ID="ContextMenu" IsContextMenu="true" StyleSetName="IG"
        BorderWidth="1" BorderColor="#CCCCCC">
        <ClientEvents ItemClick="MenuItem_Click" />        
        <Items>
            <ig:DataMenuItem Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_ContextMenu_Expand %>"
                Key="Expand" />
            <ig:DataMenuItem Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_ContextMenu_SelectRow %>"
                Key="Select" />
        </Items>
    </ig:WebDataMenu>
    <div style="width: 100%">
        <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="WebHierarchicalDataSource1"
            AutoGenerateColumns="false" AutoGenerateBands="false" InitialExpandDepth="0"
            InitialDataBindDepth="-1" Height="400" Width="100%">
            <ExpandCollapseAnimation SlideOpenDirection="Auto" SlideOpenDuration="300" SlideCloseDirection="Auto"
                SlideCloseDuration="300" />
            <ClientEvents MouseDown="WebHierarchicalDataGridMouseDown" />
            <Columns>
                <ig:BoundDataField DataFieldName="EmployeeID" Key="EmployeeID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_EmployeeID %>" />
                <ig:BoundDataField DataFieldName="LastName" Key="LastName" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_LastName %>"
                     />
                <ig:BoundDataField DataFieldName="FirstName" Key="FirstName" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_FirstName %>"
                     />
                <ig:BoundDataField DataFieldName="Region" Key="Region" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Region %>"
                     />
                <ig:BoundDataField DataFieldName="Country" Key="Country" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Country %>"
                     />
            </Columns>
            <Bands>
                <ig:Band DataMember="AccessDataSource2_Orders" Key="Orders" AutoGenerateColumns="false">
                    <Columns>
                        <ig:BoundDataField DataFieldName="OrderID" Key="OrderID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_OrderID %>" />
                        <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_CustomerID %>"
                             />
                        <ig:BoundDataField DataFieldName="OrderDate" Key="OrderDate" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_OrderDate %>"
                            DataFormatString="{0:MM/dd/yyyy}"  />
                        <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_CompanyName %>"
                             />
                        <ig:BoundDataField DataFieldName="Phone" Key="Phone" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Phone %>"
                             />
                    </Columns>
                    <Bands>
                        <ig:Band DataMember="AccessDataSource3_OrderDetails" Key="Details" AutoGenerateColumns="false">
                            <Columns>
                                <ig:BoundDataField DataFieldName="ProductName" Key="ProductName" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductName %>" />
                                <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                                <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_UnitPrice%>"
                                    DataFormatString="{0:c2}" />
                                <ig:BoundDataField DataFieldName="Quantity" Key="Quantity" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Quantity %>" />
                                <ig:BoundDataField DataFieldName="Discount" Key="Discount" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Discount %>"
                                    DataFormatString="{0:#.##%}" />
                            </Columns>
                        </ig:Band>
                    </Bands>
                </ig:Band>
            </Bands>
            <Behaviors>
                <ig:Selection RowSelectType="Single" CellClickAction="Row" Enabled="true" />
            </Behaviors>
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
    </div>

    <script language="javascript" type="text/javascript">
        var lastSelectedRow = null;

        function MenuItem_Click(menu, eventArgs) {

            var selectedItem = GetSelectedRow();

            if (selectedItem == null)
                return;

            switch (eventArgs.getItem().get_key()) {
                case "Expand":
                    selectedItem.set_expanded(!selectedItem.get_expanded());
                    break;
                case "Select":
                    if (lastSelectedRow.get_grid().get_behaviors().get_selection() != null) {
                        if (selectedItem.get_grid().get_behaviors().get_selection().get_selectedRows().indexOf(selectedItem) == -1)
                            selectedItem.get_grid().get_behaviors().get_selection().get_selectedRows().add(selectedItem);
                        else
                            selectedItem.get_grid().get_behaviors().get_selection().get_selectedRows().remove(selectedItem);
                    }
                    break;
            }
        }

        function GetSelectedRow() {
            return lastSelectedRow;
        }

        function GetCellEditingBehaviors() {
            var whdg_grid = $find("<%= this.whdg1.ClientID %>");
            return whdg_grid.get_gridView().get_behaviors().get_editingCore().get_behaviors().get_cellEditing();
        }

        function EnterEditMode(row) {
            for (i = 1; i < row.get_cellCount(); i = i + 1) {
                GetCellEditingBehaviors().enterEditMode(row.get_cell(i), null);
            }
        }

        function WebHierarchicalDataGridMouseDown(grid, eventArgs) {

            if (eventArgs.get_item() == null || !eventArgs.get_item().get_row)
                return;

            lastSelectedRow = eventArgs.get_item().get_row();

            var menu = $find("<%= this.ContextMenu.ClientID %>");

            if (lastSelectedRow.get_expanded())
                menu.getItems().getItem(0).set_text('<%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_ContextMenu_Collapse")%>');
            else
                menu.getItems().getItem(0).set_text('<%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_ContextMenu_Expand")%>');

            if (lastSelectedRow.get_grid().get_behaviors().get_selection() != null) {
                if (lastSelectedRow.get_grid().get_behaviors().get_selection().get_selectedRows().indexOf(lastSelectedRow) == -1)
                    menu.getItems().getItem(1).set_text('<%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_ContextMenu_SelectRow")%>');
                else
                    menu.getItems().getItem(1).set_text('<%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_ContextMenu_UnSelectRow")%>');
            }

            if (menu != null && eventArgs.get_browserEvent() != null && eventArgs.get_browserEvent().button == 2) {
                menu.showAt(null, null, eventArgs.get_browserEvent());
            }

        }
    </script> 
</asp:Content>
