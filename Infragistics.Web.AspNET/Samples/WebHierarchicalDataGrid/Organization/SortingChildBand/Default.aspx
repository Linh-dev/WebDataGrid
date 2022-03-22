<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
 <ig:HtmlLink  runat="server" type="text/css" rel="Stylesheet" href="ControlPanel.css" /> 
    <ig:HtmlScript runat="server" Type="text/javascript" Src="ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <div id="wrapper" class="wgDataBind">
        <div id="headerContainer" class="ControlPanelHeader">
            <img src="/samplesbrowser/samplescommon/aspnet/WebHierarchicalDataGrid/Organization/SortingChildBand/clientsideEvent.png" />
            <%= this.GetGlobalResourceObject("WebDataGrid","DataEditing_AddRowClient_HeaderTitle") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <%= this.GetGlobalResourceObject("WebDataGrid","WebDataGrid_EventsDescription") %><br />
            </div>
        </div>
    </div>
    <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="WebHierarchicalDataSource1"
        AutoGenerateColumns="false" AutoGenerateBands="false" InitialExpandDepth="0"
        InitialDataBindDepth="0" Height="400px" Width="100%" DataKeyFields="SupplierID">
        <ExpandCollapseAnimation SlideOpenDirection="Auto" SlideOpenDuration="300" SlideCloseDirection="Auto"
            SlideCloseDuration="300" />
        <Columns>
            <ig:BoundDataField DataFieldName="SupplierID" Key="Supplier ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_SupplierID %>" />
            <ig:BoundDataField DataFieldName="CompanyName" Key="Company" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Company %>"
                Width="230px" />
            <ig:BoundDataField DataFieldName="ContactName" Key="Contact" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Contact %>"
                Width="150px" />
            <ig:BoundDataField DataFieldName="Region" Key="Region" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Region %>"
                Width="80px" />
        </Columns>
        <Bands>
            <ig:Band DataMember="AccessDataSource2_Products" Key="Products" AutoGenerateColumns="false">
                <Columns>
                    <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                    <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Product %>" />
                    <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                </Columns>
                
                <Behaviors>
                    <ig:Sorting SortingMode="Single" Enabled="true">
                        <SortingClientEvents ColumnSorted="WHDG_ColumnSorted" ColumnSorting="WHDG_ColumnSorting" />
                    </ig:Sorting>
                </Behaviors>
                
            </ig:Band>
        </Bands>
        <Behaviors>
            <ig:Paging PagerAppearance="Bottom" PageSize="10" Enabled="true" />
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
    

    <script type="text/javascript">

        function WHDG_ColumnSorted(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_SortingParentClient_ColumnSorted") %>');
        }

        function WHDG_ColumnSorting(sender, args) {
            var msg = '<%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_SortingParentClient_ColumnSorting") %>' + " - " + args.get_column().get_key();
            addLine(msg);
        }
            
    </script>

</asp:Content>
