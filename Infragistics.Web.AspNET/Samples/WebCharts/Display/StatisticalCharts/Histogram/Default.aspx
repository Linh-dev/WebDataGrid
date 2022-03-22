<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_Statistical_Charts_Histogram_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
        legend
        {
            color: White;
            font-family: Segoe UI, Verdana, Helvetica, sans-serif;
            font-size: 12px;
            font-weight: bold;
            background-color: rgb(79, 79, 79);
            padding: 5px;
            margin: 5px;
        }
        fieldset
        {
            border-color: #bbb;
            border-width: 1px;
            border-style: solid;
            width: 100%;
            height: 292px;
        }
    </style>
    <div style="width: 700px; margin: 0px auto;">
        <div style="float: left;">
            <igchart:UltraChart ID="UltraChart1" runat="server" ChartType="HistogramChart" Width="422px">
                <Data>
                    <EmptyStyle>
                        <LineStyle DrawStyle="Dash"></LineStyle>
                    </EmptyStyle>
                </Data>
                <ColorModel ColorBegin="Pink" ColorEnd="DarkRed" AlphaLevel="200" ModelStyle="CustomSkin">
                    <Skin>
                        <PEs>
                            <igchartprop:PaintElement ElementType="Gradient" Fill="#89B314" FillGradientStyle="ForwardDiagonal"
                                FillStopColor="#2E5D0B" Stroke="DarkGreen"></igchartprop:PaintElement>
                        </PEs>
                    </Skin>
                </ColorModel>
                <Axis>
                    <Y LineEndCapStyle="Flat" Visible="True" TickmarkInterval="0.5" LineThickness="1"
                        Extent="20" TickmarkStyle="Smart">
                        <Labels ItemFormatString="&lt;DATA_VALUE:0.##&gt;" VerticalAlign="Center" Font="Verdana, 7pt"
                            FontColor="DimGray" Orientation="Horizontal" HorizontalAlign="Far">
                            <SeriesLabels Font="Verdana, 7pt" HorizontalAlign="Far" FormatString="" Orientation="Horizontal"
                                FontColor="DimGray" VerticalAlign="Center">
                                <Layout Behavior="Auto">
                                </Layout>
                            </SeriesLabels>
                            <Layout Behavior="Auto">
                            </Layout>
                        </Labels>
                        <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True"
                            Thickness="1"></MajorGridLines>
                        <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                            Thickness="1"></MinorGridLines>
                    </Y>
                    <Y2 Visible="True" TickmarkInterval="0.02" LineThickness="1" TickmarkStyle="Smart"
                        Extent="35">
                        <Labels ItemFormatString="&lt;DATA_VALUE:0.#00&gt;" VerticalAlign="Center" Font="Verdana, 7pt"
                            FontColor="Gray" Orientation="Horizontal" HorizontalAlign="Near">
                            <SeriesLabels Font="Verdana, 7pt" HorizontalAlign="Near" FormatString="" Orientation="Horizontal"
                                FontColor="Gray" VerticalAlign="Center">
                                <Layout Behavior="Auto">
                                </Layout>
                            </SeriesLabels>
                            <Layout Behavior="Auto">
                            </Layout>
                        </Labels>
                        <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="False"
                            Thickness="1"></MajorGridLines>
                        <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                            Thickness="1"></MinorGridLines>
                    </Y2>
                    <X2 Visible="False" TickmarkInterval="1" LineThickness="1" TickmarkStyle="Smart">
                        <Labels ItemFormatString="&lt;DATA_VALUE:0.##&gt;" VerticalAlign="Center" Font="Verdana, 7pt"
                            FontColor="Gray" Orientation="VerticalLeftFacing" HorizontalAlign="Far" Visible="False">
                            <SeriesLabels Font="Verdana, 7pt" HorizontalAlign="Far" Orientation="VerticalLeftFacing"
                                FontColor="Gray" VerticalAlign="Center" FormatString="">
                                <Layout Behavior="Auto">
                                </Layout>
                            </SeriesLabels>
                            <Layout Behavior="Auto">
                            </Layout>
                        </Labels>
                        <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True"
                            Thickness="1"></MajorGridLines>
                        <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                            Thickness="1"></MinorGridLines>
                    </X2>
                    <Z2 Visible="False" TickmarkInterval="0" LineThickness="1" TickmarkStyle="Smart">
                        <Labels ItemFormatString="" VerticalAlign="Center" Font="Verdana, 7pt" FontColor="Gray"
                            Orientation="Horizontal" HorizontalAlign="Near" Visible="False">
                            <SeriesLabels Font="Verdana, 7pt" HorizontalAlign="Near" Orientation="Horizontal"
                                FontColor="Gray" VerticalAlign="Center">
                                <Layout Behavior="Auto">
                                </Layout>
                            </SeriesLabels>
                            <Layout Behavior="Auto">
                            </Layout>
                        </Labels>
                        <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True"
                            Thickness="1"></MajorGridLines>
                        <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                            Thickness="1"></MinorGridLines>
                    </Z2>
                    <Z Visible="False" TickmarkInterval="0" LineThickness="1" TickmarkStyle="Smart">
                        <Labels ItemFormatString="" VerticalAlign="Center" Font="Verdana, 7pt" FontColor="DimGray"
                            Orientation="Horizontal" HorizontalAlign="Far" Visible="False">
                            <SeriesLabels Font="Verdana, 7pt" HorizontalAlign="Far" Orientation="Horizontal"
                                FontColor="DimGray" VerticalAlign="Center">
                                <Layout Behavior="Auto">
                                </Layout>
                            </SeriesLabels>
                            <Layout Behavior="Auto">
                            </Layout>
                        </Labels>
                        <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True"
                            Thickness="1"></MajorGridLines>
                        <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                            Thickness="1"></MinorGridLines>
                    </Z>
                    <X LineEndCapStyle="Flat" Visible="True" TickmarkInterval="8" LineThickness="1" Extent="10"
                        TickmarkStyle="DataInterval">
                        <Labels ItemFormatString="&lt;DATA_VALUE:0.##&gt;" VerticalAlign="Center" Font="Lucida Sans, 10pt"
                            FontColor="DimGray" Orientation="Horizontal" HorizontalAlign="Near">
                            <SeriesLabels Font="Verdana, 7pt" HorizontalAlign="Near" Orientation="VerticalLeftFacing"
                                FontColor="DimGray" VerticalAlign="Center" FormatString="">
                                <Layout Behavior="Auto">
                                </Layout>
                            </SeriesLabels>
                            <Layout Behavior="Auto">
                            </Layout>
                        </Labels>
                        <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True"
                            Thickness="1"></MajorGridLines>
                        <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False"
                            Thickness="1"></MinorGridLines>
                    </X>
                    <PE ElementType="None" Fill="Cornsilk" />
                </Axis>
                <DeploymentScenario ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png"
                    FilePath="/SamplesBrowser/Temp/ChartImages"></DeploymentScenario>
                <Effects>
                    <Effects>
                        <igchartprop:GradientEffect>
                        </igchartprop:GradientEffect>
                    </Effects>
                </Effects>
                <TitleTop Font="Lucida Sans, 11.25pt" HorizontalAlign="Center" Text="<%$ Resources:WebCharts, Histogram_Label_1 %>">
                </TitleTop>
                <TitleBottom Font="Lucida Sans, 9.75pt" HorizontalAlign="Center" Text="<%$ Resources:WebCharts, Histogram_Label_8 %>"
                    VerticalAlign="Near" Extent="33">
                </TitleBottom>
                <TitleLeft Extent="33" Font="Lucida Sans, 9pt" HorizontalAlign="Center" Text="<%$ Resources:WebCharts, Histogram_Label_2 %>"
                    Visible="True">
                    <Margins Left="15" Bottom="0" Right="0" Top="0" />
                </TitleLeft>
                <TitleRight Extent="32" Font="Lucida Sans, 9pt" HorizontalAlign="Center" Text="<%$ Resources:WebCharts, Histogram_Label_9 %>"
                    Visible="True">
                </TitleRight>
                <HistogramChart>
                    <ColumnAppearance ColumnSpacing="0" StringAxis="False" />
                    <LineAppearance PE-Stroke="Brown" DrawStyle="Solid" />
                </HistogramChart>
            </igchart:UltraChart>
        </div>
        <div style="float: left; padding: 2px; width: 200px">
            <fieldset>
                <legend>
                    <asp:Literal Text="<%$ Resources:WebCharts, Histogram_Label_3 %>" runat="server" />
                </legend>
                <table style="margin: 0px auto; width: auto;">
                    <tr>
                        <td>
                            <label>
                                <asp:Label ID="ShowColumns" runat="server" Text="<%$ Resources:WebCharts, Histogram_Label_4 %>"></asp:Label>
                            </label>
                        </td>
                        <td style="text-align: right">
                            <asp:DropDownList ID="columnsDropDown" runat="server" Width="75px" Height="24px"
                                AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                <asp:Label ID="ShowCurve" runat="server" Text="<%$ Resources:WebCharts, Histogram_Label_5 %>"></asp:Label>
                            </label>
                        </td>
                        <td style="text-align: right">
                            <asp:DropDownList ID="normalCurveDropDown" runat="server" Width="75px" Height="24px"
                                AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                <asp:Label ID="FillCurve" runat="server" Text="<%$ Resources:WebCharts, Histogram_Label_6 %>"></asp:Label>
                            </label>
                        </td>
                        <td style="text-align: right">
                            <asp:DropDownList ID="normalCurveFillDropDown" runat="server" Width="75px" Height="24px"
                                AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                            <asp:Label ID="XAxisTickmarks" runat="server" Text="<%$ Resources:WebCharts, Histogram_Label_7 %>"></asp:Label>
                            </label>
                        </td>
                        <td style="text-align: right">
                            <asp:DropDownList ID="tickMarkDropDown" runat="server" Width="75px" Height="24px"
                                AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
