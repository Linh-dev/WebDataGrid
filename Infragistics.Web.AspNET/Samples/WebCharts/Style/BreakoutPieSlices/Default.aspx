<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Style_Breakout_Pie_Slices_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

	<TABLE id="Table1" cellSpacing="1" cellPadding="3" border="0">
		<TR>
			<TD>
				<igchart:UltraChart id="UltraChart1" runat="server" EmptyChartText="Data Not Available. Please call UltraChart.Data.DataBind() after setting valid Data.DataSource" ForeColor="Black" ChartType="PieChart3D" BackColor="White" EnableCrossHair="False" Version="5.3" Transform3D-Perspective="50" Transform3D-ZRotation="0" Transform3D-Scale="75" Transform3D-XRotation="45" Transform3D-YRotation="45">
					<Border CornerRadius="5" DrawStyle="Solid" Raised="False" Color="Black" Thickness="1"></Border>
					<PieChart3D ConcentricSpacing="0.25" OthersCategoryPercent="3" BreakAlternatingSlices="False" BreakDistancePercentage="10" BreakOthersSlice="False" ColumnIndex="0" Concentric="False" PieThickness="20" BreakAllSlices="False" StartAngle="0" OthersCategoryText="Others" RadiusFactor="80" ShowConcentricLegend="True">
						<Labels Font="Microsoft Sans Serif, 7.8pt" Visible="True" FormatString="&lt;PERCENT_VALUE:#0.00&gt;%" LeaderLineThickness="1" FillColor="Transparent" LeaderLinesVisible="True" BorderDrawStyle="Solid" Format="Custom" BorderThickness="0" LeaderEndStyle="ArrowAnchor" FontColor="Black" BorderColor="Black" LeaderDrawStyle="Dot"></Labels>
					</PieChart3D>
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
					</Data>
					<TitleLeft Font="Microsoft Sans Serif, 7.8pt" Visible="False" Text="" FontSizeBestFit="False" Orientation="VerticalLeftFacing" WrapText="False" Extent="26" FontColor="Black" HorizontalAlign="Near" VerticalAlign="Center" Location="Left">
						<Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
					</TitleLeft>
					<ColorModel ColorBegin="DarkGoldenrod" ColorEnd="Navy" AlphaLevel="150" ModelStyle="CustomSkin" Grayscale="False" Scaling="None">
						<Skin ApplyRowWise="True">
							<PEs>
								<igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" FillStopOpacity="255" ElementType="Gradient" Fill="108, 162, 36" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="148, 244, 17" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="0" ImageWrapMode="Tile" TextureApplication="Normal"></igchartprop:PaintElement>
								<igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" FillStopOpacity="255" ElementType="Gradient" Fill="7, 108, 176" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="53, 200, 255" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="0" ImageWrapMode="Tile" TextureApplication="Normal"></igchartprop:PaintElement>
								<igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" FillStopOpacity="255" ElementType="Gradient" Fill="230, 190, 2" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="255, 255, 81" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="0" ImageWrapMode="Tile" TextureApplication="Normal"></igchartprop:PaintElement>
								<igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" FillStopOpacity="255" ElementType="Gradient" Fill="215, 0, 5" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="254, 117, 16" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="0" ImageWrapMode="Tile" TextureApplication="Normal"></igchartprop:PaintElement>
								<igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" FillStopOpacity="255" ElementType="Gradient" Fill="252, 122, 10" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="255, 108, 66" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="0" ImageWrapMode="Tile" TextureApplication="Normal"></igchartprop:PaintElement>
							</PEs>
						</Skin>
					</ColorModel>
					<Legend Font="Microsoft Sans Serif, 7.8pt" Visible="False" AlphaLevel="150" BorderThickness="1" BorderStyle="Solid" SpanPercentage="25" BorderColor="Navy" FontColor="Black" BackgroundColor="FloralWhite" DataAssociation="DefaultData" Location="Right" FormatString="&lt;ITEM_LABEL&gt;">
						<Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
					</Legend>
					<Axis BackColor="Cornsilk">
						<Y LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="False" RangeMin="0" LineColor="Black" RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10" RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
							<StripLines Interval="2" Visible="False">
								<PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill" Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal"></PE>
							</StripLines>
							<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
							<Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" WrapText="False" FontSizeBestFit="False" SeriesFormatString="" ClipText="True" Font="Microsoft Sans Serif, 7.8pt" Flip="False" ItemFormat="DataValue" FontColor="Black" Orientation="Horizontal" Visible="True" OrientationAngle="0" HorizontalAlign="Far">
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
							<Labels ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center" WrapText="False" FontSizeBestFit="False" SeriesFormatString="" ClipText="True" Font="Microsoft Sans Serif, 7.8pt" Flip="False" ItemFormat="ItemLabel" FontColor="Black" Orientation="Horizontal" Visible="True" OrientationAngle="0" HorizontalAlign="Near">
								<SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near" FontSizeBestFit="False" ClipText="True" FormatString="" Orientation="Horizontal" WrapText="False" Flip="False" FontColor="Black" VerticalAlign="Center" OrientationAngle="0"></SeriesLabels>
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
						<X LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="False" RangeMin="0" LineColor="Black" RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10" RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
							<StripLines Interval="2" Visible="False">
								<PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill" Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal"></PE>
							</StripLines>
							<ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
							<Labels ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center" WrapText="False" FontSizeBestFit="False" SeriesFormatString="" ClipText="True" Font="Microsoft Sans Serif, 7.8pt" Flip="False" ItemFormat="ItemLabel" FontColor="Black" Orientation="Horizontal" Visible="True" OrientationAngle="0" HorizontalAlign="Near">
								<SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Near" FontSizeBestFit="False" ClipText="True" FormatString="" Orientation="Horizontal" WrapText="False" Flip="False" FontColor="Black" VerticalAlign="Center" OrientationAngle="0"></SeriesLabels>
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
					<TitleTop Font="Microsoft Sans Serif, 7.8pt" Visible="False" Text="" FontSizeBestFit="False" Orientation="Horizontal" WrapText="False" Extent="33" FontColor="Black" HorizontalAlign="Near" VerticalAlign="Center" Location="Top">
						<Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
					</TitleTop>
					<DeploymentScenario Scenario="FileSystem" ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png" ImageType="Png" FilePath="/SamplesBrowser/Temp/ChartImages"></DeploymentScenario>
					<Tooltips BorderThickness="1" Overflow="None" FormatString="&lt;DATA_VALUE:00.##&gt;" EnableFadingEffect="False" Format="DataValue" FontColor="Black" BorderColor="Black" Display="MouseMove" BackColor="AntiqueWhite" Padding="0"></Tooltips>
				</igchart:UltraChart></TD>
			<TD vAlign="top">
				<TABLE id="Table2" cellSpacing="1" cellPadding="1" border="0">
					<TR>
						<TD>
							<asp:CheckBox id="CheckBox1" runat="server" Text="<%$ Resources:WebCharts, PieSliceBreaks_Label1 %>" AutoPostBack="True"></asp:CheckBox></TD>
					</TR>
					<TR>
						<TD>
							<asp:CheckBox id="CheckBox2" runat="server" Text="<%$ Resources:WebCharts, PieSliceBreaks_Label2 %>" AutoPostBack="True"></asp:CheckBox></TD>
					</TR>
					<TR>
						<TD>
							<asp:CheckBox id="CheckBox3" runat="server" Text="<%$ Resources:WebCharts, PieSliceBreaks_Label3 %>" AutoPostBack="True"></asp:CheckBox></TD>
					</TR>
					<TR>
						<TD></TD>
					</TR>
					<TR>
						<TD><asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebCharts, PieSliceBreaks_Label4 %>"></asp:Label></TD>
					</TR>
					<TR>
						<TD>
							<TABLE id="Table3" cellSpacing="1" cellPadding="1" border="1">
								<TR>
									<TD><asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebCharts, PieSliceBreaks_Label5 %>"></asp:Label>
										<ig:WebNumericEditor id="WebNumericEdit1" runat="server" Width="56px"></ig:WebNumericEditor></TD>
								</TR>
								<TR>
									<TD>
										<asp:Button id="Button1" runat="server" Text="<%$ Resources:WebCharts, PieSliceBreaks_Label6 %>"></asp:Button>
										<asp:Button id="Button2" runat="server" Text="<%$ Resources:WebCharts, PieSliceBreaks_Label7 %>"></asp:Button></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
	</TABLE>
</asp:Content>