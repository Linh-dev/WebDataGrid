<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="false"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_Funnel_And_Pyramid_Charts_3D_Cone_Chart_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <p align="center">
        <igchart:UltraChart ID="UltraChart1" runat="server" ChartType="ConeChart3D" Width="400px"
            Height="300px" Version="6.2">
            <Data>
                <EmptyStyle>
                    <PointPE FillOpacity="150" FillStopOpacity="150" Fill="Transparent" StrokeOpacity="150">
                    </PointPE>
                    <LineStyle DrawStyle="Dash"></LineStyle>
                    <PE FillOpacity="150" FillStopOpacity="150" Fill="Transparent" StrokeOpacity="150">
                    </PE>
                </EmptyStyle>
            </Data>
            <TitleLeft Visible="False" Orientation="VerticalLeftFacing" HorizontalAlign="Near"
                Extent="26" Location="Left">
                <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
            </TitleLeft>
            <ConeChart3D Labels-Font="Microsoft Sans Serif, 7.8pt" Axis="HeightWithSlopeConstant">
            </ConeChart3D>
            <ColorModel ModelStyle="CustomLinear" AlphaLevel="255">
                <Skin>
                    <PEs>
                        <igchartprop:PaintElement FillGradientStyle="Vertical" FillOpacity="150" FillStopOpacity="150"
                            ElementType="Gradient" Fill="108, 162, 36" FillStopColor="148, 244, 17" StrokeOpacity="150"
                            StrokeWidth="0"></igchartprop:PaintElement>
                        <igchartprop:PaintElement FillGradientStyle="Vertical" FillOpacity="150" FillStopOpacity="150"
                            ElementType="Gradient" Fill="7, 108, 176" FillStopColor="53, 200, 255" StrokeOpacity="150"
                            StrokeWidth="0"></igchartprop:PaintElement>
                        <igchartprop:PaintElement FillGradientStyle="Vertical" FillOpacity="150" FillStopOpacity="150"
                            ElementType="Gradient" Fill="230, 190, 2" FillStopColor="255, 255, 81" StrokeOpacity="150"
                            StrokeWidth="0"></igchartprop:PaintElement>
                        <igchartprop:PaintElement FillGradientStyle="Vertical" FillOpacity="150" FillStopOpacity="150"
                            ElementType="Gradient" Fill="215, 0, 5" FillStopColor="254, 117, 16" StrokeOpacity="150"
                            StrokeWidth="0"></igchartprop:PaintElement>
                        <igchartprop:PaintElement FillGradientStyle="Vertical" FillOpacity="150" FillStopOpacity="150"
                            ElementType="Gradient" Fill="252, 122, 10" FillStopColor="255, 108, 66" StrokeOpacity="150"
                            StrokeWidth="0"></igchartprop:PaintElement>
                    </PEs>
                </Skin>
            </ColorModel>
            <Legend FormatString="&lt;ITEM_LABEL&gt;">
                <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
            </Legend>
            <Effects>
                <Effects>
                    <igchartprop:GradientEffect Style="forwarddiagonal" Coloring="Darken">
                    </igchartprop:GradientEffect>
                </Effects>
            </Effects>
            <Axis>
                <X2 Visible="False" TickmarkInterval="10" LineThickness="1" TickmarkStyle="Smart">
                    <StripLines>
                        <PE FillOpacity="150" FillStopOpacity="150" Fill="Transparent" StrokeOpacity="150">
                        </PE>
                    </StripLines>
                    <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                    <Labels SeriesFormatString="" ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center"
                        Visible="True" HorizontalAlign="Far" Font="Verdana, 7pt" ItemFormat="DataValue"
                        FontColor="Gray" Orientation="VerticalLeftFacing">
                        <SeriesLabels VerticalAlign="Center" HorizontalAlign="Far" Font="Verdana, 7pt" FontColor="Gray"
                            Orientation="VerticalLeftFacing" Visible="True" FormatString="">
                            <Layout Behavior="Auto">
                            </Layout>
                        </SeriesLabels>
                        <Layout Behavior="Auto">
                        </Layout>
                    </Labels>
                    <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
                    </MajorGridLines>
                    <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
                    </MinorGridLines>
                </X2>
                <Z Visible="True" LineThickness="1" TickmarkStyle="Smart">
                    <StripLines>
                        <PE FillOpacity="150" FillStopOpacity="150" Fill="Transparent" StrokeOpacity="150">
                        </PE>
                    </StripLines>
                    <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                    <Labels SeriesFormatString="&lt;SERIES_LABEL&gt;" ItemFormatString="" VerticalAlign="Center"
                        Visible="True" HorizontalAlign="Far" Font="Verdana, 7pt" ItemFormat="None" FontColor="DimGray"
                        Orientation="Horizontal">
                        <SeriesLabels VerticalAlign="Center" HorizontalAlign="Far" Font="Verdana, 7pt" FontColor="DimGray"
                            Orientation="Horizontal" Visible="True" FormatString="&lt;SERIES_LABEL&gt;">
                            <Layout Behavior="Auto">
                            </Layout>
                        </SeriesLabels>
                        <Layout Behavior="Auto">
                        </Layout>
                    </Labels>
                    <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
                    </MajorGridLines>
                    <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
                    </MinorGridLines>
                </Z>
                <Z2 Visible="True" LineThickness="1" TickmarkStyle="Smart">
                    <StripLines>
                        <PE FillOpacity="150" FillStopOpacity="150" Fill="Transparent" StrokeOpacity="150">
                        </PE>
                    </StripLines>
                    <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                    <Labels SeriesFormatString="&lt;SERIES_LABEL&gt;" ItemFormatString="" VerticalAlign="Center"
                        Visible="True" HorizontalAlign="Near" Font="Verdana, 7pt" ItemFormat="None" FontColor="Gray"
                        Orientation="Horizontal">
                        <SeriesLabels VerticalAlign="Center" HorizontalAlign="Near" Font="Verdana, 7pt" FontColor="Gray"
                            Orientation="Horizontal" Visible="True" FormatString="&lt;SERIES_LABEL&gt;">
                            <Layout Behavior="Auto">
                            </Layout>
                        </SeriesLabels>
                        <Layout Behavior="Auto">
                        </Layout>
                    </Labels>
                    <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
                    </MajorGridLines>
                    <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
                    </MinorGridLines>
                </Z2>
                <X LineEndCapStyle="Flat" Visible="True" TickmarkInterval="10" LineThickness="1"
                    Extent="40" TickmarkStyle="Smart">
                    <StripLines>
                        <PE FillOpacity="150" FillStopOpacity="150" Fill="Transparent" StrokeOpacity="150">
                        </PE>
                    </StripLines>
                    <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                    <Labels SeriesFormatString="" ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center"
                        Visible="True" HorizontalAlign="Near" Font="Verdana, 7pt" ItemFormat="DataValue"
                        FontColor="DimGray" Orientation="VerticalLeftFacing">
                        <SeriesLabels VerticalAlign="Center" HorizontalAlign="Near" Font="Verdana, 7pt" FontColor="DimGray"
                            Orientation="VerticalLeftFacing" Visible="True" FormatString="">
                            <Layout Behavior="Auto">
                            </Layout>
                        </SeriesLabels>
                        <Layout Behavior="Auto">
                        </Layout>
                    </Labels>
                    <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
                    </MajorGridLines>
                    <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
                    </MinorGridLines>
                </X>
                <Y LineEndCapStyle="Flat" Visible="True" TickmarkInterval="10" LineThickness="1"
                    Extent="30" TickmarkStyle="Smart">
                    <StripLines>
                        <PE FillOpacity="150" FillStopOpacity="150" Fill="Transparent" StrokeOpacity="150">
                        </PE>
                    </StripLines>
                    <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                    <Labels SeriesFormatString="" ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center"
                        Visible="True" HorizontalAlign="Far" Font="Verdana, 7pt" ItemFormat="DataValue"
                        FontColor="DimGray" Orientation="Horizontal">
                        <SeriesLabels VerticalAlign="Center" HorizontalAlign="Far" Font="Verdana, 7pt" FontColor="DimGray"
                            Orientation="Horizontal" Visible="True" FormatString="">
                            <Layout Behavior="Auto">
                            </Layout>
                        </SeriesLabels>
                        <Layout Behavior="Auto">
                        </Layout>
                    </Labels>
                    <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
                    </MajorGridLines>
                    <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
                    </MinorGridLines>
                </Y>
                <Y2 Visible="False" TickmarkInterval="10" LineThickness="1" TickmarkStyle="Smart">
                    <StripLines>
                        <PE FillOpacity="150" FillStopOpacity="150" Fill="Transparent" StrokeOpacity="150">
                        </PE>
                    </StripLines>
                    <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                    <Labels SeriesFormatString="" ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center"
                        Visible="True" HorizontalAlign="Near" Font="Verdana, 7pt" ItemFormat="DataValue"
                        FontColor="Gray" Orientation="Horizontal">
                        <SeriesLabels VerticalAlign="Center" HorizontalAlign="Near" Font="Verdana, 7pt" FontColor="Gray"
                            Orientation="Horizontal" Visible="True" FormatString="">
                            <Layout Behavior="Auto">
                            </Layout>
                        </SeriesLabels>
                        <Layout Behavior="Auto">
                        </Layout>
                    </Labels>
                    <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
                    </MajorGridLines>
                    <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
                    </MinorGridLines>
                </Y2>
            </Axis>
            <TitleRight Visible="False" Orientation="VerticalRightFacing" HorizontalAlign="Near"
                Extent="26" Location="Right">
                <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
            </TitleRight>
            <TitleBottom Visible="False" Orientation="Horizontal" HorizontalAlign="Far" Extent="26"
                Location="Bottom">
                <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
            </TitleBottom>
            <TitleTop Visible="True" Orientation="Horizontal" HorizontalAlign="Near" Extent="33"
                Location="Top">
                <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
            </TitleTop>
            <DeploymentScenario ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png" FilePath="/SamplesBrowser/Temp/ChartImages">
            </DeploymentScenario>
        </igchart:UltraChart>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
