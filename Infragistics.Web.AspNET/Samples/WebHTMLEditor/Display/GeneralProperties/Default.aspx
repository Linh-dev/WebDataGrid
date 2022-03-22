<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/webSample_style.css" />
	 <style type="text/css">
		  #Table1 table
		  {
			 border-collapse:separate;
		  }
	 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">   
    <p>
        <asp:Label ID="TryTheFollowing" runat="server" Text="<%$ Resources:WebHTMLEditor, TryTheFollowing %>"></asp:Label></p>
    <ol style="margin-left: 25px;">
        <li>
            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebHTMLEditor, General_Description2 %>"></asp:Label>
        </li>
        <li>
            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:WebHTMLEditor, General_Description3 %>"></asp:Label>
        </li>
        <li>
            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebHTMLEditor, General_Description4 %>"></asp:Label>
        </li>
        <li>
            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:WebHTMLEditor, General_Description5 %>"></asp:Label>
        </li>
        <li>
            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:WebHTMLEditor, General_Description6 %>"></asp:Label>
        </li>
        <li>
            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:WebHTMLEditor, General_Description7 %>"></asp:Label>
        </li>
        <li>
            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:WebHTMLEditor, General_Description8 %>"></asp:Label>
        </li>
    </ol>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <table id="Table1" style="width: 100%; height: 400px; padding:10px" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 100%; height: 100%;">
                <ighedit:WebHtmlEditor UploadedFilesDirectory="/SamplesBrowser/Temp/Uploads" Height="100%" Width="100%"
                    ID="WebHtmlEditor1" runat="server" ImageDirectory="/SamplesBrowser/SamplesCommon/aspnet/WebHtmlEditor/Display/GeneralProperties"
                    LocalizationFile="<%$ Resources:WebHTMLEditor, LocalizationFilePath %>">
                    <RightClickMenu>
                        <ighedit:HtmlBoxMenuItem runat="server" Act="Cut">
                        </ighedit:HtmlBoxMenuItem>
                        <ighedit:HtmlBoxMenuItem runat="server" Act="Copy">
                        </ighedit:HtmlBoxMenuItem>
                        <ighedit:HtmlBoxMenuItem runat="server" Act="Paste">
                        </ighedit:HtmlBoxMenuItem>
                        <ighedit:HtmlBoxMenuItem runat="server" Act="PasteHtml">
                        </ighedit:HtmlBoxMenuItem>
                        <ighedit:HtmlBoxMenuItem runat="server" Act="CellProperties">
                            <Dialog InternalDialogType="CellProperties" />
                        </ighedit:HtmlBoxMenuItem>
                        <ighedit:HtmlBoxMenuItem runat="server" Act="TableProperties">
                            <Dialog InternalDialogType="ModifyTable" />
                        </ighedit:HtmlBoxMenuItem>
                        <ighedit:HtmlBoxMenuItem runat="server" Act="InsertImage">
                        </ighedit:HtmlBoxMenuItem>
                    </RightClickMenu>
                    <Toolbar>
                        <ighedit:ToolbarImage runat="server" Type="DoubleSeparator" />
                        <ighedit:ToolbarButton runat="server" Type="Bold" />
                        <ighedit:ToolbarButton runat="server" Type="Italic" />
                        <ighedit:ToolbarButton runat="server" Type="Underline" />
                        <ighedit:ToolbarButton runat="server" Type="Strikethrough" />
                        <ighedit:ToolbarImage runat="server" Type="Separator" />
                        <ighedit:ToolbarButton runat="server" Type="Subscript" />
                        <ighedit:ToolbarButton runat="server" Type="Superscript" />
                        <ighedit:ToolbarImage runat="server" Type="Separator" />
                        <ighedit:ToolbarButton runat="server" Type="Cut" />
                        <ighedit:ToolbarButton runat="server" Type="Copy" />
                        <ighedit:ToolbarButton runat="server" Type="Paste" />
                        <ighedit:ToolbarImage runat="server" Type="Separator" />
                        <ighedit:ToolbarButton runat="server" Type="Undo" />
                        <ighedit:ToolbarButton runat="server" Type="Redo" />
                        <ighedit:ToolbarImage runat="server" Type="Separator" />
                        <ighedit:ToolbarButton runat="server" Type="JustifyLeft" />
                        <ighedit:ToolbarButton runat="server" Type="JustifyCenter" />
                        <ighedit:ToolbarButton runat="server" Type="JustifyRight" />
                        <ighedit:ToolbarButton runat="server" Type="JustifyFull" />
                        <ighedit:ToolbarImage runat="server" Type="Separator" />
                        <ighedit:ToolbarButton runat="server" Type="Indent" />
                        <ighedit:ToolbarButton runat="server" Type="Outdent" />
                        <ighedit:ToolbarImage runat="server" Type="Separator" />
                        <ighedit:ToolbarButton runat="server" Type="UnorderedList" />
                        <ighedit:ToolbarButton runat="server" Type="OrderedList" />
                        <ighedit:ToolbarImage runat="server" Type="Separator" />
                        <ighedit:ToolbarDialogButton runat="server" Type="InsertRule">
                            <Dialog InternalDialogType="InsertRule" />
                        </ighedit:ToolbarDialogButton>
                        <ighedit:ToolbarImage runat="server" Type="RowSeparator" />
                        <ighedit:ToolbarImage runat="server" Type="DoubleSeparator" />
                        <ighedit:ToolbarDialogButton runat="server" Type="FontColor">
                        </ighedit:ToolbarDialogButton>
                        <ighedit:ToolbarDialogButton runat="server" Type="FontHighlight">
                        </ighedit:ToolbarDialogButton>
                        <ighedit:ToolbarDialogButton runat="server" Type="SpecialCharacter">
                            <Dialog InternalDialogType="SpecialCharacterPicker" Type="InternalWindow" />
                        </ighedit:ToolbarDialogButton>
                        <ighedit:ToolbarMenuButton runat="server" Type="InsertTable">
                            <Menu>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="TableProperties">
                                    <Dialog InternalDialogType="InsertTable" />
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="InsertColumnRight">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="InsertColumnLeft">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="InsertRowAbove">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="InsertRowBelow">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="DeleteRow">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="DeleteColumn">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="IncreaseColspan">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="DecreaseColspan">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="IncreaseRowspan">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="DecreaseRowspan">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="CellProperties">
                                    <Dialog InternalDialogType="CellProperties" />
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="TableProperties">
                                    <Dialog InternalDialogType="ModifyTable" />
                                </ighedit:HtmlBoxMenuItem>
                            </Menu>
                        </ighedit:ToolbarMenuButton>
                        <ighedit:ToolbarButton runat="server" Type="ToggleBorders" />
                        <ighedit:ToolbarImage runat="server" Type="Separator" />
                        <ighedit:ToolbarButton runat="server" Type="InsertLink" />
                        <ighedit:ToolbarButton runat="server" Type="RemoveLink" />
                        <ighedit:ToolbarImage runat="server" Type="Separator" />
                        <ighedit:ToolbarButton runat="server" RaisePostback="True" Type="Save" />
                        <ighedit:ToolbarUploadButton runat="server" Type="Open">
                            <Upload UploadEnabled="false" Filter="*.htm,*.html,*.asp,*.aspx" Height="350px" Mode="File"
                                Width="500px" />
                        </ighedit:ToolbarUploadButton>
                        <ighedit:ToolbarButton runat="server" Type="Preview" />
                        <ighedit:ToolbarImage runat="server" Type="Separator" />
                        <ighedit:ToolbarDialogButton runat="server" Type="FindReplace">
                            <Dialog InternalDialogType="FindReplace" />
                        </ighedit:ToolbarDialogButton>
                        <ighedit:ToolbarDialogButton runat="server" Type="InsertBookmark">
                            <Dialog InternalDialogType="InsertBookmark" />
                        </ighedit:ToolbarDialogButton>
                        <ighedit:ToolbarUploadButton runat="server" Type="InsertImage">
                            <Upload UploadEnabled="false" Height="420px" Width="500px" />
                        </ighedit:ToolbarUploadButton>
                        <ighedit:ToolbarUploadButton runat="server" Type="InsertFlash">
                            <Upload UploadEnabled="false" Filter="*.swf" Height="440px" Mode="Flash" Width="500px" />
                        </ighedit:ToolbarUploadButton>
                        <ighedit:ToolbarUploadButton runat="server" Type="InsertWindowsMedia">
                            <Upload UploadEnabled="false" Filter="*.asf,*.wma,*.wmv,*.wm,*.avi,*.mpg,*.mpeg,*.m1v,*.mp2,*.mp3,*.mpa,*.mpe,*.mpv2,*.m3u,*.mid,*.midi,*.rmi,*.aif,*.aifc,*.aiff,*.au,*.snd,*.wav,*.cda,*.ivf"
                                Height="400px" Mode="WindowsMedia" Width="500px" />
                        </ighedit:ToolbarUploadButton>
                        <ighedit:ToolbarDialogButton runat="server" Type="Help">
                            <Dialog InternalDialogType="Text" />
                        </ighedit:ToolbarDialogButton>
                        <ighedit:ToolbarButton runat="server" Type="CleanWord" />
                        <ighedit:ToolbarButton runat="server" Type="WordCount" />
                        <ighedit:ToolbarButton runat="server" Type="PasteHtml" />
                        <ighedit:ToolbarMenuButton runat="server" Type="Zoom">
                            <Menu>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom25">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom50">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom75">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom100">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom200">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom300">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom400">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom500">
                                </ighedit:HtmlBoxMenuItem>
                                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom600">
                                </ighedit:HtmlBoxMenuItem>
                            </Menu>
                        </ighedit:ToolbarMenuButton>
                        <ighedit:ToolbarButton runat="server" Type="TogglePositioning" />
                        <ighedit:ToolbarButton runat="server" Type="BringForward" />
                        <ighedit:ToolbarButton runat="server" Type="SendBackward" />
                        <ighedit:ToolbarImage runat="server" Type="RowSeparator" />
                        <ighedit:ToolbarImage runat="server" Type="DoubleSeparator" />
                        <ighedit:ToolbarDropDown runat="server" Type="FontName">
                        </ighedit:ToolbarDropDown>
                        <ighedit:ToolbarDropDown runat="server" Type="FontSize">
                        </ighedit:ToolbarDropDown>
                        <ighedit:ToolbarDropDown runat="server" Type="FontFormatting">
                        </ighedit:ToolbarDropDown>
                        <ighedit:ToolbarDropDown runat="server" Type="FontStyle">
                        </ighedit:ToolbarDropDown>
                        <ighedit:ToolbarDropDown runat="server" Type="Insert">
                            <Items>
                                <ighedit:ToolbarDropDownItem runat="server" Act="Greeting" />
                                <ighedit:ToolbarDropDownItem runat="server" Act="Signature" />
                            </Items>
                        </ighedit:ToolbarDropDown>
                    </Toolbar>
                </ighedit:WebHtmlEditor>
            </td>
            <td valign="top">
                <fieldset>
                    <legend>
                        <asp:Literal Text="<%$ Resources:WebHTMLEditor, General_BasicProperties %>" runat="server" /></legend>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:WebHTMLEditor, General_Label1 %>"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="colorPaletteSize" runat="server" Width="125px" Height="24px"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:WebHTMLEditor, General_Label2 %>"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="localizationType" runat="server" Width="125px" Height="24px"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:WebHTMLEditor, General_Label3 %>"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="rightClickBehavior" runat="server" Width="125px" Height="24px"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:WebHTMLEditor, General_Label4 %>"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="startUpMode" runat="server" Width="125px" Height="24px" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:WebHTMLEditor, General_Label5 %>"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="tabStripDisplay" runat="server" Width="125px" Height="24px"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:WebHTMLEditor, General_Label6 %>"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="focus" runat="server" Width="125px" Height="24px" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:WebHTMLEditor, General_Label7 %>"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="readOnly" runat="server" Width="125px" Height="24px" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:WebHTMLEditor, General_Label8 %>"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="effects" runat="server" Width="125px" Height="24px" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
