<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="false"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_Funnel_And_Pyramid_Charts_Funnel_Chart_Styles_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="Table1" cellspacing="1" cellpadding="3" border="0">
        <tr>
            <td>
                <igchart:UltraChart ID="UltraChart1" runat="server" EmptyChartText="Data Not Available. Please call UltraChart.Data.DataBind() after setting valid Data.DataSource"
                    ForeColor="Black" ChartType="FunnelChart" BackColor="White" EnableCrossHair="False"
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
                    <FunnelChart Labels-LabelStyle-Font="Microsoft Sans Serif, 7.8pt" Labels-LabelStyle-Dx="0"
                        Labels-LabelStyle-HorizontalAlign="Near" Labels-LabelStyle-FontSizeBestFit="False"
                        Labels-LabelStyle-ClipText="True" Labels-LabelStyle-RotationAngle="0" Labels-LabelStyle-Orientation="Horizontal"
                        Labels-LabelStyle-WrapText="False" Labels-LabelStyle-Flip="False" Labels-LabelStyle-FontColor="Black"
                        Labels-LabelStyle-VerticalAlign="Center" Labels-LabelStyle-Dy="0">
                    </FunnelChart>
                    <ColorModel AlphaLevel="150">
                    </ColorModel>
                    <Legend FormatString="&lt;ITEM_LABEL&gt;">
                        <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
                    </Legend>
                    <Axis>
                        <X2 Visible="False">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="" ItemFormatString="" VerticalAlign="Center" Visible="True"
                                HorizontalAlign="Far" ItemFormat="None" Orientation="VerticalLeftFacing">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Far" Orientation="VerticalLeftFacing"
                                    Visible="True" FormatString="">
                                </SeriesLabels>
                            </Labels>
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
                            </MajorGridLines>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
                            </MinorGridLines>
                        </X2>
                        <Z Visible="True">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="&lt;SERIES_LABEL&gt;" ItemFormatString="" VerticalAlign="Center"
                                Visible="True" HorizontalAlign="Far" ItemFormat="None" Orientation="Horizontal">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Far" Orientation="Horizontal"
                                    Visible="True" FormatString="&lt;SERIES_LABEL&gt;">
                                </SeriesLabels>
                            </Labels>
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
                            </MajorGridLines>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
                            </MinorGridLines>
                        </Z>
                        <Z2 Visible="True">
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
                        <X Visible="True" LineThickness="1" Extent="20">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="" ItemFormatString="&lt;ITEM_LABEL&gt;" VerticalAlign="Near"
                                Visible="True" HorizontalAlign="Near" Font="Verdana, 7pt" ItemFormat="ItemLabel"
                                Orientation="VerticalLeftFacing">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Near" Orientation="VerticalLeftFacing"
                                    Visible="True" FormatString="">
                                </SeriesLabels>
                            </Labels>
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
                            </MajorGridLines>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
                            </MinorGridLines>
                        </X>
                        <Y Visible="True" TickmarkInterval="40" LineThickness="1" Extent="20" TickmarkStyle="Smart">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="" ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center"
                                Visible="True" HorizontalAlign="Far" Font="Verdana, 7pt" ItemFormat="DataValue"
                                Orientation="Horizontal">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Far" Orientation="Horizontal"
                                    Visible="True" FormatString="">
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
                            <Labels SeriesFormatString="" ItemFormatString="" VerticalAlign="Center" Visible="True"
                                HorizontalAlign="Near" ItemFormat="None" Orientation="Horizontal">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Near" Orientation="Horizontal"
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
                    <TitleBottom Visible="True" Orientation="Horizontal" HorizontalAlign="Far" Extent="26"
                        Location="Bottom">
                        <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
                    </TitleBottom>
                    <TitleTop Visible="True" Orientation="Horizontal" HorizontalAlign="Near" Extent="33"
                        Location="Top">
                        <Margins Bottom="5" Top="5" Right="5" Left="5"></Margins>
                    </TitleTop>
                    <DeploymentScenario ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png"
                        FilePath="/SamplesBrowser/Temp/ChartImages"></DeploymentScenario>
                </igchart:UltraChart>
            </td>
            <td valign="top">
                <table id="Table2" cellspacing="1" cellpadding="1" border="0">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebCharts, FunnelStyles_Label1 %>"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebCharts, FunnelStyles_Label2 %>"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebCharts, FunnelStyles_Label3 %>"></asp:Label>
                        </td>
                        <td>
                            <ig:WebNumericEditor ID="WebNumericEdit1" runat="server" Width="80px" MaxValue="1"
                                MinValue="0">
                            </ig:WebNumericEditor>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebCharts, FunnelStyles_Label4 %>"></asp:Label>
                        </td>
                        <td>
                            <ig:WebNumericEditor ID="WebNumericEdit2" runat="server" Width="80px" MaxValue="1"
                                MinValue="0">
                            </ig:WebNumericEditor>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:WebCharts, FunnelStyles_Label5 %>"></asp:Label>
                        </td>
                        <td>
                            <ig:WebNumericEditor ID="WebNumericEdit3" runat="server" Width="80px" MaxValue="1"
                                MinValue="0">
                            </ig:WebNumericEditor>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Button ID="Button1" runat="server" Text="<%$ Resources:WebCharts, OthersCategoryDisplay_Label3 %>">
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
