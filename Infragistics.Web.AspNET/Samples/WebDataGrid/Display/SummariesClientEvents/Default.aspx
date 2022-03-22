<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Display_Summaries_Client_Events_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
    <style type="text/css">
        .ControlPanelHeader
        {
            width: auto;
        }
        .controlPanelEvent
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
        <div id="headerContainer" class="ControlPanelHeader">
            <img alt="Client Side Events" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/clientSideEvent.png" />
            <%= this.GetGlobalResourceObject("WebDataGrid","SummariesClient_EventsHeaderTitle")%></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <%= this.GetGlobalResourceObject("WebDataGrid","WebDataGrid_EventsDescription") %><br />
            </div>
        </div>
        <div id="container">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" DataSourceID="ProductsDataSource" DataKeyFields="ProductID"
                    runat="server" Width="600px" Height="400px" AutoGenerateColumns="False" OnCalculateCustomSummary="WebDataGrid1_CalculateCustomSummary">
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
                            <SummaryRowClientEvents Initialize="Initialize" CalculateCustomSummary="CalculateCustomSummary"
                                SummaryCalculated="SummaryCalculated" SummaryDropdownDisplayed="SummaryDropdownDisplayed"
                                SummaryDropdownDisplaying="SummaryDropdownDisplaying" SummaryDropdownHidden="SummaryDropdownHidden"
                                SummaryDropdownHiding="SummaryDropdownHiding" />
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
    </div>
    <asp:AccessDataSource ID="ProductsDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [UnitsInStock], [UnitsOnOrder] FROM [Products]">
    </asp:AccessDataSource>
    <script type="text/javascript">

        function Initialize(sender, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","SummariesClient_Initialize") %>');
        }
        function CalculateCustomSummary(sender, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","SummariesClient_CalculateCustomSummary") %>');
        }
        function SummaryCalculated(sender, evntArgs) {
            var summariesText = " ";
            var columnSummaryInfo = evntArgs.get_columnSummaryInfo();
            var columnKey = columnSummaryInfo.get_columnKey();
            var count = columnSummaryInfo.get_summaryCount();

            for (var i = 0; i <= 5; i++) {
                var summary = columnSummaryInfo.get_summaryByType(i);
                if (summary != null) {
                    summariesText += getSummaryType(i) + " = " + summary.get_value() + "; ";
                }
            }
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","SummariesClient_SummaryCalculated") %>' + columnKey + ": " + summariesText);
        }
        function SummaryDropdownDisplayed(sender, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","SummariesClient_SummaryDropdownDisplayed") %>');
        }
        function SummaryDropdownDisplaying(sender, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","SummariesClient_SummaryDropdownDisplaying") %>');
        }
        function SummaryDropdownHidden(sender, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","SummariesClient_SummaryDropdownHidden") %>');
        }
        function SummaryDropdownHiding(sender, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","SummariesClient_SummaryDropdownHiding") %>');
        }
        function getSummaryType(summaryTypeIndex) {
            switch (summaryTypeIndex) {
                case 0:
                    return '<%= this.GetGlobalResourceObject("WebDataGrid","SummariesClient_Count") %>';
                case 1:
                    return '<%= this.GetGlobalResourceObject("WebDataGrid","SummariesClient_Min") %>';
                case 2:
                    return '<%= this.GetGlobalResourceObject("WebDataGrid","SummariesClient_Max") %>';
                case 3:
                    return '<%= this.GetGlobalResourceObject("WebDataGrid","SummariesClient_Average") %>';
                case 4:
                    return '<%= this.GetGlobalResourceObject("WebDataGrid","SummariesClient_Sum") %>';
                case 5:
                    return '<%= this.GetGlobalResourceObject("WebDataGrid","SummariesClient_Custom") %>';
            }
        }
    </script>
</asp:Content>
