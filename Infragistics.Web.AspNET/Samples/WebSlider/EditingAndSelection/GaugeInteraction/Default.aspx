<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
  <div style="height: 100%;">
		<br />
		<table style="width: 100%; height: 100%">
			<tr>
				<td valign="top" style="width: 50%">
					<div>
						<iggauge:UltraGauge ID="UltraGauge1" runat="server" BackColor="White" ForeColor="ControlLightLight"
							OnAsyncRefresh="UltraGauge1_AsyncRefresh">
							<Gauges>
								<iggaugeprop:RadialGauge MarginString="10, 10, 10, 10, Pixels">
									<OverDial>
										<BrushElements>
											<iggaugeprop:RadialGradientBrushElement FocusScalesString="0.5, 0" CenterPointString="50, -10"
												SurroundColor="Transparent" CenterColor="100, 255, 255, 255" RelativeBoundsMeasure="Percent"
												RelativeBounds="17, 12, 70, 50"></iggaugeprop:RadialGradientBrushElement>
										</BrushElements>
									</OverDial>
									<Scales>
										<iggaugeprop:RadialGaugeScale EndAngle="405" StartAngle="135">
											<MinorTickmarks EndWidth="1" EndExtent="52" Frequency="5" StartExtent="58">
												<BrushElements>
													<iggaugeprop:SolidFillBrushElement Color="240, 240, 240"></iggaugeprop:SolidFillBrushElement>
												</BrushElements>
												<StrokeElement>
													<BrushElements>
														<iggaugeprop:SolidFillBrushElement Color="135, 135, 135"></iggaugeprop:SolidFillBrushElement>
													</BrushElements>
												</StrokeElement>
											</MinorTickmarks>
											<Ranges>
												<iggaugeprop:RadialGaugeRange InnerExtentStart="50" InnerExtentEnd="50" OuterExtent="60">
													<BrushElements>
														<iggaugeprop:SolidFillBrushElement Color="20, 255, 255, 255"></iggaugeprop:SolidFillBrushElement>
													</BrushElements>
													<Shadow>
														<BrushElements>
															<iggaugeprop:SolidFillBrushElement></iggaugeprop:SolidFillBrushElement>
														</BrushElements>
													</Shadow>
												</iggaugeprop:RadialGaugeRange>
											</Ranges>
											<Markers>
												<iggaugeprop:RadialGaugeNeedle MidWidth="8" EndWidth="1" MidExtent="0" EndExtent="50"
													StartWidth="8">
													<Anchor Radius="6">
														<BrushElements>
															<iggaugeprop:SimpleGradientBrushElement EndColor="64, 64, 64" StartColor="Gainsboro"
																GradientStyle="BackwardDiagonal"></iggaugeprop:SimpleGradientBrushElement>
														</BrushElements>
														<StrokeElement Thickness="2">
															<BrushElements>
																<iggaugeprop:RadialGradientBrushElement CenterPointString="75, 25" SurroundColor="Gray"
																	CenterColor="WhiteSmoke"></iggaugeprop:RadialGradientBrushElement>
															</BrushElements>
														</StrokeElement>
													</Anchor>
													<BrushElements>
														<iggaugeprop:SolidFillBrushElement Color="255, 61, 22"></iggaugeprop:SolidFillBrushElement>
													</BrushElements>
													<StrokeElement Thickness="0">
													</StrokeElement>
												</iggaugeprop:RadialGaugeNeedle>
											</Markers>
											<Axes>
												<iggaugeprop:NumericAxis EndValue="100"></iggaugeprop:NumericAxis>
											</Axes>
											<MajorTickmarks EndWidth="3" EndExtent="60" Frequency="10" StartExtent="50" StartWidth="3">
												<BrushElements>
													<iggaugeprop:SolidFillBrushElement Color="189, 189, 189"></iggaugeprop:SolidFillBrushElement>
												</BrushElements>
											</MajorTickmarks>
											<Labels Orientation="Horizontal" Frequency="20" Extent="70" Font="Arial, 8pt, style=Bold">
												<BrushElements>
													<iggaugeprop:SolidFillBrushElement Color="White"></iggaugeprop:SolidFillBrushElement>
												</BrushElements>
											</Labels>
										</iggaugeprop:RadialGaugeScale>
									</Scales>
									<Dial>
										<BrushElements>
											<iggaugeprop:BrushElementGroup>
												<BrushElements>
													<iggaugeprop:MultiStopRadialGradientBrushElement FocusScalesString="0.8, 0.8" CenterPointString="50, 50">
														<ColorStops>
															<iggaugeprop:ColorStop Color="161, 161, 161"></iggaugeprop:ColorStop>
															<iggaugeprop:ColorStop Color="96, 96, 96" Stop="0.4758621"></iggaugeprop:ColorStop>
															<iggaugeprop:ColorStop Color="89, 89, 89" Stop="1"></iggaugeprop:ColorStop>
														</ColorStops>
													</iggaugeprop:MultiStopRadialGradientBrushElement>
													<iggaugeprop:SolidFillBrushElement Color="Gray" RelativeBoundsMeasure="Percent" RelativeBounds="4, 4, 93, 93">
													</iggaugeprop:SolidFillBrushElement>
													<iggaugeprop:MultiStopRadialGradientBrushElement CenterPointString="50, 50" RelativeBoundsMeasure="Percent"
														RelativeBounds="4, 4, 93, 93">
														<ColorStops>
															<iggaugeprop:ColorStop Color="Transparent"></iggaugeprop:ColorStop>
															<iggaugeprop:ColorStop Color="141, 141, 141" Stop="0.06206897"></iggaugeprop:ColorStop>
															<iggaugeprop:ColorStop Color="82, 82, 82" Stop="0.07586207"></iggaugeprop:ColorStop>
															<iggaugeprop:ColorStop Color="45, 45, 45" Stop="0.1448276"></iggaugeprop:ColorStop>
															<iggaugeprop:ColorStop Color="30, 30, 30" Stop="0.2448276"></iggaugeprop:ColorStop>
															<iggaugeprop:ColorStop Color="60, 60, 60" Stop="1"></iggaugeprop:ColorStop>
														</ColorStops>
													</iggaugeprop:MultiStopRadialGradientBrushElement>
												</BrushElements>
											</iggaugeprop:BrushElementGroup>
										</BrushElements>
										<StrokeElement>
											<BrushElements>
												<iggaugeprop:SolidFillBrushElement Color="Silver"></iggaugeprop:SolidFillBrushElement>
											</BrushElements>
										</StrokeElement>
									</Dial>
								</iggaugeprop:RadialGauge>
							</Gauges>
							<%--<ClientSideEvents Click="UltraGauge1_Click" />--%>
							<DeploymentScenario FilePath="/SamplesBrowser/Temp/GaugeImages" ImageURL="/SamplesBrowser/Temp/GaugeImages/Gauge_#SEQNUM(100).#EXT" />
						</iggauge:UltraGauge>
					</div>
					<asp:Label ID="Label1" runat="server">
						<asp:Label ID="GaugeValue" runat="server" Text="<%$ Resources:WebSlider, Gauge_GaugeValue %>"></asp:Label>
					</asp:Label><br />
					<ig:WebSlider ID="WebSlider1" runat="server" Width="500px" ValueAsString="1" MinValueAsString="1"
						MaxValueAsString="100" SnapToSmallChange="true" SmallChangeAsString="5" ContentAlignment="Center"
						Tickmarks-NumberOfMinorTickmarks="10" Tickmarks-NumberOfMajorTickmarks="10" ValueType="Int"
						OnValueChanged="slider_valuechanged" ShowPlusMinusButtons="False">
						<ClientEvents ValueChanged="valueChanged" />
						<ValueLabel Location="FloatTopOrLeft" />
						<Tickmarks LabelLocation="Both" NumberOfMinorTickmarks="1">
							<CssClasses LabelFirstCssClass="leftLabel" LabelLastCssClass="rightLabel" />
						</Tickmarks>
					</ig:WebSlider>
				</td>
			</tr>
		</table>
	</div>

    <script type="text/javascript">
        function valueChanged(slider, args) {

            var oGauge = ig_getWebControlById("<%= UltraGauge1.ClientID %>");
            oGauge.updateControlState("ValueFromClient", slider.get_value());
            oGauge.refresh();
        }	
	</script>
</asp:Content>