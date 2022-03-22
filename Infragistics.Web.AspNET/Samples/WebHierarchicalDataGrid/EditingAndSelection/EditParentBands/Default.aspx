<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
        <div style="width: 100%">
        <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="WebHierarchicalDataSource1" InitialDataBindDepth="-1"  
            AutoGenerateColumns="false" AutoGenerateBands="false" DataKeyFields="SupplierID" Height="400" Width="100%">
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
                <ig:Band DataMember="AccessDataSource2_Products" Key="Products" AutoGenerateColumns="false" DataKeyFields="ProductID">
                    <Columns>
                        <ig:BoundDataField DataFieldName="ProductID" Key="Product ID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_ProductID %>" />
                        <ig:BoundDataField DataFieldName="ProductName" Key="Product" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_Product %>" />
                        <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
                    </Columns>
                </ig:Band>
            </Bands>
            <EditorProviders>
                <ig:TextEditorProvider ID="BasicTextProvider" />
                <ig:DropDownProvider ID="RegionProvider" >
                    <EditorControl ID="EditorControl1" runat="server" DisplayMode="DropDownList" 
                        TextField="Region"  Width="165px">
                         <ClientEvents DropDownOpening="DropDownOpening" />
                    </EditorControl>
                </ig:DropDownProvider>
            </EditorProviders>
            <Behaviors>
                <ig:EditingCore>
                    <Behaviors>
                        <ig:CellEditing Enabled="true" EditModeActions-EnableF2="true">
                            <ColumnSettings>
                                <ig:EditingColumnSetting ColumnKey="Supplier ID" ReadOnly="true" />
                                <ig:EditingColumnSetting EditorID="BasicTextProvider" />
                                <ig:EditingColumnSetting ColumnKey="Region" EditorID="RegionProvider" />
                            </ColumnSettings>
                        </ig:CellEditing>
                    </Behaviors>
                </ig:EditingCore>
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
        <asp:AccessDataSource ID="Regions" runat="server" SelectCommand='SELECT DISTINCT Region FROM Suppliers WHERE Region <> NULL'>
          </asp:AccessDataSource>
    </div>
    <script type="text/javascript">
        function DropDownOpening(dropDown, args) {
            if ($util.IsIE8 || $util.IsFireFox) {
                var offsetY = 0;
                var grid = $find("<%= this.whdg1.ClientID %>");
                offsetY = grid.get_gridView()._elements["vScrBar"].scrollTop;
                dropDown.behavior.set_offsetY(offsetY);
            }
        }
    </script>
</asp:Content>