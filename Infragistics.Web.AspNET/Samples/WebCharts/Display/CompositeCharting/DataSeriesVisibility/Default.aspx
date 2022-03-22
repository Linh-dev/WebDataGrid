<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="false"
	CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_Composite_Charting_Data_Series_Visibility_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<table id="Table2" cellspacing="1" cellpadding="3" border="0">
		<tr>
			<td>
				<p>
                    <div style="width:446px;height:390px">
					<asp:UpdatePanel runat="server">
						<Triggers>
							<asp:AsyncPostBackTrigger ControlID="chkSeriesA" />
							<asp:AsyncPostBackTrigger ControlID="chkSeriesB" />
							<asp:AsyncPostBackTrigger ControlID="chkSeriesC" />
							<asp:AsyncPostBackTrigger ControlID="chkSeriesD" />
						</Triggers>
						<ContentTemplate>
							<igchart:UltraChart ID="UltraChart1" runat="server" Version="6.3" ChartType="Composite">
								<CompositeChart>
									<Series>
										<igchartprop:NumericSeries Label="Yahoo" Key="SeriesA">
											<points>
								<igchartprop:NumericDataPoint Label="Q1" Value="1" DataBound="False">
									<PE FillOpacity="255" ElementType="None" Fill="Transparent"></PE>
								</igchartprop:NumericDataPoint>
								<igchartprop:NumericDataPoint Label="Q2" Value="4" DataBound="False">
									<PE FillOpacity="255" ElementType="None" Fill="Transparent"></PE>
								</igchartprop:NumericDataPoint>
								<igchartprop:NumericDataPoint Label="Q3" Value="10" DataBound="False">
									<PE FillOpacity="255" ElementType="None" Fill="Transparent"></PE>
								</igchartprop:NumericDataPoint>
								<igchartprop:NumericDataPoint Label="Q4" Value="4" DataBound="False">
									<PE FillOpacity="255" ElementType="None" Fill="Transparent"></PE>
								</igchartprop:NumericDataPoint>
							</points>
										</igchartprop:NumericSeries>
										<igchartprop:NumericSeries Label="Google" Key="SeriesB">
											<points>
								<igchartprop:NumericDataPoint Label="Q1" Value="3" DataBound="False">
									<PE FillOpacity="255" ElementType="None" Fill="Transparent"></PE>
								</igchartprop:NumericDataPoint>
								<igchartprop:NumericDataPoint Label="Q2" Value="6" DataBound="False">
									<PE FillOpacity="255" ElementType="None" Fill="Transparent"></PE>
								</igchartprop:NumericDataPoint>
								<igchartprop:NumericDataPoint Label="Q3" Value="4" DataBound="False">
									<PE FillOpacity="255" ElementType="None" Fill="Transparent"></PE>
								</igchartprop:NumericDataPoint>
								<igchartprop:NumericDataPoint Label="Q4" Value="5" DataBound="False">
									<PE FillOpacity="255" ElementType="None" Fill="Transparent"></PE>
								</igchartprop:NumericDataPoint>
							</points>
										</igchartprop:NumericSeries>
										<igchartprop:NumericSeries Label="Microsoft" Key="SeriesC">
											<points>
								<igchartprop:NumericDataPoint Label="Q1" Value="5" DataBound="False">
									<PE FillOpacity="255" ElementType="None" Fill="Transparent"></PE>
								</igchartprop:NumericDataPoint>
								<igchartprop:NumericDataPoint Label="Q2" Value="8" DataBound="False">
									<PE FillOpacity="255" ElementType="None" Fill="Transparent"></PE>
								</igchartprop:NumericDataPoint>
								<igchartprop:NumericDataPoint Label="Q3" Value="6" DataBound="False">
									<PE FillOpacity="255" ElementType="None" Fill="Transparent"></PE>
								</igchartprop:NumericDataPoint>
								<igchartprop:NumericDataPoint Label="Q4" Value="7" DataBound="False">
									<PE FillOpacity="255" ElementType="None" Fill="Transparent"></PE>
								</igchartprop:NumericDataPoint>
							</points>
										</igchartprop:NumericSeries>
										<igchartprop:NumericSeries Label="Dell" Key="SeriesD">
											<points>
								<igchartprop:NumericDataPoint Label="Q1" Value="7" DataBound="False">
									<PE FillOpacity="255" ElementType="None" Fill="Transparent"></PE>
								</igchartprop:NumericDataPoint>
								<igchartprop:NumericDataPoint Label="Q2" Value="10" DataBound="False">
									<PE FillOpacity="255" ElementType="None" Fill="Transparent"></PE>
								</igchartprop:NumericDataPoint>
								<igchartprop:NumericDataPoint Label="Q3" Value="7" DataBound="False">
									<PE FillOpacity="255" ElementType="None" Fill="Transparent"></PE>
								</igchartprop:NumericDataPoint>
								<igchartprop:NumericDataPoint Label="Q4" Value="7" DataBound="False">
									<PE FillOpacity="255" ElementType="None" Fill="Transparent"></PE>
								</igchartprop:NumericDataPoint>
							</points>
										</igchartprop:NumericSeries>
									</Series>
									<ChartLayers>
										<igchartprop:ChartLayerAppearance ChartAreaKey="area1" Key="chartLayer1" ChartType="ColumnChart"
											AxisXKey="axisX" AxisYKey="axisY" SeriesList="SeriesA|SeriesB|SeriesC|SeriesD"
											AxisY2Key="">
											<ChartTypeAppearances>
												<igchartprop:ColumnChartAppearance SeriesSpacing="1" ColumnSpacing="0" NullHandling="Zero">
												</igchartprop:ColumnChartAppearance>
											</ChartTypeAppearances>
										</igchartprop:ChartLayerAppearance>
									</ChartLayers>
									<ChartAreas>
										<igchartprop:ChartArea Visible="True" Key="area1" BoundsMeasureType="Percentage"
											Bounds="0, 0, 100, 100">
											<Axes>
												<igchartprop:AxisItem DataType="String" Key="axisX" LineThickness="1" OrientationType="X_Axis"
													Extent="65" SetLabelAxisType="GroupBySeries">
													<ScrollScale Scale="1" Scroll="0"></ScrollScale>
													<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
													</MinorGridLines>
													<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
													</MajorGridLines>
													<Labels SeriesFormatString="&lt;SERIES_LABEL&gt;" ItemFormatString="&lt;ITEM_LABEL&gt;"
														VerticalAlign="Center" Visible="True" HorizontalAlign="Near" ItemFormat="ItemLabel"
														Orientation="VerticalLeftFacing">
														<SeriesLabels VerticalAlign="Center" HorizontalAlign="Center" Orientation="Horizontal"
															Visible="True" FormatString="&lt;SERIES_LABEL&gt;">
														</SeriesLabels>
													</Labels>
													<StripLines>
														<PE FillOpacity="255" Fill="Transparent"></PE>
													</StripLines>
												</igchartprop:AxisItem>
												<igchartprop:AxisItem DataType="Numeric" Key="axisY" TickmarkInterval="1" LineThickness="1"
													OrientationType="Y_Axis" Extent="20" SetLabelAxisType="GroupBySeries" TickmarkStyle="Smart">
													<ScrollScale Scale="1" Scroll="0"></ScrollScale>
													<MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False">
													</MinorGridLines>
													<MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True">
													</MajorGridLines>
													<Labels SeriesFormatString="&lt;SERIES_LABEL&gt;" ItemFormatString="&lt;DATA_VALUE:00.##&gt;"
														VerticalAlign="Center" Visible="True" HorizontalAlign="Near" ItemFormat="DataValue"
														Orientation="Horizontal">
														<SeriesLabels VerticalAlign="Center" HorizontalAlign="Center" Orientation="Horizontal"
															Visible="True" FormatString="&lt;SERIES_LABEL&gt;">
														</SeriesLabels>
													</Labels>
													<StripLines>
														<PE FillOpacity="255" Fill="Transparent"></PE>
													</StripLines>
												</igchartprop:AxisItem>
											</Axes>
											<PE FillOpacity="255" Fill="Transparent"></PE>
										</igchartprop:ChartArea>
									</ChartAreas>
								</CompositeChart>
								<Data>
									<EmptyStyle>
										<PointPE FillOpacity="255" Fill="Transparent"></PointPE>
										<PE FillOpacity="255" Fill="Transparent"></PE>
									</EmptyStyle>
								</Data>
								<TitleLeft Visible="False" Orientation="VerticalLeftFacing" HorizontalAlign="Near"
									Extent="26" Location="Left">
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
										<Labels SeriesFormatString="&lt;SERIES_LABEL&gt;" ItemFormatString="" VerticalAlign="Center"
											Visible="True" HorizontalAlign="Near" Font="Verdana, 7pt" ItemFormat="None" FontColor="DimGray"
											Orientation="Horizontal">
											<SeriesLabels VerticalAlign="Center" HorizontalAlign="Near" Font="Verdana, 7pt" FontColor="DimGray"
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
									<Y Visible="True" TickmarkInterval="20" LineThickness="1" TickmarkStyle="Smart">
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
									<Y2 Visible="False" TickmarkInterval="20" LineThickness="1" TickmarkStyle="Smart">
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
								<DeploymentScenario Scenario="FileSystem" ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).jpg"
									ImageType="Jpeg" FilePath="/SamplesBrowser/Temp/ChartImages"></DeploymentScenario>
							</igchart:UltraChart>
						</ContentTemplate>
					</asp:UpdatePanel>
                    </div>
				</p>
			</td>
			<td valign="top">
				<table id="Table1" cellspacing="1" cellpadding="1" border="0" style="font-family: Segoe UI,Verdana;
					font-size: 13px; line-height: 18px;">
					<tr>
						<td colspan="2">
							<asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebCharts, DataSeriesVisibility_Label1%>"></asp:Label><br />
							<br />
						</td>
					</tr>
					<tr>
						<td style="height: 15px">
							<p>
								<asp:CheckBox ID="chkSeriesA" runat="server" Text="<%$ Resources:WebCharts, DataSeriesVisibility_Label2  %>"
									AutoPostBack="True"></asp:CheckBox></p>
						</td>
					</tr>
					<tr>
						<td style="height: 15px">
							<p>
								<asp:CheckBox ID="chkSeriesB" runat="server" Text="<%$ Resources:WebCharts, DataSeriesVisibility_Label3  %>"
									AutoPostBack="True"></asp:CheckBox></p>
						</td>
					</tr>
					<tr>
						<td style="height: 15px">
							<p>
								<asp:CheckBox ID="chkSeriesC" runat="server" Text="<%$ Resources:WebCharts, DataSeriesVisibility_Label4  %>"
									AutoPostBack="True"></asp:CheckBox></p>
						</td>
					</tr>
					<tr>
						<td style="height: 15px">
							<p>
								<asp:CheckBox ID="chkSeriesD" runat="server" Text="<%$ Resources:WebCharts, DataSeriesVisibility_Label5  %>"
									AutoPostBack="True"></asp:CheckBox></p>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
