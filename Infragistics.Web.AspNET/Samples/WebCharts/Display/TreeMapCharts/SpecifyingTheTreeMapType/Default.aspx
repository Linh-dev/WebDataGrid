<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_TreeMap_Charts_Specifying_The_TreeMap_Type_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div>
    <br style="clear: both;" />
    <br style="clear: both;" />
    <div id="chooserDIV" >
	    <asp:Label ID="Label1" Text="<%$ Resources:WebCharts,TreeMapTypes_TreeMapType %>" runat="server" />
	    <asp:DropDownList ID="TreeMapTypeComboBox" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
		<asp:ListItem Text="<%$ Resources:WebCharts,TreeMapTypes_ChooseOne %>" Value="" />
		<asp:ListItem Text="Rectangular" Value="Rectangular" />
		<asp:ListItem Text="Circular" Value="Circular" />
		<asp:ListItem Text="Rings" Value="Rings" />
	    </asp:DropDownList>
    </div>
    <br style="clear: both;" />
    
	<igchart:UltraChart ID="UltraChart1" runat="server"  
		    ChartType="TreeMapChart"
		    EmptyChartText="<%$ Resources:WebCharts,TreeMapTypes_EmptyChartText %>" 
		    Version="8.2" 
		    BackgroundImageFileName="">
		<TreeMapChart>
			<LabelStyle Font="Microsoft Sans Serif, 7.8pt" FontColor="#FFFFFF" VerticalAlign="Near" />
			<StaticLeafPE ElementType="Gradient" Fill="Silver" 
				FillGradientStyle="HorizontalBump" FillStopColor="Gold" />
		</TreeMapChart>
		<ColorModel AlphaLevel="150" ColorBegin="Pink" ColorEnd="DarkRed" 
			ModelStyle="CustomLinear">
		</ColorModel>
		<Effects>
			<Effects>
				<igchart:GradientEffect />
			</Effects>
		</Effects>
		<Axis>
			<PE ElementType="None" Fill="Cornsilk" />
			<X LineThickness="1" TickmarkInterval="0" TickmarkStyle="Smart" Visible="False">
				<MajorGridLines AlphaLevel="255" Color="Gainsboro" DrawStyle="Dot" 
					Thickness="1" Visible="True" />
				<MinorGridLines AlphaLevel="255" Color="LightGray" DrawStyle="Dot" 
					Thickness="1" Visible="False" />
				<Labels Font="Verdana, 7pt" FontColor="DimGray" HorizontalAlign="Near" 
					ItemFormatString="" Orientation="Horizontal" VerticalAlign="Center" 
					Visible="False">
					<SeriesLabels Font="Verdana, 7pt" FontColor="DimGray" FormatString="" 
						HorizontalAlign="Near" Orientation="Horizontal" VerticalAlign="Center">
						<Layout Behavior="Auto">
						</Layout>
					</SeriesLabels>
					<Layout Behavior="Auto">
					</Layout>
				</Labels>
			</X>
			<Y LineThickness="1" TickmarkInterval="10" TickmarkStyle="Smart" 
				Visible="False">
				<MajorGridLines AlphaLevel="255" Color="Gainsboro" DrawStyle="Dot" 
					Thickness="1" Visible="True" />
				<MinorGridLines AlphaLevel="255" Color="LightGray" DrawStyle="Dot" 
					Thickness="1" Visible="False" />
				<Labels Font="Verdana, 7pt" FontColor="DimGray" HorizontalAlign="Near" 
					ItemFormatString="" Orientation="Horizontal" VerticalAlign="Center" 
					Visible="False">
					<SeriesLabels Font="Verdana, 7pt" FontColor="DimGray" FormatString="" 
						HorizontalAlign="Near" Orientation="Horizontal" VerticalAlign="Center">
						<Layout Behavior="Auto">
						</Layout>
					</SeriesLabels>
					<Layout Behavior="Auto">
					</Layout>
				</Labels>
			</Y>
			<Y2 LineThickness="1" TickmarkInterval="10" TickmarkStyle="Smart" 
				Visible="False">
				<MajorGridLines AlphaLevel="255" Color="Gainsboro" DrawStyle="Dot" 
					Thickness="1" Visible="True" />
				<MinorGridLines AlphaLevel="255" Color="LightGray" DrawStyle="Dot" 
					Thickness="1" Visible="False" />
				<Labels Font="Verdana, 7pt" FontColor="Gray" HorizontalAlign="Near" 
					ItemFormatString="" Orientation="Horizontal" VerticalAlign="Center" 
					Visible="False">
					<SeriesLabels Font="Verdana, 7pt" FontColor="Gray" FormatString="" 
						HorizontalAlign="Near" Orientation="Horizontal" VerticalAlign="Center">
						<Layout Behavior="Auto">
						</Layout>
					</SeriesLabels>
					<Layout Behavior="Auto">
					</Layout>
				</Labels>
			</Y2>
			<X2 LineThickness="1" TickmarkInterval="0" TickmarkStyle="Smart" 
				Visible="False">
				<MajorGridLines AlphaLevel="255" Color="Gainsboro" DrawStyle="Dot" 
					Thickness="1" Visible="True" />
				<MinorGridLines AlphaLevel="255" Color="LightGray" DrawStyle="Dot" 
					Thickness="1" Visible="False" />
				<Labels Font="Verdana, 7pt" FontColor="Gray" HorizontalAlign="Near" 
					ItemFormatString="" Orientation="Horizontal" VerticalAlign="Center" 
					Visible="False">
					<SeriesLabels Font="Verdana, 7pt" FontColor="Gray" FormatString="" 
						HorizontalAlign="Near" Orientation="Horizontal" VerticalAlign="Center">
						<Layout Behavior="Auto">
						</Layout>
					</SeriesLabels>
					<Layout Behavior="Auto">
					</Layout>
				</Labels>
			</X2>
			<Z LineThickness="1" TickmarkInterval="0" TickmarkStyle="Smart" Visible="False">
				<MajorGridLines AlphaLevel="255" Color="Gainsboro" DrawStyle="Dot" 
					Thickness="1" Visible="True" />
				<MinorGridLines AlphaLevel="255" Color="LightGray" DrawStyle="Dot" 
					Thickness="1" Visible="False" />
				<Labels Font="Verdana, 7pt" FontColor="DimGray" HorizontalAlign="Near" 
					ItemFormatString="" Orientation="Horizontal" VerticalAlign="Center" 
					Visible="False">
					<SeriesLabels Font="Verdana, 7pt" FontColor="DimGray" HorizontalAlign="Near" 
						Orientation="Horizontal" VerticalAlign="Center">
						<Layout Behavior="Auto">
						</Layout>
					</SeriesLabels>
					<Layout Behavior="Auto">
					</Layout>
				</Labels>
			</Z>
			<Z2 LineThickness="1" TickmarkInterval="0" TickmarkStyle="Smart" 
				Visible="False">
				<MajorGridLines AlphaLevel="255" Color="Gainsboro" DrawStyle="Dot" 
					Thickness="1" Visible="True" />
				<MinorGridLines AlphaLevel="255" Color="LightGray" DrawStyle="Dot" 
					Thickness="1" Visible="False" />
				<Labels Font="Verdana, 7pt" FontColor="Gray" HorizontalAlign="Near" 
					ItemFormatString="" Orientation="Horizontal" VerticalAlign="Center" 
					Visible="False">
					<SeriesLabels Font="Verdana, 7pt" FontColor="Gray" HorizontalAlign="Near" 
						Orientation="Horizontal" VerticalAlign="Center">
						<Layout Behavior="Auto">
						</Layout>
					</SeriesLabels>
					<Layout Behavior="Auto">
					</Layout>
				</Labels>
			</Z2>
		</Axis>
		<Border Color="Transparent" Thickness="0" />
        <DeploymentScenario Scenario="FileSystem" ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png" ImageType="Png" FilePath="/SamplesBrowser/Temp/ChartImages"></DeploymentScenario>
	    </igchart:UltraChart>
    
    
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" Runat="Server">
</asp:Content>

