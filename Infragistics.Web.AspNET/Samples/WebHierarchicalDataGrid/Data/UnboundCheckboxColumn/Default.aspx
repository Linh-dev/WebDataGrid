<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebHierarchicalDataGrid_Data_Unbound_Checkbox_Column_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div id="headerContainer" class="ControlPanelHeader">
        <img alt="Client Side Events" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/clientSideEvent.png" />
        <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","DataEditing_UnboundCheckboxColumn_HeaderTitle") %></div>
    <div id="countContainer" class="controlPanel">
        <div id="eventList" class="controlPanelEvent">
            <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_EventsDescription") %><br />
        </div>
    </div>
    <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" Height="400px"
        Width="100%" DataSourceID="WebHierarchicalDataSource1" AutoGenerateColumns="false"
        EnableAjax="true" DataKeyFields="SupplierID" InitialDataBindDepth="0" InitialExpandDepth="0"
        AutoGenerateBands="false" OnInit="OnInit">
        <AjaxIndicator Enabled="True" />
        <Columns>
            <ig:UnboundCheckBoxField Key="Check" HeaderChecked="False" />
            <ig:BoundDataField DataFieldName="SupplierID" Key="SupplierID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_SupplierID %>" />
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
                    <ig:BoundDataField DataFieldName="ProductID" Key="ProductID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                    <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Product %>" />
                    <ig:BoundDataField DataFieldName="SupplierID" Key="SupplierID" Hidden="true" />
                    <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                    <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_UnitPrice %>" />
                    <ig:BoundDataField DataFieldName="UnitsOnOrder" Key="UnitsOnOrder" Header-Text="<%$ Resources:WebDataGrid ,UnitsOnOrder %>" />
                </Columns>
            </ig:Band>
        </Bands>
        <Behaviors>
            <ig:EditingCore>
                <Behaviors>
                    <ig:CellEditing>
                        <ColumnSettings>
                            <ig:EditingColumnSetting ColumnKey="SupplierID" ReadOnly="true" />
                            <ig:EditingColumnSetting ColumnKey="Company" ReadOnly="true" />
                            <ig:EditingColumnSetting ColumnKey="Contact" ReadOnly="true" />
                            <ig:EditingColumnSetting ColumnKey="City" ReadOnly="true" />
                            <ig:EditingColumnSetting ColumnKey="Region" ReadOnly="true" />
                            <ig:EditingColumnSetting ColumnKey="Phone" ReadOnly="true" />
                        </ColumnSettings>
                    </ig:CellEditing>
                </Behaviors>
            </ig:EditingCore>
        </Behaviors>
    </ig:WebHierarchicalDataGrid>
    <p></p>
    <asp:Button ID="Button1" Text="<%$ Resources:WebHierarchicalDataGrid, PersistentSelection_PostBack %>" runat="server" />
    <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
        <DataRelations>
            <ig:DataRelation ParentColumns="SupplierID" ParentDataViewID="ObjectDataSource1_Suppliers"
                ChildColumns="SupplierID" ChildDataViewID="AccessDataSource2_Products" />
        </DataRelations>
        <DataViews>
            <ig:DataView ID="ObjectDataSource1_Suppliers" DataSourceID="ObjectDataSource1" />
            <ig:DataView ID="AccessDataSource2_Products" DataSourceID="AccessDataSource2" />
        </DataViews>
    </ig:WebHierarchicalDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
        UpdateMethod="UpdateSupplier"
        SelectMethod="GetSuppliersDataSource"
        EnableCaching="true"
        TypeName="NorthwindDataSource">
        <UpdateParameters>
			<asp:Parameter Name="SupplierID" Type="Int32" />
			<asp:Parameter Name="CompanyName" Type="String" />
			<asp:Parameter Name="ContactName" Type="String" />
			<asp:Parameter Name="City" Type="String" />
			<asp:Parameter Name="Region" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
		</UpdateParameters>
    </asp:ObjectDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT ProductID, ProductName, SupplierID, QuantityPerUnit, UnitPrice, UnitsOnOrder FROM Products">
    </asp:AccessDataSource>
    <script type="text/javascript" language="javascript">

        function cellValueChanging(sender, eventArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","CellValueChanging") %> ' + eventArgs.get_newValue());
        }

        function cellValueChanged(sender, eventArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","CellValueChanged") %>');
        }

        function headerCheckBoxClicked(sender, eventArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","HeaderCheckBoxClicked") %>');
        }

        function headerCheckBoxClicking(sender, eventArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","HeaderCheckBoxClicking") %>');
        }
    
    </script>
</asp:Content>
