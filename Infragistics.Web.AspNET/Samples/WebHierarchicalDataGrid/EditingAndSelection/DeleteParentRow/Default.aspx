<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <div style="width: 100%">
        <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" DataSourceID="WebHierarchicalDataSource1"
            AutoGenerateColumns="false" AutoGenerateBands="false" InitialExpandDepth="2"
            InitialDataBindDepth="3" Height="500" Width="100%" DataKeyFields="CustomerID">
             <ExpandCollapseAnimation SlideOpenDirection="Auto" SlideOpenDuration="300" SlideCloseDirection="Auto"
                SlideCloseDuration="300" />
             <Columns>
             <ig:TemplateDataField Key="DeleteItem" Width="60px">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ID="DeleteItem" AlternateText="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_DeleteButton  %>"
                            ImageUrl="<%$ Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_DeleteRowImagePath %>"
                            OnClientClick="DeleteRow(); return false;" />
                    </ItemTemplate>
                </ig:TemplateDataField>
               <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID" Header-Text="<%$ Resources:WebHierarchicalDataGrid ,WebHierarchicalDataGrid_HeaderText_CustomerID %>" />
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
                <ig:Activation />
                <ig:Selection RowSelectType="Single" CellClickAction="Row" />
                <ig:EditingCore Enabled="true">
                    <Behaviors>
                        <ig:RowDeleting Enabled="true" />
                    </Behaviors>
                </ig:EditingCore>
            </Behaviors>
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
        
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DeleteCustomer"
            SelectMethod="GetCustomerDataSource" EnableCaching="false" TypeName="NwindDataSource">
            <DeleteParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </DeleteParameters>
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
        
    </div>

    <script type="text/javascript">

        function DeleteRow() {
            var grid = $find('<%= this.whdg1.ClientID %>');
            var gridRows = grid.get_gridView().get_rows();

            var selectedRows = grid.get_gridView().get_behaviors().get_selection().get_selectedRows();
            for (var i = selectedRows.get_length() - 1; i >= 0; i--) {
                var row = selectedRows.getItem(i);
                gridRows.remove(row);
            }
        }
        
    </script>
</asp:Content>