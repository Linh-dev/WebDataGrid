<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      <ig:WebHierarchicalDataGrid ID="whdg1" runat="server" AutoGenerateColumns="false"
        DataSourceID="WebHierarchicalDataSource1" AutoGenerateBands="true" InitialExpandDepth="0"
        InitialDataBindDepth="0" Height="390" Width="98%" DataKeyFields="ProductID">
        <ExpandCollapseAnimation SlideOpenDirection="Auto" SlideOpenDuration="300" SlideCloseDirection="Auto"
            SlideCloseDuration="300" />
        <Columns>
            <ig:BoundDataField DataFieldName="ProductID" Key="ProductID" Header-Text="<%$Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_ProductID %>" />
            <ig:BoundDataField DataFieldName="ProductName" Key="ProductName" Header-Text="<%$Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_ProductName %>" />
            <ig:BoundDataField DataFieldName="UnitPrice" Key="UnitPrice" Header-Text="<%$Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_UnitPrice %>" />
            <ig:BoundDataField DataFieldName="QuantityPerUnit" Key="QuantityPerUnit" Header-Text="<%$Resources:WebHierarchicalDataGrid, WebHierarchicalDataGrid_HeaderText_QuantityPerUnit %>" />
        </Columns>
        <Bands>
            <ig:Band DataMember="AccessDataSource1_Orders" Height="200" AutoGenerateColumns="true" DataKeyFields="OrderID">
                <Behaviors>
                    <ig:SummaryRow Enabled="true">
                        <ColumnSummaries>
                            <ig:ColumnSummaryInfo ColumnKey="UnitPrice">
                                <Summaries>
                                    <ig:Summary SummaryType="Average" />
                                </Summaries>
                            </ig:ColumnSummaryInfo>
                            <ig:ColumnSummaryInfo ColumnKey="Quantity">
                                <Summaries>
                                    <ig:Summary SummaryType="Sum" />
                                </Summaries>
                            </ig:ColumnSummaryInfo>
                            <ig:ColumnSummaryInfo ColumnKey="Discount">
                                <Summaries>
                                    <ig:Summary SummaryType="Max" />
                                </Summaries>
                            </ig:ColumnSummaryInfo>
                        </ColumnSummaries>
                        <ColumnSettings>
                            <ig:SummaryRowSetting ColumnKey="OrderID">
                                <SummarySettings>
                                    <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                                </SummarySettings>
                            </ig:SummaryRowSetting>
                            <ig:SummaryRowSetting ColumnKey="UnitPrice">
                                <SummarySettings>
                                    <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                                </SummarySettings>
                            </ig:SummaryRowSetting>
                            <ig:SummaryRowSetting ColumnKey="Quantity">
                                <SummarySettings>
                                    <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                                </SummarySettings>
                            </ig:SummaryRowSetting>
                        </ColumnSettings>
                    </ig:SummaryRow>
                </Behaviors>
            </ig:Band>
        </Bands>
        <Behaviors>
            <ig:SummaryRow Enabled="true">
                <ColumnSummaries>
                    <ig:ColumnSummaryInfo ColumnKey="ProductID">
                        <Summaries>
                            <ig:Summary SummaryType="Count" />
                        </Summaries>
                    </ig:ColumnSummaryInfo>
                    <ig:ColumnSummaryInfo ColumnKey="UnitPrice">
                        <Summaries>
                            <ig:Summary SummaryType="Average" />
                        </Summaries>
                    </ig:ColumnSummaryInfo>
                </ColumnSummaries>
                <ColumnSettings>
                    <ig:SummaryRowSetting ColumnKey="ProductID">
                        <SummarySettings>
                            <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                    <ig:SummaryRowSetting ColumnKey="UnitPrice">
                        <SummarySettings>
                            <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                    <ig:SummaryRowSetting ColumnKey="UnitsInStock">
                        <SummarySettings>
                            <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                    <ig:SummaryRowSetting ColumnKey="UnitsOnOrder">
                        <SummarySettings>
                            <ig:SummarySetting SummaryType="Average" FormatString="{0} = {1:###.00}" />
                        </SummarySettings>
                    </ig:SummaryRowSetting>
                </ColumnSettings>
            </ig:SummaryRow>
            <ig:Sorting Enabled="true" />
            <ig:Paging PageSize="10" Enabled="true" />
            <ig:Filtering />
        </Behaviors>
    </ig:WebHierarchicalDataGrid>
    <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
        <DataRelations>
            <ig:DataRelation ParentColumns="ProductID" ParentDataViewID="AccessDataSource2_Products"
                ChildColumns="ProductID" ChildDataViewID="AccessDataSource1_Orders" />
        </DataRelations>
        <DataViews>
            <ig:DataView ID="AccessDataSource1_Orders" DataSourceID="AccessDataSource1" />
            <ig:DataView ID="AccessDataSource2_Products" DataSourceID="AccessDataSource2" />
        </DataViews>
    </ig:WebHierarchicalDataSource>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'
        SelectCommand="SELECT [OrderID], [UnitPrice], [ProductID], [Quantity], [Discount] FROM [Order Details]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'
        SelectCommand="SELECT [ProductID], [ProductName], [SupplierID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder] FROM [Products]">
    </asp:AccessDataSource>
</asp:Content>