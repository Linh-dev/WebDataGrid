<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="false"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_Bar_And_Column_Charts_3D_Bar_And_Column_Charts_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="Table1" cellspacing="1" cellpadding="4" border="0">
        <tr>
            <td>
                <igchart:UltraChart ID="UltraChart1" runat="server" Width="300px" ChartType="BarChart3D"
                    Height="300px" Transform3D-Perspective="50" Transform3D-ZRotation="0" Transform3D-Scale="50"
                    Transform3D-XRotation="144" Transform3D-YRotation="54">
                    <Data SwapRowsAndColumns="True" />
                    <ColorModel AlphaLevel="255" ModelStyle="CustomSkin">
                        <Skin ApplyRowWise="True">
                            <PEs>
                                <igchartprop:PaintElement FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255"
                                    ElementType="SolidFill" Fill="108, 162, 36" Hatch="None" Texture="LightGrain"
                                    ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255"
                                    ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal">
                                </igchartprop:PaintElement>
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
                    <Axis>
                        <X Visible="True" TickmarkStyle="Smart">
                            <Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" Font="Verdana, 7pt"
                                FontColor="Black" Orientation="Horizontal" Visible="True" HorizontalAlign="Near" />
                        </X>
                        <Y Visible="True">
                            <Labels ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center" Font="Verdana, 7pt, style=Bold"
                                FontColor="Black" Orientation="Horizontal" Visible="True" HorizontalAlign="Far" />
                        </Y>
                        <Z Visible="True">
                            <Labels ItemFormatString="&lt;SERIES_LABEL&gt;" VerticalAlign="Center" Font="Verdana, 7pt"
                                FontColor="Black" Orientation="Horizontal" Visible="True" HorizontalAlign="Near" />
                        </Z>
                        <X2 Visible="False" />
                        <Y2 Visible="False" />
                        <Z2 Visible="False" />
                    </Axis>
                    <DeploymentScenario Scenario="FileSystem" ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png"
                        ImageType="Png" FilePath="/SamplesBrowser/Temp/ChartImages" />
                    <Tooltips BorderThickness="1" Overflow="None" FormatString="&lt;DATA_VALUE:00.##&gt;"
                        EnableFadingEffect="False" Format="DataValue" FontColor="Black" BorderColor="Black"
                        Display="MouseMove" BackColor="AntiqueWhite" Padding="0"></Tooltips>
                </igchart:UltraChart>
            </td>
            <td>
                <igchart:UltraChart ID="UltraChart2" runat="server" Width="300px" ChartType="ColumnChart3D"
                    Transform3D-Perspective="50" Transform3D-ZRotation="0" Transform3D-Scale="55"
                    Transform3D-XRotation="145" Transform3D-YRotation="51">
                    <Data SwapRowsAndColumns="True" />
                    <ColorModel AlphaLevel="255" ModelStyle="CustomSkin">
                        <Skin ApplyRowWise="True">
                            <PEs>
                                <igchartprop:PaintElement FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255"
                                    ElementType="SolidFill" Fill="108, 162, 36" Hatch="None" Texture="LightGrain"
                                    ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255"
                                    ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal">
                                </igchartprop:PaintElement>
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
                    <Axis>
                        <X Visible="True">
                            <Labels ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center" Font="Verdana, 7pt"
                                FontColor="Black" Orientation="VerticalLeftFacing" Visible="True" HorizontalAlign="Near" />
                        </X>
                        <Y Visible="True" TickmarkStyle="Smart">
                            <Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" Font="Verdana, 7pt, style=Bold"
                                FontColor="Black" Orientation="Horizontal" Visible="True" HorizontalAlign="Far" />
                        </Y>
                        <Z Visible="True">
                            <Labels ItemFormatString="&lt;SERIES_LABEL&gt;" VerticalAlign="Center" Font="Verdana, 7pt"
                                FontColor="Black" Orientation="Horizontal" Visible="True" HorizontalAlign="Far" />
                        </Z>
                        <X2 Visible="False" />
                        <Y2 Visible="False" />
                        <Z2 Visible="False" />
                    </Axis>
                    <DeploymentScenario Scenario="FileSystem" ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png"
                        ImageType="Png" FilePath="/SamplesBrowser/Temp/ChartImages"></DeploymentScenario>
                    <Tooltips BorderThickness="1" Overflow="None" FormatString="&lt;DATA_VALUE:00.##&gt;"
                        EnableFadingEffect="False" Format="DataValue" FontColor="Black" BorderColor="Black"
                        Display="MouseMove" BackColor="AntiqueWhite" Padding="0"></Tooltips>
                </igchart:UltraChart>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
