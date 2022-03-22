<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
 <ig:HtmlLink ID="HtmlLink1"  runat="server" type="text/css" rel="Stylesheet" href="ControlPanel.css" /> 
 
    <ig:HtmlScript ID="HtmlScript1" runat="server" Type="text/javascript" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
       <div id="wrapper" class="wgDataBind">
        <div id="headerContainer" class="ControlPanelHeader">
            <img src="/samplesbrowser/samplescommon/aspnet/WebHierarchicalDataGrid/EditingAndSelection/AddNewRowOnParentLevel/clientSideEvent.png" />
            <%= this.GetGlobalResourceObject("WebDataGrid","DataEditing_AddRowClient_HeaderTitle") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent" style="height:200px; overflow:auto">
                <%= this.GetGlobalResourceObject("WebDataGrid","WebDataGrid_EventsDescription") %><br />
            </div>
        </div>
    </div>
    <div style="width: 100%">
        <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="WebHierarchicalDataSource1"
            AutoCRUD="true" AutoGenerateColumns="false" AutoGenerateBands="false" InitialExpandDepth="0"
            OnRowAdding="WHDG_RowAdding" InitialDataBindDepth="0" Height="500" Width="100%"
            DataKeyFields="CustomerID">
            <Columns>
                <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Company %>" />
                <ig:BoundDataField DataFieldName="ContactName" Key="ContactName" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Contact %>" />
                <ig:BoundDataField DataFieldName="Address" Key="Address" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Address %>" />
                <ig:BoundDataField DataFieldName="City" Key="City" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_City %>" />
                <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_PostalCode %>" />
                <ig:BoundDataField DataFieldName="Country" Key="Country" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Country %>" />
            </Columns>
            <Bands>
                <ig:Band DataMember="ObjectDataSource2_Orders" Key="Orders" AutoGenerateColumns="false"
                    DataKeyFields="OrderID">
                    <Columns>
                        <ig:BoundDataField DataFieldName="OrderID" Key="OrderID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                        <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_CustomerID %>" />
                        <ig:BoundDataField DataFieldName="OrderDate" Key="OrderDate" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_OrderDate %>" />
                        <ig:BoundDataField DataFieldName="ShipCountry" Key="ShipCountry" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ShipCountry %>" />
                    </Columns>
                </ig:Band>
            </Bands>
            <Behaviors>
                <ig:EditingCore>
                    <Behaviors>
                        <ig:RowAdding Alignment="Top" EditModeActions-EnableOnActive="true" Enabled="true"
                            EditModeActions-MouseClick="Single">
                            <ColumnSettings>
                                <ig:RowAddingColumnSetting ColumnKey="Country" EditorID="CountrysProvider" />
                            </ColumnSettings>
                            <AddNewRowClientEvents EnteringEditMode="WHDG_EnteringEditMode" EnteredEditMode="WHDG_EnteredEditMode"
                                ExitedEditMode="WHDG_ExitedEditMode" ExitingEditMode="WHDG_ExitingEditMode" Initialize="WHDG_Initialize" />
                        </ig:RowAdding>
                    </Behaviors>
                </ig:EditingCore>
            </Behaviors>
                <EditorProviders>
                <ig:DropDownProvider ID="CountrysProvider">
                    <EditorControl ID="CountrysEditorControl1" runat="server" 
                        DisplayMode="DropDownList" 
                        DataSourceID="CountrysObjectDataSource" 
                        TextField="Country" 
                        ValueField="Country" Width="124px"
                         />
                </ig:DropDownProvider>
            </EditorProviders>
        </ig:WebHierarchicalDataGrid>
        
        <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
            <DataRelations>
                <ig:DataRelation ParentColumns="CustomerID" ParentDataViewID="ObjectDataSource1_Customers"
                    ChildColumns="CustomerID" ChildDataViewID="ObjectDataSource2_Orders" />
            </DataRelations>
            <DataViews>
                <ig:DataView ID="ObjectDataSource1_Customers" DataSourceID="ObjectDataSource1" />
                <ig:DataView ID="ObjectDataSource2_Orders" DataSourceID="ObjectDataSource2" />
            </DataViews>
        </ig:WebHierarchicalDataSource>
        
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="AddCustomer"
            SelectMethod="GetCustomerDataSource" EnableCaching="false" TypeName="NwindDataSource">
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="ContactName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="PostalCode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="singlePage" Type="Boolean" DefaultValue="true" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetOrdersDataSource"
            EnableCaching="false" TypeName="NwindDataSource">
            <SelectParameters>
                <asp:Parameter Name="singlePage" Type="Boolean" DefaultValue="true" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <asp:AccessDataSource ID="CountrysObjectDataSource" runat="server"
            SelectCommand="SELECT DISTINCT [Country] FROM [Customers]">
        </asp:AccessDataSource>
    </div>

    <script type="text/javascript">
        function WHDG_EnteringEditMode(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","AddNewRow_EnteringEditMode") %>');
        }

        function WHDG_EnteredEditMode(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","AddNewRow_EnteredEditMode")%>');
        }

        function WHDG_ExitedEditMode(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","AddNewRow_ExitedEditMode") %>');
        }

        function WHDG_ExitingEditMode(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","AddNewRow_ExitingEditMode") %>');
        }

        function WHDG_Initialize(webDataGrid, evntArgs) {
            addLine("WebDataGridView_Initialize");
        }
    
    </script>
</asp:Content>
