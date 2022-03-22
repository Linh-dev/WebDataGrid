<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript">
        function refreshGauge() {
            var gauge = ig_getWebControlById("UltraGauge1");
            gauge.refresh();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="<%$Resources:WebGauge, Clock_Label1 %>"></asp:Label><asp:DropDownList
            runat="server" ID="intervalPicker" AutoPostBack="true" OnSelectedIndexChanged="intervalPicker_SelectedIndexChanged">
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem Selected="true">1</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label3" runat="server" Text="<%$Resources:WebGauge, Clock_Label2 %>"></asp:Label>
    </div>
    <asp:Button ID="btnRefresh" runat="server" Text="<%$Resources:WebGauge, Clock_Label3 %>" />
    <iggauge:UltraGauge runat="server" ID="UltraGauge1" RefreshInterval="1">
        <DeploymentScenario DeleteOldImages="true" FilePath="/SamplesBrowser/Temp/GaugeImages"
            ImageURL="/SamplesBrowser/Temp/GaugeImages/Gauge_#SEQNUM(100).#EXT" />
        <%-- <DeploymentScenario Mode="Session" />--%>
        <Gauges>
            <iggaugeprop:RadialGauge>
                <OverDial>
                    <BrushElements>
                        <iggaugeprop:BrushElementGroup>
                            <BrushElements>
                                <iggaugeprop:MultiStopRadialGradientBrushElement FocusScalesString="5, 0" CenterPointString="8, 100">
                                    <ColorStops>
                                        <iggaugeprop:ColorStop Color="50, 255, 255, 255"></iggaugeprop:ColorStop>
                                        <iggaugeprop:ColorStop Color="150, 255, 255, 255" Stop="0.3310345"></iggaugeprop:ColorStop>
                                        <iggaugeprop:ColorStop Color="Transparent" Stop="0.3359606"></iggaugeprop:ColorStop>
                                        <iggaugeprop:ColorStop Color="Transparent" Stop="1"></iggaugeprop:ColorStop>
                                    </ColorStops>
                                </iggaugeprop:MultiStopRadialGradientBrushElement>
                            </BrushElements>
                        </iggaugeprop:BrushElementGroup>
                    </BrushElements>
                </OverDial>
                <Scales>
                    <iggaugeprop:RadialGaugeScale EndAngle="990" StartAngle="270">
                        <MinorTickmarks EndWidth="1" EndExtent="83" Frequency="0.2" StartExtent="81">
                            <BrushElements>
                                <iggaugeprop:SolidFillBrushElement Color="240, 240, 240"></iggaugeprop:SolidFillBrushElement>
                            </BrushElements>
                            <StrokeElement>
                                <BrushElements>
                                    <iggaugeprop:SolidFillBrushElement Color="135, 135, 135"></iggaugeprop:SolidFillBrushElement>
                                </BrushElements>
                            </StrokeElement>
                        </MinorTickmarks>
                        <Markers>
                            <iggaugeprop:RadialGaugeNeedle MidWidth="4" EndWidth="1" MidExtent="0" EndExtent="55"
                                StartWidth="4">
                                <Anchor Radius="5">
                                </Anchor>
                                <BrushElements>
                                    <iggaugeprop:SimpleGradientBrushElement EndColor="Silver" StartColor="Black" GradientStyle="BackwardDiagonal">
                                    </iggaugeprop:SimpleGradientBrushElement>
                                </BrushElements>
                                <BackAnchor Radius="5">
                                </BackAnchor>
                                <StrokeElement>
                                    <BrushElements>
                                        <iggaugeprop:SolidFillBrushElement Color="Silver"></iggaugeprop:SolidFillBrushElement>
                                    </BrushElements>
                                </StrokeElement>
                            </iggaugeprop:RadialGaugeNeedle>
                        </Markers>
                        <Axes>
                            <iggaugeprop:TimeAxis StartValue="2007-01-10" EndValue="2007-01-11" TickmarkInterval="01:00:00">
                            </iggaugeprop:TimeAxis>
                        </Axes>
                        <MajorTickmarks EndWidth="5" EndExtent="85" StartExtent="78">
                            <BrushElements>
                                <iggaugeprop:SimpleGradientBrushElement EndColor="DimGray" StartColor="DarkGray"
                                    GradientStyle="BackwardDiagonal"></iggaugeprop:SimpleGradientBrushElement>
                            </BrushElements>
                        </MajorTickmarks>
                        <Labels Orientation="Horizontal" PostInitial="1" Extent="65" FormatString="&lt;DATA_VALUE:h''&gt;"
                            Font="Franklin Gothic Book, 12pt, style=Bold">
                            <BrushElements>
                                <iggaugeprop:SolidFillBrushElement Color="64, 64, 64"></iggaugeprop:SolidFillBrushElement>
                            </BrushElements>
                        </Labels>
                    </iggaugeprop:RadialGaugeScale>
                    <iggaugeprop:RadialGaugeScale EndAngle="630" StartAngle="270">
                        <Markers>
                            <iggaugeprop:RadialGaugeNeedle MidWidth="6" EndWidth="1" MidExtent="10" EndExtent="80"
                                StartWidth="6">
                                <BrushElements>
                                    <iggaugeprop:SimpleGradientBrushElement EndColor="224, 224, 224" StartColor="Black">
                                    </iggaugeprop:SimpleGradientBrushElement>
                                </BrushElements>
                            </iggaugeprop:RadialGaugeNeedle>
                            <iggaugeprop:RadialGaugeNeedle MidWidth="1" EndWidth="1" MidExtent="60" EndExtent="75"
                                StartExtent="-20" StartWidth="1">
                                <Anchor RadiusMeasure="Percent" Radius="5">
                                    <BrushElements>
                                        <iggaugeprop:MultiStopRadialGradientBrushElement CenterPointString="50, 50">
                                            <ColorStops>
                                                <iggaugeprop:ColorStop Color="White"></iggaugeprop:ColorStop>
                                                <iggaugeprop:ColorStop Color="White" Stop="0.7700534"></iggaugeprop:ColorStop>
                                                <iggaugeprop:ColorStop Color="255, 222, 92" Stop="0.7754011"></iggaugeprop:ColorStop>
                                                <iggaugeprop:ColorStop Color="193, 168, 34" Stop="1"></iggaugeprop:ColorStop>
                                            </ColorStops>
                                        </iggaugeprop:MultiStopRadialGradientBrushElement>
                                    </BrushElements>
                                    <StrokeElement Thickness="2">
                                        <BrushElements>
                                            <iggaugeprop:SolidFillBrushElement Color="DimGray"></iggaugeprop:SolidFillBrushElement>
                                        </BrushElements>
                                    </StrokeElement>
                                </Anchor>
                                <BrushElements>
                                    <iggaugeprop:SolidFillBrushElement Color="Silver"></iggaugeprop:SolidFillBrushElement>
                                </BrushElements>
                                <StrokeElement Color="Gray" Thickness="0">
                                </StrokeElement>
                            </iggaugeprop:RadialGaugeNeedle>
                        </Markers>
                        <Axes>
                            <iggaugeprop:NumericAxis EndValue="60"></iggaugeprop:NumericAxis>
                        </Axes>
                    </iggaugeprop:RadialGaugeScale>
                </Scales>
                <Dial>
                    <BrushElements>
                        <iggaugeprop:BrushElementGroup>
                            <BrushElements>
                                <iggaugeprop:MultiStopRadialGradientBrushElement FocusScalesString="0.8, 0.8" CenterPointString="50, 50">
                                    <ColorStops>
                                        <iggaugeprop:ColorStop Color="240, 240, 240"></iggaugeprop:ColorStop>
                                        <iggaugeprop:ColorStop Color="195, 195, 195" Stop="0.3413793"></iggaugeprop:ColorStop>
                                        <iggaugeprop:ColorStop Color="195, 195, 195" Stop="1"></iggaugeprop:ColorStop>
                                    </ColorStops>
                                </iggaugeprop:MultiStopRadialGradientBrushElement>
                                <iggaugeprop:MultiStopRadialGradientBrushElement CenterPointString="50, 50" RelativeBoundsMeasure="Percent"
                                    RelativeBounds="4, 4, 93, 93">
                                    <ColorStops>
                                        <iggaugeprop:ColorStop Color="210, 210, 210"></iggaugeprop:ColorStop>
                                        <iggaugeprop:ColorStop Color="225, 225, 225" Stop="0.03989592"></iggaugeprop:ColorStop>
                                        <iggaugeprop:ColorStop Color="240, 240, 240" Stop="0.05030356"></iggaugeprop:ColorStop>
                                        <iggaugeprop:ColorStop Color="240, 240, 240" Stop="0.1006071"></iggaugeprop:ColorStop>
                                        <iggaugeprop:ColorStop Color="White" Stop="1"></iggaugeprop:ColorStop>
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
    </iggauge:UltraGauge>
</asp:Content>
