<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Display_Summaries_Scenario_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .SummaryRow
        {
            text-align: center;
        }
        .SummaryDefaultCssClass
        {
            color: Black;
        }
        .SummaryRedCssClass
        {
            color: Red;
            background: url('/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/Display/SummariesScenario/redArrow.gif') no-repeat scroll 10px center;
        }
        .SummaryGreenCssClass
        {
            color: Green;
            background: url('/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/Display/SummariesScenario/greenArrow.gif') no-repeat scroll 10px center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="GridUpdatePanel">
        <ContentTemplate>
            <asp:HiddenField ID="ProductSummaryValueField" runat="server" />
            <asp:HiddenField ID="PriceSummaryValueField" runat="server" />
            <asp:HiddenField ID="OrderSummaryValueField" runat="server" />
            <asp:HiddenField ID="StockSummaryValueField" runat="server" />
            <ig:WebDataGrid ID="WebDataGrid1" DataKeyFields="ProductID" DataSourceID="ObjectDataSource1"
                runat="server" Width="100%" Height="350px" AutoGenerateColumns="False" EnableAjax="false"
                OnSummaryCalculated="WebDataGrid1_SummaryCalculated" OnCalculateCustomSummary="WebDataGrid1_CalculateCustomSummary"
                OnRowUpdated="WebDataGrid1_RowUpdated">
                <Columns>
                    <ig:TemplateDataField Key="DeleteItem" Width="70px">
                        <ItemTemplate>
                            <asp:Button Text="<%$Resources:WebDataGrid, DataEditing_DeleteButton %>" ID="Button1"
                                runat="server" OnClientClick="DeleteRow(); return false;" />
                        </ItemTemplate>
                    </ig:TemplateDataField>
                    <ig:BoundDataField DataFieldName="ProductID" DataType="System.Int32" Key="ProductID">
                        <Header Text="ProductID" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="ProductName" DataType="System.String" Key="ProductName">
                        <Header Text="ProductName" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="UnitPrice" Width="200px" DataType="System.Decimal"
                        Key="UnitPrice">
                        <Header Text="UnitPrice" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="UnitsInStock" DataType="System.Int32" Key="UnitsInStock">
                        <Header Text="UnitsInStock" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="UnitsOnOrder" DataType="System.Int32" Key="UnitsOnOrder">
                        <Header Text="UnitsOnOrder" />
                    </ig:BoundDataField>
                </Columns>
                <Behaviors>
                    <ig:Activation />
                    <ig:EditingCore>
                        <EditingClientEvents RowUpdating="rowUpdating" RowsDeleting="rowsDeleting" 
                            CellValueChanging="cellValChanging" />
                        <Behaviors>
                            <ig:CellEditing Enabled="true">
                                <EditModeActions EnableOnActive="true" />
                                <ColumnSettings>
                                    <ig:EditingColumnSetting ColumnKey="ProductID" ReadOnly="true" />
                                </ColumnSettings>
                            </ig:CellEditing>
                            <ig:RowDeleting Enabled="true" />
                        </Behaviors>
                    </ig:EditingCore>
                    <ig:Selection RowSelectType="Multiple" CellClickAction="Row" />
                    <ig:SummaryRow SummariesCssClass="SummaryRow" EmptyFooterText="" ShowSummariesButtons="false"
                        CompactRendering="On">
                        <SummaryRowClientEvents SummaryCalculated="SummaryCalculated" />
                        <ColumnSummaries>
                            <ig:ColumnSummaryInfo ColumnKey="ProductID">
                                <Summaries>
                                    <ig:Summary SummaryType="Count" />
                                    <ig:Summary CustomSummaryName="<%$Resources:WebDataGrid, SummaryScenario_Variation %>"
                                        SummaryType="Custom" />
                                </Summaries>
                            </ig:ColumnSummaryInfo>
                            <ig:ColumnSummaryInfo ColumnKey="UnitPrice">
                                <Summaries>
                                    <ig:Summary SummaryType="Average" />
                                    <ig:Summary CustomSummaryName="<%$Resources:WebDataGrid, SummaryScenario_Variation %>"
                                        SummaryType="Custom" />
                                </Summaries>
                            </ig:ColumnSummaryInfo>
                            <ig:ColumnSummaryInfo ColumnKey="UnitsInStock">
                                <Summaries>
                                    <ig:Summary SummaryType="Sum" />
                                    <ig:Summary CustomSummaryName="<%$Resources:WebDataGrid, SummaryScenario_Variation %>"
                                        SummaryType="Custom" />
                                </Summaries>
                            </ig:ColumnSummaryInfo>
                            <ig:ColumnSummaryInfo ColumnKey="UnitsOnOrder">
                                <Summaries>
                                    <ig:Summary SummaryType="Max" />
                                    <ig:Summary CustomSummaryName="<%$Resources:WebDataGrid, SummaryScenario_Variation %>"
                                        SummaryType="Custom" />
                                </Summaries>
                            </ig:ColumnSummaryInfo>
                        </ColumnSummaries>
                        <ColumnSettings>
                            <ig:SummaryRowSetting ColumnKey="UnitPrice" ShowSummaryButton="false">
                                <SummarySettings>
                                    <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                                </SummarySettings>
                            </ig:SummaryRowSetting>
                        </ColumnSettings>
                    </ig:SummaryRow>
                </Behaviors>
                <EditorProviders>
                    <ig:TextEditorProvider ID="TextEditorProvider1" />
                </EditorProviders>
            </ig:WebDataGrid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetProductsDataSource"
        UpdateMethod="UpdateProduct" DeleteMethod="DeleteProduct" TypeName="NorthwindDataSource"
        InsertMethod="AddProduct">
        <UpdateParameters>
            <asp:Parameter Name="ProductID" Type="Int32" />
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="SupplierID" Type="Int32" />
            <asp:Parameter Name="QuantityPerUnit" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="UnitsInStock" Type="Int16" />
            <asp:Parameter Name="UnitsOnOrder" Type="Int16" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="UnitsInStock" Type="Int16" />
            <asp:Parameter Name="UnitsOnOrder" Type="Int16" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="ProductID" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    <script type="text/javascript">

        var hasFirstCellUpdated = false;

        function formatString(value) {
            if (value > 0)
                return "+" + value;
            else
                return value;
        }

        function formatDecimalPlaces(num) {
            return Math.round(num * 100) / 100;
        }  

        function DeleteRow() {

            var grid = $find('<%= WebDataGrid1.ClientID %>');
            var gridRows = grid.get_rows()

            var selectedRows = grid.get_behaviors().get_selection().get_selectedRows();

            var rows = new Array();
            var i1 = 0;

            for (var i = selectedRows.get_length() - 1; i >= 0; i--) {

                rows[i1] = selectedRows.getItem(i);
                i1++;
            }

            grid.get_behaviors().get_editingCore().get_behaviors().get_rowDeleting().deleteRows(rows);
        }

        function SaveExistingSummaries(colKey) {

            if (colKey == undefined) {
                SaveExistingSummaries("ProductID");
                SaveExistingSummaries("UnitPrice");
                SaveExistingSummaries("UnitsOnOrder");
                SaveExistingSummaries("UnitsInStock"); 
            }

            var grid = $find('<%= WebDataGrid1.ClientID %>');
            var summaryRow = grid.get_behaviors().get_summaryRow();

            switch (colKey) {
                case "ProductID":
                    $get('<%= ProductSummaryValueField.ClientID %>').value = summaryRow.get_columnSummaryInfoFromKey("ProductID").get_summary(0).get_value();
                    break;

                case "UnitPrice":
                    $get('<%= PriceSummaryValueField.ClientID %>').value = summaryRow.get_columnSummaryInfoFromKey("UnitPrice").get_summary(0).get_value();
                    break;

                case "UnitsOnOrder":
                    $get('<%= OrderSummaryValueField.ClientID %>').value = summaryRow.get_columnSummaryInfoFromKey("UnitsOnOrder").get_summary(0).get_value();
                    break;

                case "UnitsInStock":
                    $get('<%= StockSummaryValueField.ClientID %>').value = summaryRow.get_columnSummaryInfoFromKey("UnitsInStock").get_summary(0).get_value();
                    break;
                default:
                    break;
            }

        }

        function SummaryCalculated(sender, eventargs) {            

            var info = eventargs.get_columnSummaryInfo();
            var variation = info.get_summary(1);
            var newValue = info.get_summary(0).get_value();
            var oldValue;

            switch (info.get_columnKey()) {
                case "ProductID":
                    oldValue = $get('<%= ProductSummaryValueField.ClientID %>').value;

                    if (oldValue == "")
                        $get('<%= ProductSummaryValueField.ClientID %>').value = oldValue = newValue;

                    variation.set_value(formatString(newValue - oldValue));
                    break;

                case "UnitsInStock":
                    oldValue = $get('<%= StockSummaryValueField.ClientID %>').value;

                    if (oldValue == "")
                        $get('<%= StockSummaryValueField.ClientID %>').value = oldValue = newValue;

                    variation.set_value(formatString(newValue - oldValue));
                    break;

                case "UnitPrice":
                    oldValue = $get('<%= PriceSummaryValueField.ClientID %>').value;
                    newValue = formatDecimalPlaces(newValue);
                    info.get_summary(0).set_value(newValue);

                    if (oldValue == "")
                        $get('<%= PriceSummaryValueField.ClientID %>').value = oldValue = newValue;

                    variation.set_value(formatString(formatDecimalPlaces(newValue - oldValue)));
                    break;

                case "UnitsOnOrder":
                    oldValue = $get('<%= OrderSummaryValueField.ClientID %>').value;

                    if (oldValue == "")
                        $get('<%= OrderSummaryValueField.ClientID %>').value = oldValue = newValue;

                    variation.set_value(formatString(newValue - oldValue));
                    break;

                default:
                    break;
            }

        }

        function cellValChanging(sender, e) {
            if (hasFirstCellUpdated)
                SaveExistingSummaries(e.get_cell().get_column().get_key());
            else {
                SaveExistingSummaries();
                hasFirstCellUpdated = true;
            }                        
        }

        function rowUpdating(sender, e) {
            hasFirstCellUpdated = false;
        }

        function rowsDeleting(sender, e) {
            SaveExistingSummaries();
        }
   
    </script>
</asp:Content>
