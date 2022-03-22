<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="false"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_Composite_Charting_Data_Series_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="Table2" cellspacing="1" cellpadding="3" border="0">
        <tr>
            <td>
                <p>
                    <igchart:UltraChart ID="UltraChart1" runat="server" Width="422px" Height="402px"
                        BackgroundImageStyle="StretchedFit" ChartType="ColumnChart" Transform3D-YRotation="12"
                        Transform3D-XRotation="144" Transform3D-Scale="55" Transform3D-ZRotation="0">
                        <Border CornerRadius="0" DrawStyle="Solid" Raised="False" Color="Black" Thickness="0">
                        </Border>
                        <TitleRight Font="Microsoft Sans Serif, 7.8pt" Visible="False" Text="UltraChart for .NET is #1 !"
                            FontSizeBestFit="False" Orientation="VerticalLeftFacing" WrapText="False" Extent="26"
                            FontColor="Black" HorizontalAlign="Near" VerticalAlign="Center" Location="Right">
                            <Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
                        </TitleRight>
                        <Data DataMember="" SwapRowsAndColumns="False" UseMinMax="False" UseRowLabelsColumn="False"
                            MinValue="-1.7976931348623157E+308" RowLabelsColumn="-1" ZeroAligned="True" MaxValue="1.7976931348623157E+308">
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
                        <TitleLeft Font="Microsoft Sans Serif, 7.8pt" Visible="False" Text="Component Market"
                            FontSizeBestFit="False" Orientation="VerticalLeftFacing" WrapText="False" Extent="26"
                            FontColor="Black" HorizontalAlign="Near" VerticalAlign="Center" Location="Left">
                            <Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
                        </TitleLeft>
                        <ColorModel ColorBegin="DarkGoldenrod" ColorEnd="Navy" AlphaLevel="200" ModelStyle="PureRandom"
                            Grayscale="False" Scaling="None">
                            <Skin ApplyRowWise="True">
                            </Skin>
                        </ColorModel>
                        <Legend Font="Microsoft Sans Serif, 7.8pt" Visible="False" AlphaLevel="200" BorderThickness="2"
                            BorderStyle="Solid" SpanPercentage="25" BorderColor="Navy" FontColor="Black"
                            BackgroundColor="FloralWhite" DataAssociation="DefaultData" Location="Right"
                            FormatString="&lt;ITEM_LABEL&gt;">
                            <Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
                        </Legend>
                        <ColumnChart SeriesSpacing="1" ColumnSpacing="0" NullHandling="Zero">
                        </ColumnChart>
                        <Axis BackColor="Cornsilk">
                            <Y LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black"
                                RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10"
                                RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
                                <StripLines Interval="2" Visible="False">
                                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="Tiled" FillStopColor="Transparent"
                                        StrokeOpacity="255" ImagePath="" Stroke="Transparent" StrokeWidth="1" ImageWrapMode="Tile"
                                        TextureApplication="Normal"></PE>
                                </StripLines>
                                <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                                <Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" WrapText="False"
                                    FontSizeBestFit="False" SeriesFormatString="&lt;SERIES_LABEL&gt;" ClipText="True"
                                    Font="Microsoft Sans Serif, 7.8pt" Flip="False" ItemFormat="DataValue" FontColor="Black"
                                    Orientation="Horizontal" Visible="True" OrientationAngle="0" HorizontalAlign="Far">
                                    <SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Center"
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
                            </Y>
                            <Y2 LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0"
                                LineColor="Black" RangeType="Automatic" TickmarkInterval="0" LineThickness="2"
                                Extent="80" LogBase="10" RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10"
                                NumericAxisType="Linear">
                                <StripLines Interval="2" Visible="False">
                                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="Tiled" FillStopColor="Transparent"
                                        StrokeOpacity="255" ImagePath="" Stroke="Transparent" StrokeWidth="1" ImageWrapMode="Tile"
                                        TextureApplication="Normal"></PE>
                                </StripLines>
                                <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                                <Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" WrapText="False"
                                    FontSizeBestFit="False" SeriesFormatString="&lt;SERIES_LABEL&gt;" ClipText="True"
                                    Font="Microsoft Sans Serif, 7.8pt" Flip="False" ItemFormat="DataValue" FontColor="Black"
                                    Orientation="Horizontal" Visible="True" OrientationAngle="0" HorizontalAlign="Near">
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
                            </Y2>
                            <X2 LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0"
                                LineColor="Black" RangeType="Automatic" TickmarkInterval="0" LineThickness="2"
                                Extent="80" LogBase="10" RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10"
                                NumericAxisType="Linear">
                                <StripLines Interval="2" Visible="False">
                                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="Tiled" FillStopColor="Transparent"
                                        StrokeOpacity="255" ImagePath="" Stroke="Transparent" StrokeWidth="1" ImageWrapMode="Tile"
                                        TextureApplication="Normal"></PE>
                                </StripLines>
                                <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                                <Labels ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center" WrapText="False"
                                    FontSizeBestFit="False" SeriesFormatString="&lt;SERIES_LABEL&gt;" ClipText="True"
                                    Font="Microsoft Sans Serif, 7.8pt" Flip="False" ItemFormat="ItemLabel" FontColor="Black"
                                    Orientation="VerticalLeftFacing" Visible="True" OrientationAngle="0" HorizontalAlign="Far">
                                    <SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Center"
                                        FontSizeBestFit="False" ClipText="True" FormatString="&lt;SERIES_LABEL&gt;" Orientation="Horizontal"
                                        WrapText="False" Flip="False" FontColor="Black" VerticalAlign="Far" OrientationAngle="0">
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
                            <Z2 LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0"
                                LineColor="Black" RangeType="Automatic" TickmarkInterval="0" LineThickness="2"
                                Extent="80" LogBase="10" RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10"
                                NumericAxisType="Linear">
                                <StripLines Interval="2" Visible="False">
                                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="Tiled" FillStopColor="Transparent"
                                        StrokeOpacity="255" ImagePath="" Stroke="Transparent" StrokeWidth="1" ImageWrapMode="Tile"
                                        TextureApplication="Normal"></PE>
                                </StripLines>
                                <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                                <Labels ItemFormatString="" VerticalAlign="Center" WrapText="False" FontSizeBestFit="False"
                                    SeriesFormatString="" ClipText="True" Font="Microsoft Sans Serif, 7.8pt" Flip="False"
                                    ItemFormat="None" FontColor="Black" Orientation="Horizontal" Visible="True" OrientationAngle="0"
                                    HorizontalAlign="Near">
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
                            </Z2>
                            <Z LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black"
                                RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10"
                                RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
                                <StripLines Interval="2" Visible="False">
                                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="Tiled" FillStopColor="Transparent"
                                        StrokeOpacity="255" ImagePath="" Stroke="Transparent" StrokeWidth="1" ImageWrapMode="Tile"
                                        TextureApplication="Normal"></PE>
                                </StripLines>
                                <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                                <Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" WrapText="False"
                                    FontSizeBestFit="False" SeriesFormatString="" ClipText="True" Font="Microsoft Sans Serif, 7.8pt"
                                    Flip="False" ItemFormat="DataValue" FontColor="Black" Orientation="Horizontal"
                                    Visible="True" OrientationAngle="0" HorizontalAlign="Far">
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
                            </Z>
                            <X LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black"
                                RangeType="Automatic" TickmarkInterval="0" LineThickness="2" Extent="80" LogBase="10"
                                RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
                                <StripLines Interval="2" Visible="False">
                                    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill"
                                        Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="Tiled" FillStopColor="Transparent"
                                        StrokeOpacity="255" ImagePath="" Stroke="Transparent" StrokeWidth="1" ImageWrapMode="Tile"
                                        TextureApplication="Normal"></PE>
                                </StripLines>
                                <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
                                <Labels ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center" WrapText="False"
                                    FontSizeBestFit="False" SeriesFormatString="&lt;SERIES_LABEL&gt;" ClipText="True"
                                    Font="Microsoft Sans Serif, 7.8pt" Flip="False" ItemFormat="ItemLabel" FontColor="Black"
                                    Orientation="VerticalLeftFacing" Visible="True" OrientationAngle="0" HorizontalAlign="Near">
                                    <SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Center"
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
                            </X>
                        </Axis>
                        <TitleBottom Font="Microsoft Sans Serif, 7.8pt" Visible="False" Text="Copyright 2004 Infragistics Inc."
                            FontSizeBestFit="False" Orientation="VerticalLeftFacing" WrapText="False" Extent="26"
                            FontColor="Black" HorizontalAlign="Far" VerticalAlign="Center" Location="Bottom">
                            <Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
                        </TitleBottom>
                        <TitleTop Font="Microsoft Sans Serif, 7.8pt" Visible="False" Text="" FontSizeBestFit="False"
                            Orientation="VerticalLeftFacing" WrapText="False" Extent="33" FontColor="Black"
                            HorizontalAlign="Center" VerticalAlign="Center" Location="Top">
                            <Margins Bottom="5" Left="5" Top="5" Right="5"></Margins>
                        </TitleTop>
                        <DeploymentScenario Scenario="FileSystem" ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).jpg"
                            ImageType="Jpeg" FilePath="/SamplesBrowser/Temp/ChartImages"></DeploymentScenario>
                        <Tooltips BorderThickness="1" Overflow="None" FormatString="&lt;DATA_VALUE:00.00&gt;"
                            EnableFadingEffect="True" Format="Custom" FontColor="Black" BorderColor="Black"
                            Display="MouseMove" BackColor="150, 250, 235, 215" Padding="0"></Tooltips>
                    </igchart:UltraChart>
                </p>
            </td>
            <td valign="top">
                <p>
                    <table id="Table1" cellspacing="1" cellpadding="1" style="width:290px; height:200px; margin-top:15px; font-family: Segoe UI,Verdana; font-size: 13px; line-height: 18px;">
                        <tr>
                                <td>
                                <asp:Label ID="Label1" runat="server" Width="100px" Text="<%$ Resources:WebCharts, CompositeChartDataSeries_Label1 %>" />
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="160px" Height="32px" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                         <td>
                                <asp:Label ID="Label2" runat="server" Width="100px" Text="<%$ Resources:WebCharts, CompositeChartDataSeries_Label2 %>" />
                            </td>
                              <td>
                                <asp:DropDownList ID="Dropdownlist2" runat="server" Width="160px" Height="32px" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
            <td>
                                <asp:Label ID="Label44" runat="server" Font-Size="X-Small" Width="100px" Text="<%$ Resources:WebCharts, CompositeChartDataSeries_Label3 %>" />
                            </td>
                            <td style="height: 5px">
                                <asp:Label ID="Axis1" runat="server" Font-Size="X-Small" Width="100px" ForeColor="Red"
                                    Text="<%$ Resources:WebCharts, CompositeChartDataSeries_Label4 %>" />
                            </td>
                        </tr>
                        <tr>
             <td>
                                <asp:Label ID="Label4" runat="server" Font-Size="X-Small" Width="100px" Text="<%$ Resources:WebCharts, CompositeChartDataSeries_Label5 %>" />
                            </td>
                            <td style="height: 5px">
                                <asp:Label ID="Axis2" runat="server" Font-Size="X-Small" Width="100px" ForeColor="Red"
                                    Text="<%$ Resources:WebCharts, CompositeChartDataSeries_Label4 %>" />
                            </td>
                        </tr>
                        <tr>
                              <td>
                                <asp:Label ID="Label5" runat="server" Font-Size="X-Small" Width="100px" Text="<%$ Resources:WebCharts, CompositeChartDataSeries_Label6%>" />
                            </td>
                            <td style="height: 19px">
                                <asp:Label ID="Axis3" runat="server" Font-Size="X-Small" Width="100px" ForeColor="Red"
                                    Text="<%$ Resources:WebCharts, CompositeChartDataSeries_Label4 %>" />
                            </td>
                        </tr>
                        <tr>
                           <td>
                                <asp:Label ID="Label6" runat="server" Font-Size="X-Small" Width="100px" Text="<%$ Resources:WebCharts, CompositeChartDataSeries_Label7 %>" />
                            </td>
                           <td>
                                <asp:Label ID="Axis4" runat="server" Font-Size="X-Small" Width="100px" ForeColor="Red"
                                    Text="<%$ Resources:WebCharts, CompositeChartDataSeries_Label4 %>" />
                            </td>
                        </tr>
                        <tr>
                               <td>
                                <asp:Label ID="Label7" runat="server" Font-Size="X-Small" Width="100px" Text="<%$ Resources:WebCharts, CompositeChartDataSeries_Label8 %>" />
                            </td>
                                <td>
                                <asp:Label ID="Axis5" runat="server" Font-Size="X-Small" Width="100px" ForeColor="Red"
                                    Text="<%$ Resources:WebCharts, CompositeChartDataSeries_Label4 %>" />
                            </td>
                        </tr>
                        <tr>
                          <td>
                                <asp:Label ID="Label8" runat="server" Font-Size="X-Small" Width="100px" Text="<%$ Resources:WebCharts, CompositeChartDataSeries_Label9 %>" />
                            </td>
                    <td>
                                <asp:Label ID="Axis6" runat="server" Font-Size="X-Small" Width="100px" ForeColor="Red"
                                    Text="<%$ Resources:WebCharts, CompositeChartDataSeries_Label4 %>" />
                            </td>
                        </tr>
                    </table>
                </p>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
