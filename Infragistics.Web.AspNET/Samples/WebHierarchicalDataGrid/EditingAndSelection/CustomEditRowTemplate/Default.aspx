<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        tbody tr td.activeCellClass
        {
            border-color: Black;
            border-width: 1px;
            border-style: dashed;
        }
        .customEditRowTable td, tr
        {
            font-family: Verdana;
            font-size: 10px;
            color: #000000;
        }
        .customEditRowTable input
        {
            background-color: #696969;
            font-size: 10px;
            font-family: Verdana;
            color: #FFFFFF;
            border: 1px solid #CCCCCC;
            padding: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div id="Icon">
            </div>
            <div id="DataGridWrapper">
                <ig:WebHierarchicalDataGrid id="WebHierarchicalDataGrid1" runat="server" height="400px"
                    width="100%" datasourceid="WebHierarchicalDataSource1" autogeneratecolumns="false"
                    enableajax="true" enableajaxviewstate="true" datakeyfields="CustomerID" initialdatabinddepth="0"
                    initialexpanddepth="0" autogeneratebands="false" oninit="OnInit">
                        <AjaxIndicator Enabled="True" />
                        <Columns>
                            <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_CustomerID %>" />
                            <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Company %>" />
                            <ig:BoundDataField DataFieldName="ContactName" Key="ContactName" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Contact %>" />
                            <ig:BoundDataField DataFieldName="City" Key="City" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_City %>" />
                            <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_PostalCode %>" />
                            <ig:BoundDataField DataFieldName="Country" Key="Country" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Country %>" />
                        </Columns>
                        <Bands>
                            <ig:Band DataMember="ObjectDataSource2_Orders" Key="Orders" DataKeyFields="OrderID"
                                AutoGenerateColumns="false">
                                <Columns>
                                    <ig:BoundDataField DataFieldName="OrderID" Key="OrderID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                                    <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" Hidden="true" />
                                    <ig:BoundDataField DataFieldName="OrderDate" DataType="System.DateTime" Key="OrderDate" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_OrderDate %>" />
                                    <ig:BoundDataField DataFieldName="ShipAddress" Key="ShipAddress" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ShipAddress %>" />
									<ig:BoundDataField DataFieldName="ShipCountry" Key="ShipCountry" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ShipCountry %>" />
                                </Columns>
                                <Behaviors>
                                    <ig:EditingCore>
                                        <Behaviors>
                                            <ig:RowEditingTemplate CancelButton="buttonCancel" OKButton="buttonOK">
                                                <EditModeActions MouseClick="Double" />
                                                <ClientBindings>
                                                    <ig:RowEditingClientBinding ColumnKey="OrderDate" ControlID="control1" GetValueJavaScript="new Date($get({ClientID}).value)"
                                                        SetValueJavaScript="$get({ClientID}).value={value}" />
                                                    <ig:RowEditingClientBinding ColumnKey="ShipAddress" ControlID="control2" GetValueJavaScript="$get({ClientID}).value"
                                                        SetValueJavaScript="$get({ClientID}).value={value}" />
                                                    <ig:RowEditingClientBinding ColumnKey="ShipCountry" ControlID="control3" GetValueJavaScript="$get({ClientID}).value"
                                                        SetValueJavaScript="$get({ClientID}).value={value}" />
                                                </ClientBindings>
                                                <Template>
                                                    <div style="background-color: white; border: 1px solid black;">
                                                        <table border="0" class="customEditRowTable">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="OrderDateLabel" runat="server" Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_OrderDate %>" />
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="control1" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="ShipAddressLabel" runat="server" Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ShipAddress %>" />
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="control2" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="ShipCountryLabel" runat="server" Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ShipCountry %>" />
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="control3" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="buttonOK" runat="server" OnClientClick="return" Text="<%$ Resources:WebHierarchicalDataGrid, ButtonOK %>"
                                                                        UseSubmitBehavior="False" />&nbsp;
                                                                    <asp:Button ID="buttonCancel" runat="server" CausesValidation="False" OnClientClick="return"
                                                                        Text="<%$ Resources:WebHierarchicalDataGrid, ButtonCancel %>" UseSubmitBehavior="False" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </Template>
                                            </ig:RowEditingTemplate>
                                        </Behaviors>
                                    </ig:EditingCore>
                                </Behaviors>
                            </ig:Band>
                        </Bands>
                        <Behaviors>
                        <ig:Activation ActiveCellCssClass="activeCellClass" Enabled="true" />
                        <ig:Selection CellClickAction="Row" RowSelectType="Single" Enabled="true" />
                        <ig:Paging PagerAppearance="Bottom" PageSize="10" Enabled="true" />
                    </Behaviors>
                </ig:WebHierarchicalDataGrid>
            </div>
        </div>
    </div>
	<ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
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
</asp:Content>
