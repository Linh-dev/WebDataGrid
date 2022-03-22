<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
	CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
	<ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<table id="Table3" cellspacing="5" cellpadding="0" width="100%" border="0">
		<tr>
			<td>
				<br />
				<br />
				<table id="Table1" cellspacing="0" cellpadding="5" width="100%" border="0">
					<tr>
						<td class="imgBtn" valign="bottom" width="30%">
							<asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_ButtonDefault %>"></asp:Label>
						</td>
						<td class="imgBtn" style="border-left: #333333 1px solid" valign="bottom">
							<asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_CustomAppearance %>"></asp:Label>
						</td>
					</tr>
					<tr>
						<td style="border-bottom: #333333 1px solid" valign="bottom" class="imgBtn">
							<igtxt:WebImageButton ID="Webimagebutton1" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_UseBrowserDefaults %>" Height="20"
								AutoSubmit="False">
								<FocusAppearance>
									<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
									</Image>
								</FocusAppearance>
								<PressedAppearance>
									<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
									</Image>
								</PressedAppearance>
								<HoverAppearance>
									<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
									</Image>
								</HoverAppearance>
								<Appearance>
									<style font-size="8pt" font-names="Verdana">
										
									</style>
									<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up.gif">
									</Image>
								</Appearance>
							</igtxt:WebImageButton>
						</td>
						<td style="border-left: #333333 1px solid; border-bottom: #333333 1px solid">
							<div class="image-button-container">
								<igtxt:WebImageButton Height="20" ID="Webimagebutton20" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_Left %>"
									AutoSubmit="False" UseBrowserDefaults="False">
									<FocusAppearance>
										<style forecolor="Red">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
										</Image>
										<InnerBorder ColorTop="255, 192, 128" ColorBottom="255, 192, 128" ColorRight="255, 192, 128"
											ColorLeft="255, 192, 128"></InnerBorder>
									</FocusAppearance>
									<RoundedCorners RenderingType="Disabled"></RoundedCorners>
									<PressedAppearance ContentShift="Right">
										<style bordercolor="#FFF0D0">

<BorderDetails ColorTop="128, 64, 0" ColorLeft="128, 64, 0">
</BorderDetails>

											</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
										</Image>
										<InnerBorder ColorTop="200, 152, 68" ColorBottom="255, 222, 178" ColorRight="255, 222, 178"
											ColorLeft="200, 152, 68"></InnerBorder>
									</PressedAppearance>
									<HoverAppearance ContentShift="Left">
										<style borderwidth="2px" bordercolor="#FFE0C0" forecolor="Blue">

<BorderDetails ColorBottom="128, 64, 0" ColorRight="128, 64, 0">
</BorderDetails>

											</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
										</Image>
										<InnerBorder ColorTop="255, 242, 240" ColorBottom="255, 122, 58" ColorRight="255, 122, 58"
											ColorLeft="255, 242, 240"></InnerBorder>
									</HoverAppearance>
									<Appearance>
										<style borderwidth="2px" font-size="8pt" font-names="Verdana" bordercolor="#C04000"
											borderstyle="Solid" backcolor="#FFC080">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up.gif">
										</Image>
										<InnerBorder ColorTop="255, 192, 128" WidthLeft="1px" StyleBottom="Solid" ColorBottom="255, 192, 128"
											WidthTop="1px" ColorRight="255, 192, 128" WidthRight="1px" StyleTop="Solid" StyleRight="Solid"
											WidthBottom="1px" StyleLeft="Solid" ColorLeft="255, 192, 128"></InnerBorder>
									</Appearance>
								</igtxt:WebImageButton>
							</div>
							<div class="image-button-container">
								<igtxt:WebImageButton Height="20" ID="Webimagebutton19" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_Right %>"
									AutoSubmit="False" UseBrowserDefaults="False">
									<Alignments TextImage="ImageRight"></Alignments>
									<FocusAppearance>
										<style forecolor="Red">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
										</Image>
									</FocusAppearance>
									<RoundedCorners RenderingType="Disabled"></RoundedCorners>
									<PressedAppearance ContentShift="DownRight">
										<style bordercolor="#804000">

<BorderDetails ColorBottom="White" ColorRight="White">
</BorderDetails>

											</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
										</Image>
										<InnerBorder ColorTop="255, 128, 0" ColorBottom="255, 224, 192" ColorRight="255, 224, 192"
											ColorLeft="255, 128, 0"></InnerBorder>
									</PressedAppearance>
									<HoverAppearance ContentShift="UpLeft">
										<style forecolor="Blue">

<BorderDetails ColorTop="255, 128, 0" ColorLeft="255, 128, 0">
</BorderDetails>

											</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
										</Image>
										<InnerBorder ColorTop="White" ColorBottom="255, 128, 0" ColorRight="255, 128, 0"
											ColorLeft="White"></InnerBorder>
									</HoverAppearance>
									<Appearance>
										<style font-size="8pt" font-names="Verdana" bordercolor="#804000" borderstyle="Solid"
											backcolor="#FFC080">

