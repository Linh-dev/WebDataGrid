<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Display_Summaries_Row_Selectors_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript">
        function init(grid) {
            var summaryRow = grid.get_behaviors().get_summaryRow();
            var rowSelectors = grid.get_behaviors().get_rowSelectors();
            var maxSums = summaryRow._maxSumCount;
            var cols = grid.get_columns();
            var colSumInfoCount = summaryRow.get_columnSummaryInfoCount();
            var s = -1;
            for (var x = 0; x < maxSums; ++x) {
                var rowElement = grid._elements["footSumRow" + x];
                var rowObj = new $IG.GridRow(null, rowElement, [], grid, null);
                var cellCount = rowObj.get_cellCount();
                var rowSel = rowSelectors.getSelectorFromRow(rowObj);
                var name = "";
                var sum = null;
                for (var i = 0; i < cellCount; ++i) {
                    var cell = rowObj.get_cell(i).get_element();
                    if (IsNonEmptySumCell(cell)) {
                        var col = cols.get_column(i);
                        var colKey = col.get_key();
                        var colSumInfo = summaryRow.get_columnSummaryInfoFromKey(colKey);
                        var sum = getSummaryFromCell(colSumInfo, cell);
                        var sumType = sum.get_summaryType();
                        if (sumType == $IG.SummaryType.Custom || sum.get_customSummaryName().length > 0)
                            name = sum.get_customSummaryName();
                        else
                            name = summaryRow._sumNames[sumType];
                        break;
                    }
                }
                rowSel.innerText = name;
                rowSel.textContent = name;
            }
        }

        function IsNonEmptySumCell(cell) {
            // Summary td that have an actual summary have a 'mkr' attribute
            return cell.getAttribute('mkr') != null;
        }
        function getSummaryFromCell(colSumInfo, cell) {
            // The index that the td corresponds to in the summary collection
            // is stored in the 'mkr' attribute
            return colSumInfo.get_summary(parseInt(cell.getAttribute('mkr')));
        }
            
    </script>
    <style type="text/css">
        tbody tr th.rowSelectorWidth
        {
            width: 75px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebDataGrid ID="WebDataGrid1" DataSourceID="ProductsDataSource" DataKeyFields="ProductID"
        runat="server" Width="98%" Height="365px" AutoGenerateColumns="False">
        <ClientEvents Initialize="init" AJAXResponse="init" />
        <Columns>
            <ig:BoundDataField DataFieldName="ProductID" DataType="System.Int32" Key="ProductID">
                <Header Text="ProductID" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="ProductName" DataType="System.String" Key="ProductName">
                <Header Text="ProductName" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="UnitPrice" DataType="System.Decimal" Key="UnitPrice">
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
            <ig:RowSelectors RowSelectorCssClass="rowSelectorWidth">
            </ig:RowSelectors>
            <ig:ColumnFixing ShowFixButtons="false">
            </ig:ColumnFixing>
            <ig:SummaryRow CompactRendering="Off" FormatString="{1}">
                <ColumnSettings>
                    <ig:SummaryRowSetting ColumnKey="ProductID" ShowSummaryButton="false" FormatString="{1}">
                    </ig:SummaryRowSetting>
                    <ig:SummaryRowSetting ColumnKey="UnitPrice" FormatString="{1}">
                        <SummarySettings>
                            <ig:SummarySetting SummaryType="Average" FormatString="{1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                    <ig:SummaryRowSetting ColumnKey="UnitsInStock" FormatString="{1}">
                        <SummarySettings>
                            <ig:SummarySetting SummaryType="Average" FormatString="{1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                    <ig:SummaryRowSetting ColumnKey="UnitsOnOrder" FormatString="{1}">
                        <SummarySettings>
                            <ig:SummarySetting SummaryType="Average" FormatString="{1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                </ColumnSettings>
            </ig:SummaryRow>
        </Behaviors>
    </ig:WebDataGrid>
    <br />
    <%= this.GetGlobalResourceObject("WebDataGrid","SummariesBasicFeatures_AddRemove")%>
    <asp:CheckBox runat="server" ID="chkAddRemoveSummaries" Checked="false" AutoPostBack="true"
        OnCheckedChanged="chkAddRemoveSummaries_CheckedChanged" />
    <asp:AccessDataSource ID="ProductsDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [UnitsInStock], [UnitsOnOrder] FROM [Products]">
    </asp:AccessDataSource>
</asp:Content>
