<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebButtons_Performance_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="/samplesbrowser/samplescommon/aspnet/Common/webSample_style.css" rel="stylesheet"
        type="text/css" />
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Styles.css" />
    <script type="text/javascript">
			function setFocus(oButton) {
				var edit = $find("<%= WebDateTimeEdit1.ClientID %>");
				if (edit == null) { alert("<%= this.GetGlobalResourceObject("WebButton","WebImageButton_Error1") %>"); return; }
				edit.focus();
			}
			function clickEvt(oButton, oEvent) {
				var edit = $find("<%= WebDateTimeEdit1.ClientID %>");
				if (edit == null) { alert("<%= this.GetGlobalResourceObject("WebButton","WebImageButton_Error1") %>"); return; }
				edit.set_value(new Date());
				var text = "";
				switch (oEvent.action) {
					case "0":
						text = "<%= this.GetGlobalResourceObject("WebButton","WebImageButton_Click1") %>";
						break;
					case "1":
						text = "<%= this.GetGlobalResourceObject("WebButton","WebImageButton_Click2") %>";
						break;
					case "2":
						text = "<%= this.GetGlobalResourceObject("WebButton","WebImageButton_Click3") %>";
						break;
					case "3":
						text = "<%= this.GetGlobalResourceObject("WebButton","WebImageButton_Click3") %>";
						break;
				}
				showEvt(text, "");
			}
			function shiftLeft(oButton) {
				var edit = $find("<%= WebDateTimeEdit1.ClientID %>");
				if (edit == null) { alert("<%= this.GetGlobalResourceObject("WebButton","WebImageButton_Error1") %>"); return; }
				if (!edit.hasFocus())
					edit.focus();
				var start = edit.getSelection(true);
				var end = edit.getSelection(false);
				if (start-- > 0)
					edit.select(start, end);
				else if (end-- > 0)
					edit.select(0, end);
			}
			function shiftRight(oButton) {
				var edit = $find("<%= WebDateTimeEdit1.ClientID%>");
				if (edit == null) { alert("<%= this.GetGlobalResourceObject("WebButton","WebImageButton_Error1") %>"); return; }
				if (!edit.hasFocus())
					edit.focus();
				var start = edit.getSelection(true);
				var end = edit.getSelection(false);
				var len = edit.get_text().length;
				if (end++ < len)
					edit.select(start, end);
				else if (start++ < len)
					edit.select(start, end);
			}
			function spinUp(oButton) {
				var edit = $find("<%= WebDateTimeEdit1.ClientID%>");
				if (edit == null) { alert("<%= this.GetGlobalResourceObject("WebButton","WebImageButton_Error1") %>"); return; }
				var date = edit.get_value();
				if (date == null)
					date = new Date();
				else
					date.setDate(date.getDate() + 1);
				edit.set_value(date);
			}
			function spinDown(oButton) {
				var edit = $find("<%= WebDateTimeEdit1.ClientID%>");
				if (edit == null) { alert("<%= this.GetGlobalResourceObject("WebButton","WebImageButton_Error1") %>"); return; }
				var date = edit.get_value();
				if (date == null)
					date = new Date();
				else
					date.setDate(date.getDate() - 1);
				edit.set_value(date);
			}
			function clearList(oButton) {
				showEvt("", null);
			}
			var count = 0;
			function showEvt(text, id) {
				var output = document.getElementById("<%= OutputEvents.ClientID%>");
				if (output == null)
					return false;
				var checkbox = null;
				// initialization or clear event (reset output text)
				if (id == null)
					output.value = "";
				// click event
				else if (id != "") {
					// mouse/focus/key/paint events
					checkbox = document.getElementById(id);
					if (checkbox == null || !checkbox.checked)
						return false;
				}
				// append text for event
				if (text != "")
					output.value += "\n" + ++count + ". " + text;
				return true;
			}
			function mouseDownEvt(oButton, oEvent) {
			    showEvt("<%= this.GetGlobalResourceObject("WebButton","WebImageButton_MouseDown") %>: \"" + oButton.getID() + "\"", "<%= ShowMouse.ClientID%>");
			}
			function mouseOverEvt(oButton, oEvent) {
			    showEvt("<%= this.GetGlobalResourceObject("WebButton","WebImageButton_MouseOver") %>:", "<%= ShowMouse.ClientID%>");
			}
			function mouseOutEvt(oButton, oEvent) {
			    showEvt("<%= this.GetGlobalResourceObject("WebButton","WebImageButton_MouseOut") %>:", "<%= ShowMouse.ClientID%>");
			}
			function mouseUpEvt(oButton, oEvent) {
			    showEvt("<%= this.GetGlobalResourceObject("WebButton","WebImageButton_MouseUp") %>:", "<%= ShowMouse.ClientID%>");
			}
			function focusEvt(oButton, oEvent) {
			    showEvt("<%= this.GetGlobalResourceObject("WebButton","WebImageButton_FocusOnly") %>: \"" + oButton.getID() + "\"", "<%= ShowFocus.ClientID%>");
			}
			function blurEvt(oButton, oEvent) {
			    showEvt("<%= this.GetGlobalResourceObject("WebButton","WebImageButton_Blur") %>: \"" + oButton.getID() + "\"", "<%= ShowFocus.ClientID%>");
			}
			function keyDownEvt(oButton, oEvent) {
			    showEvt("keydown, keyCode: " + oEvent.event.keyCode, "<%= ShowKey.ClientID%>");
			}
			function keyUpEvt(oButton, oEvent) {
			    showEvt("keyup, keyCode: " + oEvent.event.keyCode, "<%= ShowKey.ClientID%>");
			}
			function initEvt(oButton) {
				showEvt("<%= this.GetGlobalResourceObject("WebButton","WebImageButton_Initialize") %>: \"" + oButton.getID() + "\", <%= this.GetGlobalResourceObject("WebButton", "WebImageButton_Text") %>:\" " + oButton.getText() + "\"", null);
			}
			function paintEvt(oButton, oEvent) {
				var text = "<%= this.GetGlobalResourceObject("WebButton","WebImageButton_Paint") %> "
				var backColor = "";
				var imgColor = "";
				var border = "";
				switch (oButton.getState()) {
					case 0:
						text += "<%= this.GetGlobalResourceObject("WebButton","WebImageButton_NormalState") %>";
						backColor = "#ccccff";
						imgColor = "";
						border = "1px solid #9999ff";
						break;
					case 1:
						text += "<%= this.GetGlobalResourceObject("WebButton","WebImageButton_MouseOverState") %>";
						backColor = "#999966";
						imgColor = "#cccc99";
						border = "1px solid #666633";
						break;
					case 2:
						text += "<%= this.GetGlobalResourceObject("WebButton","WebImageButton_FocusState") %>";
						backColor = "#993300";
						imgColor = "#cc6633";
						border = "1px dotted #663300";
						break;
					case 3:
						text += "<%= this.GetGlobalResourceObject("WebButton","WebImageButton_MouseOverFocusState") %>";
						backColor = "#FFCC33";
						imgColor = "#CC9933";
						border = "1px dotted #000000";
						break;
					case 4:
						text += "<%= this.GetGlobalResourceObject("WebButton","WebImageButton_PressedState") %>";
						backColor = "999999";
						imgColor = "#cccccc";
						border = "1px solid black";
						break;
					case 5:
						text += "<%= this.GetGlobalResourceObject("WebButton","WebImageButton_DisabledState") %>";
						break;
				}
			    var usePaint = showEvt(text, "<%= UsePaint.ClientID%>");
				var elem = document.getElementById("ParentOfSetToday");
				if (elem == null)
					return;
				var span = oButton.getElementAt(3);
				var img = oButton.getElementAt(4);
				if (!usePaint) {
					if (elem.style.backgroundColor == "")
						return;
					else {
						backColor = imgColor = "";
						border = "0";
					}
				}
				elem.style.backgroundColor = backColor;
				if (span != null) {
					span.style.border = border;
					span.style.marginLeft = "5px";
				}
				if (img != null)
					img.style.backgroundColor = imgColor;
			}
			var modCount = 0;
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="Table2" cellspacing="5" cellpadding="0" width="100%" border="0">
        <tr>
            <td>
                <br />
                <br />
                <table id="Table1" cellspacing="3" cellpadding="3" width="100%" border="0">
                    <tr>
                        <td align="right" colspan="3" rowspan="2">
                            <ig:WebDateTimeEditor ID="WebDateTimeEdit1" runat="server" Width="175px" Height="25px"
                                EditModeFormat="g" HorizontalAlign="Right">
                            </ig:WebDateTimeEditor>
                        </td>
                        <td valign="bottom" style="border-bottom: #cccccc 1px solid">
                            <igtxt:WebImageButton ID="WebImageButton2" runat="server" Focusable="False" AutoSubmit="False"
                                UseBrowserDefaults="False">
                                <ClientSideEvents Click="spinUp"></ClientSideEvents>
                                <PressedAppearance>
                                    <Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/up1.gif"></Image>
                                </PressedAppearance>
                                <HoverAppearance>
                                    <style cursor="Hand">
                                        
                                    </style>
                                    <Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/up2.gif"></Image>
                                </HoverAppearance>
                                <Appearance>
                                    <Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/up.gif"></Image>
                                </Appearance>
                            </igtxt:WebImageButton>
                        </td>
                        <td style="padding-left: 15px; border-left: #cccccc 1px solid" rowspan="6" valign="top"
                            width="100%">
                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:WebButton, WebImageButton_Output %>"></asp:Label><br />
                            <asp:TextBox ID="OutputEvents" runat="server" Width="325px" Height="275px" Rows="18"
                                EnableViewState="False" Wrap="False" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <igtxt:WebImageButton ID="WebImageButton1" runat="server" Focusable="False" AutoSubmit="False"
                                UseBrowserDefaults="False">
                                <ClientSideEvents Click="spinDown"></ClientSideEvents>
                                <PressedAppearance>
                                    <Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/down1.gif">
                                    </Image>
                                </PressedAppearance>
                                <HoverAppearance>
                                    <style cursor="Hand">
                                        
                                    </style>
                                    <Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/down2.gif">
                                    </Image>
                                </HoverAppearance>
                                <Appearance>
                                    <Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/down.gif">
                                    </Image>
                                </Appearance>
                            </igtxt:WebImageButton>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <igtxt:WebImageButton ID="WebImageButton3" runat="server" Width="150px" Focusable="False"
                                AutoSubmit="False" UseBrowserDefaults="False" Text="<%$ Resources:WebButton, WebImageButton_ShiftSelectionLeft %>"
                                ToolTip="<%$ Resources:WebButton, WebImageButton_ShiftSelectionLeftToolTip %>">
                                <Alignments TextImage="TextRightImageLeft"></Alignments>
                                <ClientSideEvents Click="shiftLeft"></ClientSideEvents>
                                <RoundedCorners MaxHeight="80" ImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP1o.gif"
                                    MaxWidth="400" HoverImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP2o.gif"
                                    RenderingType="FileImages" PressedImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP4o.gif"
                                    DisabledImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP5o.gif"
                                    FocusImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP3o.gif">
                                </RoundedCorners>
                                <PressedAppearance>
                                    <Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/left1.gif">
                                    </Image>
                                </PressedAppearance>
                                <Appearance>
                                    <style font-size="8pt" font-names="Verdana">
                                        <Padding Top="5px" Right="5px">
                                        </Padding>
									</style>
                                </Appearance>
                            </igtxt:WebImageButton>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <igtxt:WebImageButton ID="WebImageButton4" runat="server" Width="150px" Focusable="False"
                                AutoSubmit="False" UseBrowserDefaults="False" Text="<%$ Resources:WebButton, WebImageButton_ShiftSelectionRight %>"
                                ToolTip="<%$ Resources:WebButton, WebImageButton_ShiftSelectionRightToolTip %>">
                                <Alignments TextImage="TextLeftImageRight"></Alignments>
                                <ClientSideEvents Click="shiftRight"></ClientSideEvents>
                                <RoundedCorners MaxHeight="80" ImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP1o.gif"
                                    MaxWidth="400" HoverImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP2o.gif"
                                    RenderingType="FileImages" PressedImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP4o.gif"
                                    DisabledImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP5o.gif"
                                    FocusImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP3o.gif">
                                </RoundedCorners>
                                <PressedAppearance>
                                    <Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/right1.gif">
                                    </Image>
                                </PressedAppearance>
                                <Appearance>
                                    <style font-size="8pt" font-names="Verdana">
                                        <Padding Top="5px" Right="5px">
                                        </Padding>
									</style>
                                </Appearance>
                            </igtxt:WebImageButton>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <igtxt:WebImageButton ID="WebImageButton5" AccessKey="o" runat="server" Width="95px"
                                Height="45px" Focusable="False" AutoSubmit="False" UseBrowserDefaults="False"
                                Text="<%$ Resources:WebButton, WebImageButton_SetFocus %>" ToolTip="<%$ Resources:WebButton, WebImageButton_SetFocusToolTip %>">
                                <Alignments TextImage="ImageBottom"></Alignments>
                                <ClientSideEvents Click="setFocus"></ClientSideEvents>
                                <RoundedCorners MaxHeight="80" ImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP1wh.gif"
                                    MaxWidth="400" HoverImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP2wh.gif"
                                    RenderingType="FileImages" PressedImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP4wh.gif"
                                    DisabledImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP5wh.gif"
                                    FocusImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP3wh.gif">
                                </RoundedCorners>
                                <Appearance>
                                    <style font-size="8pt" font-names="Verdana">
                                        
                                    </style>
                                    <Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/bell.gif">
                                    </Image>
                                </Appearance>
                            </igtxt:WebImageButton>
                        </td>
                        <td>
                        </td>
                        <td id="ParentOfSetToday_old" valign="top" align="left" colspan="1" rowspan="2" style="border-left: #cccccc 1px solid">
                            <font style="font-weight: normal; color: blue" color="#000000">
								<asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebButton, WebImageButton_SelectLabel %>"></asp:Label>
							</font>
                            <hr width="100%" size="1">
                            <asp:CheckBox ID="UsePaint" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="<%$ Resources:WebButton, WebImageButton_Paint %>"
                                ToolTip="<%$ Resources:WebButton, WebImageButton_PaintToolTip %>"></asp:CheckBox><br />
                            <asp:CheckBox ID="ShowMouse" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                Text="<%$ Resources:WebButton, WebImageButton_Mouse %>" ToolTip="<%$ Resources:WebButton, WebImageButton_MouseToolTip %>">
                            </asp:CheckBox><br />
                            <asp:CheckBox ID="ShowKey" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="<%$ Resources:WebButton, WebImageButton_Key %>"
                                ToolTip="<%$ Resources:WebButton, WebImageButton_KeyToolTip %>"></asp:CheckBox><br />
                            <span style="white-space:nowrap">
                            <asp:CheckBox ID="ShowFocus" runat="server" Font-Names="Verdana" Font-Size="8pt" 
                                Text="<%$ Resources:WebButton, WebImageButton_Focus %>" ToolTip="<%$ Resources:WebButton, WebImageButton_FocusToolTip %>">
                            </asp:CheckBox></span><br />
                            <br />
                            <igtxt:WebImageButton ID="ClearList" runat="server" Focusable="False" AutoSubmit="False"
                                UseBrowserDefaults="False" Text="<%$ Resources:WebButton, WebImageButton_ClearList %>"
                                ToolTip="<%$ Resources:WebButton, WebImageButton_ClearListToolTip %>">
                                <ClientSideEvents Click="clearList"></ClientSideEvents>
                                <RoundedCorners MaxHeight="80" ImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP1wh.gif"
                                    MaxWidth="400" HoverImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP2wh.gif"
                                    RenderingType="FileImages" PressedImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP4wh.gif"
                                    DisabledImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP5wh.gif"
                                    FocusImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP3wh.gif">
                                </RoundedCorners>
                                <Appearance>
                                    <style font-size="8pt" font-names="Verdana">
                                        <Padding Top="4px" Right="6px">
                                            </Padding>
									</style>
                                </Appearance>
                            </igtxt:WebImageButton>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td id="ParentOfSetToday" valign="top" align="center">
                            <igtxt:WebImageButton ID="WebImageButton6" AccessKey="s" runat="server" Width="95px"
                                Height="45px" AutoSubmit="False" UseBrowserDefaults="False" Text="<%$ Resources:WebButton, WebImageButton_SetToday %>"
                                ToolTip="<%$ Resources:WebButton, WebImageButton_SetTodayToolTip %>">
                                <Alignments TextImage="ImageBottom"></Alignments>
                                <ClientSideEvents KeyDown="keyDownEvt" Paint="paintEvt" KeyUp="keyUpEvt" MouseUp="mouseUpEvt"
                                    Focus="focusEvt" Click="clickEvt" MouseDown="mouseDownEvt" Blur="blurEvt" Initialize="initEvt"
                                    MouseOut="mouseOutEvt" MouseOver="mouseOverEvt"></ClientSideEvents>
                                <RoundedCorners MaxHeight="80" ImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP1wh.gif"
                                    MaxWidth="400" HoverImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP2wh.gif"
                                    RenderingType="FileImages" PressedImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP4wh.gif"
                                    DisabledImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP5wh.gif"
                                    FocusImageUrl="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/ig_butXP3wh.gif">
                                </RoundedCorners>
                                <HoverAppearance>
                                    <Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/plus2.gif">
                                    </Image>
                                </HoverAppearance>
                                <Appearance>
                                    <style font-size="8pt" font-names="Verdana">
                                        
                                    </style>
                                    <Image Url="/samplesbrowser/samplescommon/aspnet/Common/Button-Styles/plus.gif">
                                    </Image>
                                </Appearance>
                            </igtxt:WebImageButton>
                        </td>
                        <td>
                        </td>
                        <td valign="top" align="left">
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBodyPlaceHolder" runat="Server">
</asp:Content>
