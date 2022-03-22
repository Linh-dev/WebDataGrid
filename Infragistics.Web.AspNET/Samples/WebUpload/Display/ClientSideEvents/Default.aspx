<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
    <ig:HtmlScript ID="HtmlScript1" runat="server" Type="text/javascript" Src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
    <!--#BEGIN SNIPPET#-->
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/themes/infragistics/infragistics.theme.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/structure/infragistics.css" />

    <ig:HtmlScript ID="HtmlScript4" runat="server" Type="text/javascript" Src="/SamplesBrowser/SamplesCommon/aspnet/Common/Scripts/jquery/js/infragistics.js" />
    <!--#END SNIPPET#-->
    <script type="text/javascript" language="javascript">
        function fileSelecting(e, args) {
            var message =
            "<div class='event-fired'>fileSelecting " +
                CONST.EventFired +
            "</div>";
            showEvent(message);
        }
        function fileSelected(e, args) {
            var message =
            "<div class='event-fired'>fileSelected " +
                CONST.EventFiredArgs +
            "</div>" +
            "<div class='event-args'>" +
                CONST.FileID + ": " + args.fileId + "<br />" +
                CONST.FilePath + ": " + args.filePath +
            "</div>";
            showEvent(message);
        }
        // <!--#BEGIN SNIPPET#-->
        function fileUploading(e, args) {
            var message =
            "<div class='event-fired'>fileUploading " +
                CONST.EventFiredArgs +
            "</div>" +
            "<div class='event-args'>" +
                CONST.FileID + ": " + args.fileId + "<br />" +
                CONST.FilePath + ": " + args.filePath + "<br />" +
                CONST.FileStatus + ": " + args.fileStatus + "<br />" +
                CONST.TotalSize + ": " + args.totalSize + "<br />" +
                CONST.UploadedBytes + ": " + args.uploadedBytes +
            "</div>";
            showEvent(message);
        }
        // <!--#END SNIPPET#-->
        function fileUploaded(e, args) {
            var message =
            "<div class='event-fired'>fileUploaded " +
                CONST.EventFiredArgs +
            "</div>" +
            "<div class='event-args'>" +
                CONST.FileID + ": " + args.fileId + "<br />" +
                CONST.FilePath + ": " + args.filePath + "<br />" +
                CONST.TotalSize + ": " + args.totalSize +
            "</div>";
            showEvent(message);
        } 
        function fileUploadAborted(e, args) {
            var message =
            "<div class='event-fired'>fileUploadAborted " +
                CONST.EventFiredArgs +
            "</div>" +
            "<div class='event-args'>" +
                CONST.FileID + ": " + args.fileId + "<br />" +
                CONST.FilePath + ": " + args.filePath + "<br />" +
                CONST.Status + ": " + args.status + "<br />" +
                CONST.TotalSize + ": " + args.totalSize + "<br />" +
                CONST.UploadedBytes + ": " + args.uploadedBytes +
            "</div>";
            showEvent(message);
        }
        function cancelAllClicked(e, args) {
            var message =
            "<div class='event-fired'>cancelAllClicked " +
                CONST.EventFired +
            "</div>";
            showEvent(message);
        } 
        function onError(e, args) {
            var errorDescr = getErrorDescr(args),
                    message = 
            "<div class='event-fired'>onError " +
                CONST.EventFiredArgs +
            "</div>" +
            "<div class='event-args'>" +
                CONST.ErrorCode + ": " + args.errorCode + "<br />" +
                CONST.ErrorDescr + ": " + errorDescr + "<br />" + 
                CONST.ErrorMessage + ": " + args.errorMessage + "<br />" +
                CONST.ErrorType + ": " + args.errorType + "<br />" +
                CONST.ServerMessage + ": " + args.serverMessage +
            "</div>";
            showEvent(message);
        }
        function showEvent(message) {
            $("#eventList").html($("#eventList").html() + message).prop({ scrollTop: $("#eventList").prop("scrollHeight") });
        }

        function getErrorDescr(args) {
            // Gets the type of the error, thrown from the server.
            // All the codes are mapped with the error type.
            switch (args.errorCode) {
                case 0: return '<%= this.GetGlobalResourceObject("WebUpload", "Error_Code_0")%>';
                case 1: return '<%= this.GetGlobalResourceObject("WebUpload", "Error_Code_1")%>';
                case 2: return '<%= this.GetGlobalResourceObject("WebUpload", "Error_Code_2")%>';
                case 3: return '<%= this.GetGlobalResourceObject("WebUpload", "Error_Code_3")%>';
                case 4: return '<%= this.GetGlobalResourceObject("WebUpload", "Error_Code_4")%>';
                case 5: return '<%= this.GetGlobalResourceObject("WebUpload", "Error_Code_5")%>';
                case 6: return '<%= this.GetGlobalResourceObject("WebUpload", "Error_Code_6")%>';
                case 7: return '<%= this.GetGlobalResourceObject("WebUpload", "Error_Code_7")%>';
                case 8: return '<%= this.GetGlobalResourceObject("WebUpload", "Error_Code_8")%>';
                case 9: return '<%= this.GetGlobalResourceObject("WebUpload", "Error_Code_9")%>';
                case 10: return '<%= this.GetGlobalResourceObject("WebUpload", "Error_Code_10")%>';
            }
        }

        var CONST = {
            FileID: '<%= this.GetGlobalResourceObject("WebUpload", "lbl_fileId")%>',
            FilePath: '<%= this.GetGlobalResourceObject("WebUpload", "lbl_filePath")%>',
            FileStatus: '<%= this.GetGlobalResourceObject("WebUpload", "lbl_fileStatus")%>',
            TotalSize: '<%= this.GetGlobalResourceObject("WebUpload", "lbl_totalSize")%>',
            UploadedBytes: '<%= this.GetGlobalResourceObject("WebUpload", "lbl_uploadedBytes")%>',
            Status: '<%= this.GetGlobalResourceObject("WebUpload", "lbl_status")%>',
            ErrorCode: '<%= this.GetGlobalResourceObject("WebUpload", "lbl_errorCode")%>',
            ErrorMessage: '<%= this.GetGlobalResourceObject("WebUpload", "lbl_errorMessage")%>',
            ErrorType: '<%= this.GetGlobalResourceObject("WebUpload", "lbl_errorType")%>',
            ServerMessage: '<%= this.GetGlobalResourceObject("WebUpload", "lbl_serverMessage")%>',
            EventFired: '<%= this.GetGlobalResourceObject("WebUpload", "lbl_eventFired")%>',
            EventFiredArgs: '<%= this.GetGlobalResourceObject("WebUpload", "lbl_eventFiredArgs")%>',
            ErrorDescr: '<%= this.GetGlobalResourceObject("WebUpload", "lbl_errorDescr")%>'
        }
    </script>
    <style type="text/css">
        .event-fired { font-weight: bold; margin: 5px 0; }
        .event-args { padding-left: 20px; }
        #eventList { padding: 10px; height: 250px; overflow-y: auto; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="sampleContents">
		<div class="sample-container">
            <!--#BEGIN SNIPPET#-->
            <igjq:WebUpload ID="webUpload1" runat="server" 
                Mode="Single">
                    <ClientEvents FileSelecting="fileSelecting" FileSelected="fileSelected" 
                        FileUploading="fileUploading" FileUploaded="fileUploaded"
                        FileUploadAborted="fileUploadAborted" CancelAllClicked="cancelAllClicked"
                        OnError="onError"/>
            </igjq:WebUpload>
            <!--#END SNIPPET#-->
        </div>
        <br/>
        <br/>
        <div id="div2" class="ControlPanelHeader">
            <img src="/samplesbrowser/samplescommon/aspnet/Common/clientsideEvent.png" />
            <%= this.GetGlobalResourceObject("Strings","ClientEventsCaption") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                
            </div>
        </div>
    </div>	
</asp:Content>