<BorderDetails ColorTop="255, 224, 192" ColorLeft="255, 224, 192">
</BorderDetails>

											</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up.gif">
										</Image>
										<InnerBorder ColorTop="255, 192, 128" WidthLeft="1px" StyleBottom="Solid" ColorBottom="255, 192, 128"
											WidthTop="1px" ColorRight="255, 192, 128" WidthRight="1px" StyleTop="Solid" StyleRight="Solid"
											WidthBottom="1px" StyleLeft="Solid" ColorLeft="255, 192, 128"></InnerBorder>
									</Appearance>
								</igtxt:WebImageButton>
							</div>
							<div class="image-button-container">
								<igtxt:WebImageButton Height="30" ID="Webimagebutton18" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_Top %>"
									AutoSubmit="False" UseBrowserDefaults="False">
									<Alignments TextImage="ImageTop"></Alignments>
									<FocusAppearance>
										<style forecolor="Red">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
										</Image>
										<InnerBorder ColorTop="64, 64, 0" StyleBottom="Dotted" ColorBottom="64, 64, 0" ColorRight="64, 64, 0"
											StyleTop="Dotted" StyleRight="Dotted" StyleLeft="Dotted" ColorLeft="64, 64, 0">
										</InnerBorder>
									</FocusAppearance>
									<RoundedCorners RenderingType="Disabled"></RoundedCorners>
									<PressedAppearance ContentShift="Down">
										<style bordercolor="#E0F080">

<BorderDetails ColorTop="Olive" ColorLeft="Olive">
</BorderDetails>

											</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
										</Image>
									</PressedAppearance>
									<HoverAppearance ContentShift="Up">
										<style bordercolor="#E0F080" forecolor="Blue" backcolor="#C0C000">

<BorderDetails ColorBottom="Olive" ColorRight="Olive">
</BorderDetails>

											</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
										</Image>
									</HoverAppearance>
									<Appearance>
										<style borderwidth="2px" font-size="8pt" font-names="Verdana" bordercolor="#C0C000"
											borderstyle="Solid" backcolor="#C0C000">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up.gif">
										</Image>
										<InnerBorder ColorTop="192, 192, 0" WidthLeft="1px" StyleBottom="Solid" ColorBottom="192, 192, 0"
											WidthTop="1px" ColorRight="192, 192, 0" WidthRight="1px" StyleTop="Solid" StyleRight="Solid"
											WidthBottom="1px" StyleLeft="Solid" ColorLeft="192, 192, 0"></InnerBorder>
									</Appearance>
								</igtxt:WebImageButton>
							</div>
							<div class="image-button-container">
								<igtxt:WebImageButton Height="30" ID="Webimagebutton17" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_Bottom %>"
									AutoSubmit="False" UseBrowserDefaults="False">
									<Alignments TextImage="ImageBottom"></Alignments>
									<FocusAppearance>
										<style bordercolor="#400040" forecolor="Yellow" backcolor="Purple">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
										</Image>
										<InnerBorder ColorTop="255, 192, 255" ColorBottom="255, 192, 255" ColorRight="255, 192, 255"
											ColorLeft="255, 192, 255"></InnerBorder>
									</FocusAppearance>
									<RoundedCorners RenderingType="Disabled"></RoundedCorners>
									<PressedAppearance ContentShift="None">
										<style bordercolor="#000040" backcolor="Navy">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
										</Image>
										<InnerBorder ColorTop="0, 0, 64" ColorBottom="0, 0, 64" ColorRight="0, 0, 64" ColorLeft="0, 0, 64">
										</InnerBorder>
									</PressedAppearance>
									<HoverAppearance ContentShift="Down">
										<style bordercolor="#202000" forecolor="White" backcolor="#404000">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
										</Image>
										<InnerBorder ColorTop="144, 144, 0" ColorBottom="144, 144, 0" ColorRight="144, 144, 0"
											ColorLeft="144, 144, 0"></InnerBorder>
									</HoverAppearance>
									<Appearance>
										<style borderwidth="1px" font-size="8pt" font-names="Verdana" bordercolor="#402000"
											borderstyle="Solid" forecolor="#80FFFF" backcolor="#804000">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up.gif">
										</Image>
										<InnerBorder ColorTop="160, 96, 0" WidthLeft="1px" StyleBottom="Solid" ColorBottom="160, 96, 0"
											WidthTop="1px" ColorRight="160, 96, 0" WidthRight="1px" StyleTop="Solid" StyleRight="Solid"
											WidthBottom="1px" StyleLeft="Solid" ColorLeft="160, 96, 0"></InnerBorder>
									</Appearance>
								</igtxt:WebImageButton>
							</div>
							<div class="image-button-container">
								<igtxt:WebImageButton Height="20" ID="Webimagebutton16" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_Transparent %>"
									AutoSubmit="False" UseBrowserDefaults="False">
									<Alignments TextImage="ImageRight"></Alignments>
									<FocusAppearance>
										<style forecolor="Red">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
										</Image>
									</FocusAppearance>
									<RoundedCorners RenderingType="Disabled"></RoundedCorners>
									<PressedAppearance>
										<style bordercolor="#804000">

