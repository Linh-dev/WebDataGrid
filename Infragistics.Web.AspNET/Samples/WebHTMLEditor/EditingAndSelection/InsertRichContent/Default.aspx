<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css"
        rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

<ighedit:WebHtmlEditor  ID="WebHtmlEditor1" runat="server" Width="730" Height="700" UploadedFilesDirectory="/SamplesBrowser/Temp/Uploads" ImageDirectory="/SamplesBrowser/SamplesCommon/aspnet/WebHtmlEditor/Display/GeneralProperties">
    <DownlevelLabel ClientIDMode="Predictable"></DownlevelLabel>

    <DownlevelTextArea></DownlevelTextArea>

    <TabStrip></TabStrip>

    <Toolbar>
        <ighedit:ToolbarImage runat="server" Type="DoubleSeparator"></ighedit:ToolbarImage>
        <ighedit:ToolbarButton runat="server" Type="Bold"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="Italic"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="Underline"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="Strikethrough"></ighedit:ToolbarButton>
        <ighedit:ToolbarImage runat="server" Type="Separator"></ighedit:ToolbarImage>
        <ighedit:ToolbarButton runat="server" Type="Subscript"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="Superscript"></ighedit:ToolbarButton>
        <ighedit:ToolbarImage runat="server" Type="Separator"></ighedit:ToolbarImage>
        <ighedit:ToolbarButton runat="server" Type="Cut"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="Copy"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="Paste"></ighedit:ToolbarButton>
        <ighedit:ToolbarImage runat="server" Type="Separator"></ighedit:ToolbarImage>
        <ighedit:ToolbarButton runat="server" Type="Undo"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="Redo"></ighedit:ToolbarButton>
        <ighedit:ToolbarImage runat="server" Type="Separator"></ighedit:ToolbarImage>
        <ighedit:ToolbarButton runat="server" Type="JustifyLeft"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="JustifyCenter"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="JustifyRight"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="JustifyFull"></ighedit:ToolbarButton>
        <ighedit:ToolbarImage runat="server" Type="Separator"></ighedit:ToolbarImage>
        <ighedit:ToolbarButton runat="server" Type="Indent"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="Outdent"></ighedit:ToolbarButton>
        <ighedit:ToolbarImage runat="server" Type="Separator"></ighedit:ToolbarImage>
        <ighedit:ToolbarButton runat="server" Type="UnorderedList"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="OrderedList"></ighedit:ToolbarButton>
        <ighedit:ToolbarImage runat="server" Type="Separator"></ighedit:ToolbarImage>
        <ighedit:ToolbarDialogButton runat="server" Type="InsertRule">
            <Dialog InternalDialogType="InsertRule"></Dialog>
        </ighedit:ToolbarDialogButton>
        <ighedit:ToolbarImage runat="server" Type="RowSeparator"></ighedit:ToolbarImage>
        <ighedit:ToolbarImage runat="server" Type="DoubleSeparator"></ighedit:ToolbarImage>
        <ighedit:ToolbarDialogButton runat="server" Type="FontColor">
            <dialog></dialog>
        </ighedit:ToolbarDialogButton>
        <ighedit:ToolbarDialogButton runat="server" Type="FontHighlight">
            <dialog></dialog>
        </ighedit:ToolbarDialogButton>
        <ighedit:ToolbarDialogButton runat="server" Type="SpecialCharacter">
            <Dialog InternalDialogType="SpecialCharacterPicker" Type="InternalWindow"></Dialog>
        </ighedit:ToolbarDialogButton>
        <ighedit:ToolbarMenuButton runat="server" Type="InsertTable">
            <Menu>
                <ighedit:HtmlBoxMenuItem runat="server" Act="TableProperties">
                    <Dialog InternalDialogType="InsertTable"></Dialog>
                </ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="InsertColumnRight"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="InsertColumnLeft"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="InsertRowAbove"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="InsertRowBelow"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="DeleteRow"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="DeleteColumn"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="IncreaseColspan"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="DecreaseColspan"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="IncreaseRowspan"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="DecreaseRowspan"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="CellProperties">
                    <Dialog InternalDialogType="CellProperties"></Dialog>
                </ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="TableProperties">
                    <Dialog InternalDialogType="ModifyTable"></Dialog>
                </ighedit:HtmlBoxMenuItem>
            </Menu>
        </ighedit:ToolbarMenuButton>
        <ighedit:ToolbarButton runat="server" Type="ToggleBorders"></ighedit:ToolbarButton>
        <ighedit:ToolbarImage runat="server" Type="Separator"></ighedit:ToolbarImage>
        <ighedit:ToolbarButton runat="server" Type="InsertLink"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="RemoveLink"></ighedit:ToolbarButton>
        <ighedit:ToolbarImage runat="server" Type="Separator"></ighedit:ToolbarImage>
        <ighedit:ToolbarButton runat="server" Type="Save" RaisePostback="True"></ighedit:ToolbarButton>
        <ighedit:ToolbarUploadButton runat="server" Type="Open">
            <Upload Mode="File" Filter="*.htm,*.html,*.asp,*.aspx" Height="350px" Width="500px"></Upload>
        </ighedit:ToolbarUploadButton>
        <ighedit:ToolbarButton runat="server" Type="Preview"></ighedit:ToolbarButton>
        <ighedit:ToolbarImage runat="server" Type="Separator"></ighedit:ToolbarImage>
        <ighedit:ToolbarDialogButton runat="server" Type="FindReplace">
            <Dialog InternalDialogType="FindReplace"></Dialog>
        </ighedit:ToolbarDialogButton>
        <ighedit:ToolbarDialogButton runat="server" Type="InsertBookmark">
            <Dialog InternalDialogType="InsertBookmark"></Dialog>
        </ighedit:ToolbarDialogButton>
        <ighedit:ToolbarUploadButton runat="server" Type="InsertImage">
            <Upload Height="420px" Width="500px"></Upload>
        </ighedit:ToolbarUploadButton>
        <ighedit:ToolbarUploadButton runat="server" Type="InsertFlash">
            <Upload Mode="Flash" Filter="*.swf" Height="440px" Width="500px"></Upload>
        </ighedit:ToolbarUploadButton>
        <ighedit:ToolbarUploadButton runat="server" Type="InsertWindowsMedia">
            <Upload Mode="WindowsMedia" Filter="*.asf,*.wma,*.wmv,*.wm,*.avi,*.mpg,*.mpeg,*.m1v,*.mp2,*.mp3,*.mpa,*.mpe,*.mpv2,*.m3u,*.mid,*.midi,*.rmi,*.aif,*.aifc,*.aiff,*.au,*.snd,*.wav,*.cda,*.ivf" Height="400px" Width="500px"></Upload>
        </ighedit:ToolbarUploadButton>
        <ighedit:ToolbarDialogButton runat="server" Type="Help">
            <Dialog InternalDialogType="Text"></Dialog>
        </ighedit:ToolbarDialogButton>
        <ighedit:ToolbarButton runat="server" Type="CleanWord"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="WordCount"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="PasteHtml"></ighedit:ToolbarButton>
        <ighedit:ToolbarMenuButton runat="server" Type="Zoom">
            <Menu><ighedit:HtmlBoxMenuItem runat="server" Act="Zoom25"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom50"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom75"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom100"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom200"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom300"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom400"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom500"></ighedit:HtmlBoxMenuItem>
                <ighedit:HtmlBoxMenuItem runat="server" Act="Zoom600"></ighedit:HtmlBoxMenuItem>
            </Menu>
        </ighedit:ToolbarMenuButton>
        <ighedit:ToolbarButton runat="server" Type="TogglePositioning"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="BringForward"></ighedit:ToolbarButton>
        <ighedit:ToolbarButton runat="server" Type="SendBackward"></ighedit:ToolbarButton>
        <ighedit:ToolbarImage runat="server" Type="RowSeparator"></ighedit:ToolbarImage>
        <ighedit:ToolbarImage runat="server" Type="DoubleSeparator"></ighedit:ToolbarImage>
        <ighedit:ToolbarDropDown runat="server" Type="FontName"></ighedit:ToolbarDropDown>
        <ighedit:ToolbarDropDown runat="server" Type="FontSize"></ighedit:ToolbarDropDown>
        <ighedit:ToolbarDropDown runat="server" Type="FontFormatting"></ighedit:ToolbarDropDown>
        <ighedit:ToolbarDropDown runat="server" Type="FontStyle"></ighedit:ToolbarDropDown>
        <ighedit:ToolbarDropDown runat="server" Type="Insert">
        <Items>
            <ighedit:ToolbarDropDownItem runat="server" Act="Greeting"></ighedit:ToolbarDropDownItem>
            <ighedit:ToolbarDropDownItem runat="server" Act="Signature"></ighedit:ToolbarDropDownItem>
        </Items>
        </ighedit:ToolbarDropDown>
    </Toolbar>

    <ProgressBar></ProgressBar>

    <RightClickMenu><ighedit:HtmlBoxMenuItem runat="server" Act="Cut"></ighedit:HtmlBoxMenuItem>
        <ighedit:HtmlBoxMenuItem runat="server" Act="Copy"></ighedit:HtmlBoxMenuItem>
        <ighedit:HtmlBoxMenuItem runat="server" Act="Paste"></ighedit:HtmlBoxMenuItem>
        <ighedit:HtmlBoxMenuItem runat="server" Act="PasteHtml"></ighedit:HtmlBoxMenuItem>
        <ighedit:HtmlBoxMenuItem runat="server" Act="CellProperties">
            <Dialog InternalDialogType="CellProperties"></Dialog>
        </ighedit:HtmlBoxMenuItem>
        <ighedit:HtmlBoxMenuItem runat="server" Act="TableProperties">
            <Dialog InternalDialogType="ModifyTable"></Dialog>
        </ighedit:HtmlBoxMenuItem>
        <ighedit:HtmlBoxMenuItem runat="server" Act="InsertImage"></ighedit:HtmlBoxMenuItem>
    </RightClickMenu>

    <TextWindow Height="740"></TextWindow>
</ighedit:WebHtmlEditor>
    <script type="text/javascript" language="javascript">
        var iframe1 = document.getElementById('MainContent_WebHtmlEditor1_tw');
        var doc = iframe1 ? iframe1.contentDocument : null;

        if (doc) {
            doc.designMode = "off";
        }

        function WebHtmlEditor1_AfterAction(oEditor, actID) {
            if (actID === "Undo") {
                addLine('<%= this.GetGlobalResourceObject("WebHTMLEditor","Action_Undo") %>');
            }
            else if (actID === "Redo") {
                addLine('<%= this.GetGlobalResourceObject("WebHTMLEditor","Action_Redo") %>');
            }
        }
    </script>
</asp:Content>
