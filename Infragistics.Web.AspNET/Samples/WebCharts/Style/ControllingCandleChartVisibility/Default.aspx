<%@ Page language="c#" MasterPageFile="~/SamplePage.master" CodeFile="Default.aspx.cs" AutoEventWireup="false" Inherits="Samples_WebCharts_Style_Controlling_Candle_Chart_Visibility_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
	<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1" />
	<meta name="vs_defaultClientScript" content="JavaScript" />
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <TABLE id="Table1" cellSpacing="1" cellPadding="3" border="0">
	    <TR>
		    <TD>
		    <igchart:UltraChart id="UltraChart1" runat="server" BackColor="White" EmptyChartText="Data Not Available. Please call UltraChart.Data.DataBind() after setting valid Data.DataSource" ForeColor="Black" ChartType="CandleChart" EnableCrossHair="False" Version="5.3">
				    <ColorModel AlphaLevel="255" />
				    <Axis BackColor="Cornsilk">
					    <X LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black" RangeType="Automatic" TickmarkInterval="0" LineThickness="1" Extent="80" LogBase="10" RangeMax="0" TickmarkStyle="Percentage" TickmarkPercentage="10" NumericAxisType="Linear">
						    <StripLines Interval="2" Visible="False">
							    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill" Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal"></PE>
						    </StripLines>
						    <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
						    <Labels ItemFormatString="<ITEM_LABEL:d>" VerticalAlign="Center" Font="Verdana, 7pt" FontColor="Black" Orientation="VerticalLeftFacing" Visible="True" HorizontalAlign="Near" />
						    <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
						    <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
						    <TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
						    <Margin>
							    <Far MarginType="Percentage" Value="0"></Far>
							    <Near MarginType="Percentage" Value="0"></Near>
						    </Margin>
					    </X>
					    <Y LineEndCapStyle="NoAnchor" LineDrawStyle="Solid" Visible="True" RangeMin="0" LineColor="Black" RangeType="Automatic" TickmarkInterval="0.5" LineThickness="1" Extent="80" LogBase="10" RangeMax="0" TickmarkStyle="Smart" TickmarkPercentage="10" NumericAxisType="Linear">
						    <StripLines Interval="2" Visible="False">
							    <PE FillGradientStyle="None" FillOpacity="255" FillStopOpacity="255" ElementType="SolidFill" Fill="Transparent" Hatch="None" Texture="LightGrain" ImageFitStyle="StretchedFit" FillStopColor="Transparent" StrokeOpacity="255" ImagePath="" Stroke="Black" StrokeWidth="1" ImageWrapMode="Tile" TextureApplication="Normal"></PE>
						    </StripLines>
						    <ScrollScale Scale="1" Scroll="0" Height="10" Width="15" Visible="False"></ScrollScale>
						    <Labels ItemFormatString="&lt;DATA_VALUE:00.##&gt;" VerticalAlign="Center" WrapText="False" FontSizeBestFit="False" SeriesFormatString="" ClipText="True" Font="Verdana, 7pt" Flip="False" ItemFormat="DataValue" FontColor="Black" Orientation="Horizontal" Visible="True" OrientationAngle="0" HorizontalAlign="Far">
							    <SeriesLabels Font="Microsoft Sans Serif, 7.8pt" Visible="True" HorizontalAlign="Far" FontSizeBestFit="False" ClipText="True" FormatString="" Orientation="Horizontal" WrapText="False" Flip="False" FontColor="Black" VerticalAlign="Center" OrientationAngle="0"></SeriesLabels>
						    </Labels>
						    <MajorGridLines AlphaLevel="255" DrawStyle="Dot" Color="Gainsboro" Visible="True" Thickness="1"></MajorGridLines>
						    <MinorGridLines AlphaLevel="255" DrawStyle="Dot" Color="LightGray" Visible="False" Thickness="1"></MinorGridLines>
						    <TimeAxisStyle TimeAxisStyle="Continuous"></TimeAxisStyle>
						    <Margin>
							    <Far MarginType="Percentage" Value="0"></Far>
							    <Near MarginType="Percentage" Value="0"></Near>
						    </Margin>
					    </Y>
					    <Y2 Visible="False" />
					    <X2 Visible="False" />
				    </Axis>
				    <DeploymentScenario Scenario="FileSystem" ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png" ImageType="Png" FilePath="/SamplesBrowser/Temp/ChartImages"></DeploymentScenario>
				    <CandleChart WickColor="60, 60, 60" VolumeColor="Gainsboro" OpenCloseVisible="True" NegativeRangeColor="7, 108, 176" SkipN="0" VolumeVisible="False" HighLowVisible="True" WickThickness="1" PositiveRangeColor="108, 162, 36"></CandleChart>
				    <Tooltips BorderThickness="1" Overflow="None" FormatString="&lt;DATA_VALUE:00.##&gt;" EnableFadingEffect="False" Format="DataValue" FontColor="Black" BorderColor="Black" Display="MouseMove" BackColor="AntiqueWhite" Padding="0"></Tooltips>
			    </igchart:UltraChart></TD>
		    <TD vAlign="top">
			    <TABLE id="Table2" cellSpacing="1" cellPadding="1" border="0">
				    <TR>
					    <TD>
						    <asp:CheckBox id="CheckBox1" runat="server" Text="<%$ Resources:WebCharts, CandleChartVisibility_Label1 %>" AutoPostBack="True"></asp:CheckBox></TD>
				    </TR>
				    <TR>
					    <TD>
						    <asp:CheckBox id="CheckBox2" runat="server" Text="<%$ Resources:WebCharts, CandleChartVisibility_Label2 %>" AutoPostBack="True"></asp:CheckBox></TD>
				    </TR>
				    <TR>
					    <TD>
						    <asp:CheckBox id="CheckBox3" runat="server" Text="<%$ Resources:WebCharts, CandleChartVisibility_Label3 %>" AutoPostBack="True"></asp:CheckBox></TD>
				    </TR>
				    <TR>
					    <TD></TD>
				    </TR>
			    </TABLE>
		    </TD>
	    </TR>
    </TABLE>
</asp:Content>
