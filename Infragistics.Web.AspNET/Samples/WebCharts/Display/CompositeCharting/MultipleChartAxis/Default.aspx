<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="false"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_Composite_Charting_Multiple_Chart_Axis_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <igchart:UltraChart ID="UltraChart1" runat="server" EmptyChartText="Data Not Available. Please call UltraChart.Data.DataBind() after setting valid Data.DataSource"
        ForeColor="Black" ChartType="Composite" BackColor="White" EnableCrossHair="False"
        Version="5.3" Height="504px" Width="656px">
        <Border CornerRadius="5" DrawStyle="Solid" Raised="False" Color="Black" Thickness="1">
        </Border>
        <CompositeChart>
            <Legends>
                <igchartprop:CompositeLegend ChartLayerList="chartLayer1" BoundsMeasureType="Pixels"
                    Bounds="0, 0, 0, 0">
                    <LabelStyle Font="Microsoft Sans Serif, 7.8pt" Dy="0" HorizontalAlign="Near" FontSizeBestFit="False"
                        ClipText="True" Dx="0" RotationAngle="0" Orientation="Horizontal" WrapText="False"
                        Flip="False" FontColor="Black" VerticalAlign="Center"></LabelStyle>
                    <Border CornerRadius="0" DrawStyle="Solid" Raised="False" Color="Black" Thickness="1">
                    </Border>
                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                        FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                        ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                </igchartprop:CompositeLegend>
                <igchartprop:CompositeLegend ChartLayerList="chartLayer2" BoundsMeasureType="Pixels"
                    Bounds="0, 0, 0, 0">
                    <LabelStyle Font="Microsoft Sans Serif, 7.8pt" Dy="0" HorizontalAlign="Near" FontSizeBestFit="False"
                        ClipText="True" Dx="0" RotationAngle="0" Orientation="Horizontal" WrapText="False"
                        Flip="False" FontColor="Black" VerticalAlign="Center"></LabelStyle>
                    <Border CornerRadius="0" DrawStyle="Solid" Raised="False" Color="Black" Thickness="1">
                    </Border>
                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                        FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                        ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                </igchartprop:CompositeLegend>
                <igchartprop:CompositeLegend ChartLayerList="chartLayer3" BoundsMeasureType="Pixels"
                    Bounds="0, 0, 0, 0">
                    <LabelStyle Font="Microsoft Sans Serif, 7.8pt" Dy="0" HorizontalAlign="Near" FontSizeBestFit="False"
                        ClipText="True" Dx="0" RotationAngle="0" Orientation="Horizontal" WrapText="False"
                        Flip="False" FontColor="Black" VerticalAlign="Center"></LabelStyle>
                    <Border CornerRadius="0" DrawStyle="Solid" Raised="False" Color="Black" Thickness="1">
                    </Border>
                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                        FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                        ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                </igchartprop:CompositeLegend>
                <igchartprop:CompositeLegend ChartLayerList="chartLayer4" BoundsMeasureType="Pixels"
                    Bounds="0, 0, 0, 0">
                    <LabelStyle Font="Microsoft Sans Serif, 7.8pt" Dy="0" HorizontalAlign="Near" FontSizeBestFit="False"
                        ClipText="True" Dx="0" RotationAngle="0" Orientation="Horizontal" WrapText="False"
                        Flip="False" FontColor="Black" VerticalAlign="Center"></LabelStyle>
                    <Border CornerRadius="0" DrawStyle="Solid" Raised="False" Color="Black" Thickness="1">
                    </Border>
                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                        FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                        ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                </igchartprop:CompositeLegend>
            </Legends>
            <Series>
                <igchartprop:NumericSeries Label="" Key="series1">
                    <pes>
									<igchartprop:PaintElement FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill" Fill="Red" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="2" ImageWrapMode="Tile" TextureApplication="Normal"></igchartprop:PaintElement>
								</pes>
                    <data labelcolumn="" valuecolumn=""></data>
                </igchartprop:NumericSeries>
                <igchartprop:NumericSeries Label="" Key="series2">
                    <pes>
									<igchartprop:PaintElement FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill" Fill="Yellow" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="2" ImageWrapMode="Tile" TextureApplication="Normal"></igchartprop:PaintElement>
								</pes>
                    <data labelcolumn="" valuecolumn=""></data>
                </igchartprop:NumericSeries>
                <igchartprop:NumericSeries Label="" Key="series3">
                    <pes>
									<igchartprop:PaintElement FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill" Fill="Lime" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="2" ImageWrapMode="Tile" TextureApplication="Normal"></igchartprop:PaintElement>
								</pes>
                    <data labelcolumn="" valuecolumn=""></data>
                </igchartprop:NumericSeries>
                <igchartprop:NumericSeries Label="" Key="series4">
                    <pes>
									<igchartprop:PaintElement FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill" Fill="Blue" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="2" ImageWrapMode="Tile" TextureApplication="Normal"></igchartprop:PaintElement>
								</pes>
                    <data labelcolumn="" valuecolumn=""></data>
                </igchartprop:NumericSeries>
            </Series>
            <ChartLayers>
                <igchartprop:ChartLayerAppearance ChartAreaKey="area1" Key="chartLayer1" ChartType="LineChart"
                    AxisXKey="axis5" AxisYKey="axis1" SeriesList="series1" AxisY2Key="axis1">
                    <ChartTypeAppearances>
                        <igchartprop:LineChartAppearance DrawStyle="Solid" Thickness="3" NullHandling="Zero"
                            MidPointAnchors="True" StartStyle="DiamondAnchor" HighLightLines="False" EndStyle="DiamondAnchor">
                        </igchartprop:LineChartAppearance>
                    </ChartTypeAppearances>
                </igchartprop:ChartLayerAppearance>
                <igchartprop:ChartLayerAppearance ChartAreaKey="area1" Key="chartLayer2" ChartType="LineChart"
                    AxisXKey="axis5" AxisYKey="axis2" SeriesList="series2" AxisY2Key="axis1">
                    <ChartTypeAppearances>
                        <igchartprop:LineChartAppearance DrawStyle="Solid" Thickness="3" NullHandling="Zero"
                            MidPointAnchors="True" StartStyle="DiamondAnchor" HighLightLines="False" EndStyle="DiamondAnchor">
                        </igchartprop:LineChartAppearance>
                    </ChartTypeAppearances>
                </igchartprop:ChartLayerAppearance>
                <igchartprop:ChartLayerAppearance ChartAreaKey="area1" Key="chartLayer3" ChartType="LineChart"
                    AxisXKey="axis5" AxisYKey="axis3" SeriesList="series3" AxisY2Key="">
                    <ChartTypeAppearances>
                        <igchartprop:LineChartAppearance DrawStyle="Solid" Thickness="3" NullHandling="Zero"
                            MidPointAnchors="True" StartStyle="DiamondAnchor" HighLightLines="False" EndStyle="DiamondAnchor">
                        </igchartprop:LineChartAppearance>
                    </ChartTypeAppearances>
                </igchartprop:ChartLayerAppearance>
                <igchartprop:ChartLayerAppearance ChartAreaKey="area1" Key="chartLayer4" ChartType="LineChart"
                    AxisXKey="axis5" AxisYKey="axis4" SeriesList="series4" AxisY2Key="">
                    <ChartTypeAppearances>
                        <igchartprop:LineChartAppearance DrawStyle="Solid" Thickness="3" NullHandling="Zero"
                            MidPointAnchors="True" StartStyle="DiamondAnchor" HighLightLines="False" EndStyle="DiamondAnchor">
                        </igchartprop:LineChartAppearance>
                    </ChartTypeAppearances>
                </igchartprop:ChartLayerAppearance>
            </ChartLayers>
            <ChartAreas>
                <igchartprop:ChartArea Visible="True" Key="area1" BoundsMeasureType="Pixels" Bounds="0, 0, 0, 0">
                    <Axes>
                        <igchartprop:AxisItem OrientationType="Y_Axis" DataType="Numeric" LineEndCapStyle="NoAnchor"
                            LineDrawStyle="Solid" RangeMin="0" LineColor="Red" RangeType="Custom" Key="axis1"
                            TickmarkInterval="20" LineThickness="1" Extent="100" LogBase="10" SetLabelAxisType="GroupBySeries"
                            RangeMax="300" TickmarkStyle="Smart" TickmarkPercentage="10" NumericAxisType="Linear">
                            <StripLines Interval="2" Visible="False">
                                <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                                    Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                                    FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                                    ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                                Thickness="1"></MinorGridLines>
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True"
                                Thickness="1"></MajorGridLines>
                            <Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" WrapText="False"
                                FontSizeBestFit="False" SeriesFormatString="&lt;SERIES_LABEL&gt;" ClipText="True"
                                Font="Verdana, 7pt" Flip="False" ItemFormat="DataValue" FontColor="Black" Orientation="Horizontal"
                                Visible="True" OrientationAngle="0" HorizontalAlign="Near">
                                <SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near"
                                    FontSizeBestFit="False" ClipText="True" FormatString="&lt;SERIES_LABEL&gt;" Orientation="Horizontal"
                                    WrapText="False" Flip="False" FontColor="Black" VerticalAlign="Center" OrientationAngle="0">
                                </SeriesLabels>
                            </Labels>
                            <TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
                            <Margin>
                                <Far MarginType="Percentage" Value="0"></Far>
                                <Near MarginType="Percentage" Value="0"></Near>
                            </Margin>
                        </igchartprop:AxisItem>
                        <igchartprop:AxisItem OrientationType="Y_Axis" DataType="Numeric" LineEndCapStyle="NoAnchor"
                            LineDrawStyle="Solid" RangeMin="1" LineColor="Yellow" RangeType="Custom" Key="axis2"
                            TickmarkInterval="20" LineThickness="1" Extent="75" LogBase="10" SetLabelAxisType="GroupBySeries"
                            RangeMax="250" TickmarkStyle="Smart" TickmarkPercentage="10" NumericAxisType="Linear">
                            <StripLines Interval="2" Visible="False">
                                <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                                    Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                                    FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                                    ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                                Thickness="1"></MinorGridLines>
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True"
                                Thickness="1"></MajorGridLines>
                            <Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" WrapText="False"
                                FontSizeBestFit="False" SeriesFormatString="&lt;SERIES_LABEL&gt;" ClipText="True"
                                Font="Verdana, 7pt" Flip="False" ItemFormat="DataValue" FontColor="Black" Orientation="Horizontal"
                                Visible="True" OrientationAngle="0" HorizontalAlign="Near">
                                <SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near"
                                    FontSizeBestFit="False" ClipText="True" FormatString="&lt;SERIES_LABEL&gt;" Orientation="Horizontal"
                                    WrapText="False" Flip="False" FontColor="Black" VerticalAlign="Center" OrientationAngle="0">
                                </SeriesLabels>
                            </Labels>
                            <TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
                            <Margin>
                                <Far MarginType="Percentage" Value="0"></Far>
                                <Near MarginType="Percentage" Value="0"></Near>
                            </Margin>
                        </igchartprop:AxisItem>
                        <igchartprop:AxisItem OrientationType="Y_Axis" DataType="Numeric" LineEndCapStyle="NoAnchor"
                            LineDrawStyle="Solid" RangeMin="2" LineColor="Lime" RangeType="Custom" Key="axis3"
                            TickmarkInterval="20" LineThickness="1" Extent="50" LogBase="10" SetLabelAxisType="GroupBySeries"
                            RangeMax="200" TickmarkStyle="Smart" TickmarkPercentage="10" NumericAxisType="Linear">
                            <StripLines Interval="2" Visible="False">
                                <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                                    Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                                    FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                                    ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                                Thickness="1"></MinorGridLines>
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True"
                                Thickness="1"></MajorGridLines>
                            <Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" WrapText="False"
                                FontSizeBestFit="False" SeriesFormatString="&lt;SERIES_LABEL&gt;" ClipText="True"
                                Font="Verdana, 7pt" Flip="False" ItemFormat="DataValue" FontColor="Black" Orientation="Horizontal"
                                Visible="True" OrientationAngle="0" HorizontalAlign="Near">
                                <SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near"
                                    FontSizeBestFit="False" ClipText="True" FormatString="&lt;SERIES_LABEL&gt;" Orientation="Horizontal"
                                    WrapText="False" Flip="False" FontColor="Black" VerticalAlign="Center" OrientationAngle="0">
                                </SeriesLabels>
                            </Labels>
                            <TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
                            <Margin>
                                <Far MarginType="Percentage" Value="0"></Far>
                                <Near MarginType="Percentage" Value="0"></Near>
                            </Margin>
                        </igchartprop:AxisItem>
                        <igchartprop:AxisItem OrientationType="Y_Axis" DataType="Numeric" LineEndCapStyle="NoAnchor"
                            LineDrawStyle="Solid" RangeMin="3" LineColor="Blue" RangeType="Custom" Key="axis4"
                            TickmarkInterval="20" LineThickness="1" Extent="25" LogBase="10" SetLabelAxisType="GroupBySeries"
                            RangeMax="150" TickmarkStyle="Smart" TickmarkPercentage="10" NumericAxisType="Linear">
                            <StripLines Interval="2" Visible="False">
                                <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                                    Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                                    FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                                    ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                                Thickness="1"></MinorGridLines>
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True"
                                Thickness="1"></MajorGridLines>
                            <Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" WrapText="False"
                                FontSizeBestFit="False" SeriesFormatString="&lt;SERIES_LABEL&gt;" ClipText="True"
                                Font="Verdana, 7pt" Flip="False" ItemFormat="DataValue" FontColor="Black" Orientation="Horizontal"
                                Visible="True" OrientationAngle="0" HorizontalAlign="Near">
                                <SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near"
                                    FontSizeBestFit="False" ClipText="True" FormatString="&lt;SERIES_LABEL&gt;" Orientation="Horizontal"
                                    WrapText="False" Flip="False" FontColor="Black" VerticalAlign="Center" OrientationAngle="0">
                                </SeriesLabels>
                            </Labels>
                            <TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
                            <Margin>
                                <Far MarginType="Percentage" Value="0"></Far>
                                <Near MarginType="Percentage" Value="0"></Near>
                            </Margin>
                        </igchartprop:AxisItem>
                        <igchartprop:AxisItem OrientationType="X_Axis" DataType="String" LineEndCapStyle="NoAnchor"
                            LineDrawStyle="Solid" RangeMin="0" LineColor="Black" RangeType="Automatic" Key="axis5"
                            TickmarkInterval="0" LineThickness="1" Extent="10" LogBase="10" SetLabelAxisType="ContinuousData"
                            RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
                            <StripLines Interval="2" Visible="False">
                                <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                                    Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                                    FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                                    ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                                Thickness="1"></MinorGridLines>
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True"
                                Thickness="1"></MajorGridLines>
                            <Labels ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Near" WrapText="False"
                                FontSizeBestFit="False" SeriesFormatString="&lt;SERIES_LABEL&gt;" ClipText="True"
                                Font="Verdana, 7pt" Flip="False" ItemFormat="ItemLabel" FontColor="Black" Orientation="Horizontal"
                                Visible="True" OrientationAngle="0" HorizontalAlign="Center">
                                <SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near"
                                    FontSizeBestFit="False" ClipText="True" FormatString="&lt;SERIES_LABEL&gt;" Orientation="Horizontal"
                                    WrapText="False" Flip="False" FontColor="Black" VerticalAlign="Center" OrientationAngle="0">
                                </SeriesLabels>
                            </Labels>
                            <TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
                            <Margin>
                                <Far MarginType="Percentage" Value="0"></Far>
                                <Near MarginType="Percentage" Value="0"></Near>
                            </Margin>
                        </igchartprop:AxisItem>
                    </Axes>
                    <Border CornerRadius="0" DrawStyle="Solid" Raised="False" Color="Black" Thickness="1">
                    </Border>
                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                        FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                        ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                </igchartprop:ChartArea>
            </ChartAreas>
        </CompositeChart>
        <TitleRight Font="Microsoft Sans Serif, 7.8pt" Visible="False" Text="" FontSizeBestFit="False"
            Orientation="VerticalRightFacing" WrapText="False" Extent="26" FontColor="Black"
            HorizontalAlign="Near" VerticalAlign="Center" Location="Right">
            <Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
        </TitleRight>
        <Data DataMember="" SwapRowsAndColumns="False" UseMinMax="False" UseRowLabelsColumn="False"
            MinValue="-1.7976931348623157E+308" RowLabelsColumn="-1" ZeroAligned="False"
            MaxValue="1.7976931348623157E+308">
            <EmptyStyle Text="Empty" EnableLineStyle="False" ShowInLegend="False" EnablePE="False"
                EnablePoint="False">
                <PointPE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                    Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                    FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                    ImageWrapMode="Tile" TextureApplication="Normal"></PointPE>
                <PointStyle CharacterFont="Microsoft Sans Serif, 7.8pt"></PointStyle>
                <LineStyle MidPointAnchors="False" EndStyle="NoAnchor" DrawStyle="Dash" StartStyle="NoAnchor">
                </LineStyle>
                <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                    Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                    FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                    ImageWrapMode="Tile" TextureApplication="Normal"></PE>
            </EmptyStyle>
        </Data>
        <TitleLeft Font="Microsoft Sans Serif, 7.8pt" Visible="False" Text="" FontSizeBestFit="False"
            Orientation="VerticalLeftFacing" WrapText="False" Extent="26" FontColor="Black"
            HorizontalAlign="Near" VerticalAlign="Center" Location="Left">
            <Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
        </TitleLeft>
        <ColorModel ColorBegin="DarkGoldenrod" ColorEnd="Navy" AlphaLevel="150" ModelStyle="PureRandom"
            Grayscale="False" Scaling="None">
            <Skin ApplyRowWise="True">
            </Skin>
        </ColorModel>
        <Legend Font="Microsoft Sans Serif, 7.8pt" Visible="False" AlphaLevel="150" BorderThickness="1"
            BorderStyle="Solid" SpanPercentage="25" BorderColor="Navy" FontColor="Black"
            BackgroundColor="FloralWhite" DataAssociation="DefaultData" Location="Right"
            FormatString="&lt;ITEM_LABEL&gt;">
            <Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
        </Legend>
        <Axis BackColor="Cornsilk">
            <Y LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black"
                RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10"
                RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
                <StripLines Interval="2" Visible="False">
                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                        FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                        ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                </StripLines>
                <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                <Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" WrapText="False"
                    FontSizeBestFit="False" SeriesFormatString="" ClipText="True" Font="Microsoft Sans Serif, 7.8pt"
                    Flip="False" ItemFormat="DataValue" FontColor="Black" Orientation="Horizontal"
                    Visible="True" OrientationAngle="0" HorizontalAlign="Far">
                    <SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Far"
                        FontSizeBestFit="False" ClipText="True" FormatString="" Orientation="VerticalLeftFacing"
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
            </Y>
            <Y2 LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="False" RangeMin="0"
                LineColor="Black" RangeType="Automatic" TickmarkInterval="0" LineThickness="2"
                Extent="80" LogBase="10" RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10"
                NumericAxisType="Linear">
                <StripLines Interval="2" Visible="False">
                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                        FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                        ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                </StripLines>
                <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                <Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" WrapText="False"
                    FontSizeBestFit="False" SeriesFormatString="" ClipText="True" Font="Microsoft Sans Serif, 7.8pt"
                    Flip="False" ItemFormat="DataValue" FontColor="Black" Orientation="Horizontal"
                    Visible="True" OrientationAngle="0" HorizontalAlign="Near">
                    <SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near"
                        FontSizeBestFit="False" ClipText="True" FormatString="" Orientation="VerticalLeftFacing"
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
            </Y2>
            <X2 LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="False" RangeMin="0"
                LineColor="Black" RangeType="Automatic" TickmarkInterval="0" LineThickness="2"
                Extent="80" LogBase="10" RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10"
                NumericAxisType="Linear">
                <StripLines Interval="2" Visible="False">
                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                        FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                        ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                </StripLines>
                <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                <Labels ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center" WrapText="False"
                    FontSizeBestFit="False" SeriesFormatString="" ClipText="True" Font="Microsoft Sans Serif, 7.8pt"
                    Flip="False" ItemFormat="ItemLabel" FontColor="Black" Orientation="VerticalLeftFacing"
                    Visible="True" OrientationAngle="0" HorizontalAlign="Near">
                    <SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near"
                        FontSizeBestFit="False" ClipText="True" FormatString="" Orientation="VerticalLeftFacing"
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
            </X2>
            <Z2 LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="False" RangeMin="0"
                LineColor="Black" RangeType="Automatic" TickmarkInterval="0" LineThickness="2"
                Extent="80" LogBase="10" RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10"
                NumericAxisType="Linear">
                <StripLines Interval="2" Visible="False">
                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                        FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                        ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                </StripLines>
                <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                <Labels ItemFormatString="" VerticalAlign="Center" WrapText="False" FontSizeBestFit="False"
                    SeriesFormatString="&lt;SERIES_LABEL&gt;" ClipText="True" Font="Microsoft Sans Serif, 7.8pt"
                    Flip="False" ItemFormat="None" FontColor="Black" Orientation="Horizontal" Visible="True"
                    OrientationAngle="0" HorizontalAlign="Near">
                    <SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near"
                        FontSizeBestFit="False" ClipText="True" FormatString="&lt;SERIES_LABEL&gt;" Orientation="Horizontal"
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
            </Z2>
            <Z LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="False" RangeMin="0"
                LineColor="Black" RangeType="Automatic" TickmarkInterval="0" LineThickness="2"
                Extent="80" LogBase="10" RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10"
                NumericAxisType="Linear">
                <StripLines Interval="2" Visible="False">
                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                        FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                        ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                </StripLines>
                <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                <Labels ItemFormatString="" VerticalAlign="Center" WrapText="False" FontSizeBestFit="False"
                    SeriesFormatString="&lt;SERIES_LABEL&gt;" ClipText="True" Font="Microsoft Sans Serif, 7.8pt"
                    Flip="False" ItemFormat="None" FontColor="Black" Orientation="Horizontal" Visible="True"
                    OrientationAngle="0" HorizontalAlign="Near">
                    <SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near"
                        FontSizeBestFit="False" ClipText="True" FormatString="&lt;SERIES_LABEL&gt;" Orientation="VerticalLeftFacing"
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
            </Z>
            <X LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black"
                RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10"
                RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
                <StripLines Interval="2" Visible="False">
                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                        FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                        ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                </StripLines>
                <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                <Labels ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center" WrapText="False"
                    FontSizeBestFit="False" SeriesFormatString="" ClipText="True" Font="Microsoft Sans Serif, 7.8pt"
                    Flip="False" ItemFormat="ItemLabel" FontColor="Black" Orientation="VerticalLeftFacing"
                    Visible="True" OrientationAngle="0" HorizontalAlign="Near">
                    <SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near"
                        FontSizeBestFit="False" ClipText="True" FormatString="" Orientation="VerticalLeftFacing"
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
        </Axis>
        <TitleBottom Font="Microsoft Sans Serif, 7.8pt" Visible="True" Text="" FontSizeBestFit="False"
            Orientation="Horizontal" WrapText="False" Extent="26" FontColor="Black" HorizontalAlign="Far"
            VerticalAlign="Center" Location="Bottom">
            <Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
        </TitleBottom>
        <TitleTop Font="Microsoft Sans Serif, 7.8pt" Visible="True" Text="" FontSizeBestFit="False"
            Orientation="Horizontal" WrapText="False" Extent="33" FontColor="Black" HorizontalAlign="Near"
            VerticalAlign="Center" Location="Top">
            <Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
        </TitleTop>
        <DeploymentScenario Scenario="FileSystem" ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png"
            ImageType="Png" FilePath="/SamplesBrowser/Temp/ChartImages"></DeploymentScenario>
        <Tooltips BorderThickness="1" Overflow="None" FormatString="&lt;DATA_VALUE:00.##&gt;"
            EnableFadingEffect="False" Format="DataValue" FontColor="Black" BorderColor="Black"
            Display="MouseMove" BackColor="AntiqueWhite" Padding="0"></Tooltips>
    </igchart:UltraChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