<BorderDetails ColorBottom="White" ColorRight="White">
</BorderDetails>

											</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
										</Image>
									</PressedAppearance>
									<HoverAppearance>
										<style forecolor="Blue">

<BorderDetails ColorTop="White" ColorBottom="108, 54, 0" ColorRight="108, 54, 0" ColorLeft="White">
</BorderDetails>

											</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
										</Image>
									</HoverAppearance>
									<Appearance>
										<style borderwidth="1px" font-size="8pt" font-names="Verdana" bordercolor="#C04000"
											borderstyle="Solid" backcolor="Transparent">

<BorderDetails ColorTop="255, 224, 192" ColorLeft="255, 224, 192">
</BorderDetails>

											</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up.gif">
										</Image>
										<InnerBorder ColorTop="255, 192, 128" WidthLeft="1px" StyleBottom="Solid" ColorBottom="255, 192, 128"
											WidthTop="1px" ColorRight="255, 192, 128" WidthRight="1px" StyleTop="Solid" StyleRight="Solid"
											WidthBottom="1px" StyleLeft="Solid" ColorLeft="255, 192, 128"></InnerBorder>
									</Appearance>
								</igtxt:WebImageButton>
							</div>
							<div class="clear-floating">
							</div>
						</td>
					</tr>
					<tr>
						<td class="headers">
							<asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_ASPNETButton %>"></asp:Label>
						</td>
						<td class="headers" style="border-left: #333333 1px solid">
							<asp:Label ID="Label6" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_CustomAppearance2 %>"></asp:Label>
						</td>
					</tr>
					<tr>
						<td valign="middle">
							<asp:Button ID="Button1" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_ASPNETDefault %>"
								Font-Size="8pt" Font-Names="Verdana" CausesValidation="False"></asp:Button>
						</td>
						<td style="border-left: #333333 1px solid" class="imgBtn" valign="bottom">
							<div class="image-button-container">
								<igtxt:WebImageButton Height="20" ID="Webimagebutton14" AccessKey="l" runat="server"
									Text="<%$ Resources:WebButton, WebButtonStyles_Left %>" AutoSubmit="False" UseBrowserDefaults="False">
									<FocusAppearance>
										<style forecolor="Red">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
										</Image>
										<InnerBorder ColorTop="255, 192, 128" ColorBottom="255, 192, 128" ColorRight="255, 192, 128"
											ColorLeft="255, 192, 128"></InnerBorder>
									</FocusAppearance>
									<RoundedCorners RenderingType="BordersByTableCells"></RoundedCorners>
									<PressedAppearance ContentShift="Right">
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
										</Image>
										<InnerBorder ColorTop="255, 192, 128" ColorBottom="255, 192, 128" ColorRight="255, 192, 128"
											ColorLeft="255, 192, 128"></InnerBorder>
									</PressedAppearance>
									<HoverAppearance ContentShift="Left">
										<style forecolor="Blue">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
										</Image>
										<InnerBorder ColorTop="255, 192, 128" ColorBottom="255, 192, 128" ColorRight="255, 192, 128"
											ColorLeft="255, 192, 128"></InnerBorder>
									</HoverAppearance>
									<Appearance>
										<style font-size="8pt" font-names="Verdana" bordercolor="#C04000" backcolor="#FFC080">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up.gif">
										</Image>
										<InnerBorder ColorTop="255, 192, 128" ColorBottom="255, 192, 128" ColorRight="255, 192, 128"
											ColorLeft="255, 192, 128"></InnerBorder>
									</Appearance>
								</igtxt:WebImageButton>
							</div>
							<div class="image-button-container">
								<igtxt:WebImageButton Height="20" ID="Webimagebutton11" AccessKey="r" runat="server"
									Text="<%$ Resources:WebButton, WebButtonStyles_Right %>" AutoSubmit="False" UseBrowserDefaults="False">
									<Alignments TextImage="ImageRight"></Alignments>
									<FocusAppearance>
										<style forecolor="Red">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
										</Image>
									</FocusAppearance>
									<RoundedCorners RenderingType="BordersByTableCells"></RoundedCorners>
									<PressedAppearance ContentShift="DownRight">
										<style bordercolor="#C04000" borderstyle="Inset">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
										</Image>
									</PressedAppearance>
									<HoverAppearance ContentShift="UpLeft">
										<style forecolor="Blue">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
										</Image>
									</HoverAppearance>
									<Appearance>
										<style font-size="8pt" font-names="Verdana" bordercolor="#C04000" borderstyle="Outset"
											backcolor="#FFC080">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up.gif">
										</Image>
										<InnerBorder ColorTop="255, 192, 128" ColorBottom="255, 192, 128" ColorRight="255, 192, 128"
											ColorLeft="255, 192, 128"></InnerBorder>
									</Appearance>
								</igtxt:WebImageButton>
							</div>
							<div class="image-button-container">
								<igtxt:WebImageButton ID="Webimagebutton12" Height="30" AccessKey="t" runat="server"
									Text="<%$ Resources:WebButton, WebButtonStyles_Top %>" AutoSubmit="False" UseBrowserDefaults="False"
									ImageTextSpacing="11">
									<Alignments TextImage="ImageTop"></Alignments>
									<FocusAppearance>
										<style forecolor="Red">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
										</Image>
									</FocusAppearance>
									<RoundedCorners RenderingType="BordersByTableCells"></RoundedCorners>
									<PressedAppearance ContentShift="Down">
										<style bordercolor="Olive" borderstyle="Inset">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
										</Image>
									</PressedAppearance>
									<HoverAppearance ContentShift="Up">
										<style bordercolor="#C0C000" borderstyle="Outset" forecolor="Blue" backcolor="#C0C000">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
										</Image>
									</HoverAppearance>
									<Appearance>
										<style font-size="8pt" font-names="Verdana" bordercolor="Olive" backcolor="#C0C000"
											customrules="writing-mode:tb-rl;letter-spacing:6">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up.gif">
										</Image>
									</Appearance>
								</igtxt:WebImageButton>
							</div>
							<div class="image-button-container">
								<igtxt:WebImageButton ID="Webimagebutton13" Height="30" AccessKey="b" runat="server"
									Text="<%$ Resources:WebButton, WebButtonStyles_Bottom %>" AutoSubmit="False"
									UseBrowserDefaults="False">
									<Alignments TextImage="ImageBottom"></Alignments>
									<FocusAppearance>
										<style forecolor="Yellow" backcolor="Purple">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
										</Image>
									</FocusAppearance>
									<RoundedCorners RenderingType="BordersByTableCells"></RoundedCorners>
									<PressedAppearance ContentShift="None">
										<style backcolor="Navy">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
										</Image>
									</PressedAppearance>
									<HoverAppearance ContentShift="Down">
										<style forecolor="White" backcolor="#404000">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
										</Image>
									</HoverAppearance>
									<Appearance>
										<style font-size="8pt" font-names="Verdana" bordercolor="#004000" forecolor="#80FFFF"
											backcolor="#804000" customrules="writing-mode:tb-rl">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up.gif">
										</Image>
									</Appearance>
								</igtxt:WebImageButton>
							</div>
							<div class="image-button-container">
								<igtxt:WebImageButton ID="Webimagebutton15" Height="20" AccessKey="a" runat="server"
									Text="<%$ Resources:WebButton, WebButtonStyles_Transparent %>" AutoSubmit="False"
									UseBrowserDefaults="False">
									<Alignments TextImage="ImageRight"></Alignments>
									<FocusAppearance>
										<style forecolor="Red">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
										</Image>
									</FocusAppearance>
									<RoundedCorners RenderingType="BordersByTableCells"></RoundedCorners>
									<PressedAppearance>
										<style bordercolor="#C04000" borderstyle="Inset">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
										</Image>
									</PressedAppearance>
									<HoverAppearance>
										<style forecolor="Blue">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
										</Image>
									</HoverAppearance>
									<Appearance>
										<style font-size="8pt" font-names="Verdana" bordercolor="#C04000" borderstyle="Outset"
											backcolor="Transparent">
											
										</style>
										<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up.gif">
										</Image>
										<InnerBorder ColorTop="255, 192, 128" ColorBottom="255, 192, 128" ColorRight="255, 192, 128"
											ColorLeft="255, 192, 128"></InnerBorder>
									</Appearance>
								</igtxt:WebImageButton>
							</div>
							<div class="clear-floating">
							</div>
						</td>
					</tr>
					<tr>
						<td class="headers" style="border-top: #333333 1px solid" valign="bottom" colspan="2">
							<asp:Label ID="Label7" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_BuiltIn %>"></asp:Label>
						</td>
						<td>
						</td>
					</tr>
					<tr>
						<td style="height: 83px" colspan="2">
							<table id="Table2" height="75" cellspacing="3" cellpadding="3" border="0">
								<tr>
									<td height="80">
										<igtxt:WebImageButton ID="Webimagebutton22" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_Office2003 %>"
											AutoSubmit="False" UseBrowserDefaults="False" Height="90%">
											<FocusAppearance>
												<style backcolor="#FCE6AB">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
												</Image>
												<InnerBorder ColorTop="0, 33, 27, 96" WidthLeft="1px" StyleBottom="Solid" ColorBottom="0, 33, 27, 96"
													WidthTop="1px" ColorRight="0, 33, 27, 96" WidthRight="1px" StyleTop="Solid" StyleRight="Solid"
													WidthBottom="1px" StyleLeft="Solid" ColorLeft="0, 33, 27, 96"></InnerBorder>
											</FocusAppearance>
											<PressedAppearance ContentShift="None">
												<style backcolor="#F79646">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
												</Image>
												<InnerBorder ColorTop="0, 33, 27, 96" WidthLeft="1px" StyleBottom="Solid" ColorBottom="0, 33, 27, 96"
													WidthTop="1px" ColorRight="0, 33, 27, 96" WidthRight="1px" StyleTop="Solid" StyleRight="Solid"
													WidthBottom="1px" StyleLeft="Solid" ColorLeft="0, 33, 27, 96"></InnerBorder>
											</PressedAppearance>
											<HoverAppearance>
												<style backcolor="#F9DA9B">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
												</Image>
												<InnerBorder ColorTop="0, 33, 27, 96" WidthLeft="1px" StyleBottom="Solid" ColorBottom="0, 33, 27, 96"
													WidthTop="1px" ColorRight="0, 33, 27, 96" WidthRight="1px" StyleTop="Solid" StyleRight="Solid"
													WidthBottom="1px" StyleLeft="Solid" ColorLeft="0, 33, 27, 96"></InnerBorder>
											</HoverAppearance>
											<Appearance>
												<style font-size="8pt" font-names="Verdana">
													
												</style>
											</Appearance>
										</igtxt:WebImageButton>
									</td>
									<td height="80">
										<igtxt:WebImageButton ID="Webimagebutton8" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_VisualStudio %>"
											AutoSubmit="False" UseBrowserDefaults="False" Height="90%">
											<FocusAppearance>
												<style backcolor="#DEEAF3">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
												</Image>
												<InnerBorder ColorTop="0, 37, 108, 180" WidthLeft="1px" StyleBottom="Solid" ColorBottom="0, 37, 108, 180"
													WidthTop="1px" ColorRight="0, 37, 108, 180" WidthRight="1px" StyleTop="Solid"
													StyleRight="Solid" WidthBottom="1px" StyleLeft="Solid" ColorLeft="0, 37, 108, 180">
												</InnerBorder>
											</FocusAppearance>
											<PressedAppearance ContentShift="None">
												<style backcolor="#92B8E7">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
												</Image>
												<InnerBorder ColorTop="0, 37, 108, 180" WidthLeft="1px" StyleBottom="Solid" ColorBottom="0, 37, 108, 180"
													WidthTop="1px" ColorRight="0, 37, 108, 180" WidthRight="1px" StyleTop="Solid"
													StyleRight="Solid" WidthBottom="1px" StyleLeft="Solid" ColorLeft="0, 37, 108, 180">
												</InnerBorder>
											</PressedAppearance>
											<HoverAppearance>
												<style backcolor="#BCD7F1">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
												</Image>
												<InnerBorder ColorTop="0, 37, 108, 180" WidthLeft="1px" StyleBottom="Solid" ColorBottom="0, 37, 108, 180"
													WidthTop="1px" ColorRight="0, 37, 108, 180" WidthRight="1px" StyleTop="Solid"
													StyleRight="Solid" WidthBottom="1px" StyleLeft="Solid" ColorLeft="0, 37, 108, 180">
												</InnerBorder>
											</HoverAppearance>
											<Appearance>
												<style font-size="8pt" font-names="Verdana">
													
												</style>
											</Appearance>
										</igtxt:WebImageButton>
									</td>
									<td height="80">
										<igtxt:WebImageButton ID="Webimagebutton24" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_Go %>"
											AutoSubmit="False" UseBrowserDefaults="False" Height="90%">
											<Alignments TextImage="TextLeftImageRight"></Alignments>
											<FocusAppearance>
												<style backcolor="#DEEAF3">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/rightArrow2.gif">
												</Image>
												<InnerBorder ColorTop="0, 37, 108, 180" WidthLeft="1px" StyleBottom="Solid" ColorBottom="0, 37, 108, 180"
													WidthTop="1px" ColorRight="0, 37, 108, 180" WidthRight="1px" StyleTop="Solid"
													StyleRight="Solid" WidthBottom="1px" StyleLeft="Solid" ColorLeft="0, 37, 108, 180">
												</InnerBorder>
											</FocusAppearance>
											<PressedAppearance ContentShift="None">
												<style backcolor="#92B8E7">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/rightArrow3.gif">
												</Image>
												<InnerBorder ColorTop="0, 37, 108, 180" WidthLeft="1px" StyleBottom="Solid" ColorBottom="0, 37, 108, 180"
													WidthTop="1px" ColorRight="0, 37, 108, 180" WidthRight="1px" StyleTop="Solid"
													StyleRight="Solid" WidthBottom="1px" StyleLeft="Solid" ColorLeft="0, 37, 108, 180">
												</InnerBorder>
											</PressedAppearance>
											<HoverAppearance>
												<style backcolor="#BCD7F1">
													
												</style>
												<InnerBorder ColorTop="0, 37, 108, 180" WidthLeft="1px" StyleBottom="Solid" ColorBottom="0, 37, 108, 180"
													WidthTop="1px" ColorRight="0, 37, 108, 180" WidthRight="1px" StyleTop="Solid"
													StyleRight="Solid" WidthBottom="1px" StyleLeft="Solid" ColorLeft="0, 37, 108, 180">
												</InnerBorder>
											</HoverAppearance>
											<Appearance>
												<style font-size="8pt" font-names="Verdana">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/rightArrow1.gif">
												</Image>
											</Appearance>
										</igtxt:WebImageButton>
									</td>
									<td height="80">
										<igtxt:WebImageButton ID="Webimagebutton21" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_VisualStudio2 %>"
											AutoSubmit="False" UseBrowserDefaults="False" Height="90%">
											<Alignments TextImage="TextRightImageLeft"></Alignments>
											<FocusAppearance>
												<style backcolor="#DEEAF3">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
												</Image>
												<InnerBorder ColorTop="0, 37, 108, 180" WidthLeft="1px" StyleBottom="Solid" ColorBottom="0, 37, 108, 180"
													WidthTop="1px" ColorRight="0, 37, 108, 180" WidthRight="1px" StyleTop="Solid"
													StyleRight="Solid" WidthBottom="1px" StyleLeft="Solid" ColorLeft="0, 37, 108, 180">
												</InnerBorder>
											</FocusAppearance>
											<PressedAppearance ContentShift="DownRight">
												<style backcolor="#92B8E7">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
												</Image>
												<InnerBorder ColorTop="0, 37, 108, 180" WidthLeft="1px" StyleBottom="Solid" ColorBottom="0, 37, 108, 180"
													WidthTop="1px" ColorRight="0, 37, 108, 180" WidthRight="1px" StyleTop="Solid"
													StyleRight="Solid" WidthBottom="1px" StyleLeft="Solid" ColorLeft="0, 37, 108, 180">
												</InnerBorder>
											</PressedAppearance>
											<HoverAppearance ContentShift="UpLeft">
												<style backcolor="#BCD7F1">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
												</Image>
												<InnerBorder ColorTop="0, 37, 108, 180" WidthLeft="1px" StyleBottom="Solid" ColorBottom="0, 37, 108, 180"
													WidthTop="1px" ColorRight="0, 37, 108, 180" WidthRight="1px" StyleTop="Solid"
													StyleRight="Solid" WidthBottom="1px" StyleLeft="Solid" ColorLeft="0, 37, 108, 180">
												</InnerBorder>
											</HoverAppearance>
											<Appearance>
												<style font-size="8pt" font-names="Verdana">
													
												</style>
											</Appearance>
										</igtxt:WebImageButton>
									</td>
									<td style="width: 34px" height="80">
										<igtxt:WebImageButton ID="Webimagebutton23" runat="server" AutoSubmit="False" UseBrowserDefaults="False"
											Height="90%">
											<FocusAppearance>
												<style backcolor="#DEEAF3">
													
												</style>
												<InnerBorder ColorTop="0, 37, 108, 180" WidthLeft="1px" StyleBottom="Solid" ColorBottom="0, 37, 108, 180"
													WidthTop="1px" ColorRight="0, 37, 108, 180" WidthRight="1px" StyleTop="Solid"
													StyleRight="Solid" WidthBottom="1px" StyleLeft="Solid" ColorLeft="0, 37, 108, 180">
												</InnerBorder>
											</FocusAppearance>
											<PressedAppearance ContentShift="DownRight">
												<style backcolor="#92B8E7">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/document1.gif">
												</Image>
												<InnerBorder ColorTop="0, 37, 108, 180" WidthLeft="1px" StyleBottom="Solid" ColorBottom="0, 37, 108, 180"
													WidthTop="1px" ColorRight="0, 37, 108, 180" WidthRight="1px" StyleTop="Solid"
													StyleRight="Solid" WidthBottom="1px" StyleLeft="Solid" ColorLeft="0, 37, 108, 180">
												</InnerBorder>
											</PressedAppearance>
											<HoverAppearance ContentShift="UpLeft">
												<style backcolor="#BCD7F1">
													
												</style>
												<InnerBorder ColorTop="0, 37, 108, 180" WidthLeft="1px" StyleBottom="Solid" ColorBottom="0, 37, 108, 180"
													WidthTop="1px" ColorRight="0, 37, 108, 180" WidthRight="1px" StyleTop="Solid"
													StyleRight="Solid" WidthBottom="1px" StyleLeft="Solid" ColorLeft="0, 37, 108, 180">
												</InnerBorder>
											</HoverAppearance>
											<Appearance>
												<style font-size="8pt" font-names="Verdana">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/document0.gif">
												</Image>
											</Appearance>
										</igtxt:WebImageButton>
									</td>
									<td height="80">
										<igtxt:WebImageButton ID="Webimagebutton2" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_Popup %>"
											AutoSubmit="False" UseBrowserDefaults="False" Height="90%">
											<Alignments TextImage="ImageTop"></Alignments>
											<FocusAppearance ContentShift="None">
												<style bordercolor="#909090">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/file2.gif">
												</Image>
											</FocusAppearance>
											<PressedAppearance>
												<style>

