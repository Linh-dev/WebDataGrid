<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="false"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_3D_Charting_Chart_Rotation_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .halfTransparent
        {
            opacity: 0.5;
            filter: alpha(opacity=50);
            color: Black;
            margin-top: -32px !important;
        }
        .opaque
        {
            opacity: 1.0;
            filter: alpha(opacity=100);
            margin-top: -32px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
    <table id="Table1" cellspacing="1" cellpadding="3" border="0">
        <tr>
            <td valign="top">
                <igchart:UltraChart ID="UltraChart1" runat="server" EmptyChartText="Data Not Available. Please call UltraChart.Data.DataBind() after setting valid Data.DataSource"
                    ForeColor="Black" ChartType="ColumnChart3D" BackColor="White" EnableCrossHair="False"
                    Version="5.3" Transform3D-YRotation="45" Transform3D-XRotation="144" Transform3D-Scale="50"
                    Transform3D-ZRotation="0" Transform3D-Perspective="50">
                    <Border CornerRadius="5" DrawStyle="Solid" Raised="False" Color="Black" Thickness="1">
                    </Border>
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
                    <ColorModel ColorBegin="DarkGoldenrod" ColorEnd="Navy" AlphaLevel="255" ModelStyle="CustomSkin"
                        Grayscale="False" Scaling="None">
                        <Skin ApplyRowWise="False">
                            <PEs>
                                <igchartprop:PaintElement FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255"
                                    ElementType="SolidFill" Fill="7, 108, 176" Hatch="None" Texture="LightGrain"
                                    ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255"
                                    ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal">
                                </igchartprop:PaintElement>
                                <igchartprop:PaintElement FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255"
                                    ElementType="SolidFill" Fill="215, 0, 5" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                                    FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                                    ImageWrapMode="Tile" TextureApplication="Normal"></igchartprop:PaintElement>
                                <igchartprop:PaintElement FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255"
                                    ElementType="SolidFill" Fill="44, 180, 49" Hatch="None" Texture="LightGrain"
                                    ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255"
                                    ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal">
                                </igchartprop:PaintElement>
                                <igchartprop:PaintElement FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255"
                                    ElementType="SolidFill" Fill="243, 204, 3" Hatch="None" Texture="LightGrain"
                                    ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255"
                                    ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal">
                                </igchartprop:PaintElement>
                                <igchartprop:PaintElement FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255"
                                    ElementType="SolidFill" Fill="252, 122, 10" Hatch="None" Texture="LightGrain"
                                    ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255"
                                    ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal">
                                </igchartprop:PaintElement>
                            </PEs>
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
                            RangeMax="0" TickmarkStyle="Smart" TickmarkPercentage="10" NumericAxisType="Linear">
                            <StripLines Interval="2" Visible="False">
                                <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                                    Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit"
                                    FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1"
                                    ImageWrapMode="Tile" TextureApplication="Normal"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                            <Labels ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center" WrapText="False"
                                FontSizeBestFit="False" SeriesFormatString="" ClipText="True" Font="Verdana, 7pt, style=Bold"
                                Flip="False" ItemFormat="ItemLabel" FontColor="Black" Orientation="Horizontal"
                                Visible="True" OrientationAngle="0" HorizontalAlign="Far">
                                <SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Far"
                                    FontSizeBestFit="False" ClipText="True" FormatString="" Orientation="Horizontal"
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
                                    FontSizeBestFit="False" ClipText="True" FormatString="" Orientation="Horizontal"
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
                        <Z LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black"
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
                                FontSizeBestFit="False" SeriesFormatString="&lt;SERIES_LABEL&gt;" ClipText="True"
                                Font="Verdana, 7pt" Flip="False" ItemFormat="DataValue" FontColor="Black" Orientation="VerticalLeftFacing"
                                Visible="True" OrientationAngle="0" HorizontalAlign="Near">
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
                                FontSizeBestFit="False" SeriesFormatString="" ClipText="True" Font="Verdana, 7pt"
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
                    <ColumnChart3D ColumnSpacing="0" NullHandling="Zero"></ColumnChart3D>
                    <DeploymentScenario Scenario="FileSystem" ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png"
                        ImageType="Png" FilePath="/SamplesBrowser/Temp/ChartImages"></DeploymentScenario>
                    <Tooltips BorderThickness="1" Overflow="None" FormatString="&lt;DATA_VALUE:00.##&gt;"
                        EnableFadingEffect="False" Format="DataValue" FontColor="Black" BorderColor="Black"
                        Display="MouseMove" BackColor="AntiqueWhite" Padding="0"></Tooltips>
                </igchart:UltraChart>
            </td>
            <td valign="top">
                <table id="Table2" cellspacing="1" cellpadding="1" border="0">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebCharts, ThreeDRotation_XRotation %>"></asp:Label>
                            
                            <ig:WebSlider ID="XRotationSlider" runat="server" Width="250px" MaxValueAsString="360" AutoPostBackFlags-ValueChanged="On">
                             <ValueLabel Location="FloatTopOrLeft" FloatCssClass="halfTransparent" FloatHoverCssClass="opaque" />
                            </ig:WebSlider>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebCharts, ThreeDRotation_YRotation %>"></asp:Label>
                            <ig:WebSlider ID="YRotationSlider" runat="server" Width="250px" MaxValueAsString="360" AutoPostBackFlags-ValueChanged="On">
                             <ValueLabel Location="FloatTopOrLeft" FloatCssClass="halfTransparent" FloatHoverCssClass="opaque" />
                            </ig:WebSlider>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebCharts, ThreeDRotation_ZRotation %>"></asp:Label>
                          <ig:WebSlider ID="ZRotationSlider" runat="server" Width="250px" MaxValueAsString="360" AutoPostBackFlags-ValueChanged="On">
                             <ValueLabel Location="FloatTopOrLeft" FloatCssClass="halfTransparent" FloatHoverCssClass="opaque" />
                            </ig:WebSlider>
                        </td>
                    </tr>
                </table>
                <p>
                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:WebCharts, ThreeDRotation_AxisRotation %>"></asp:Label><br />
                    <img src="/samplesbrowser/samplescommon/aspnet/WebCharts/Display/3DCharting/Chart-Rotation/axis.JPG" border="1" alt="axis"></p>
            </td>
        </tr>
    </table>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
