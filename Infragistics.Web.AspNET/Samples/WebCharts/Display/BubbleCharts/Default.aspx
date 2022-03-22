<%@ Page language="c#" CodeFile="Default.aspx.cs" MasterPageFile="~/SamplePage.master" AutoEventWireup="false" Inherits="Samples_WebCharts_Display_Bubble_Charts_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1"/>
<meta name="ProgId" content="VisualStudio.HTML"/>
<meta name="Originator" content="Microsoft Visual Studio .NET 7.1"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <P align="center">
		<igchart:UltraChart id="UltraChart1" runat="server" ChartType="BubbleChart" Width="400px" Height="300px">
			<Border CornerRadius="0" DrawStyle="Solid" Raised="False" Color="Black" Thickness="1"></Border>
			<BubbleChart SortByRadius="None" ColumnX="0" ColumnY="1" ColumnZ="2" NullHandling="Zero" BubbleShape="Circle" ColorCueColumn="-1"></BubbleChart>
			<TitleRight Font="Microsoft Sans Serif, 7.8pt" Visible="False" Text="" FontSizeBestFit="False" Orientation="VerticalRightFacing" WrapText="False" Extent="26" FontColor="Black" HorizontalAlign="Near" VerticalAlign="Center" Location="Right">
				<Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
			</TitleRight>
			<Data DataMember="" SwapRowsAndColumns="False" UseMinMax="False" UseRowLabelsColumn="False" MinValue="-1.7976931348623157E+308" RowLabelsColumn="-1" ZeroAligned="False" MaxValue="1.7976931348623157E+308">
				<EmptyStyle Text="Empty" EnableLineStyle="False" ShowInLegend="False" EnablePE="False" EnablePoint="False">
					<PointPE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill" Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal"></PointPE>
					<PointStyle CharacterFont="Microsoft Sans Serif, 7.8pt"></PointStyle>
					<LineStyle MidPointAnchors="False" EndStyle="NoAnchor" DrawStyle="Dash" StartStyle="NoAnchor"></LineStyle>
					<PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill" Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal"></PE>
				</EmptyStyle>
			</Data><TitleLeft Font="Microsoft Sans Serif, 7.8pt" Visible="False" Text="" FontSizeBestFit="False" Orientation="VerticalLeftFacing" WrapText="False" Extent="26" FontColor="Black" HorizontalAlign="Near" VerticalAlign="Center" Location="Left">
				<Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
			</TitleLeft>
			<ColorModel ColorBegin="DarkGoldenrod" ColorEnd="Navy" AlphaLevel="150" ModelStyle="CustomSkin" Grayscale="False" Scaling="None">
				<Skin ApplyRowWise="True">
					<PEs>
						<igchartprop:PaintElement FillGradientStyle="Vertical" FillOpacity="255" FillStopOpacity="255" ElementType="Gradient" Fill="108, 162, 36" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="148, 244, 17" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="0" ImageWrapMode="Tile" TextureApplication="Normal"></igchartprop:PaintElement>
						<igchartprop:PaintElement FillGradientStyle="Vertical" FillOpacity="255" FillStopOpacity="255" ElementType="Gradient" Fill="7, 108, 176" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="53, 200, 255" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="0" ImageWrapMode="Tile" TextureApplication="Normal"></igchartprop:PaintElement>
						<igchartprop:PaintElement FillGradientStyle="Vertical" FillOpacity="255" FillStopOpacity="255" ElementType="Gradient" Fill="230, 190, 2" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="255, 255, 81" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="0" ImageWrapMode="Tile" TextureApplication="Normal"></igchartprop:PaintElement>
						<igchartprop:PaintElement FillGradientStyle="Vertical" FillOpacity="255" FillStopOpacity="255" ElementType="Gradient" Fill="215, 0, 5" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="254, 117, 16" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="0" ImageWrapMode="Tile" TextureApplication="Normal"></igchartprop:PaintElement>
						<igchartprop:PaintElement FillGradientStyle="Vertical" FillOpacity="255" FillStopOpacity="255" ElementType="Gradient" Fill="252, 122, 10" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="255, 108, 66" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="0" ImageWrapMode="Tile" TextureApplication="Normal"></igchartprop:PaintElement>
					</PEs>
				</Skin>
			</ColorModel>
			<Legend Font="Microsoft Sans Serif, 7.8pt" Visible="False" AlphaLevel="150" BorderThickness="1" BorderStyle="Solid" SpanPercentage="25" BorderColor="Navy" FontColor="Black" BackgroundColor="FloralWhite" DataAssociation="DefaultData" Location="Right" FormatString="&lt;ITEM_LABEL&gt;">
				<Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
			</Legend>
			<Axis BackColor="Cornsilk">
				<Y LineEndCapStyle="Flat" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black" RangeType="Automatic" TickmarkInterval="10" LineThickness="1" Extent="30" LogBase="10" RangeMax="0" TickmarkStyle="Smart" TickmarkPercentage="10" NumericAxisType="Linear">
					<StripLines Interval="2" Visible="False">
						<PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill" Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal"></PE>
					</StripLines>
					<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
					<Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" WrapText="False" FontSizeBestFit="False" SeriesFormatString="" ClipText="True" Font="Verdana, 7pt" Flip="False" ItemFormat="DataValue" FontColor="Black" Orientation="Horizontal" Visible="True" OrientationAngle="0" HorizontalAlign="Far">
						<SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Far" FontSizeBestFit="False" ClipText="True" FormatString="" Orientation="Horizontal" WrapText="False" Flip="False" FontColor="Black" VerticalAlign="Center" OrientationAngle="0"></SeriesLabels>
					</Labels>
					<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
					<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
					<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
					<Margin>
						<Far MarginType="Percentage" Value="0"></Far>
						<Near MarginType="Percentage" Value="0"></Near>
					</Margin>
				</Y>
				<Y2 LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="False" RangeMin="0" LineColor="Black" RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10" RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
					<StripLines Interval="2" Visible="False">
						<PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill" Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal"></PE>
					</StripLines>
					<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
					<Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" WrapText="False" FontSizeBestFit="False" SeriesFormatString="" ClipText="True" Font="Microsoft Sans Serif, 7.8pt" Flip="False" ItemFormat="DataValue" FontColor="Black" Orientation="Horizontal" Visible="True" OrientationAngle="0" HorizontalAlign="Near">
						<SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near" FontSizeBestFit="False" ClipText="True" FormatString="" Orientation="Horizontal" WrapText="False" Flip="False" FontColor="Black" VerticalAlign="Center" OrientationAngle="0"></SeriesLabels>
					</Labels>
					<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
					<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
					<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
					<Margin>
						<Far MarginType="Percentage" Value="0"></Far>
						<Near MarginType="Percentage" Value="0"></Near>
					</Margin>
				</Y2>
				<X2 LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="False" RangeMin="0" LineColor="Black" RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10" RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
					<StripLines Interval="2" Visible="False">
						<PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill" Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal"></PE>
					</StripLines>
					<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
					<Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" WrapText="False" FontSizeBestFit="False" SeriesFormatString="" ClipText="True" Font="Microsoft Sans Serif, 7.8pt" Flip="False" ItemFormat="DataValue" FontColor="Black" Orientation="VerticalLeftFacing" Visible="True" OrientationAngle="0" HorizontalAlign="Far">
						<SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Far" FontSizeBestFit="False" ClipText="True" FormatString="" Orientation="VerticalLeftFacing" WrapText="False" Flip="False" FontColor="Black" VerticalAlign="Center" OrientationAngle="0"></SeriesLabels>
					</Labels>
					<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
					<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
					<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
					<Margin>
						<Far MarginType="Percentage" Value="0"></Far>
						<Near MarginType="Percentage" Value="0"></Near>
					</Margin>
				</X2>
				<Z2 LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="False" RangeMin="0" LineColor="Black" RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10" RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
					<StripLines Interval="2" Visible="False">
						<PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill" Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal"></PE>
					</StripLines>
					<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
					<Labels ItemFormatString="" VerticalAlign="Center" WrapText="False" FontSizeBestFit="False" SeriesFormatString="&lt;SERIES_LABEL&gt;" ClipText="True" Font="Microsoft Sans Serif, 7.8pt" Flip="False" ItemFormat="None" FontColor="Black" Orientation="Horizontal" Visible="True" OrientationAngle="0" HorizontalAlign="Near">
						<SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near" FontSizeBestFit="False" ClipText="True" FormatString="&lt;SERIES_LABEL&gt;" Orientation="Horizontal" WrapText="False" Flip="False" FontColor="Black" VerticalAlign="Center" OrientationAngle="0"></SeriesLabels>
					</Labels>
					<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
					<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
					<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
					<Margin>
						<Far MarginType="Percentage" Value="0"></Far>
						<Near MarginType="Percentage" Value="0"></Near>
					</Margin>
				</Z2>
				<Z LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="False" RangeMin="0" LineColor="Black" RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10" RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
					<StripLines Interval="2" Visible="False">
						<PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill" Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal"></PE>
					</StripLines>
					<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
					<Labels ItemFormatString="" VerticalAlign="Center" WrapText="False" FontSizeBestFit="False" SeriesFormatString="&lt;SERIES_LABEL&gt;" ClipText="True" Font="Microsoft Sans Serif, 7.8pt" Flip="False" ItemFormat="None" FontColor="Black" Orientation="Horizontal" Visible="True" OrientationAngle="0" HorizontalAlign="Near">
						<SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near" FontSizeBestFit="False" ClipText="True" FormatString="&lt;SERIES_LABEL&gt;" Orientation="Horizontal" WrapText="False" Flip="False" FontColor="Black" VerticalAlign="Center" OrientationAngle="0"></SeriesLabels>
					</Labels>
					<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
					<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
					<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
					<Margin>
						<Far MarginType="Percentage" Value="0"></Far>
						<Near MarginType="Percentage" Value="0"></Near>
					</Margin>
				</Z>
				<X LineEndCapStyle="Flat" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black" RangeType="Automatic" TickmarkInterval="10" LineThickness="1" Extent="40" LogBase="10" RangeMax="0" TickmarkStyle="Smart" TickmarkPercentage="10" NumericAxisType="Linear">
					<StripLines Interval="2" Visible="False">
						<PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill" Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal"></PE>
					</StripLines>
					<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
					<Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Near" WrapText="False" FontSizeBestFit="False" SeriesFormatString="" ClipText="True" Font="Verdana, 7pt" Flip="False" ItemFormat="DataValue" FontColor="Black" Orientation="Horizontal" Visible="True" OrientationAngle="0" HorizontalAlign="Center">
						<SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Center" FontSizeBestFit="False" ClipText="True" FormatString="" Orientation="VerticalLeftFacing" WrapText="False" Flip="False" FontColor="Black" VerticalAlign="Center" OrientationAngle="0"></SeriesLabels>
					</Labels>
					<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
					<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
					<TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
					<Margin>
						<Far MarginType="Percentage" Value="0"></Far>
						<Near MarginType="Percentage" Value="0"></Near>
					</Margin>
				</X>
			</Axis>
			<TitleBottom Font="Microsoft Sans Serif, 7.8pt" Visible="False" Text="" FontSizeBestFit="False" Orientation="Horizontal" WrapText="False" Extent="26" FontColor="Black" HorizontalAlign="Far" VerticalAlign="Center" Location="Bottom">
				<Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
			</TitleBottom>
			<TitleTop Font="Microsoft Sans Serif, 7.8pt" Visible="True" Text="" FontSizeBestFit="False" Orientation="Horizontal" WrapText="False" Extent="33" FontColor="Black" HorizontalAlign="Near" VerticalAlign="Center" Location="Top">
				<Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
			</TitleTop>
			<DeploymentScenario Scenario="FileSystem" ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png" ImageType="Png" FilePath="/SamplesBrowser/Temp/ChartImages"></DeploymentScenario>
			<Tooltips BorderThickness="1" Overflow="None" FormatString="&lt;DATA_VALUE:00.##&gt;" EnableFadingEffect="False" Format="DataValue" FontColor="Black" BorderColor="Black" Display="MouseMove" BackColor="AntiqueWhite" Padding="0"></Tooltips>
		</igchart:UltraChart></P>
</asp:Content>
