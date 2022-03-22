<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Style_Basic_Annotations_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <p>
        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:WebCharts, BasicAnnotations_Description1 %>"></asp:Label>
    </p>
    <ul style="font-size: 12px; color: #656565; list-style-position: inside;">
        <li>
            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebCharts, BasicAnnotations_Description2 %>"></asp:Label>
        </li>
        <li>
            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebCharts, BasicAnnotations_Description3 %>"></asp:Label>
        </li>
        <li>
            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebCharts, BasicAnnotations_Description4 %>"></asp:Label>
        </li>
        <li>
            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebCharts, BasicAnnotations_Description5 %>"></asp:Label>
        </li>
    </ul>
    <p>
    </p>
    <p>
        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:WebCharts, BasicAnnotations_Description6 %>"></asp:Label>
    </p>
    <table id="Table1" cellspacing="1" cellpadding="3" border="0">
        <tr>
            <td>
                <igchart:UltraChart ID="UltraChart1" runat="server" EmptyChartText="Data Not Available. Please call UltraChart.Data.DataBind() after setting valid Data.DataSource"
                    ForeColor="Black" ChartType="BubbleChart" BackColor="White" EnableCrossHair="False"
                    Version="5.3" Width="400px" Height="300px">
                    <Border CornerRadius="5"></Border>
                    <BubbleChart ColumnX="0" SortByRadius="None" ColumnY="1" ColumnZ="2" NullHandling="Zero"
                        BubbleShape="Circle" ColorCueColumn="-1">
                    </BubbleChart>
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
                        <Skin>
                            <PEs>
                                <igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" ElementType="Gradient"
                                    Fill="108, 162, 36" FillStopColor="148, 244, 17" StrokeWidth="0"></igchartprop:PaintElement>
                                <igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" ElementType="Gradient"
                                    Fill="7, 108, 176" FillStopColor="53, 200, 255" StrokeWidth="0"></igchartprop:PaintElement>
                                <igchartprop:PaintElement FillGradientStyle="Horizontal" FillOpacity="255" ElementType="Gradient"
                                    Fill="230, 190, 2" FillStopColor="255, 255, 81" StrokeWidth="0"></igchartprop:PaintElement>
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
                    <Axis>
                        <X2 Visible="False">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="" ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center"
                                Visible="True" HorizontalAlign="Far" ItemFormat="DataValue" Orientation="VerticalLeftFacing">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Far" Orientation="VerticalLeftFacing"
                                    Visible="True" FormatString="">
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
                        <X Visible="True" TickmarkInterval="10" Extent="60" TickmarkStyle="Smart">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="" ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center"
                                Visible="True" HorizontalAlign="Near" ItemFormat="DataValue" Orientation="VerticalLeftFacing">
                                <SeriesLabels VerticalAlign="Center" HorizontalAlign="Center" Orientation="VerticalLeftFacing"
                                    Visible="True" FormatString="">
                                </SeriesLabels>
                            </Labels>
                            <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
                            </MajorGridLines>
                            <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
                            </MinorGridLines>
                        </X>
                        <Y Visible="True" TickmarkInterval="10" Extent="20" TickmarkStyle="Smart">
                            <StripLines>
                                <PE FillOpacity="255" Fill="Transparent"></PE>
                            </StripLines>
                            <ScrollScale Scale="1" Scroll="0"></ScrollScale>
                            <Labels SeriesFormatString="" ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center"
                                Visible="True" HorizontalAlign="Far" ItemFormat="DataValue" Orientation="Horizontal">
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
                            <Labels SeriesFormatString="" ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center"
                                Visible="True" HorizontalAlign="Near" ItemFormat="DataValue" Orientation="Horizontal">
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
                    <DeploymentScenario ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png" FilePath="/SamplesBrowser/Temp/ChartImages">
                    </DeploymentScenario>
                    <Annotations>
                        <Annotations>
                            <igchartprop:LineAnnotation Color="Black" Style-MidPointAnchors="True" Style-EndStyle="Flat"
                                Style-StartStyle="ArrowAnchor" OffsetMode="Manual" Thickness="2">
                                <offset type="Pixels" locationx="380" row="0" column="0" valuey="0" valuex="0" locationy="20"></offset>
                                <location type="Pixels" locationx="330" row="0" column="0" valuey="0" valuex="0"
                                    locationy="55"></location>
                            </igchartprop:LineAnnotation>
                            <igchartprop:EllipseAnnotation Text="<%$ Resources:WebCharts, BasicAnnotations_Description4 %>"
                                Height="25" OutlineDrawStyle="Solid">
                                <textstyle font="Microsoft Sans Serif, 7.8pt" dx="0" horizontalalign="Center" fontsizebestfit="False"
                                    cliptext="True" rotationangle="0" orientation="Horizontal" wraptext="False" flip="False"
                                    fontcolor="DarkOrchid" verticalalign="Center" dy="0"></textstyle>
                                <location type="DataValues" locationx="0" row="0" column="0" valuey="-50" valuex="2"
                                    locationy="0"></location>
                                <pe fillopacity="255" fill="Moccasin" strokewidth="3"></pe>
                            </igchartprop:EllipseAnnotation>
                            <igchartprop:CalloutAnnotation Text="<%$ Resources:WebCharts, BasicAnnotations_Description3 %>"
                                Height="25" OffsetMode="Manual" Width="-1">
                                <border cornerradius="3"></border>
                                <offset type="Pixels" locationx="110" row="0" column="0" valuey="0" valuex="0" locationy="30"></offset>
                                <textstyle font="Microsoft Sans Serif, 7.8pt" dx="0" horizontalalign="Center" fontsizebestfit="False"
                                    cliptext="True" rotationangle="0" orientation="Horizontal" wraptext="False" flip="True"
                                    fontcolor="Black" verticalalign="Center" dy="0"></textstyle>
                                <location type="Pixels" locationx="224" row="0" column="0" valuey="0" valuex="0"
                                    locationy="87"></location>
                                <pe fillopacity="255" fill="White"></pe>
                            </igchartprop:CalloutAnnotation>
                            <igchartprop:BoxAnnotation Text="<%$ Resources:WebCharts, BasicAnnotations_Description2 %>"
                                Height="-1" Width="-1">
                                <textstyle font="Microsoft Sans Serif, 7.8pt" dx="0" horizontalalign="Center" fontsizebestfit="False"
                                    cliptext="True" rotationangle="0" orientation="Horizontal" wraptext="False" flip="False"
                                    fontcolor="Black" verticalalign="Center" dy="0"></textstyle>
                                <location type="Percentage" locationx="80" row="0" column="0" valuey="0" valuex="0"
                                    locationy="50"></location>
                                <pe fillopacity="255" fill="WhiteSmoke"></pe>
                            </igchartprop:BoxAnnotation>
                        </Annotations>
                    </Annotations>
                </igchart:UltraChart>
            </td>
            <td valign="top">
            <div>
                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:WebCharts, BasicAnnotations_Label1 %>"></asp:Label>
                </div>
                <div style="margin-top: 10px;">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="<%$ Resources:WebCharts, BasicAnnotations_Label2 %>">
                    </asp:CheckBox>
                </div>
                <div>
                    <asp:CheckBox ID="CheckBox2" runat="server" Text="<%$ Resources:WebCharts, BasicAnnotations_Label3 %>">
                    </asp:CheckBox>
                </div>
                <div>
                    <asp:CheckBox ID="CheckBox3" runat="server" Text="<%$ Resources:WebCharts, BasicAnnotations_Label4 %>">
                    </asp:CheckBox>
                </div>
                <div>
                    <asp:CheckBox ID="CheckBox4" runat="server" Text="<%$ Resources:WebCharts, BasicAnnotations_Label5 %>">
                    </asp:CheckBox>
                </div>
                <div style="margin-left: 80px; margin-top: 10px;">
                    <asp:Button ID="Button1" runat="server" Text="<%$ Resources:WebCharts, BasicAnnotations_Label6 %>">
                    </asp:Button>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
