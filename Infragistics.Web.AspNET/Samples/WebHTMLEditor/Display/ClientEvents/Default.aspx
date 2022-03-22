<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
	CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
	<ig:HtmlLink runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
	<ig:HtmlLink runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/webSample_style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<style type="text/css">
		.igeb_IGItemActive
		{
			background-color: transparent;
			color: Black;
		}
		
		.igeb_IGItem
		{
			font-size: small;
			padding-left:5px;
		}

	</style>
	<p>
		<asp:Label ID="Label2" runat="server" Text="<%$ Resources:WebHTMLEditor, TryTheFollowing %>"></asp:Label>
	</p>
	<ol style="margin-left: 25px;">
		<li>
			<asp:Label ID="Label14" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Description2 %>"></asp:Label></li>
		<li>
			<asp:Label ID="Label15" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Description3 %>"></asp:Label></li>
		<li>
			<asp:Label ID="Label16" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Description4 %>"></asp:Label></li>
		<li>
			<asp:Label ID="Label17" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Description5 %>"></asp:Label></li>
		<li>
			<asp:Label ID="Label18" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Description6 %>"></asp:Label>
		</li>
	</ol>
	<br />
    <div id="contentWrapperDiv" class="contentWrapperClass">
	    <table id="Table1" style="width: 100%; height: 100%" cellspacing="5" cellpadding="0"
		    border="0">
		    <tbody>
			    <tr valign="top">
				    <td style="padding-right: 10px;" align="left">
					    <ighedit:WebHtmlEditor UploadedFilesDirectory="/SamplesBrowser/Temp/Uploads" LocalizationFile="<%$ Resources:WebHTMLEditor, LocalizationFilePath %>"
						    ImageDirectory="/SamplesBrowser/SamplesCommon/aspnet/WebHtmlEditor/Display/ClientEvents"
						    ID="WebHtmlEditor1" runat="server" Height="250px" Width="100%" FontSizeList="1,2,3,4,5,6,7"
						    FontStyleList="Blue Underline=color:blue;text-decoration:underline;&amp;Red Bold=color:red;font-weight:bold;&amp;ALL CAPS=text-transform:uppercase;&amp;all lowercase=text-transform:lowercase;&amp;Reset="
						    FontNameList="Arial,Verdana,Tahoma,Courier New,Georgia" SpecialCharacterList="O,S,?,F,G,?,?,T,?,?,?,ｵ,?,f,?,e,?,d,?,?,ﾟ,p,s,ﾟ,,ﾞ,・?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,ﾆ,ﾅ,ﾇ,ﾐ,ﾑ,ﾖ,・・・・・・・・・｢,｣,､,･,?,・ｩ,ｮ,・@,・｡,&#14;,&#18;,&#24;,&#26;,&#27;,ｦ,ｧ,ｨ,ｪ,ｬ,ｯ,ｶ,ｰ,ｱ,ｫ,ｻ,ｷ,ｸ,ｺ,ｹ,ｲ,ｳ,ｼ,ｽ,ｾ,ｿ,ﾗ,・"
						    FontFormattingList="Heading 1=<h1>&amp;Heading 2=<h2>&amp;Heading 3=<h3>&amp;Heading 4=<h4>&amp;Heading 5=<h5>&amp;Normal=<p>">
						    <ClientSideEvents Blur="WebHtmlEditor1_Blur" Initialize="WebHtmlEditor1_Initialize"
							    AfterAction="WebHtmlEditor1_AfterAction" KeyPress="WebHtmlEditor1_KeyPress" KeyDown="WebHtmlEditor1_KeyDown"
							    Focus="WebHtmlEditor1_Focus" BeforeAction="WebHtmlEditor1_BeforeAction"></ClientSideEvents>
						    <DialogStyle Font-Size="8pt" Font-Names="sans-serif" BorderWidth="1px" ForeColor="Black"
							    BorderStyle="Solid" BorderColor="Black" BackColor="#ECE9D8"></DialogStyle>
						    <Toolbar>
							    <ighedit:ToolbarImage Type="DoubleSeparator"></ighedit:ToolbarImage>
							    <ighedit:ToolbarButton Type="Bold"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="Italic"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="Underline"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="Strikethrough"></ighedit:ToolbarButton>
							    <ighedit:ToolbarImage Type="Separator"></ighedit:ToolbarImage>
							    <ighedit:ToolbarButton Type="Subscript"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="Superscript"></ighedit:ToolbarButton>
							    <ighedit:ToolbarImage Type="Separator"></ighedit:ToolbarImage>
							    <ighedit:ToolbarButton Type="Cut"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="Copy"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="Paste"></ighedit:ToolbarButton>
							    <ighedit:ToolbarImage Type="Separator"></ighedit:ToolbarImage>
							    <ighedit:ToolbarButton Type="Undo"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="Redo"></ighedit:ToolbarButton>
							    <ighedit:ToolbarImage Type="Separator"></ighedit:ToolbarImage>
							    <ighedit:ToolbarButton Type="JustifyLeft"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="JustifyCenter"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="JustifyRight"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="JustifyFull"></ighedit:ToolbarButton>
							    <ighedit:ToolbarImage Type="Separator"></ighedit:ToolbarImage>
							    <ighedit:ToolbarButton Type="Indent"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="Outdent"></ighedit:ToolbarButton>
							    <ighedit:ToolbarImage Type="Separator"></ighedit:ToolbarImage>
							    <ighedit:ToolbarButton Type="UnorderedList"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="OrderedList"></ighedit:ToolbarButton>
							    <ighedit:ToolbarImage Type="Separator"></ighedit:ToolbarImage>
							    <ighedit:ToolbarDialogButton Type="InsertRule">
								    <Dialog Strings="" InternalDialogType="InsertRule"></Dialog>
							    </ighedit:ToolbarDialogButton>
							    <ighedit:ToolbarImage Type="Separator"></ighedit:ToolbarImage>
							    <ighedit:ToolbarButton Type="Custom" ToolTip="Tooltip for Custom Button"></ighedit:ToolbarButton>
							    <ighedit:ToolbarDialogButton Type="Custom" ToolTip="Tooltip for Custom Dialog">
								    <Dialog Strings="" InternalDialogType="Text" Caption="Custom Title"></Dialog>
							    </ighedit:ToolbarDialogButton>
							    <ighedit:ToolbarImage Type="RowSeparator"></ighedit:ToolbarImage>
							    <ighedit:ToolbarImage Type="DoubleSeparator"></ighedit:ToolbarImage>
							    <ighedit:ToolbarDialogButton Type="FontColor">
								    <Dialog BorderStyle="Solid" BackColor="#ECE9D8" ForeColor="Black" Strings="" BorderWidth="1px"
									    BorderColor="Black" Font-Size="8pt" Font-Names="sans-serif"></Dialog>
							    </ighedit:ToolbarDialogButton>
							    <ighedit:ToolbarDialogButton Type="FontHighlight">
								    <Dialog BorderStyle="Solid" BackColor="#ECE9D8" ForeColor="Black" Strings="" BorderWidth="1px"
									    BorderColor="Black" Font-Size="8pt" Font-Names="sans-serif"></Dialog>
							    </ighedit:ToolbarDialogButton>
							    <ighedit:ToolbarDialogButton Type="SpecialCharacter">
								    <Dialog Strings="" InternalDialogType="SpecialCharacterPicker" Type="InternalWindow">
								    </Dialog>
							    </ighedit:ToolbarDialogButton>
							    <ighedit:ToolbarMenuButton Type="InsertTable">
								    <Menu Width="80px">
									    <ighedit:HtmlBoxMenuItem Act="TableProperties">
										    <Dialog Strings="" InternalDialogType="InsertTable"></Dialog>
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="InsertColumnRight">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="InsertColumnLeft">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="InsertRowAbove">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="InsertRowBelow">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="DeleteRow">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="DeleteColumn">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="IncreaseColspan">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="DecreaseColspan">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="IncreaseRowspan">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="DecreaseRowspan">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="CellProperties">
										    <Dialog Strings="" InternalDialogType="CellProperties"></Dialog>
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="TableProperties">
										    <Dialog Strings="" InternalDialogType="ModifyTable"></Dialog>
									    </ighedit:HtmlBoxMenuItem>
								    </Menu>
							    </ighedit:ToolbarMenuButton>
							    <ighedit:ToolbarButton Type="ToggleBorders"></ighedit:ToolbarButton>
							    <ighedit:ToolbarImage Type="Separator"></ighedit:ToolbarImage>
							    <ighedit:ToolbarButton Type="InsertLink"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="RemoveLink"></ighedit:ToolbarButton>
							    <ighedit:ToolbarImage Type="Separator"></ighedit:ToolbarImage>
							    <ighedit:ToolbarButton Type="Save" RaisePostback="True"></ighedit:ToolbarButton>
							    <ighedit:ToolbarUploadButton Type="Open">
								    <Upload UploadEnabled="false" Filter="*.htm,*.html,*.asp,*.aspx" Height="350px" Mode="File"
									    Width="500px" Strings=""></Upload>
							    </ighedit:ToolbarUploadButton>
							    <ighedit:ToolbarButton Type="Preview"></ighedit:ToolbarButton>
							    <ighedit:ToolbarImage Type="Separator"></ighedit:ToolbarImage>
							    <ighedit:ToolbarDialogButton Type="FindReplace">
								    <Dialog UploadEnabled="false" Strings="" InternalDialogType="FindReplace"></Dialog>
							    </ighedit:ToolbarDialogButton>
							    <ighedit:ToolbarDialogButton Type="InsertBookmark">
								    <Dialog Strings="" InternalDialogType="InsertBookmark"></Dialog>
							    </ighedit:ToolbarDialogButton>
							    <ighedit:ToolbarUploadButton Type="InsertImage">
								    <Upload UploadEnabled="false" Height="420px" Width="500px" Strings=""></Upload>
							    </ighedit:ToolbarUploadButton>
							    <ighedit:ToolbarUploadButton Type="InsertFlash">
								    <Upload UploadEnabled="false" Filter="*.swf" Height="440px" Mode="Flash" Width="500px"
									    Strings=""></Upload>
							    </ighedit:ToolbarUploadButton>
							    <ighedit:ToolbarUploadButton Type="InsertWindowsMedia">
								    <Upload UploadEnabled="false" Filter="*.asf,*.wma,*.wmv,*.wm,*.avi,*.mpg,*.mpeg,*.m1v,*.mp2,*.mp3,*.mpa,*.mpe,*.mpv2,*.m3u,*.mid,*.midi,*.rmi,*.aif,*.aifc,*.aiff,*.au,*.snd,*.wav,*.cda,*.ivf"
									    Height="400px" Mode="WindowsMedia" Width="500px" Strings=""></Upload>
							    </ighedit:ToolbarUploadButton>
							    <ighedit:ToolbarDialogButton Type="Help">
								    <Dialog Strings="" InternalDialogType="Text"></Dialog>
							    </ighedit:ToolbarDialogButton>
							    <ighedit:ToolbarButton Type="CleanWord"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="WordCount"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="PasteHtml"></ighedit:ToolbarButton>
							    <ighedit:ToolbarMenuButton Type="Zoom">
								    <Menu Width="180px">
									    <ighedit:HtmlBoxMenuItem Act="Zoom25">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="Zoom50">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="Zoom75">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="Zoom100">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="Zoom200">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="Zoom300">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="Zoom400">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="Zoom500">
									    </ighedit:HtmlBoxMenuItem>
									    <ighedit:HtmlBoxMenuItem Act="Zoom600">
									    </ighedit:HtmlBoxMenuItem>
								    </Menu>
							    </ighedit:ToolbarMenuButton>
							    <ighedit:ToolbarButton Type="TogglePositioning"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="BringForward"></ighedit:ToolbarButton>
							    <ighedit:ToolbarButton Type="SendBackward"></ighedit:ToolbarButton>
							    <ighedit:ToolbarImage Type="RowSeparator"></ighedit:ToolbarImage>
							    <ighedit:ToolbarImage Type="DoubleSeparator"></ighedit:ToolbarImage>
							    <ighedit:ToolbarDropDown Type="FontName">
							    </ighedit:ToolbarDropDown>
							    <ighedit:ToolbarDropDown Type="FontSize">
							    </ighedit:ToolbarDropDown>
							    <ighedit:ToolbarDropDown Type="FontFormatting">
							    </ighedit:ToolbarDropDown>
							    <ighedit:ToolbarDropDown Type="FontStyle">
							    </ighedit:ToolbarDropDown>
							    <ighedit:ToolbarDropDown Type="Insert">
								    <Items>
									    <ighedit:ToolbarDropDownItem Act="Greeting"></ighedit:ToolbarDropDownItem>
									    <ighedit:ToolbarDropDownItem Act="Signature"></ighedit:ToolbarDropDownItem>
								    </Items>
							    </ighedit:ToolbarDropDown>
							    <ighedit:ToolbarDropDown Type="Custom" ToolTip="Tooltip for Custom DropDown">
								    <Items>
									    <ighedit:ToolbarDropDownItem Value="CustomValue1" Text="CustomText1"></ighedit:ToolbarDropDownItem>
									    <ighedit:ToolbarDropDownItem Value="CustomValue2" Text="CustomText2"></ighedit:ToolbarDropDownItem>
								    </Items>
							    </ighedit:ToolbarDropDown>
						    </Toolbar>
						    <RightClickMenu>
							    <ighedit:HtmlBoxMenuItem Act="Cut">
							    </ighedit:HtmlBoxMenuItem>
							    <ighedit:HtmlBoxMenuItem Act="Copy">
							    </ighedit:HtmlBoxMenuItem>
							    <ighedit:HtmlBoxMenuItem Act="Paste">
							    </ighedit:HtmlBoxMenuItem>
							    <ighedit:HtmlBoxMenuItem Act="PasteHtml">
							    </ighedit:HtmlBoxMenuItem>
							    <ighedit:HtmlBoxMenuItem Act="CellProperties">
								    <Dialog Strings="" InternalDialogType="CellProperties"></Dialog>
							    </ighedit:HtmlBoxMenuItem>
							    <ighedit:HtmlBoxMenuItem Act="TableProperties">
								    <Dialog Strings="" InternalDialogType="ModifyTable"></Dialog>
							    </ighedit:HtmlBoxMenuItem>
							    <ighedit:HtmlBoxMenuItem Act="InsertImage">
							    </ighedit:HtmlBoxMenuItem>
						    </RightClickMenu>
					    </ighedit:WebHtmlEditor>
					    <br>
					    <span class="header">
						    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Header_2 %>"></asp:Label>
					    </span>
					    <br>
					    <br>
					    <textarea unselectable="on" id="outputEvent" style="border: solid 1px #CCCCCC; font-size: 10px;
						    width: 100%; font-family: arial; height: 150px; padding-left: 10px; padding-top: 10px;"></textarea>
				    </td>
				    <td style="width: 200px;" align="left">
					    <ig:WebExplorerBar ID="ActionListPanel" runat="server" EnableHotTracking="false"
						    EnableSelection="false" Width="200px">
						    <Groups>
							    <ig:ExplorerBarGroup Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label1 %>" Expanded="true">
								    <Items>
									    <ig:ExplorerBarItem>
										    <Template>
											    <a href="javascript:clearListClick()">
												    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label2 %>"></asp:Label></a><br>
											    <a href="javascript:clearTextClick()">
												    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label3 %>"></asp:Label></a><br>
											    <a href="javascript:getTextClick()">
												    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label4 %>"></asp:Label></a><br>
											    <a href="javascript:imageClick()">
												    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label5 %>"></asp:Label></a><br>
											    <a href="javascript:tableClick()">
												    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label6 %>"></asp:Label></a><br>
										    </Template>
									    </ig:ExplorerBarItem>
								    </Items>
							    </ig:ExplorerBarGroup>
							    <ig:ExplorerBarGroup Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label7 %>" Expanded="true">
								    <Items>
									    <ig:ExplorerBarItem>
										    <Template>
											    <table align="center" id="Table2" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
												    height: 90%; padding: 0px;">
												    <tr>
													    <td>
														    <asp:CheckBox ID="BeforeAct" Checked="true" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label8 %>"
															    Font-Names="Verdana" Font-Size="8pt"></asp:CheckBox>
													    </td>
												    </tr>
												    <tr>
													    <td>
														    <asp:CheckBox ID="AfterAct" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label9 %>"
															    Font-Names="Verdana" Font-Size="8pt"></asp:CheckBox>
													    </td>
												    </tr>
												    <tr>
													    <td>
														    <asp:CheckBox ID="KeyDownPress" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label10 %>"
															    Font-Names="Verdana" Font-Size="8pt"></asp:CheckBox>
													    </td>
												    </tr>
												    <tr>
													    <td>
														    <asp:CheckBox ID="FocusBlur" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label11 %>"
															    Font-Names="Verdana" Font-Size="8pt"></asp:CheckBox>
													    </td>
												    </tr>
											    </table>
										    </Template>
									    </ig:ExplorerBarItem>
								    </Items>
							    </ig:ExplorerBarGroup>
							    <ig:ExplorerBarGroup Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label12 %>" Expanded="true">
								    <Items>
									    <ig:ExplorerBarItem>
										    <Template>
											    <table align="center" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
												    height: 95%">
												    <tr>
													    <td>
														    <asp:CheckBox ID="CancelAll" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label13 %>"
															    Font-Names="Verdana" Font-Size="8pt" ToolTip="Cancel all events (actions and keys)">
														    </asp:CheckBox>
													    </td>
												    </tr>
												    <tr>
													    <td>
														    <asp:CheckBox ID="CancelFont" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label14 %>"
															    Font-Names="Verdana" Font-Size="8pt" ToolTip="Cancel opening FontName drop-down.">
														    </asp:CheckBox>
													    </td>
												    </tr>
												    <tr>
													    <td>
														    <asp:CheckBox ID="CancelPost" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label15 %>"
															    Font-Names="Verdana" Font-Size="8pt" ToolTip="Cancel default postback action. It is Save button.">
														    </asp:CheckBox>
													    </td>
												    </tr>
												    <tr>
													    <td>
														    <asp:CheckBox ID="ModifyKeyPress" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label16 %>"
															    Font-Names="Verdana" Font-Size="8pt" ToolTip="Increment keyCode by 1. Not all browsers may support that feature.">
														    </asp:CheckBox>
													    </td>
												    </tr>
												    <tr>
													    <td>
														    <asp:CheckBox ID="ModifyKeyDown" runat="server" Text="<%$ Resources:WebHTMLEditor, ClientEvents_Label17 %>"
															    Font-Names="Verdana" Font-Size="8pt" ToolTip="Increment keyCode by 1. Result can be confusing and not all browsers may support that feature.">
														    </asp:CheckBox>
													    </td>
												    </tr>
											    </table>
										    </Template>
									    </ig:ExplorerBarItem>
								    </Items>
							    </ig:ExplorerBarGroup>
						    </Groups>
					    </ig:WebExplorerBar>
				    </td>
			    </tr>
			    <tr>
				    <td valign="top" style="height: 100%;" colspan="2">
				    </td>
			    </tr>
		    </tbody>
	    </table>
    </div>
	<script type="text/javascript"><!--
		//Handle the Initialization Event.  We'll just log it for now, but this can be used for any custom
		//Initializtion required for your project.
		function WebHtmlEditor1_Initialize(oEditor) {
			/* Setting up some styles */
			document.getElementById("Font").className = "resetFont";
			document.getElementById("Size").className = "resetFont";
			document.getElementById("Formatting").className = "resetFont";
			document.getElementById("Style").className = "resetFont";
			document.getElementById("Insert").className = "resetFont";
			document.getElementById("CustomDropDown").className = "resetFont";

			showEvent(0, '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_Initialize1") %>' + oEditor.ID + '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_Initialize2") %>');
		}

		//This event is fired after any action is performed on the HTML Editor, and cannot be cancelled.  
		//Note: parameters p4,p5,p6,p7,p8 are not public, and are subject to change in future releases.
		function WebHtmlEditor1_AfterAction(oEditor, actID, oEvent, p4, p5, p6, p7, p8) {
			showEvent(2, "AfterAction actID=\"" + actID + "\"");
		}

		// global variables used by logic in a WebHtmlEditor1_BeforeAction
		var lastDialogID = null;
		var isKnownDialog = false;
		var lastAct = null;

		//This event is fired before an action is executed.  This event can be cancelled.
		//Note: The implementation below shows an advanced use of undocumented parameters 
		//(parameters p4,p5,p6,p7,p8 are not public, and are subject to change in future releases)
		//Because these parameters are undocumented and may change in the future, 
		//you should only use them with the understanding that backwards compatibility is not guaranteed.
		function WebHtmlEditor1_BeforeAction(oEditor, actID, oEvent, p4, p5, p6, p7, p8) {
			var str = "";
			//---------------------
			// try to get which pop-up window was closed and how it was closed
			if (actID == "ClosePopup") {
				//---------------------
				// test for known dialogs
				if (lastDialogID) {
					if (lastAct == "FindReplace")
						str = '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_Closed1") %>';
					else
						str = '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_Clicked1") %>' + lastDialogID + '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_Clicked2") %>';
				}
				else if (isKnownDialog) {
					if (p4 && p4.length > 2)
						str = '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_Clicked3") %>' + lastAct + '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_Clicked4") %>';
					else
						str = '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_Closed2") %>' + lastAct + '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_Closed3") %>';
				}
				else if (lastAct)
				//---------------------
				// all other drop-downs
					str = '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_Closed4") %>' + lastAct + '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_Closed5") %>';
				lastAct = null;
			}
			//----------------------
			// FindReplace dialog has several actions and
			// dialog is not closed automatically on those actions
			// so, do not reset value of lastAct.
			else if (lastAct != "FindReplace")
				lastAct = actID;
			isKnownDialog = false;
			if (actID == "InsertRule" || actID == "InsertBookmark" || actID == "FindReplace" ||
					actID == "CellProperties" || actID == "TableProperties" || actID == "InsertLink" || actID == "Help")
				isKnownDialog = true;
			if (isKnownDialog)
				str = '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_TitleOnDialog1") %>' + p4 + '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_TitleOnDialog2") %>';
			if (actID.indexOf("Dialog") > 3)
				lastDialogID = actID;
			else
				lastDialogID = null;
			if (p6 == "select")
				str = '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_ItemWasSelected1") %>' + p5 + '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_ItemWasSelected2") %>';
			showEvent(1, "BeforeAction actID=\"" + actID + "\"" + str);
			cancelEditorEvent(actID, oEvent);
		}

		//This function acts as our Event Filter, based on the checked items in the "EventOptions" panel.
		function cancelEditorEvent(actID, oEvent, key) {

		    var eCancel = document.getElementById('<%= ActionListPanel.ClientID %>' + '_tree_2_0_CancelAll');
			if (!eCancel) return;
			//-------------------
			// cancel all events
			if (eCancel.checked)
				oEvent.cancel = true;
			var eCancelFont = document.getElementById('<%= ActionListPanel.ClientID %>' + '_tree_2_0_CancelFont');
			//-------------------
			// cancel FontName event
			if (eCancelFont && eCancelFont.checked && actID == "FontName")
				oEvent.cancel = true;
			var eCancelPost = document.getElementById('<%= ActionListPanel.ClientID %>' + '_tree_2_0_CancelPost');
			//-------------------
			// cancel postback
			if (eCancelPost && eCancelPost.checked)
				oEvent.cancelPostBack = true;
			var eModifyKeyDown = document.getElementById('<%= ActionListPanel.ClientID %>' + '_tree_2_0_ModifyKeyDown');

			//Modify keydown event
			//This is done simply for demonstration purposes.
			//In a real world application, you would likely only be changing a single key, to have a specific meaning.
			if (key && eModifyKeyDown && eModifyKeyDown.checked && actID == "KeyDown") {
				oEvent.key = key + 1;
			}

			var eModifyKeyPress = document.getElementById('<%= ActionListPanel.ClientID %>' + '_tree_2_0_ModifyKeyPress');

			//-------------------
			// Modify keydown event
			//This is done simply for demonstration purposes.
			//In a real world application, you would likely only be changing a single key, to have a specific meaning.
			if (key && eModifyKeyPress && eModifyKeyPress.checked && actID == "KeyPress") {
				oEvent.key = key + 1;
			}
		}
		function WebHtmlEditor1_Blur(oEditor, dummy, oEvent) {
			showEvent(3, "Blur");
		}
		function WebHtmlEditor1_Focus(oEditor, dummy, oEvent) {
			showEvent(3, "Focus");
		}
		function WebHtmlEditor1_KeyDown(oEditor, keyCode, oEvent) {
			showEvent(4, "KeyDown keyCode=" + keyCode);
			cancelEditorEvent("KeyDown", oEvent, keyCode);
		}
		function WebHtmlEditor1_KeyPress(oEditor, keyCode, oEvent) {
			showEvent(4, "KeyPress keyCode=" + keyCode);
			cancelEditorEvent("KeyPress", oEvent, keyCode);
		}
		var iEventCount = 0;
		function showEvent(type, text) {
			var e, id = null;
			switch (type) {
			    case 1: id = '<%= ActionListPanel.ClientID %>' + '_tree_1_0_BeforeAct'; break;
				case 2: id = '<%= ActionListPanel.ClientID %>' + '_tree_1_0_AfterAct'; break;
				case 3: id = '<%= ActionListPanel.ClientID %>' + '_tree_1_0_FocusBlur'; break;
				case 4: id = '<%= ActionListPanel.ClientID %>' + '_tree_1_0_KeyDownPress'; break;
			}
			if (id) {
				e = document.getElementById(id);
				if (e && !e.checked)
					return;
			}
			e = document.getElementById("outputEvent");
			if (!e) return;
			e.value += ++iEventCount + ": " + text + "\n";
		}
		function clearListClick() {
			var e = document.getElementById("outputEvent");
			if (!e) return;
			e.value = "";
		}
		function clearTextClick() {
		    var edit = iged_getById('<%= WebHtmlEditor1.ClientID %>');
			if (!edit) return;
			edit.setText("");
		}
		function getTextClick() {
		    var edit = iged_getById('<%= WebHtmlEditor1.ClientID %>');
			if (!edit) return;
			alert(edit.getText());
		}
		function focusClick() {
		    var edit = iged_getById('<%= WebHtmlEditor1.ClientID %>');
			if (!edit) return;
			alert("WebHtmlEditor1 " + (edit.hasFocus() ? '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_Focus1") %>' : '<%= this.GetGlobalResourceObject("WebHTMLEditor","ClientEvents_Focus2") %>'));
		}
		function tableClick() {
		    var edit = iged_getById('<%= WebHtmlEditor1.ClientID %>');
			if (!edit) return;
			var txt = edit.getText();
			txt += "<table bgcolor='orange' border='1' cellspacing='2'><tr><td>New</td></tr><tr><td>table</td></tr></table>";
			edit.setText(txt);
		}
		function imageClick() {
			var edit = iged_getById('<%= WebHtmlEditor1.ClientID %>');
			if (!edit) return;
			var txt = edit.getText();
			txt += "<img src='/SamplesBrowser/SamplesCommon/aspnet/WebHtmlEditor/Display/ClientEvents/image.gif' />";
			edit.setText(txt);
		}
--></script>
	<style type="text/css">
		.resetFont
		{
			font-size: 13px !important;
			line-height: 18px !important;
		}
	</style>
</asp:Content>
