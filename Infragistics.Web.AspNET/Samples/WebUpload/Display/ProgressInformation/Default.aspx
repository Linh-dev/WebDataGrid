<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <!--#BEGIN SNIPPET#-->
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/themes/infragistics/infragistics.theme.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/structure/infragistics.css" />

    <ig:HtmlScript ID="HtmlScript3" runat="server" Type="text/javascript" Src="/SamplesBrowser/SamplesCommon/aspnet/Common/Scripts/jquery/js/infragistics.js" />
    <!--#END SNIPPET#-->
    <script type="text/javascript" language="javascript">
        var timeOutID;
        function startTimer() {
            var currCount = parseInt($('#timeElapsed').html(), 10);
            $('#timeElapsed').html(currCount + 1);
            timeOutID = setTimeout('startTimer()', 1000);
        }
        function areAllFilesUploaded() {
            var uploadInfo = $("#<%=this.webUpload1.ClientID %>").igUpload('getFileInfoData');
            return uploadInfo.countTotalFiles === uploadInfo.countUploadingFiles;
        }
        // <!--#BEGIN SNIPPET#-->
        function refreshProgressInformation() {
            var uploadInfo = $("#<%=this.webUpload1.ClientID %>").igUpload('getFileInfoData'),
            timeElapsed = parseInt($('#timeElapsed').html(), 10),
            uploadSpeed;

            if (timeElapsed === 0) {
                uploadSpeed = 0;
            } else {
                uploadSpeed = Math.round(uploadInfo.fileSizeUploaded / (1024 * timeElapsed));
            }

            $("#uploadedFiles").html(uploadInfo.countUploadingFiles);
            $("#uploaded").html(Math.round(uploadInfo.fileSizeUploaded / 1024));
            $("#toUpload").html(Math.round((uploadInfo.fileSizeTotal - uploadInfo.fileSizeUploaded) / 1024));
            $("#speed").html(uploadSpeed);
            if (uploadSpeed === 0) {
                $("#timeLeft").html(0);
            } else {
                $("#timeLeft").html(Math.round((uploadInfo.fileSizeTotal - uploadInfo.fileSizeUploaded) / (1024 * uploadSpeed)));
            }
        }
        // <!--#END SNIPPET#-->
        function fileUploading(e, args) {
            if ($("#hdnStartTimer").val() === 'false') {
                $("#hdnStartTimer").val('true');
                startTimer();
            }
            refreshProgressInformation();
        }

        function fileUploaded(e, args) {
            refreshProgressInformation();
            if (areAllFilesUploaded()) {
                clearTimeout(timeOutID);
                $("#hdnStartTimer").val('false');
            }
            $("#error").css("display", "none");
        }
        function fileUploadAborted(e, args) {
            refreshProgressInformation();
            clearTimeout(timeOutID);
            $("#hdnStartTimer").val('false');
        }
        function cancelAllClicked(e, args) {
            refreshProgressInformation();
            clearTimeout(timeOutID);
            $("#hdnStartTimer").val('false');
        }
        function onError(e, args) {
            refreshProgressInformation();
            clearTimeout(timeOutID);
            $("#hdnStartTimer").val('false');

            if (args.errorType === 'serverside' && args.errorCode === 2) {
                $("#error").stop(true, true).fadeIn(500).delay(3000).fadeOut(500);
            }
        } 
        $(window).load(function () {
            $("#error").css("display", "none");
        });
    </script>
    <style type="text/css">
        .container-info, .error-info { margin: 10px 0 ; font-weight: bold; }
        .error-info { color: #FF0000; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="sampleContents">
		<div class="sample-container">
            <!--#BEGIN SNIPPET#-->
	        <igjq:WebUpload ID="webUpload1" runat="server" 
                MaxSimultaneousFilesUploads="2" Mode="Multiple">
                <ClientEvents FileUploading="fileUploading" FileUploaded="fileUploaded"
                              FileUploadAborted="fileUploadAborted" CancelAllClicked="cancelAllClicked"
                              OnError="onError"/>
            </igjq:WebUpload>
            <!--#END SNIPPET#-->
            <div class="container-info">
                <label>
                    <%= this.GetGlobalResourceObject("WebUpload", "txt_average_speed")%>: 
                    <span id="speed">0</span>
                    KB/S
                </label>
            </div>
            <div class="container-info">
                <label>
                    <%= this.GetGlobalResourceObject("WebUpload", "txt_uploaded_files")%>:  
                    <span id="uploadedFiles">0</span>
                </label>
            </div>
            <div class="container-info">
                <label>
                    <%= this.GetGlobalResourceObject("WebUpload", "txt_uploaded")%>: 
                    <span id="uploaded">0</span>
                    KB
                </label>
            </div>
            <div class="container-info">
                <label>
                    <%= this.GetGlobalResourceObject("WebUpload", "txt_to_be_uploaded")%>:
                    <span id="toUpload">0</span>
                    KB
                </label>
            </div>
            <div class="container-info">
                <label>
                    <%= this.GetGlobalResourceObject("WebUpload", "txt_time_elapsed")%>:
                    <span id="timeElapsed">0</span>
                    <%= this.GetGlobalResourceObject("WebUpload", "txt_seconds")%>
                </label>
            </div>
            <div class="container-info">
                <label>
                    <%= this.GetGlobalResourceObject("WebUpload", "txt_time_left")%>:
                    <span id="timeLeft">0</span>
                    <%= this.GetGlobalResourceObject("WebUpload", "txt_seconds")%>
                </label>
            </div>
            <div id="error" class="error-info">
                <%= this.GetGlobalResourceObject("WebUpload", "txt_size_restriction")%>
            </div>
            <input type="hidden" id="hdnStartTimer" value="false"/>
        </div>
    </div>
</asp:Content>