<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" 
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
    <ig:HtmlScript ID="HtmlScript1" runat="server" Type="text/javascript" Src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="div1" class="wgDataBind">
        <div id="div2" class="ControlPanelHeader">
            <img src="/samplesbrowser/samplescommon/aspnet/Common/clientsideEvent.png" />
            <%= this.GetGlobalResourceObject("Strings","ClientEventsCaption") %>
        </div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <%= this.GetGlobalResourceObject("Strings","ClientEventsDescription") %><br />
            </div>
        </div>
    </div>
    <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="WebHierarchicalDataSource1"
        AutoGenerateColumns="false" AutoGenerateBands="false" InitialDataBindDepth="0"
        DataKeyFields="SupplierID" Height="300" Width="100%">
        <AjaxIndicator Enabled="False" />
        <ClientEvents Populated="PopulatedHandler" Populating="PopulatingHandler" />
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
            <ig:Band DataMember="AccessDataSource2_Products" Key="Products" AutoGenerateColumns="false"
                DataKeyFields="ProductID">
                <Columns>
                    <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                    <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Product %>" />
                    <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                </Columns>
            </ig:Band>
        </Bands>
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
    <asp:AccessDataSource ID="AccessDataSource1" runat="server"
        SelectCommand="SELECT SupplierID, CompanyName, ContactName, Region FROM Suppliers">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server"
        SelectCommand="SELECT ProductID, ProductName, SupplierID, QuantityPerUnit FROM Products">
    </asp:AccessDataSource>

    <script type="text/javascript">
        function PopulatedHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_ClientEvents_Populated") %>');
        }

        function PopulatingHandler(sender, args) {
            addLine('<%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_ClientEvents_Populating") %>');
        }      
    </script>
</asp:Content>

