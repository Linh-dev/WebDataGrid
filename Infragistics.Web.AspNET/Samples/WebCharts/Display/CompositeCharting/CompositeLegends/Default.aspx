<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="false"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_Composite_Charting_Composite_Legends_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="Table2" cellspacing="1" cellpadding="3" border="0">
        <tr>
            <td>
                <igchart:UltraChart ID="UltraChart1" runat="server" Transform3D-ZRotation="0" Transform3D-Scale="55"
                    Transform3D-XRotation="144" Transform3D-YRotation="12" ChartType="ColumnChart"
                    Height="402px" Width="442px" BackgroundImageStyle="StretchedFit">
                    <Border Thickness="0" Color="Black" Raised="False" DrawStyle="Solid" CornerRadius="5">
                    </Border>
                    <TitleRight Text="UltraChart for .NET is #1 !" Location="Right" VerticalAlign="Center"
                        HorizontalAlign="Near" FontColor="Black" Extent="26" WrapText="False" Orientation="VerticalRightFacing"
                        FontSizeBestFit="False" Visible="False" Font="Microsoft Sans Serif, 7.8pt">
                        <Margins Right="5" Top="5" Left="5" Bottom="5"></Margins>
                    </TitleRight>
                    <Data MaxValue="1.7976931348623157E+308" ZeroAligned="True" RowLabelsColumn="-1"
                        MinValue="-1.7976931348623157E+308" UseRowLabelsColumn="False" UseMinMax="False"
                        SwapRowsAndColumns="False" DataMember="">
                        <EmptyStyle Text="Empty" EnablePoint="False" EnablePE="False" ShowInLegend="False"
                            EnableLineStyle="False">
                            <PointPE TextureApplication="Normal" ImageWrapMode="Tile" StrokeWidth="1" Stroke="Black"
                                ImagePath="" StrokeOpacity="255" FillStopColor="Transparent" ImageFitStyle="StretchedFit"
                                Texture="LightGrain" Hatch="None" Fill="Transparent" ElementType="SolidFill"
                                FillStopOpacity="255" FillOpacity="255" FillGradientStyle="None"></PointPE>
                            <PointStyle CharacterFont="Microsoft Sans Serif, 7.8pt"></PointStyle>
                            <LineStyle DrawStyle="Dash" StartStyle="NoAnchor" EndStyle="NoAnchor" MidPointAnchors="False">
                            </LineStyle>
                            <PE TextureApplication="Normal" ImageWrapMode="Tile" StrokeWidth="1" Stroke="Black"
                                ImagePath="" StrokeOpacity="255" FillStopColor="Transparent" ImageFitStyle="StretchedFit"
                                Texture="LightGrain" Hatch="None" Fill="Transparent" ElementType="SolidFill"
                                FillStopOpacity="255" FillOpacity="255" FillGradientStyle="None"></PE>
                        </EmptyStyle>
                    </Data>
                    <TitleLeft Text="Component Market" Location="Left" VerticalAlign="Center" HorizontalAlign="Near"
                        FontColor="Black" Extent="26" WrapText="False" Orientation="VerticalLeftFacing"
                        FontSizeBestFit="False" Visible="False" Font="Microsoft Sans Serif, 7.8pt">
                        <Margins Right="5" Top="5" Left="5" Bottom="5"></Margins>
                    </TitleLeft>
                    <ColorModel Scaling="None" Grayscale="False" ModelStyle="PureRandom" AlphaLevel="200"
                        ColorEnd="Navy" ColorBegin="DarkGoldenrod">
                        <Skin ApplyRowWise="True">
                        </Skin>
                    </ColorModel>
                    <Legend BorderStyle="Solid" BorderColor="Navy" Location="Right" FontColor="Black"
                        Visible="False" Font="Microsoft Sans Serif, 7.8pt" AlphaLevel="200" FormatString="<ITEM_LABEL>"
                        DataAssociation="DefaultData" BackgroundColor="FloralWhite" SpanPercentage="25"
                        BorderThickness="2">
                        <Margins Right="5" Top="5" Left="5" Bottom="5"></Margins>
                    </Legend>
                    <ColumnChart NullHandling="Zero" ColumnSpacing="0" SeriesSpacing="1">
                    </ColumnChart>
                    <Axis BackColor="Cornsilk">
                        <Y Extent="80" Visible="True" NumericAxisType="Linear" TickmarkPercentage="10" TickmarkStyle="Percentage"
                            RangeMax="0" LogBase="10" LineThickness="2" TickmarkInterval="0" RangeType="Automatic"
                            LineColor="Black" RangeMin="0" LineDrawStyle="Solid" LineEndCapStyle="NoAnchor">
                            <StripLines Visible="False" Interval="2">
                                <PE TextureApplication="Normal" ImageWrapMode="Tile" StrokeWidth="1" Stroke="Black"
                                    ImagePath="" StrokeOpacity="255" FillStopColor="Transparent" ImageFitStyle="StretchedFit"
                                    Texture="LightGrain" Hatch="None" Fill="Transparent" ElementType="SolidFill"
                                    FillStopOpacity="255" FillOpacity="255" FillGradientStyle="None"></PE>
                            </StripLines>
                            <ScrollScale Width="15" Height="10" Visible="False" Scroll="0" Scale="1"></ScrollScale>
                            <Labels VerticalAlign="Center" HorizontalAlign="Far" FontColor="Black" WrapText="False"
                                Orientation="Horizontal" FontSizeBestFit="False" Visible="True" Font="Microsoft Sans Serif, 7.8pt"
                                OrientationAngle="0" ItemFormat="DataValue" Flip="False" ClipText="True" SeriesFormatString="<SERIES_LABEL>"
                                ItemFormatString="<DATA_VALUE:00.##>">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Center" FontColor="Black" WrapText="False"
                                    Orientation="VerticalLeftFacing" FontSizeBestFit="False" Visible="True" Font="Microsoft Sans Serif, 7.8pt"
                                    FormatString="<SERIES_LABEL>" OrientationAngle="0" Flip="False" ClipText="True">
                                </SeriesLabels>
                            </Labels>
                            <MajorGridLines Thickness="1" Color="Gainsboro" DrawStyle="Dot" Visible="True" AlphaLevel="255">
                            </MajorGridLines>
                            <MinorGridLines Thickness="1" Color="LightGray" DrawStyle="Dot" Visible="False" AlphaLevel="255">
                            </MinorGridLines>
                            <TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
                            <Margin>
                                <Far Value="0" MarginType="Percentage"></Far>
                                <Near Value="0" MarginType="Percentage"></Near>
                            </Margin>
                        </Y>
                        <Y2 Extent="80" Visible="True" NumericAxisType="Linear" TickmarkPercentage="10" TickmarkStyle="Percentage"
                            RangeMax="0" LogBase="10" LineThickness="2" TickmarkInterval="0" RangeType="Automatic"
                            LineColor="Black" RangeMin="0" LineDrawStyle="Solid" LineEndCapStyle="NoAnchor">
                            <StripLines Visible="False" Interval="2">
                                <PE TextureApplication="Normal" ImageWrapMode="Tile" StrokeWidth="1" Stroke="Black"
                                    ImagePath="" StrokeOpacity="255" FillStopColor="Transparent" ImageFitStyle="StretchedFit"
                                    Texture="LightGrain" Hatch="None" Fill="Transparent" ElementType="SolidFill"
                                    FillStopOpacity="255" FillOpacity="255" FillGradientStyle="None"></PE>
                            </StripLines>
                            <ScrollScale Width="15" Height="10" Visible="False" Scroll="0" Scale="1"></ScrollScale>
                            <Labels VerticalAlign="Center" HorizontalAlign="Near" FontColor="Black" WrapText="False"
                                Orientation="Horizontal" FontSizeBestFit="False" Visible="True" Font="Microsoft Sans Serif, 7.8pt"
                                OrientationAngle="0" ItemFormat="DataValue" Flip="False" ClipText="True" SeriesFormatString="<SERIES_LABEL>"
                                ItemFormatString="<DATA_VALUE:00.##>">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Center" FontColor="Black" WrapText="False"
                                    Orientation="VerticalLeftFacing" FontSizeBestFit="False" Visible="True" Font="Microsoft Sans Serif, 7.8pt"
                                    FormatString="<SERIES_LABEL>" OrientationAngle="0" Flip="False" ClipText="True">
                                </SeriesLabels>
                            </Labels>
                            <MajorGridLines Thickness="1" Color="Gainsboro" DrawStyle="Dot" Visible="True" AlphaLevel="255">
                            </MajorGridLines>
                            <MinorGridLines Thickness="1" Color="LightGray" DrawStyle="Dot" Visible="False" AlphaLevel="255">
                            </MinorGridLines>
                            <TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
                            <Margin>
                                <Far Value="0" MarginType="Percentage"></Far>
                                <Near Value="0" MarginType="Percentage"></Near>
                            </Margin>
                        </Y2>
                        <X2 Extent="80" Visible="True" NumericAxisType="Linear" TickmarkPercentage="10" TickmarkStyle="Percentage"
                            RangeMax="0" LogBase="10" LineThickness="2" TickmarkInterval="0" RangeType="Automatic"
                            LineColor="Black" RangeMin="0" LineDrawStyle="Solid" LineEndCapStyle="NoAnchor">
                            <StripLines Visible="False" Interval="2">
                                <PE TextureApplication="Normal" ImageWrapMode="Tile" StrokeWidth="1" Stroke="Black"
                                    ImagePath="" StrokeOpacity="255" FillStopColor="Transparent" ImageFitStyle="StretchedFit"
                                    Texture="LightGrain" Hatch="None" Fill="Transparent" ElementType="SolidFill"
                                    FillStopOpacity="255" FillOpacity="255" FillGradientStyle="None"></PE>
                            </StripLines>
                            <ScrollScale Width="15" Height="10" Visible="False" Scroll="0" Scale="1"></ScrollScale>
                            <Labels VerticalAlign="Center" HorizontalAlign="Far" FontColor="Black" WrapText="False"
                                Orientation="VerticalLeftFacing" FontSizeBestFit="False" Visible="True" Font="Microsoft Sans Serif, 7.8pt"
                                OrientationAngle="0" ItemFormat="ItemLabel" Flip="False" ClipText="True" SeriesFormatString="<SERIES_LABEL>"
                                ItemFormatString="<ITEM_LABEL>">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Center" FontColor="Black" WrapText="False"
                                    Orientation="Horizontal" FontSizeBestFit="False" Visible="True" Font="Microsoft Sans Serif, 7.8pt"
                                    FormatString="<SERIES_LABEL>" OrientationAngle="0" Flip="False" ClipText="True">
                                </SeriesLabels>
                            </Labels>
                            <MajorGridLines Thickness="1" Color="Gainsboro" DrawStyle="Dot" Visible="True" AlphaLevel="255">
                            </MajorGridLines>
                            <MinorGridLines Thickness="1" Color="LightGray" DrawStyle="Dot" Visible="False" AlphaLevel="255">
                            </MinorGridLines>
                            <TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
                            <Margin>
                                <Far Value="0" MarginType="Percentage"></Far>
                                <Near Value="0" MarginType="Percentage"></Near>
                            </Margin>
                        </X2>
                        <Z2 Extent="80" Visible="True" NumericAxisType="Linear" TickmarkPercentage="10" TickmarkStyle="Percentage"
                            RangeMax="0" LogBase="10" LineThickness="2" TickmarkInterval="0" RangeType="Automatic"
                            LineColor="Black" RangeMin="0" LineDrawStyle="Solid" LineEndCapStyle="NoAnchor">
                            <StripLines Visible="False" Interval="2">
                                <PE TextureApplication="Normal" ImageWrapMode="Tile" StrokeWidth="1" Stroke="Black"
                                    ImagePath="" StrokeOpacity="255" FillStopColor="Transparent" ImageFitStyle="StretchedFit"
                                    Texture="LightGrain" Hatch="None" Fill="Transparent" ElementType="SolidFill"
                                    FillStopOpacity="255" FillOpacity="255" FillGradientStyle="None"></PE>
                            </StripLines>
                            <ScrollScale Width="15" Height="10" Visible="False" Scroll="0" Scale="1"></ScrollScale>
                            <Labels VerticalAlign="Center" HorizontalAlign="Near" FontColor="Black" WrapText="False"
                                Orientation="Horizontal" FontSizeBestFit="False" Visible="True" Font="Microsoft Sans Serif, 7.8pt"
                                OrientationAngle="0" ItemFormat="None" Flip="False" ClipText="True" SeriesFormatString="<SERIES_LABEL>"
                                ItemFormatString="">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Near" FontColor="Black" WrapText="False"
                                    Orientation="Horizontal" FontSizeBestFit="False" Visible="True" Font="Microsoft Sans Serif, 7.8pt"
                                    FormatString="<SERIES_LABEL>" OrientationAngle="0" Flip="False" ClipText="True">
                                </SeriesLabels>
                            </Labels>
                            <MajorGridLines Thickness="1" Color="Gainsboro" DrawStyle="Dot" Visible="True" AlphaLevel="255">
                            </MajorGridLines>
                            <MinorGridLines Thickness="1" Color="LightGray" DrawStyle="Dot" Visible="False" AlphaLevel="255">
                            </MinorGridLines>
                            <TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
                            <Margin>
                                <Far Value="0" MarginType="Percentage"></Far>
                                <Near Value="0" MarginType="Percentage"></Near>
                            </Margin>
                        </Z2>
                        <Z Extent="80" Visible="True" NumericAxisType="Linear" TickmarkPercentage="10" TickmarkStyle="Percentage"
                            RangeMax="0" LogBase="10" LineThickness="2" TickmarkInterval="0" RangeType="Automatic"
                            LineColor="Black" RangeMin="0" LineDrawStyle="Solid" LineEndCapStyle="NoAnchor">
                            <StripLines Visible="False" Interval="2">
                                <PE TextureApplication="Normal" ImageWrapMode="Tile" StrokeWidth="1" Stroke="Black"
                                    ImagePath="" StrokeOpacity="255" FillStopColor="Transparent" ImageFitStyle="StretchedFit"
                                    Texture="LightGrain" Hatch="None" Fill="Transparent" ElementType="SolidFill"
                                    FillStopOpacity="255" FillOpacity="255" FillGradientStyle="None"></PE>
                            </StripLines>
                            <ScrollScale Width="15" Height="10" Visible="False" Scroll="0" Scale="1"></ScrollScale>
                            <Labels VerticalAlign="Center" HorizontalAlign="Near" FontColor="Black" WrapText="False"
                                Orientation="Horizontal" FontSizeBestFit="False" Visible="True" Font="Microsoft Sans Serif, 7.8pt"
                                OrientationAngle="0" ItemFormat="DataValue" Flip="False" ClipText="True" SeriesFormatString=""
                                ItemFormatString="<DATA_VALUE:00.##>">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Near" FontColor="Black" WrapText="False"
                                    Orientation="Horizontal" FontSizeBestFit="False" Visible="True" Font="Microsoft Sans Serif, 7.8pt"
                                    FormatString="" OrientationAngle="0" Flip="False" ClipText="True">
                                </SeriesLabels>
                            </Labels>
                            <MajorGridLines Thickness="1" Color="Gainsboro" DrawStyle="Dot" Visible="True" AlphaLevel="255">
                            </MajorGridLines>
                            <MinorGridLines Thickness="1" Color="LightGray" DrawStyle="Dot" Visible="False" AlphaLevel="255">
                            </MinorGridLines>
                            <TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
                            <Margin>
                                <Far Value="0" MarginType="Percentage"></Far>
                                <Near Value="0" MarginType="Percentage"></Near>
                            </Margin>
                        </Z>
                        <X Extent="80" Visible="True" NumericAxisType="Linear" TickmarkPercentage="10" TickmarkStyle="Percentage"
                            RangeMax="0" LogBase="10" LineThickness="2" TickmarkInterval="0" RangeType="Automatic"
                            LineColor="Black" RangeMin="0" LineDrawStyle="Solid" LineEndCapStyle="NoAnchor">
                            <StripLines Visible="False" Interval="2">
                                <PE TextureApplication="Normal" ImageWrapMode="Tile" StrokeWidth="1" Stroke="Black"
                                    ImagePath="" StrokeOpacity="255" FillStopColor="Transparent" ImageFitStyle="StretchedFit"
                                    Texture="LightGrain" Hatch="None" Fill="Transparent" ElementType="SolidFill"
                                    FillStopOpacity="255" FillOpacity="255" FillGradientStyle="None"></PE>
                            </StripLines>
                            <ScrollScale Width="15" Height="10" Visible="False" Scroll="0" Scale="1"></ScrollScale>
                            <Labels VerticalAlign="Center" HorizontalAlign="Near" FontColor="Black" WrapText="False"
                                Orientation="VerticalLeftFacing" FontSizeBestFit="False" Visible="True" Font="Microsoft Sans Serif, 7.8pt"
                                OrientationAngle="0" ItemFormat="ItemLabel" Flip="False" ClipText="True" SeriesFormatString="<SERIES_LABEL>"
                                ItemFormatString="<ITEM_LABEL>">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Center" FontColor="Black" WrapText="False"
                                    Orientation="Horizontal" FontSizeBestFit="False" Visible="True" Font="Microsoft Sans Serif, 7.8pt"
                                    FormatString="<SERIES_LABEL>" OrientationAngle="0" Flip="False" ClipText="True">
                                </SeriesLabels>
                            </Labels>
                            <MajorGridLines Thickness="1" Color="Gainsboro" DrawStyle="Dot" Visible="True" AlphaLevel="255">
                            </MajorGridLines>
                            <MinorGridLines Thickness="1" Color="LightGray" DrawStyle="Dot" Visible="False" AlphaLevel="255">
                            </MinorGridLines>
                            <TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
                            <Margin>
                                <Far Value="0" MarginType="Percentage"></Far>
                                <Near Value="0" MarginType="Percentage"></Near>
                            </Margin>
                        </X>
                    </Axis>
                    <TitleBottom Text="Copyright 2004 Infragistics Inc." Location="Bottom" VerticalAlign="Center"
                        HorizontalAlign="Far" FontColor="Black" Extent="26" WrapText="False" Orientation="Horizontal"
                        FontSizeBestFit="False" Visible="False" Font="Microsoft Sans Serif, 7.8pt">
                        <Margins Right="5" Top="5" Left="5" Bottom="5"></Margins>
                    </TitleBottom>
                    <TitleTop Text="" Location="Top" VerticalAlign="Center" HorizontalAlign="Center"
                        FontColor="Black" Extent="33" WrapText="False" Orientation="Horizontal" FontSizeBestFit="False"
                        Visible="False" Font="Microsoft Sans Serif, 7.8pt">
                        <Margins Right="5" Top="5" Left="5" Bottom="5"></Margins>
                    </TitleTop>
                    <DeploymentScenario FilePath="/SamplesBrowser/Temp/ChartImages" ImageType="Jpeg" ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).jpg"
                        Scenario="FileSystem"></DeploymentScenario>
                    <Tooltips BorderColor="Black" BackColor="150, 250, 235, 215" FontColor="Black" FormatString="<DATA_VALUE:00.00>"
                        BorderThickness="1" Padding="0" Display="MouseMove" Format="Custom" EnableFadingEffect="False"
                        Overflow="None"></Tooltips>
                </igchart:UltraChart>
            </td>
            <td valign="top">
                <table id="Table3" cellspacing="1" cellpadding="1" border="0" style="width:290px; margin-top:15px; font-family: Segoe UI,Verdana; font-size: 13px; line-height: 18px;">
                    <tr>
                        <td colspan="2">
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="<%$ Resources:WebCharts, CompositeChartLegends_Label1 %>">
                            </asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:CheckBox ID="CheckBox2" runat="server" Text="<%$ Resources:WebCharts, CompositeChartLegends_Label2 %>">
                            </asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:CheckBox ID="CheckBox3" runat="server" Text="<%$ Resources:WebCharts, CompositeChartLegends_Label3 %>">
                            </asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:WebCharts, CompositeChartLegends_Label4%>"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="Dropdownlist2" runat="server" Height="32px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebCharts, CompositeChartLegends_Label5%>"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="Dropdownlist3" runat="server" Height="32px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebCharts, CompositeChartLegends_Label6%>"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="Dropdownlist4" runat="server" Height="32px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <br />
                            <asp:Button ID="Button1" runat="server" Text="<%$ Resources:WebCharts, AxisMargins_Label6 %>">
                            </asp:Button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
