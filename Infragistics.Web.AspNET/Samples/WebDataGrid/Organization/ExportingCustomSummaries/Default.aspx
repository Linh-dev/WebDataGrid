<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Organization_Exporting_Custom_Summaries_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ig:WebExcelExporter runat="server" ID="eExporter" ExportMode="Download" OnCellExporting="WebExcelExporter1_CellExporting" />
    <ig:WebDataGrid runat="server" ID="wdgProducts" DataSourceID="SqlDsProducts" DataKeyFields="ProductID"
        AutoGenerateColumns="false" Width="100%" Height="450" OnCalculateCustomSummary="WebDataGrid1_CalculateCustomSummary">
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
            <ig:SummaryRow>
                <ColumnSummaries>
                    <ig:ColumnSummaryInfo ColumnKey="UnitPrice">
                        <Summaries>
                            <ig:Summary CustomSummaryName="STDEV" SummaryType="Custom" />
                            <ig:Summary SummaryType="Average" />
                        </Summaries>
                    </ig:ColumnSummaryInfo>
                    <ig:ColumnSummaryInfo ColumnKey="UnitsOnOrder">
                        <Summaries>
                            <ig:Summary CustomSummaryName="STDEV" SummaryType="Custom" />
                            <ig:Summary SummaryType="Average" />
                        </Summaries>
                    </ig:ColumnSummaryInfo>
                    <ig:ColumnSummaryInfo ColumnKey="UnitsInStock">
                        <Summaries>
                            <ig:Summary CustomSummaryName="STDEV" SummaryType="Custom" />
                            <ig:Summary SummaryType="Average" />
                        </Summaries>
                    </ig:ColumnSummaryInfo>
                </ColumnSummaries>
                <ColumnSettings>
                    <ig:SummaryRowSetting ColumnKey="ProductID" ShowSummaryButton="false">
                    </ig:SummaryRowSetting>
                    <ig:SummaryRowSetting ColumnKey="UnitPrice">
                        <SummarySettings>
                            <ig:SummarySetting CustomSummaryName="STDEV" SummaryType="Custom" />
                            <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                    <ig:SummaryRowSetting ColumnKey="UnitsInStock">
                        <SummarySettings>
                            <ig:SummarySetting CustomSummaryName="STDEV" SummaryType="Custom" />
                            <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                    <ig:SummaryRowSetting ColumnKey="UnitsOnOrder">
                        <SummarySettings>
                            <ig:SummarySetting CustomSummaryName="STDEV" SummaryType="Custom" />
                            <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                </ColumnSettings>
            </ig:SummaryRow>
        </Behaviors>
    </ig:WebDataGrid>
    <br />
    <asp:Button runat="server" ID="btnExport" Text="<%$ Resources:WebExcelExporter, EO_ExportButtonText %>"
        OnClick="btnExport_Click" />
    <asp:SqlDataSource ID="SqlDsProducts" runat="server" ConnectionString='<%# this.GetSqlConnectionString("SamplesDB.mdf") %>'
        SelectCommand="SELECT  [ProductID], [ProductName], [UnitPrice], [UnitsInStock], [UnitsOnOrder] FROM nwd.[Products]">
    </asp:SqlDataSource>
</asp:Content>