<BorderDetails ColorTop="104, 104, 104" ColorBottom="248, 248, 248" ColorRight="248, 248, 248" ColorLeft="104, 104, 104">
</BorderDetails>

														</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/file3.gif">
												</Image>
											</PressedAppearance>
											<HoverAppearance ContentShift="UpLeft">
												<style>

<BorderDetails ColorTop="248, 248, 248" ColorBottom="104, 104, 104" ColorRight="104, 104, 104" ColorLeft="248, 248, 248">
</BorderDetails>

														</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/file2.gif">
												</Image>
											</HoverAppearance>
											<Appearance>
												<style borderwidth="1px" font-size="8pt" font-names="Verdana" bordercolor="Transparent"
													borderstyle="Solid" backcolor="Control">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/file1.gif">
												</Image>
											</Appearance>
										</igtxt:WebImageButton>
									</td>
									<td valign="middle" align="center" width="65" height="80">
										<igtxt:WebImageButton ID="Webimagebutton25" runat="server" AutoSubmit="False" UseBrowserDefaults="False"
											Height="68px">
											<FocusAppearance>
												<style borderwidth="1px" bordercolor="#256CB4" borderstyle="Solid" backcolor="#DEEAF3">
													
												</style>
											</FocusAppearance>
											<RoundedCorners RenderingType="Disabled"></RoundedCorners>
											<PressedAppearance ContentShift="DownRight">
												<style borderwidth="1px" bordercolor="#256CB4" borderstyle="Solid" backcolor="#92B8E7">
													
												</style>
											</PressedAppearance>
											<HoverAppearance ContentShift="UpLeft">
												<style borderwidth="1px" bordercolor="#256CB4" borderstyle="Solid" backcolor="#BCD7F1">
													
												</style>
											</HoverAppearance>
											<Appearance>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/apple.gif">
												</Image>
											</Appearance>
										</igtxt:WebImageButton>
									</td>
								</tr>
							</table>
							<br />
							<table id="Table4" cellspacing="3" cellpadding="3" border="0">
								<tr>
									<td height="40">
										<igtxt:WebImageButton ID="Webimagebutton4" runat="server" Text="Netscape" AutoSubmit="False"
											UseBrowserDefaults="False">
											<FocusAppearance>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
												</Image>
											</FocusAppearance>
											<RoundedCorners RenderingType="Disabled"></RoundedCorners>
											<PressedAppearance>
												<style>

