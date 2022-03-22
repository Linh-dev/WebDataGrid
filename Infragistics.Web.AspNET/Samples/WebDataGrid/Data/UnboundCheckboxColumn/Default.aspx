<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Data_Unbound_Checkbox_Column_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="headerContainer" class="ControlPanelHeader">
        <img alt="Client Side Events" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/clientSideEvent.png" />
        <%= this.GetGlobalResourceObject("WebDataGrid","DataEditing_UnboundCheckboxColumn_HeaderTitle") %></div>
    <div id="countContainer" class="controlPanel">
        <div id="eventList" class="controlPanelEvent">
            <%= this.GetGlobalResourceObject("WebDataGrid","WebDataGrid_EventsDescription") %><br />
        </div>
    </div>
    <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="400px"
        Width="100%" DataSourceID="ObjectDataSource1" AutoGenerateColumns="false"
        EnableAjax="true" EnableAjaxViewState="true" DataKeyFields="ProductID" >
        <AjaxIndicator Enabled="True" />
        <Columns>
            <ig:UnboundCheckBoxField Key="Check" HeaderChecked="False" />
            <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebDataGrid ,ProductID %>" />
            <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebDataGrid ,ProductName %>" />
            <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebDataGrid ,QuantityPerUnit %>" />
            <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" Header-Text="<%$ Resources:WebDataGrid ,UnitPrice %>" />
            <ig:BoundDataField DataFieldName="UnitsOnOrder" Key="UnitsOnOrder" Header-Text="<%$ Resources:WebDataGrid ,UnitsOnOrder %>" />
        </Columns>
        <Behaviors>
            <ig:EditingCore>
                <Behaviors>
                    <ig:CellEditing>
                        <ColumnSettings>
                            <ig:EditingColumnSetting ColumnKey="Product ID" ReadOnly="true" />
                            <ig:EditingColumnSetting ColumnKey="Product" ReadOnly="true" />
                            <ig:EditingColumnSetting ColumnKey="QuantityPerUnit" ReadOnly="true" />
                            <ig:EditingColumnSetting ColumnKey="UnitPrice" ReadOnly="true" />
                            <ig:EditingColumnSetting ColumnKey="UnitsOnOrder" ReadOnly="true" />
                            <ig:EditingColumnSetting ColumnKey="Sum" ReadOnly="true" />
                        </ColumnSettings>
                    </ig:CellEditing>
                </Behaviors>
            </ig:EditingCore>
        </Behaviors>
    </ig:WebDataGrid>
    <p></p>
    <asp:Button ID="Button1" Text="<%$ Resources:WebDataGrid, PersistentSelection_PostBack %>" runat="server" />
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
        UpdateMethod="UpdateProduct"
        SelectMethod="GetProductsDataSource"  
        EnableCaching="false"
        TypeName="NorthwindDataSource" >
		<UpdateParameters>
			<asp:Parameter Name="ProductID" Type="Int32" />
			<asp:Parameter Name="ProductName" Type="String" />
			<asp:Parameter Name="SupplierID" Type="Int32" />
			<asp:Parameter Name="QuantityPerUnit" Type="String" />
			<asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="UnitsInStock" Type="Int16" />
			<asp:Parameter Name="UnitsOnOrder" Type="Int16" />
            <asp:Parameter Name="Discontinued" Type="Boolean" />
		</UpdateParameters>		
    </asp:ObjectDataSource>
    
    <script type="text/javascript" language="javascript">

        function cellValueChanging(sender, eventArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","CellValueChanging") %> ' + eventArgs.get_newValue());
        }

        function cellValueChanged(sender, eventArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","CellValueChanged") %>');
        }

        function headerCheckBoxClicked(sender, eventArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","HeaderCheckBoxClicked") %>');
        }

        function headerCheckBoxClicking(sender, eventArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","HeaderCheckBoxClicking") %>');
        }
    
    </script>
</asp:Content>
