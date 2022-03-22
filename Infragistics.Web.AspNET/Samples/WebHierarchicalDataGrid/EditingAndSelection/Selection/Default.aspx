<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:htmllink runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
<ig:htmllink runat="server" type="text/css" rel="Stylesheet" href="ControlPanel.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <div>
        <div id="topContentContainer" style="margin-top: 25px; margin-bottom: 10px;">
            <div id="headerContainer" class="ControlPanelHeader">
                <img src="/samplesbrowser/samplescommon/aspnet/WebHierarchicalDataGrid/EditingAndSelection/Selection/config.png" />
                <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_Selection_PanelHeaderTitle")%></div>
            <div id="countContainer" class="controlPanel">
                <div id="eventList" class="controlPanelEvent">
                    <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_Selection_PanelDescription")%><br />
                    <div class="outputValue">
                        <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_Selection_SelectedCellsLabel")%>
                        <span id="selectedCellCountLabel">0</span></div>
                    <div class="outputValue">
                        <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_Selection_SelectedColumnsLabel")%>
                        <span id="selectedColumnCountLabel">0</span></div>
                    <div class="outputValue" style=" overflow: auto; ">
                        <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_Selection_SelectedRowLabel")%>
                        <span id="bandSelectedRowLabel"></span></div>
                </div>
            </div>
        </div>
        <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="WebHierarchicalDataSource1"
            AutoGenerateColumns="false" AutoGenerateBands="false" InitialExpandDepth="0" DataKeyFields="SupplierID"
            InitialDataBindDepth="0" Height="400px" Width="100%">
            <Columns>
                <ig:BoundDataField DataFieldName="SupplierID" Key="Supplier ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_SupplierID %>" />
                <ig:BoundDataField DataFieldName="CompanyName" Key="Company" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Company %>"
                    Width="230px" />
                <ig:BoundDataField DataFieldName="ContactName" Key="Contact" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Contact %>"
                    Width="250px" />
                <ig:BoundDataField DataFieldName="Region" Key="Region" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Region %>"
                    Width="120px" />
            </Columns>
            <Bands>
                <ig:Band DataMember="AccessDataSource2_Products" Key="Products" AutoGenerateColumns="false" DataKeyFields="ProductID">
                    <Columns>
                        <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                        <ig:BoundDataField DataFieldName="ProductName" Key="Product" Width="40%" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Product %>" />
                        <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Width="40%"
                            Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                    </Columns>
                </ig:Band>
            </Bands>
            <Behaviors>
                <ig:Selection CellSelectType="Multiple" ColumnSelectType="Multiple" Enabled="true">
                    <SelectionClientEvents ColumnSelectionChanged="WHDG_ColumnSelectionChanged" CellSelectionChanged="WHDG_CellSelectionChanged" />
                </ig:Selection>
            </Behaviors>
        </ig:WebHierarchicalDataGrid>
        <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
            <DataRelations>
                <ig:DataRelation ParentColumns="SupplierID" ParentDataViewID="AccessDataSource1_Suppliers"
                    ChildColumns="SupplierID" ChildDataViewID="AccessDataSource2_Products" />
            </DataRelations>
            <DataViews>
                <ig:DataView ID="AccessDataSource1_Suppliers" DataSourceID="AccessDataSource1" />
                <ig:DataView ID="AccessDataSource2_Products" DataSourceID="AccessDataSource2" />
            </DataViews>
        </ig:WebHierarchicalDataSource>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'
            SelectCommand="SELECT SupplierID, CompanyName, ContactName, Region FROM Suppliers">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'
            SelectCommand="SELECT ProductID, ProductName, SupplierID, QuantityPerUnit FROM Products">
        </asp:AccessDataSource>
    </div>

    <script type="text/javascript">
        function WHDG_ColumnSelectionChanged(webDataGrid, evntArgs) {
            Count(webDataGrid);
        }

        function WHDG_CellSelectionChanged(webDataGrid, evntArgs) {

            var cells = webDataGrid.get_behaviors().get_selection().get_selectedCellsResolved();

            if (cells.length == 0) {
                document.getElementById("selectedCellCountLabel").innerHTML = "0";
                document.getElementById("bandSelectedRowLabel").innerHTML = "";
                return;
            }

            var cellValues = cells[0].get_value();

            for (i = 1; i < cells.length; i++) {
                cellValues += ", " + cells[i].get_value();
            }

            document.getElementById("bandSelectedRowLabel").innerHTML = cellValues;
            Count(webDataGrid);
        }

        function Count(webDataGrid) {
            var selectedCells = webDataGrid.get_behaviors().get_selection().get_selectedCells().get_length();
            var selectedColumns = webDataGrid.get_behaviors().get_selection().get_selectedColumns().get_length();

            document.getElementById("selectedCellCountLabel").innerHTML = selectedCells;
            document.getElementById("selectedColumnCountLabel").innerHTML = selectedColumns;

            if (selectedCells == 0)
                document.getElementById("bandSelectedRowLabel").innerHTML = '';
        }

    </script>
</asp:Content>