<BorderDetails ColorTop="120, 120, 120" ColorBottom="240, 240, 240" ColorRight="240, 240, 240" ColorLeft="120, 120, 120">
</BorderDetails>

														</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
												</Image>
											</PressedAppearance>
											<HoverAppearance>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
												</Image>
											</HoverAppearance>
											<Appearance>
												<style borderwidth="2px" font-names="Verdana" borderstyle="Solid" backcolor="Control">

<BorderDetails ColorTop="240, 240, 240" ColorBottom="120, 120, 120" ColorRight="120, 120, 120" ColorLeft="240, 240, 240">
</BorderDetails>

														</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up.gif">
												</Image>
											</Appearance>
										</igtxt:WebImageButton>
									</td>
									<td height="40">
										<igtxt:WebImageButton ID="Webimagebutton6" runat="server" Text="Outlook Olive" AutoSubmit="False"
											UseBrowserDefaults="False">
											<FocusAppearance>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
												</Image>
											</FocusAppearance>
											<RoundedCorners MaxHeight="80" ImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP1o.gif"
												MaxWidth="400" HoverImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP2o.gif"
												RenderingType="FileImages" PressedImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP4o.gif"
												DisabledImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP5o.gif"
												FocusImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP3o.gif">
											</RoundedCorners>
											<PressedAppearance>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
												</Image>
											</PressedAppearance>
											<HoverAppearance>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
												</Image>
											</HoverAppearance>
											<Appearance>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up.gif">
												</Image>
											</Appearance>
										</igtxt:WebImageButton>
									</td>
									<td height="40">
										<igtxt:WebImageButton ID="Webimagebutton7" runat="server" Text="Thin3D" AutoSubmit="False"
											UseBrowserDefaults="False">
											<FocusAppearance>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
												</Image>
											</FocusAppearance>
											<PressedAppearance>
												<style bordercolor="#F8F8F8">

