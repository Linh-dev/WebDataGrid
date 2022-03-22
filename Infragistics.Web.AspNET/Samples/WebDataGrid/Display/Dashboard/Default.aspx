<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Display_Dashboard_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="UltraChartUpdatePanel" ChildrenAsTriggers="true"
        UpdateMode="Always" RenderMode="Inline">
        <ContentTemplate>
            <div id="gridDIV">
                <ig:WebDataGrid ID="WebDataGrid1" runat="server" Width="100%" Height="425" DataKeyNames="CustomerId"
                    AutoGenerateColumns="false" OnPageIndexChanged="Paging_PageIndexChanged" OnRowSelectionChanged="Selection_RowSelectionChanged">
                    <Columns>
                        <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderID  %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="ContactName" Key="ContactName">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="Address" Key="Address">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="City" Key="City">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="Country" Key="Country">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
                        </ig:BoundDataField>
                    </Columns>
                    <Behaviors>
                        <ig:Activation Enabled="false" />
                        <ig:Selection RowSelectType="Single" CellClickAction="Row">
                            <SelectionClientEvents RowSelectionChanged="Row_Selected" />
                        </ig:Selection>
                        <ig:RowSelectors RowNumbering="true" />
                        <ig:Paging PageSize="10" PagerAppearance="Bottom" />
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
            <div id="chartDIV" style="width: 800px;">
                <br />
                <igchart:UltraChart ID="UltraChart1" runat="server" ForeColor="Black" EnableCrossHair="False"
                    ChartType="LineChart" Width="100%" BackgroundImageFileName="" EmptyChartText="Select a customer to view sales information."
                    Visible="false" Version="8.3">
                    <Border CornerRadius="5"></Border>
                    <Data SwapRowsAndColumns="True">
                        <EmptyStyle>
                            <LineStyle DrawStyle="Dash"></LineStyle>
                        </EmptyStyle>
                    </Data>
                    <ColorModel ColorBegin="Pink" ColorEnd="DarkRed" AlphaLevel="150" ModelStyle="CustomLinear">
                    </ColorModel>
                    <Legend Visible="True" Location="Top"></Legend>
                    <Effects>
                        <Effects>
                            <igchart:GradientEffect />
                        </Effects>
                    </Effects>
                    <Axis>
                        <PE ElementType="None" Fill="Cornsilk" />
                        <X LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black"
                            RangeType="Automatic" TickmarkInterval="0" LineThickness="1" Extent="80" LogBase="10"
                            RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
                            <StripLines Interval="2" Visible="False">
                                <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                                    Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                                    FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                                    ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                            <Labels ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center" WrapText="False"
                                FontSizeBestFit="False" SeriesFormatString="&lt;SERIES_LABEL&gt;" ClipText="True"
                                Font="Verdana, 7pt" Flip="False" ItemFormat="ItemLabel" FontColor="Black" Orientation="VerticalLeftFacing"
                                Visible="True" OrientationAngle="0" HorizontalAlign="Near">
                                <SeriesLabels Font="Verdana, 7pt" Visible="True" HorizontalAlign="Center" FontSizeBestFit="False"
                                    ClipText="True" FormatString="&lt;SERIES_LABEL&gt;" Orientation="Horizontal"
                                    WrapText="False" Flip="False" FontColor="Black" VerticalAlign="Center" OrientationAngle="0">
                                </SeriesLabels>
                            </Labels>
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True"
                                Thickness="1"></MajorGridLines>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                                Thickness="1"></MinorGridLines>
                            <TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
                            <Margin>
                                <Far MarginType="Percentage" Value="0"></Far>
                                <Near MarginType="Percentage" Value="0"></Near>
                            </Margin>
                        </X>
                        <Y Visible="True" TickmarkInterval="50" LineThickness="1" Extent="30" TickmarkStyle="Smart">
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True"
                                Thickness="1"></MajorGridLines>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                                Thickness="1"></MinorGridLines>
                            <Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" Font="Verdana, 7pt"
                                FontColor="DimGray" Orientation="Horizontal" HorizontalAlign="Far">
                                <SeriesLabels Font="Verdana, 7pt" HorizontalAlign="Center" Orientation="VerticalLeftFacing"
                                    FontColor="DimGray" VerticalAlign="Center">
                                    <Layout Behavior="Auto">
                                    </Layout>
                                </SeriesLabels>
                                <Layout Behavior="Auto">
                                </Layout>
                            </Labels>
                        </Y>
                        <Y2 Visible="False" TickmarkInterval="50" LineThickness="1" TickmarkStyle="Smart">
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True"
                                Thickness="1"></MajorGridLines>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                                Thickness="1"></MinorGridLines>
                            <Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" Font="Verdana, 7pt"
                                FontColor="Gray" Orientation="Horizontal" HorizontalAlign="Near">
                                <SeriesLabels Font="Verdana, 7pt" HorizontalAlign="Near" Orientation="VerticalLeftFacing"
                                    FontColor="Gray" VerticalAlign="Center">
                                    <Layout Behavior="Auto">
                                    </Layout>
                                </SeriesLabels>
                                <Layout Behavior="Auto">
                                </Layout>
                            </Labels>
                        </Y2>
                        <X2 Visible="False" TickmarkInterval="0" LineThickness="1" TickmarkStyle="Smart">
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True"
                                Thickness="1"></MajorGridLines>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                                Thickness="1"></MinorGridLines>
                            <Labels ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center" Font="Verdana, 7pt"
                                FontColor="Gray" Orientation="VerticalLeftFacing" HorizontalAlign="Near">
                                <SeriesLabels Font="Verdana, 7pt" HorizontalAlign="Near" Orientation="Horizontal"
                                    FontColor="Gray" VerticalAlign="Center">
                                    <Layout Behavior="Auto">
                                    </Layout>
                                </SeriesLabels>
                                <Layout Behavior="Auto">
                                </Layout>
                            </Labels>
                        </X2>
                        <Z Visible="False" TickmarkInterval="0" LineThickness="1" TickmarkStyle="Smart">
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True"
                                Thickness="1"></MajorGridLines>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                                Thickness="1"></MinorGridLines>
                            <Labels ItemFormatString="" VerticalAlign="Center" Font="Verdana, 7pt" FontColor="DimGray"
                                Orientation="Horizontal" HorizontalAlign="Near">
                                <SeriesLabels Font="Verdana, 7pt" HorizontalAlign="Near" Orientation="Horizontal"
                                    FontColor="DimGray" VerticalAlign="Center">
                                    <Layout Behavior="Auto">
                                    </Layout>
                                </SeriesLabels>
                                <Layout Behavior="Auto">
                                </Layout>
                            </Labels>
                        </Z>
                        <Z2 Visible="False" TickmarkInterval="0" LineThickness="1" TickmarkStyle="Smart">
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True"
                                Thickness="1"></MajorGridLines>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                                Thickness="1"></MinorGridLines>
                            <Labels ItemFormatString="" VerticalAlign="Center" Font="Verdana, 7pt" FontColor="Gray"
                                Orientation="Horizontal" HorizontalAlign="Near">
                                <SeriesLabels Font="Verdana, 7pt" HorizontalAlign="Near" Orientation="Horizontal"
                                    FontColor="Gray" VerticalAlign="Center">
                                    <Layout Behavior="Auto">
                                    </Layout>
                                </SeriesLabels>
                                <Layout Behavior="Auto">
                                </Layout>
                            </Labels>
                        </Z2>
                    </Axis>
                    <TitleBottom Visible="False" Extent="33" Location="Bottom">
                    </TitleBottom>
                    <DeploymentScenario ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png"
                        FilePath="/SamplesBrowser/Temp/ChartImages"></DeploymentScenario>
                </igchart:UltraChart>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">

        function Row_Selected(webDataGrid, evntArgs) {
            __doPostBack('<%= UltraChart1.ClientID %>', '');
        }
	    
    </script>
</asp:Content>
