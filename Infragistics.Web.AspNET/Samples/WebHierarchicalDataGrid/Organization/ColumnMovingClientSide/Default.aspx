<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css"
        rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
    <script type="text/javascript">

        function WebDataGridView_Initialize(webDataGrid, evntArgs) {
            addLine("Initialized");
        }

        function WebDataGridView_HeaderDragStart(webDataGrid, evntArgs) {
            addLine("HeaderDragStart");
        }

        function WebDataGridView_HeaderDragEnd(webDataGrid, evntArgs) {
            addLine("HeaderDragEnd");
        }

        function WebDataGridView_HeaderDropped(webDataGrid, evntArgs) {
            var movedColumnIndex = evntArgs.get_column().get_index();
            var movedColumnTargetIndex = evntArgs.get_targetIndex();

            addLine(String.format("HeaderDropped: Column {0}, New Index {1}", movedColumnIndex, movedColumnTargetIndex));
        }

        function WebDataGridView_HeaderMove(webDataGrid, evntArgs) {
            addLine("HeaderMove");
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="headerContainer" class="ControlPanelHeader">
            <img alt="Client Side Events" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/clientSideEvent.png" />
            <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","ColumnMoving_ClientEventsHeaderTitle") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent" style="height : 200px; overflow : scroll;">
                <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_EventsDescription") %><br />
            </div>
        </div>
        <div id="container">
            <div id="DataGridWrapper">
                <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" Height="400px"
                    Width="100%" DataSourceID="WebHierarchicalDataSource1" AutoGenerateColumns="false"
                    DataKeyFields="SupplierID" InitialDataBindDepth="0" InitialExpandDepth="0" AutoGenerateBands="false">
                    <Columns>
                        <ig:BoundDataField DataFieldName="SupplierID" Key="Supplier ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_SupplierID %>" />
                        <ig:BoundDataField DataFieldName="CompanyName" Key="Company" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Company %>" />
                        <ig:BoundDataField DataFieldName="ContactName" Key="Contact" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Contact %>" />
                        <ig:BoundDataField DataFieldName="City" Key="City" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_City %>" />
                        <ig:BoundDataField DataFieldName="Region" Key="Region" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Region %>" />
                        <ig:BoundDataField DataFieldName="Phone" Key="Phone" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Phone %>" />
                    </Columns>
                    <Bands>
                        <ig:Band DataMember="AccessDataSource2_Products" Key="Products" DataKeyFields="ProductID"
                            AutoGenerateColumns="false">
                            <Columns>
                                <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                                <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Product %>" />
                                <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                                <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_UnitPrice %>" />
                            </Columns>
                            <Behaviors>
                                <ig:ColumnMoving DragStyle="Follow">
                                    <ColumnMovingClientEvents Initialize="WebDataGridView_Initialize" HeaderDragStart="WebDataGridView_HeaderDragStart"
                                        HeaderDragEnd="WebDataGridView_HeaderDragEnd" HeaderMove="WebDataGridView_HeaderMove"
                                        HeaderDropped="WebDataGridView_HeaderDropped" />
                                </ig:ColumnMoving>
                            </Behaviors>
                        </ig:Band>
                    </Bands>
                    <Behaviors>
                        <ig:ColumnMoving DragStyle="Follow">
                            <ColumnMovingClientEvents Initialize="WebDataGridView_Initialize" HeaderDragStart="WebDataGridView_HeaderDragStart"
                                HeaderDragEnd="WebDataGridView_HeaderDragEnd" HeaderMove="WebDataGridView_HeaderMove"
                                HeaderDropped="WebDataGridView_HeaderDropped" />
                        </ig:ColumnMoving>
                    </Behaviors>
                </ig:WebHierarchicalDataGrid>
            </div>
        </div>
    </div>
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
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT SupplierID, CompanyName, ContactName, City, Region, Phone FROM Suppliers">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT ProductID, ProductName, SupplierID, QuantityPerUnit, UnitPrice FROM Products">
    </asp:AccessDataSource>
</asp:Content>
