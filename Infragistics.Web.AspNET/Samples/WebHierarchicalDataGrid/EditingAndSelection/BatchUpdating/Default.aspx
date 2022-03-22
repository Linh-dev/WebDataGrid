<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .batch-options { color: #656565; font-size: 12px; margin: 5px 0; padding: 5px; border: 1px solid #000000; font-weight:bold; }
        .batch-options > .batch-info { font-style: italic; margin: 5px 20px; font-weight: normal; }
        .batch-buttons { float: right; margin: 5px 0 5px 5px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="up1" runat="server">
        <ContentTemplate>
            <div class="batch-options">
                <asp:CheckBox ID="chkBatch" runat="server" Checked="true"
                     AutoPostBack="true"/>
                <asp:Literal ID="ltrEnableBatch" runat="server" Text="<%$ Resources:WebHierarchicalDataGrid, BatchUpdatingEnable %>"></asp:Literal><br />
                <asp:CheckBox ID="chkBatchChild" runat="server" Checked="true"
                     AutoPostBack="true"/>
                <asp:Literal ID="ltrEnableBatchChild" runat="server" Text="<%$ Resources:WebHierarchicalDataGrid, BatchUpdatingEnableChild %>"></asp:Literal>
            </div>
            <!--#BEGIN SNIPPET#-->
            <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="whds1"
                AutoGenerateColumns="false" AutoGenerateBands="false" DataKeyFields="CustomerID"
                InitialExpandDepth="0" InitialDataBindDepth="3" Width="100%">
                <ExpandCollapseAnimation SlideOpenDirection="Auto" SlideOpenDuration="300" 
                                         SlideCloseDirection="Auto" SlideCloseDuration="300" />
                <Columns>
                    <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_CustomerID %>" />
                    <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Company %>" />
                    <ig:BoundDataField DataFieldName="ContactName" Key="ContactName" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Contact %>" />
                    <ig:BoundDataField DataFieldName="Address" Key="Address" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Address %>" />
                    <ig:BoundDataField DataFieldName="City" Key="City" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_City %>" />
                    <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_PostalCode %>" />
                    <ig:BoundDataField DataFieldName="Country" Key="Country" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Country %>" />
                </Columns>
                <Behaviors>
                    <ig:Activation />
                    <ig:Paging />
                    <ig:Filtering />
                    <ig:Sorting />
                    <ig:Selection CellClickAction="Row" RowSelectType="Multiple"/>
                    <ig:EditingCore BatchUpdating="true">
                        <Behaviors>
                            <ig:RowAdding>
                                <ColumnSettings>
                                    <ig:RowAddingColumnSetting ColumnKey="CustomerID" DefaultValueAsString="---" />
                                </ColumnSettings>
                            </ig:RowAdding>
                            <ig:RowDeleting/>
                            <ig:CellEditing Enabled="true" EditModeActions-EnableF2="true">
                                <ColumnSettings>
                                    <ig:EditingColumnSetting ColumnKey="CustomerID" ReadOnly="true" />
                                </ColumnSettings>
                            </ig:CellEditing>
                        </Behaviors>
                    </ig:EditingCore>
                </Behaviors>
                <Bands>
                    <ig:Band DataMember="ObjectDataSource2_Orders" Key="Orders" AutoGenerateColumns="false"
                        DataKeyFields="OrderID">
                        <Columns>
                            <ig:BoundDataField DataFieldName="OrderID" Key="OrderID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                            <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_CustomerID %>" />
                            <ig:BoundDataField DataFieldName="OrderDate" Key="OrderDate" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_OrderDate %>" />
                            <ig:BoundDataField DataFieldName="ShipCountry" Key="ShipCountry" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ShipCountry %>" />
                        </Columns>
                        <Behaviors>
                            <ig:EditingCore BatchUpdating="true">
                                <Behaviors>
                                    <ig:RowAdding>
                                        <ColumnSettings>
                                            <ig:RowAddingColumnSetting ColumnKey="OrderID" DefaultValueAsString="-1" />
                                            <ig:RowAddingColumnSetting ColumnKey="CustomerID" DefaultValueAsString="---" />
                                        </ColumnSettings>
                                    </ig:RowAdding>
                                    <ig:RowDeleting/>
                                    <ig:CellEditing Enabled="true" EditModeActions-EnableF2="true">
                                        <ColumnSettings>
                                            <ig:EditingColumnSetting ColumnKey="ProductID" ReadOnly="true" />
                                            <ig:EditingColumnSetting ColumnKey="CustomerID" ReadOnly="true" />
                                        </ColumnSettings>
                                    </ig:CellEditing>
                                </Behaviors>
                            </ig:EditingCore>
                        </Behaviors>
                    </ig:Band>
                </Bands>
            </ig:WebHierarchicalDataGrid>
            <!--#END SNIPPET#-->
            
            <div class="buttons-default-save">
                <asp:Button ID="btnSaveData" runat="server" CssClass="batch-buttons"
                    Text="<%$Resources:WebHierarchicalDataGrid , lbl_BatchUpdateSaveData %>" />

                <asp:Button ID="btnDefaultData" runat="server" CssClass="batch-buttons"
                    Text="<%$Resources:WebHierarchicalDataGrid , lbl_DefaultBatchData %>" />
                <div class="clear"></div>
            </div>

            <ig:WebHierarchicalDataSource ID="whds1" runat="server">
                <DataRelations>
                    <ig:DataRelation ParentColumns="CustomerID" ParentDataViewID="ObjectDataSource1_Customers"
                        ChildColumns="CustomerID" ChildDataViewID="ObjectDataSource2_Orders" />
                </DataRelations>
                <DataViews>
                    <ig:DataView ID="ObjectDataSource1_Customers" DataSourceID="ods1" />
                    <ig:DataView ID="ObjectDataSource2_Orders" DataSourceID="ods2" />
                </DataViews>
            </ig:WebHierarchicalDataSource>
        
            <asp:ObjectDataSource ID="ods1" runat="server"
                SelectMethod="GetCustomerDataSource"  
                UpdateMethod="UpdateCustomer"
                InsertMethod="AddCustomer"
                DeleteMethod="DeleteCustomer"
                EnableCaching="false"
                TypeName="NorthwindDataSource" >
                <SelectParameters>
                    <asp:Parameter Name="singlePage" Type="Boolean" DefaultValue="true" />
                </SelectParameters>
                <UpdateParameters>
			        <asp:Parameter Name="CustomerID" Type="String" />
			        <asp:Parameter Name="CompanyName" Type="String" />
			        <asp:Parameter Name="ContactName" Type="String" />
			        <asp:Parameter Name="Address" Type="String" />
			        <asp:Parameter Name="City" Type="String" />
			        <asp:Parameter Name="PostalCode" Type="String" />
			        <asp:Parameter Name="Country" Type="String" />
		        </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="CustomerID" Type="String" />
			        <asp:Parameter Name="CompanyName" Type="String" />
			        <asp:Parameter Name="ContactName" Type="String" />
			        <asp:Parameter Name="Address" Type="String" />
			        <asp:Parameter Name="City" Type="String" />
			        <asp:Parameter Name="PostalCode" Type="String" />
			        <asp:Parameter Name="Country" Type="String" />
                </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Name="CustomerID" Type="String" />
                </DeleteParameters>
            </asp:ObjectDataSource>
        
            <asp:ObjectDataSource ID="ods2" runat="server" 
                SelectMethod="GetOrdersDataSource"
                UpdateMethod="UpdateOrder"
                InsertMethod="AddOrder"
                DeleteMethod="DeleteOrder"
                EnableCaching="false" 
                TypeName="NwindDataSource">
                <SelectParameters>
                    <asp:Parameter Name="singlePage" Type="Boolean" DefaultValue="true" />
                </SelectParameters>
                <UpdateParameters>
			        <asp:Parameter Name="OrderID" Type="String" />
			        <asp:Parameter Name="CustomerID" Type="String" />
			        <asp:Parameter Name="OrderDate" Type="String" />
                    <asp:Parameter Name="ShipName" Type="String" DefaultValue="" />
                    <asp:Parameter Name="ShipAddress" Type="String" DefaultValue="" />
                    <asp:Parameter Name="ShipCity" Type="String" DefaultValue="" />
			        <asp:Parameter Name="ShipCountry" Type="String" />
		        </UpdateParameters>
                <InsertParameters>
			        <asp:Parameter Name="OrderID" Type="String" />
			        <asp:Parameter Name="CustomerID" Type="String" />
			        <asp:Parameter Name="OrderDate" Type="String" />
                    <asp:Parameter Name="ShipName" Type="String" DefaultValue="" />
                    <asp:Parameter Name="ShipAddress" Type="String" DefaultValue="" />
                    <asp:Parameter Name="ShipCity" Type="String" DefaultValue="" />
			        <asp:Parameter Name="ShipCountry" Type="String" />
                </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Name="OrderID" Type="String" />
                </DeleteParameters>
            </asp:ObjectDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>