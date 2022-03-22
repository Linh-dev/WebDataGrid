<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="false"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_Visual_Appearance_Visual_Effects_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="Table1" cellspacing="1" cellpadding="1" border="1">
        <tr>
            <td>
                <igchart:UltraChart ID="UltraChart1" runat="server" EmptyChartText="Data Not Available. Please call UltraChart.Data.DataBind() after setting valid Data.DataSource"
                    ForeColor="Black" BackColor="White" EnableCrossHair="False" ChartType="ColumnChart"
                    Version="5.3">
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
                                <igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" Fill="108, 162, 36"
                                    StrokeWidth="0"></igchartprop:PaintElement>
                                <igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" Fill="7, 108, 176"
                                    StrokeWidth="0"></igchartprop:PaintElement>
                                <igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" Fill="230, 190, 2"
                                    StrokeWidth="0"></igchartprop:PaintElement>
                                <igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" Fill="215, 0, 5"
                                    StrokeWidth="0"></igchartprop:PaintElement>
                                <igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" Fill="252, 122, 10"
                                    StrokeWidth="0"></igchartprop:PaintElement>
                            </PEs>
                        </Skin>
                    </ColorModel>
                    <Legend FormatString="&lt;ITEM_LABEL&gt;">
                        <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
                    </Legend>
                    <ColumnChart SeriesSpacing="1" ColumnSpacing="0" NullHandling="Zero">
                    </ColumnChart>
                    <Effects>
                        <Effects>
                            <igchartprop:GradientEffect Style="forwarddiagonal" Coloring="Darken">
                            </igchartprop:GradientEffect>
                            <igchartprop:TextureEffect ApplyTo="Background" Texture="LightGrain">
                            </igchartprop:TextureEffect>
                            <igchartprop:ShadowEffect Color="DarkGray" Angle="45">
                            </igchartprop:ShadowEffect>
                            <igchartprop:ThreeDEffect>
                            </igchartprop:ThreeDEffect>
                        </Effects>
                    </Effects>
                    <Axis>
                        <X2 Visible="False">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="&lt;SERIES_LABEL&gt;" ItemFormatString="&lt;ITEM_LABEL&gt;"
                                VerticalAlign="Center" Visible="True" HorizontalAlign="Near" ItemFormat="ItemLabel"
                                Orientation="VerticalLeftFacing">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Near" Orientation="Horizontal"
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
                        <X Visible="True">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="&lt;SERIES_LABEL&gt;" ItemFormatString="&lt;ITEM_LABEL&gt;"
                                VerticalAlign="Center" Visible="True" HorizontalAlign="Near" ItemFormat="ItemLabel"
                                Orientation="VerticalLeftFacing">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Center" Orientation="Horizontal"
                                    Visible="True" FormatString="&lt;SERIES_LABEL&gt;">
                                </SeriesLabels>
                            </Labels>
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
                            </MajorGridLines>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
                            </MinorGridLines>
                        </X>
                        <Y Visible="True">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="&lt;SERIES_LABEL&gt;" ItemFormatString="&lt;DATA_VALUE:00.##&gt;"
                                VerticalAlign="Center" Visible="True" HorizontalAlign="Far" ItemFormat="DataValue"
                                Orientation="Horizontal">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Center" Orientation="VerticalLeftFacing"
                                    Visible="True" FormatString="&lt;SERIES_LABEL&gt;">
                                </SeriesLabels>
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
                            <Labels SeriesFormatString="&lt;SERIES_LABEL&gt;" ItemFormatString="&lt;DATA_VALUE:00.##&gt;"
                                VerticalAlign="Center" Visible="True" HorizontalAlign="Near" ItemFormat="DataValue"
                                Orientation="Horizontal">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Near" Orientation="VerticalLeftFacing"
                                    Visible="True" FormatString="&lt;SERIES_LABEL&gt;">
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
                    <TitleBottom Visible="True" Orientation="Horizontal" HorizontalAlign="Far" Extent="26"
                        Location="Bottom">
                        <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
                    </TitleBottom>
                    <TitleTop Visible="True" Orientation="Horizontal" HorizontalAlign="Near" Extent="33"
                        Location="Top">
                        <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
                    </TitleTop>
                    <DeploymentScenario Scenario="FileSystem" ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png"
                        ImageType="Png" FilePath="/SamplesBrowser/Temp/ChartImages"></DeploymentScenario>
                </igchart:UltraChart>
            </td>
            <td valign="top">
                <table id="Table2" cellspacing="1" cellpadding="1" border="0">
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebCharts, VisualEffects_Label1 %>"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="<%$ Resources:WebCharts, VisualEffects_Label2 %>">
                            </asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="CheckBox3" runat="server" Text="<%$ Resources:WebCharts, VisualEffects_Label3 %>">
                            </asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="CheckBox2" runat="server" Text="<%$ Resources:WebCharts, VisualEffects_Label4 %>">
                            </asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="CheckBox4" runat="server" Text="<%$ Resources:WebCharts, VisualEffects_Label5 %>">
                            </asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Button ID="Button1" runat="server" Text="<%$ Resources:WebCharts, GanttChartStyles_Label7 %>">
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
