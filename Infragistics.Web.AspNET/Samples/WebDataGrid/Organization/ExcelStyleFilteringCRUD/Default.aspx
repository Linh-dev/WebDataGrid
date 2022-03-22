<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript">
        function CellValueChangedHandler(sender, args) {
            var editingCore = sender.get_behaviors().get_editingCore();
            editingCore.commit();
        }
        function DeleteRow() {
            var grid = $find('<%= this.WebDataGrid1.ClientID %>');
            var gridRows = grid.get_rows();

            var selectedRows = grid.get_behaviors().get_selection().get_selectedRows();
            for (var i = selectedRows.get_length() - 1; i >= 0; i--) {
                var row = selectedRows.getItem(i);
                gridRows.remove(row);
            }
        }
        $(window).load(function () {
            $("#sampleContainer").addClass("filteringDropDown");
        });
    </script>
         <style type="text/css">
            .filteringDropDown
            {
              overflow: visible !important;
                }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <ig:WebDataGrid ID="WebDataGrid1" runat="server" EnableAjax="false" Height="350px"
                Width="700px" AutoGenerateColumns="false" DataSourceID="ods1" DataKeyFields="ProductID">
                <Columns>
                    <ig:TemplateDataField Key="DeleteItem" Width="60px">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" ID="DeleteItem" AlternateText="alt" 
                            ImageUrl="<%$ Resources:WebDataGrid, DataEditing_DeleteRowImagePath %>"
                            OnClientClick="DeleteRow(); return false;" />
                        </ItemTemplate>
                    </ig:TemplateDataField>
                    <ig:BoundDataField DataFieldName="ProductID" Key="ProductID"
                     Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderId %>" Width="40px" />
                    <ig:BoundDataField DataFieldName="ProductName" Key="ProductName"
                     Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderProduct %>" />
                    <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" 
                    Header-Text="<%$ Resources:WebDataGrid, UnitPrice %>" />
                    <ig:BoundDataField DataFieldName="UnitsInStock" Key="UnitsInStock"
                     Header-Text="<%$ Resources:WebDataGrid, UnitsInStock %>" />
                    <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" 
                    Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderQuantity %>" />
                </Columns>
                <Behaviors>
                    <ig:Activation />
                    <ig:Selection RowSelectType="Single" CellClickAction="Row" />
                    <ig:EditingCore>
                        <EditingClientEvents CellValueChanged="CellValueChangedHandler" />
                        <Behaviors>
                            <ig:RowAdding Alignment="Top">
                                <AddNewRowClientEvents ExitingEditMode="CellValueChangedHandler" />
                                <ColumnSettings>
                                    <ig:RowAddingColumnSetting ColumnKey="ProductID" ReadOnly="true" />
                                </ColumnSettings>
                            </ig:RowAdding>
                            <ig:CellEditing EditModeActions-MouseClick="Double">
                                <ColumnSettings>
                                    <ig:EditingColumnSetting ColumnKey="ProductID" ReadOnly="true" />
                                </ColumnSettings>
                            </ig:CellEditing>
                            <ig:RowDeleting />
                            <ig:RowEditingTemplate CancelButton="Cancel" OKButton="Apply" Enabled="true" />
                        </Behaviors>
                    </ig:EditingCore>
                    <ig:Filtering FilterType="ExcelStyleFilter">
                        <ColumnSettings>
                            <ig:ColumnFilteringSetting ColumnKey="ProductID" Enabled="false" />
                            <ig:ColumnFilteringSetting ColumnKey="DeleteItem" Enabled="false" />
                        </ColumnSettings>
                    </ig:Filtering>
                </Behaviors>
            </ig:WebDataGrid>
        </ContentTemplate>
    </asp:UpdatePanel>



        <asp:ObjectDataSource ID="ods1" runat="server"
                SelectMethod="GetProductsDataSource"
                UpdateMethod="UpdateProduct"
                InsertMethod="AddProduct"
                DeleteMethod="DeleteProduct"  
                EnableCaching="false"
                TypeName="NorthwindDataSource" >
        <DeleteParameters>
            <asp:Parameter Name="ProductID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductID" Type="Int32" />
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="UnitsInStock" Type="Int16" />
            <asp:Parameter Name="QuantityPerUnit" Type="String" />
            <asp:Parameter Name="SupplierID" Type="Int32" />
            <asp:Parameter Name="UnitsOnOrder" Type="Int32" />
            <asp:Parameter Name="Discontinued" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProductID" Type="Int32" />
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="UnitsInStock" Type="Int16" />
            <asp:Parameter Name="QuantityPerUnit" Type="String" />
            
            <asp:Parameter Name="SupplierID" Type="Int32" />
            <asp:Parameter Name="UnitsOnOrder" Type="Int32" />
            <asp:Parameter Name="Discontinued" Type="Boolean" />


        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>