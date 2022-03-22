<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Display_Summaries_Server_Events_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css"
        rel="stylesheet" type="text/css" />
    <style type="text/css">
        .ControlPanelHeader
        {
            width: auto;
        }
        .controlPanelEventServer
        {
            height: 150px;
            font-size: small;
        }
        .controlPanel
        {
            width: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div id="headerContainer" class="ControlPanelHeader">
                <img alt="Server Side Events" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/serverSideEvent.png" />
                <%= this.GetGlobalResourceObject("WebDataGrid","SummariesServer_EventsHeaderTitle")%></div>
            <div id="countContainer" class="controlPanel">
                <div id="eventList" class="controlPanelEventServer" style="height: 100px;" runat="server">
                </div>
            </div>
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" DataSourceID="ProductsDataSource" DataKeyFields="ProductID"
                    runat="server" Width="600px" Height="400px" AutoGenerateColumns="False" EnableAjax="false">
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
                            </ColumnSummaries>
                            <ColumnSettings>
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
            </div>
        </div>
        <asp:AccessDataSource ID="ProductsDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
            SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [UnitsInStock], [UnitsOnOrder] FROM [Products]">
        </asp:AccessDataSource>
    </div>
</asp:Content>
