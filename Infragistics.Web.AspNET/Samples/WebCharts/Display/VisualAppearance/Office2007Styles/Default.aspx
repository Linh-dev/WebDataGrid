<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="false"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebCharts_Display_Visual_Appearance_Office_2007_Styles_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table>
        <tr>
            <td>
                <igchart:UltraChart ID="UltraChart1" runat="server" ChartType="ColumnChart" Version="5.3"
                    Width="408px" Height="304px">
                    <DeploymentScenario Scenario="FileSystem" ImageURL="/SamplesBrowser/Temp/ChartImages/Chart_#SEQNUM(100).png"
                        ImageType="Png" FilePath="/SamplesBrowser/Temp/ChartImages" />
                </igchart:UltraChart>
            </td>
            <td align="center" style="vertical-align: top;">
                <div runat="server" id="presetPicker" style="width: 200px;">
                    <div>
                        <igtxt:webimagebutton id="AquaButton" runat="server" onclick="ImageButtons_OnClick"
                            width="197px" height="32px" enabletheming="False" imagetextspacing="0" displaymode="Block">
							<Appearance ContentShift="None">
								<style>
										<Padding Bottom="-1px" />
									</style>
							</Appearance>
							<HoverAppearance ContentShift="None" />
							<FocusAppearance ContentShift="None" />
							<PressedAppearance ContentShift="None" />
							<RoundedCorners ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebCharts/Display/VisualAppearance/2007/aqua.jpg" HoverImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebCharts/Display/VisualAppearance/2007/aqua_hover.jpg"
								MaxHeight="32" RenderingType="FileImages" MaxWidth="250" HeightOfBottomEdge="0" />
						</igtxt:webimagebutton>
                    </div>
                    <div>
                        <igtxt:webimagebutton id="ShadesOfBlueButton" runat="server" onclick="ImageButtons_OnClick"
                            width="197px" height="34px" enabletheming="False" imagetextspacing="0" displaymode="Block">
							<Appearance ContentShift="None">
								<style>
										<Padding Bottom="-1px" />
									</style>
							</Appearance>
							<HoverAppearance ContentShift="None" />
							<FocusAppearance ContentShift="None" />
							<PressedAppearance ContentShift="None" />
							<RoundedCorners ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebCharts/Display/VisualAppearance/2007/shadesofblue.jpg" HoverImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebCharts/Display/VisualAppearance/2007/shadesofblue_hover.jpg"
								MaxHeight="34" RenderingType="FileImages" MaxWidth="250" HeightOfBottomEdge="0" />
						</igtxt:webimagebutton>
                    </div>
                    <div>
                        <igtxt:webimagebutton id="OfficialRedButton" runat="server" onclick="ImageButtons_OnClick"
                            width="197px" height="35px" enabletheming="False" imagetextspacing="0" displaymode="Block">
							<Appearance ContentShift="None">
								<style>
										<Padding Bottom="-1px" />
									</style>
							</Appearance>
							<HoverAppearance ContentShift="None" />
							<FocusAppearance ContentShift="None" />
							<PressedAppearance ContentShift="None" />
							<RoundedCorners ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebCharts/Display/VisualAppearance/2007/official_red.jpg" HoverImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebCharts/Display/VisualAppearance/2007/official_red_hover.jpg"
								MaxHeight="35" RenderingType="FileImages" MaxWidth="250" HeightOfBottomEdge="0" />
						</igtxt:webimagebutton>
                    </div>
                    <div>
                        <igtxt:webimagebutton id="GreenGradientButton" runat="server" onclick="ImageButtons_OnClick"
                            width="197px" height="34px" enabletheming="False" imagetextspacing="0" displaymode="Block">
							<Appearance ContentShift="None">
								<style>
										<Padding Bottom="-1px" />
									</style>
							</Appearance>
							<HoverAppearance ContentShift="None" />
							<FocusAppearance ContentShift="None" />
							<PressedAppearance ContentShift="None" />
							<RoundedCorners ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebCharts/Display/VisualAppearance/2007/gradientgreen.jpg" HoverImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebCharts/Display/VisualAppearance/2007/gradientgreen_hover.jpg"
								MaxHeight="34" RenderingType="FileImages" MaxWidth="250" HeightOfBottomEdge="0" />
						</igtxt:webimagebutton>
                    </div>
                    <div>
                        <igtxt:webimagebutton id="OrangeAndBlackButton" runat="server" onclick="ImageButtons_OnClick"
                            width="197px" height="34px" enabletheming="False" imagetextspacing="0" displaymode="Block">
							<Appearance ContentShift="None">
								<style>
										<Padding Bottom="-1px" />
									</style>
							</Appearance>
							<HoverAppearance ContentShift="None" />
							<FocusAppearance ContentShift="None" />
							<PressedAppearance ContentShift="None" />
							<RoundedCorners ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebCharts/Display/VisualAppearance/2007/orangeandblack.jpg" HoverImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebCharts/Display/VisualAppearance/2007/orangeandblack_hover.jpg"
								MaxHeight="34" RenderingType="FileImages" MaxWidth="250" HeightOfBottomEdge="0" />
						</igtxt:webimagebutton>
                    </div>
                </div>
                <div>
                    <asp:ListBox ID="ListBox1" runat="Server" AutoPostBack="True" Rows="10" />
                </div>
                <div style="margin-left: 20px; margin-top: 10px;">
                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Text="<%$ Resources:WebCharts, Office2007_Label %>" />
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
