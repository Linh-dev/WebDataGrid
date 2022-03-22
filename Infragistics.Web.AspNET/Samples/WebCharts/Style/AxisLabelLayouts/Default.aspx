<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Style_Axis_Label_Layouts_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="Table2" cellspacing="1" cellpadding="3" border="0">
        <tr>
            <td>
                <igchart:UltraChart ID="UltraChart1" runat="server" Version="5.3" ChartType="ColumnChart"
                    EnableCrossHair="False" BackColor="White" ForeColor="Black" EmptyChartText="Data Not Available. Please call UltraChart.Data.DataBind() after setting valid Data.DataSource">
                    <Border CornerRadius="5"></Border>
                    <Data>
                        <EmptyStyle>
                            <PointPE FillOpacity="255" Fill="Transparent"></PointPE>
                            <LineStyle DrawStyle="Dash"></LineStyle>
                            <PE FillOpacity="255" Fill="Transparent"></PE>
                        </EmptyStyle>
                    </Data>
                    <TitleLeft Visible="False" Orientation="VerticalLeftFacing" HorizontalAlign="Near"
                        Extent="26" Location="Left">
                        <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
                    </TitleLeft>
                    <ColorModel ModelStyle="CustomSkin" AlphaLevel="150">
                        <Skin ApplyRowWise="False">
                            <PEs>
                                <igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" ElementType="Gradient"
                                    Fill="230, 190, 2" FillStopColor="255, 255, 81" StrokeWidth="0"></igchartprop:PaintElement>
                                <igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" ElementType="Gradient"
                                    Fill="108, 162, 36" FillStopColor="148, 244, 17" StrokeWidth="0"></igchartprop:PaintElement>
                                <igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" ElementType="Gradient"
                                    Fill="7, 108, 176" FillStopColor="53, 200, 255" StrokeWidth="0"></igchartprop:PaintElement>
                                <igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" ElementType="Gradient"
                                    Fill="215, 0, 5" FillStopColor="254, 117, 16" StrokeWidth="0"></igchartprop:PaintElement>
                                <igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" ElementType="Gradient"
                                    Fill="252, 122, 10" FillStopColor="255, 108, 66" StrokeWidth="0"></igchartprop:PaintElement>
                            </PEs>
                        </Skin>
                    </ColorModel>
                    <Legend FormatString="&lt;ITEM_LABEL&gt;">
                        <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
                    </Legend>
                    <ColumnChart SeriesSpacing="1" ColumnSpacing="0" NullHandling="Zero">
                    </ColumnChart>
                    <Axis>
                        <X2 Visible="False">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="&lt;SERIES_LABEL&gt;" ItemFormatString="&lt;ITEM_LABEL&gt;"
                                VerticalAlign="Center" Visible="True" HorizontalAlign="Far" ItemFormat="ItemLabel"
                                Orientation="VerticalLeftFacing">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Center" Orientation="Horizontal"
                                    Visible="True" FormatString="&lt;SERIES_LABEL&gt;">
                                </SeriesLabels>
                            </Labels>
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
                            </MajorGridLines>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
                            </MinorGridLines>
                        </X2>
                        <Z Visible="False">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="&lt;SERIES_LABEL&gt;" ItemFormatString="" VerticalAlign="Center"
                                Visible="True" HorizontalAlign="Near" ItemFormat="None" Orientation="Horizontal">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Near" Orientation="Horizontal"
                                    Visible="True" FormatString="&lt;SERIES_LABEL&gt;">
                                </SeriesLabels>
                            </Labels>
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
                            </MajorGridLines>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
                            </MinorGridLines>
                        </Z>
                        <Z2 Visible="False">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="&lt;SERIES_LABEL&gt;" ItemFormatString="" VerticalAlign="Center"
                                Visible="True" HorizontalAlign="Near" ItemFormat="None" Orientation="Horizontal">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Near" Orientation="Horizontal"
                                    Visible="True" FormatString="&lt;SERIES_LABEL&gt;">
                                </SeriesLabels>
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
                            <Labels SeriesFormatString="&lt;SERIES_LABEL&gt;" ItemFormatString="&lt;ITEM_LABEL&gt;"
                                VerticalAlign="Near" Visible="True" HorizontalAlign="Near" Font="Arial, 12pt"
                                ItemFormat="ItemLabel" Orientation="VerticalLeftFacing">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Center" Font="Microsoft Sans Serif, 15.75pt"
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
                        </X>
                        <Y Visible="True" TickmarkInterval="40" LineThickness="1" Extent="40" TickmarkStyle="Smart">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="" ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center"
                                Visible="True" HorizontalAlign="Far" Font="Verdana, 12pt" ItemFormat="DataValue"
                                Orientation="Horizontal">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Far" Orientation="VerticalLeftFacing"
                                    Visible="True" FormatString="">
                                </SeriesLabels>
                                <Layout Behavior="Auto">
                                </Layout>
                            </Labels>
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
                            </MajorGridLines>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
                            </MinorGridLines>
                        </Y>
                        <Y2 Visible="False">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="" ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center"
                                Visible="True" HorizontalAlign="Near" ItemFormat="DataValue" Orientation="Horizontal">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Near" Orientation="VerticalLeftFacing"
                                    Visible="True" FormatString="">
                                </SeriesLabels>
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
            </td>
            <td valign="top">
                <table id="Table1" cellspacing="1" cellpadding="1" border="0">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebCharts, AxisLabelLayout_Label1 %>"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:WebCharts, AxisLabelLayout_Label2 %>"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="chart1_axisXLabelsLayoutBehavior" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:WebCharts, AxisLabelLayout_Label3 %>"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="chart1_axisXSeriesLabelsLayoutBehavior" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:WebCharts, AxisLabelLayout_Label4 %>"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="chart1_axisYLabelsLayoutBehavior" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:WebCharts, AxisLabelLayout_Label5 %>"></asp:Label>
                        </td>
                        <td>
                            <ig:WebNumericEditor ID="chart1_axisXExtent" runat="server" Width="75px" DataMode="Int">
                            </ig:WebNumericEditor>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:WebCharts, AxisLabelLayout_Label6 %>"></asp:Label>
                        </td>
                        <td>
                            <ig:WebNumericEditor ID="chart1_axisYExtent" runat="server" Width="75px" DataMode="Int">
                            </ig:WebNumericEditor>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">
                            <asp:Button ID="Button1" runat="server" Text="<%$ Resources:WebCharts, BasicAnnotations_Label6 %>">
                            </asp:Button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