<BorderDetails ColorTop="104, 104, 104" ColorLeft="104, 104, 104">
</BorderDetails>

														</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
												</Image>
											</PressedAppearance>
											<HoverAppearance>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
												</Image>
											</HoverAppearance>
											<Appearance>
												<style borderwidth="1px" font-size="8pt" font-names="Verdana" bordercolor="#F8F8F8"
													borderstyle="Solid" backcolor="Control">

<BorderDetails ColorBottom="104, 104, 104" ColorRight="104, 104, 104">
</BorderDetails>

														</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up.gif">
												</Image>
											</Appearance>
										</igtxt:WebImageButton>
									</td>
									<td height="40">
										<igtxt:WebImageButton ID="Webimagebutton9" runat="server" Text="MSCRM" AutoSubmit="False"
											UseBrowserDefaults="False" Height="23px">
											<RoundedCorners MaxHeight="40" ImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butCRM1.gif"
												MaxWidth="400" HoverImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butCRM2.gif"
												RenderingType="FileImages" HeightOfBottomEdge="2" PressedImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butCRM2.gif"
												WidthOfRightEdge="2"></RoundedCorners>
											<PressedAppearance>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/football.gif">
												</Image>
											</PressedAppearance>
											<HoverAppearance>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/basketball.gif">
												</Image>
											</HoverAppearance>
											<Appearance>
												<style font-size="8pt" font-names="Verdana">

