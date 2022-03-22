<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="false"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_Chart_Customization_Custom_Map_Layer_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="Table1" cellspacing="1" cellpadding="10" border="0">
        <tr>
            <td>
                <p align="center">
                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebCharts, MapCustomChartLayers_Label1 %>"></asp:Label></p>
            </td>
        </tr>
        <tr>
            <td style="width: 369px; height: 317px">
                <igchart:UltraChart ID="UltraChart1" runat="server" Height="300px" Width="400px"
                    Version="6.2" ChartType="Composite">
                    <Border CornerRadius="5" Thickness="0"></Border>
                    <Data>
                        <EmptyStyle>
                            <PointPE FillOpacity="255" Fill="Transparent"></PointPE>
                            <LineStyle DrawStyle="Dash"></LineStyle>
                            <PE FillOpacity="255" Fill="Transparent"></PE>
                        </EmptyStyle>
                    </Data>
                    <TitleLeft Text="Component Market" Visible="False" Orientation="VerticalLeftFacing"
                        HorizontalAlign="Near" Extent="26" Location="Left">
                        <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
                    </TitleLeft>
                    <ColorModel ModelStyle="CustomLinear" AlphaLevel="150">
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
                        <X2 Visible="False" LineThickness="1" TickmarkStyle="Smart">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="" ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center"
                                Visible="True" HorizontalAlign="Far" Font="Verdana, 7pt" ItemFormat="ItemLabel"
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
                        <Z Visible="False" LineThickness="1" TickmarkStyle="Smart">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="" ItemFormatString="" VerticalAlign="Center" Visible="True"
                                HorizontalAlign="Near" Font="Verdana, 7pt" ItemFormat="None" FontColor="DimGray"
                                Orientation="Horizontal">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Near" Font="Verdana, 7pt" FontColor="DimGray"
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
                        </Z>
                        <Z2 Visible="False" LineThickness="1" TickmarkStyle="Smart">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
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
                        <X Visible="True" LineThickness="1" TickmarkStyle="Smart">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="" ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Center"
                                Visible="True" HorizontalAlign="Near" Font="Verdana, 7pt" ItemFormat="ItemLabel"
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
                        <Y Visible="True" TickmarkInterval="40" LineThickness="1" TickmarkStyle="Smart">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
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
                        <Y2 Visible="False" TickmarkInterval="40" LineThickness="1" TickmarkStyle="Smart">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
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
                    <TitleRight Text="UltraChart for .NET is #1 !" Visible="False" Orientation="VerticalRightFacing"
                        HorizontalAlign="Near" Extent="26" Location="Right">
                        <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
                    </TitleRight>
                    <TitleBottom Text="Copyright Infragistics Inc." Visible="False" Orientation="Horizontal"
                        HorizontalAlign="Far" Extent="26" Location="Bottom">
                        <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
                    </TitleBottom>
                    <TitleTop Text="UltraChart Gauge" Visible="True" Orientation="Horizontal" HorizontalAlign="Center"
                        Extent="33" Location="Top">
                        <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
                    </TitleTop>
                    <DeploymentScenario ImageURL="/SamplesBrowser/Temp/ChartImages/Chart1_#SEQNUM(100).jpg"
                        ImageType="Jpeg" FilePath="/SamplesBrowser/Temp/ChartImages">
                    </DeploymentScenario>
                </igchart:UltraChart>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
