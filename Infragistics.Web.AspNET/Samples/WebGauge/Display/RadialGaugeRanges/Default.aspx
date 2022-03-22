<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="updatePanel">
        <ContentTemplate>
            <div style="width: auto; float: left; height: 270px;">
                <table>
                    <colgroup>
                        <col style="width: 150px" />
                        <col style="width: 130px" />
                    </colgroup>
                    <tr>
                        <td>
                            <%= this.GetGlobalResourceObject("WebGauge", "Ranges_Label1")%>
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="rangePicker" OnSelectedIndexChanged="rangePicker_SelectedIndexChanged"
                                AutoPostBack="True">
                                <asp:ListItem Text="<%$Resources:WebGauge, Ranges_Label2 %>" Value="green"></asp:ListItem>
                                <asp:ListItem Text="<%$Resources:WebGauge, Ranges_Label3 %>" Value="orange"></asp:ListItem>
                                <asp:ListItem Text="<%$Resources:WebGauge, Ranges_Label4 %>" Value="red"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%= this.GetGlobalResourceObject("WebGauge", "Ranges_Label5")%>
                        </td>
                        <td>
                            <ig:WebNumericEditor runat="server" ID="startValueEditor" StyleSetName="Default" OnValueChanged="editors_ValueChanged">
                                <Buttons SpinButtonsDisplay="OnRight" />
                            </ig:WebNumericEditor>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%= this.GetGlobalResourceObject("WebGauge", "Ranges_Label6")%>
                        </td>
                        <td>
                            <ig:WebNumericEditor runat="server" ID="endValueEditor" StyleSetName="Default" OnValueChanged="editors_ValueChanged">
                                <Buttons SpinButtonsDisplay="OnRight" />
                            </ig:WebNumericEditor>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%= this.GetGlobalResourceObject("WebGauge", "Ranges_Label7")%>
                        </td>
                        <td>
                            <ig:WebNumericEditor runat="server" ID="innerExtentStartEditor" StyleSetName="Default" OnValueChanged="editors_ValueChanged">
                                <Buttons SpinButtonsDisplay="OnRight" />
                            </ig:WebNumericEditor>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%= this.GetGlobalResourceObject("WebGauge", "Ranges_Label8")%>
                        </td>
                        <td>
                            <ig:WebNumericEditor runat="server" ID="innerExtentEndEditor" StyleSetName="Default" OnValueChanged="editors_ValueChanged">
                                <Buttons SpinButtonsDisplay="OnRight" />
                            </ig:WebNumericEditor>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%= this.GetGlobalResourceObject("WebGauge", "Ranges_Label9")%>
                        </td>
                        <td>
                            <ig:WebNumericEditor runat="server" ID="outerExtentEditor" StyleSetName="Default" OnValueChanged="editors_ValueChanged">
                                <Buttons SpinButtonsDisplay="OnRight" />
                            </ig:WebNumericEditor>
                        </td>
                    </tr>
                </table>
                <div style="margin-top: 20px;">
                    <asp:Button runat="server" ID="submitButton" Text="<%$Resources:WebGauge, Ranges_Label10 %>" />
                </div>
            </div>
            <div style="float: left; height: 260px; margin-left: 50px;">
                <iggauge:UltraGauge runat="server" ID="UltraGauge1">
                    <Gauges>
                        <iggauge:RadialGauge>
                            <Scales>
                                <iggauge:RadialGaugeScale EndAngle="450" StartAngle="90">
                                    <Ranges>
                                        <iggauge:RadialGaugeRange InnerExtentStart="60" Key="green" InnerExtentEnd="60" OuterExtent="80" EndValueString="10" StartValueString="0" >
                                            <BrushElements>
                                                <iggauge:SimpleGradientBrushElement EndColor="Green" StartColor="YellowGreen">
                                                </iggauge:SimpleGradientBrushElement>
                                            </BrushElements>
                                            <StrokeElement Color="Transparent" Thickness="0">
                                            </StrokeElement>
                                        </iggauge:RadialGaugeRange>
                                        <iggauge:RadialGaugeRange InnerExtentStart="60" Key="orange" InnerExtentEnd="60"
                                            OuterExtent="80">
                                            <BrushElements>
                                                <iggauge:SolidFillBrushElement Color="Orange"></iggauge:SolidFillBrushElement>
                                            </BrushElements>
                                            <StrokeElement Color="Transparent">
                                            </StrokeElement>
                                        </iggauge:RadialGaugeRange>
                                        <iggauge:RadialGaugeRange InnerExtentStart="60" Key="red" InnerExtentEnd="60" OuterExtent="80">
                                            <BrushElements>
                                                <iggauge:SimpleGradientBrushElement EndColor="Red" StartColor="255, 128, 128"></iggauge:SimpleGradientBrushElement>
                                            </BrushElements>
                                            <StrokeElement Color="Transparent">
                                            </StrokeElement>
                                        </iggauge:RadialGaugeRange>
                                    </Ranges>
                                    <Markers>
                                        <iggauge:RadialGaugeNeedle MidWidth="4" EndWidth="4" MidExtent="40" EndExtent="75"
                                            StartExtent="-25" StartWidth="4">
                                            <Anchor>
                                                <BrushElements>
                                                    <iggauge:RadialGradientBrushElement CenterPointString="0, 0" SurroundColor="DimGray">
                                                    </iggauge:RadialGradientBrushElement>
                                                </BrushElements>
                                                <StrokeElement Color="White">
                                                </StrokeElement>
                                            </Anchor>
                                            <BrushElements>
                                                <iggauge:SimpleGradientBrushElement EndColor="64, 64, 64" StartColor="Silver" GradientStyle="BackwardDiagonal">
                                                </iggauge:SimpleGradientBrushElement>
                                            </BrushElements>
                                            <StrokeElement Color="Transparent">
                                            </StrokeElement>
                                        </iggauge:RadialGaugeNeedle>
                                    </Markers>
                                    <Axes>
                                        <iggauge:NumericAxis></iggauge:NumericAxis>
                                    </Axes>
                                    <Labels PreTerminal="1" SpanMaximum="20" Extent="70" Font="Arial, 39.75pt, style=Bold">
                                        <BrushElements>
                                            <iggauge:SolidFillBrushElement Color="White"></iggauge:SolidFillBrushElement>
                                        </BrushElements>
                                        <Shadow Depth="1">
                                            <BrushElements>
                                                <iggauge:SolidFillBrushElement Color="Black"></iggauge:SolidFillBrushElement>
                                            </BrushElements>
                                        </Shadow>
                                    </Labels>
                                    <StrokeElement Thickness="0">
                                    </StrokeElement>
                                </iggauge:RadialGaugeScale>
                            </Scales>
                            <Dial>
                                <BrushElements>
                                    <iggauge:BrushElementGroup>
                                        <BrushElements>
                                            <iggauge:MultiStopRadialGradientBrushElement FocusScalesString="0.8, 0.8" CenterPointString="50, 50">
                                                <ColorStops>
                                                    <iggauge:ColorStop Color="240, 240, 240"></iggauge:ColorStop>
                                                    <iggauge:ColorStop Color="195, 195, 195" Stop="0.3413793"></iggauge:ColorStop>
                                                    <iggauge:ColorStop Color="195, 195, 195" Stop="1"></iggauge:ColorStop>
                                                </ColorStops>
                                            </iggauge:MultiStopRadialGradientBrushElement>
                                            <iggauge:MultiStopRadialGradientBrushElement CenterPointString="50, 50" RelativeBoundsMeasure="Percent"
                                                RelativeBounds="4, 4, 93, 93">
                                                <ColorStops>
                                                    <iggauge:ColorStop Color="210, 210, 210"></iggauge:ColorStop>
                                                    <iggauge:ColorStop Color="225, 225, 225" Stop="0.03989592"></iggauge:ColorStop>
                                                    <iggauge:ColorStop Color="240, 240, 240" Stop="0.05030356"></iggauge:ColorStop>
                                                    <iggauge:ColorStop Color="240, 240, 240" Stop="0.1006071"></iggauge:ColorStop>
                                                    <iggauge:ColorStop Color="White" Stop="1"></iggauge:ColorStop>
                                                </ColorStops>
                                            </iggauge:MultiStopRadialGradientBrushElement>
                                        </BrushElements>
                                    </iggauge:BrushElementGroup>
                                </BrushElements>
                                <StrokeElement>
                                    <BrushElements>
                                        <iggauge:SolidFillBrushElement Color="Silver"></iggauge:SolidFillBrushElement>
                                    </BrushElements>
                                </StrokeElement>
                            </Dial>
                        </iggauge:RadialGauge>
                    </Gauges>
					<DeploymentScenario FilePath="/SamplesBrowser/Temp/GaugeImages" ImageURL="/SamplesBrowser/Temp/GaugeImages/Gauge_#SEQNUM(100).#EXT" />
                </iggauge:UltraGauge>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>