<Padding Top="2px">
</Padding>

														</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/soccer.gif">
												</Image>
											</Appearance>
										</igtxt:WebImageButton>
									</td>
									<td height="40">
										<igtxt:WebImageButton ID="Webimagebutton5" runat="server" Text="Macintosh" AutoSubmit="False"
											UseBrowserDefaults="False">
											<RoundedCorners MaxHeight="23" ImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butMac1.gif"
												MaxWidth="300" HoverImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butMac2.gif"
												RenderingType="FileImages" HeightOfBottomEdge="0" PressedImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butMac4.gif"
												WidthOfRightEdge="13"></RoundedCorners>
											<Appearance>
												<style forecolor="#666666">
													
												</style>
											</Appearance>
										</igtxt:WebImageButton>
									</td>
									<td height="40" class="imgBtn">
										<igtxt:WebImageButton ID="Webimagebutton10" runat="server" Text="WinXP (pixel-TDs)"
											AutoSubmit="False">
											<FocusAppearance>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up2.gif">
												</Image>
											</FocusAppearance>
											<RoundedCorners RenderingType="BordersByTableCells"></RoundedCorners>
											<PressedAppearance>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up3.gif">
												</Image>
											</PressedAppearance>
											<HoverAppearance>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up1.gif">
												</Image>
											</HoverAppearance>
											<Appearance>
												<style font-size="8pt" font-names="Verdana">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/arrow_up.gif">
												</Image>
											</Appearance>
										</igtxt:WebImageButton>
									</td>
									<td valign="middle" align="center" width="110" height="40">
										<igtxt:WebImageButton ID="WebImageButton26" runat="server" Text="<%$ Resources:WebButton, WebButtonStyles_SendReceive %>"
											Width="120px" AutoSubmit="False" UseBrowserDefaults="False" Height="24px">
											<Alignments TextImage="TextRightImageLeft" VerticalImage="Top"></Alignments>
											<FocusAppearance>
												<style borderwidth="1px" bordercolor="Black" borderstyle="Solid">
													
												</style>
											</FocusAppearance>
											<RoundedCorners RenderingType="Disabled"></RoundedCorners>
											<PressedAppearance ContentShift="DownRight">
												<style borderwidth="1px" bordercolor="#256CB4" borderstyle="Solid" backcolor="#92B8E7">
													
												</style>
											</PressedAppearance>
											<HoverAppearance ContentShift="UpLeft">
												<style borderwidth="1px" bordercolor="#256CB4" borderstyle="Solid" backcolor="#BCD7F1">
													
												</style>
											</HoverAppearance>
											<DisabledAppearance>
												<style borderwidth="1px" bordercolor="Black">
													
												</style>
											</DisabledAppearance>
											<Appearance ContentShift="None">
												<style font-size="8pt" font-names="Tahoma" backgroundimage="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/btnOutlook.gif">
													
												</style>
												<Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/sendReceive.gif">
												</Image>
											</Appearance>
										</igtxt:WebImageButton>
									</td>
								</tr>
							</table>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td style="height: 83px">
						</td>
					</tr>
				</table>
				<br />
			</td>
		</tr>
	</table>
</asp:Content>
