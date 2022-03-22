<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebHierarchicalDataGrid_Organization_Column_Moving_Server_Side_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css"
        rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePaneContainer" ChildrenAsTriggers="true" UpdateMode="Conditional"
        runat="server">
        <ContentTemplate>
            <div id="headerContainer" class="ControlPanelHeader">
                <img alt="Control Panel" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/config.png" />
                <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_Configuration_Panel_Title") %></div>
            <div id="countContainer" class="controlPanel">
                <div id="eventList" class="controlPanelEvent">
                    <span class="leftTitle">
                        <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","ColumnMoving_MovingType")%></span>
                    <asp:DropDownList ID="ColumnMovingType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ColumnMovingType_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="Slide" Text="<%$ Resources:WebHierarchicalDataGrid, ColumnMoving_DragStyleSlide  %>"></asp:ListItem>
                        <asp:ListItem Value="Follow" Text="<%$ Resources:WebHierarchicalDataGrid, ColumnMoving_DragStyleFollow  %>"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <span class="leftTitle">
                        <%= this.GetGlobalResourceObject("WebHierarchicalDataGrid","ColumnMoving_Disable")%></span>
                    <asp:DropDownList ID="ColumnsList" runat="server" AutoPostBack="True" CssClass="columnList"
                        OnSelectedIndexChanged="ColumnsList_SelectedIndexChanged">
                        <asp:ListItem Value="None" Text="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_None %>"
                            Selected="True"></asp:ListItem>
                        <asp:ListItem Value="Supplier ID" Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_SupplierID %>"></asp:ListItem>
                        <asp:ListItem Value="Company" Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Company %>"></asp:ListItem>
                        <asp:ListItem Value="Contact" Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Contact %>"></asp:ListItem>
                        <asp:ListItem Value="City" Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_City %>"></asp:ListItem>
                        <asp:ListItem Value="Region" Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Region %>"></asp:ListItem>
                        <asp:ListItem Value="Phone" Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Phone %>"></asp:ListItem>
                        <asp:ListItem Value="Product ID" Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductID %>"></asp:ListItem>
                        <asp:ListItem Value="Product" Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Product %>"></asp:ListItem>
                        <asp:ListItem Value="QuantityPerUnit" Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>"></asp:ListItem>
                        <asp:ListItem Value="UnitPrice" Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_UnitPrice %>"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
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
                                <ig:ColumnMoving DragStyle="Slide">
                                    <ColumnSettings>
                                        <ig:ColumnMoveSetting EnableMove="true" ColumnKey="Product ID" />
                                        <ig:ColumnMoveSetting EnableMove="true" ColumnKey="Product" />
                                        <ig:ColumnMoveSetting EnableMove="true" ColumnKey="QuantityPerUnit" />
                                        <ig:ColumnMoveSetting EnableMove="true" ColumnKey="UnitPrice" />
                                    </ColumnSettings>
                                </ig:ColumnMoving>
                            </Behaviors>
                        </ig:Band>
                    </Bands>
                    <Behaviors>
                        <ig:ColumnMoving DragStyle="Slide">
                            <ColumnSettings>
                                <ig:ColumnMoveSetting EnableMove="true" ColumnKey="Supplier ID" />
                                <ig:ColumnMoveSetting EnableMove="true" ColumnKey="Company" />
                                <ig:ColumnMoveSetting EnableMove="true" ColumnKey="Contact" />
                                <ig:ColumnMoveSetting EnableMove="true" ColumnKey="City" />
                                <ig:ColumnMoveSetting EnableMove="true" ColumnKey="Region" />
                                <ig:ColumnMoveSetting EnableMove="true" ColumnKey="Phone" />
                            </ColumnSettings>
                        </ig:ColumnMoving>
                    </Behaviors>
                </ig:WebHierarchicalDataGrid>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
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
