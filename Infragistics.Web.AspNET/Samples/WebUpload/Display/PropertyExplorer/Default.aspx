<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/themes/infragistics/infragistics.theme.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/structure/infragistics.css" />

    <ig:HtmlScript ID="HtmlScript3" runat="server" Type="text/javascript" Src="/SamplesBrowser/SamplesCommon/aspnet/Common/Scripts/jquery/js/infragistics.js" />

    <script type="text/javascript" language="javascript">
        $(window).load(function () {
            $("#autoStart1").change(function () {
                var isAutoStart = ($(this).val() === 'true') ? true : false;
                $("#<%=this.webUpload1.ClientID%>").igUpload('option', 'autostartupload', isAutoStart);
            });
            $("#feIcon1").change(function () {
                var hasIcon = ($(this).val() === 'true') ? true : false;
                $("#<%=this.webUpload1.ClientID%>").igUpload('option', 'showFileExtensionIcon', hasIcon);
            });
            $("#fzMetric1").change(function () {
                var fileSizeMetric = $(this).val();
                $("#<%=this.webUpload1.ClientID%>").igUpload('option', 'fileSizeMetric', fileSizeMetric);
                if (fileSizeMetric === 'bytes') {
                    $("#decimal1").val(0).prop('disabled', true);
                    $("#<%=this.webUpload1.ClientID%>").igUpload('option', 'fileSizeDecimalDisplay', 0);
                } else {
                    $("#decimal1").prop('disabled', false);
                }

            });
            $("#decimal1").change(function () {
                var decimalDisplay = parseInt($(this).val(), 10);
                $("#<%=this.webUpload1.ClientID%>").igUpload('option', 'fileSizeDecimalDisplay', decimalDisplay);
            });
            $("#allowedFiles1").change(function () {
                var allowedExt = $(this).val(),
                arrExt = [];
                arrExt[0] = allowedExt;
                $("#<%=this.webUpload1.ClientID%>").igUpload('option', 'allowedExtensions', arrExt);
            });

            $("#maxFiles").change(function () {
                var maxFiles = parseInt($(this).val(), 10);
                $("#<%=this.webUpload2.ClientID%>").igUpload('option', 'maxUploadedFiles', maxFiles);
            });
            $("#maxSimFiles").change(function () {
                var maxSimFiles = parseInt($(this).val(), 10);
                alert(maxSimFiles);
                $("#<%=this.webUpload2.ClientID%>").igUpload('option', 'maxSimultaneousFilesUploads', maxSimFiles);
            });
            $("#width2").change(function () {
                var newWidth = $(this).val();
                $("#<%=this.webUpload2.ClientID%>").igUpload('option', 'width', newWidth);
            });
            $("#height2").change(function () {
                var newHeight = $(this).val();
                $("#<%=this.webUpload2.ClientID%>").igUpload('option', 'height', newHeight);
            });
        });
        function onErrorHandlerSingle(e, args) {
            showAlert(args, 1);
        }
        function onErrorHandlerMultiple(e, args) {
            showAlert(args, 2);
        }
        function showAlert(args, index) {
            $("#message" + index).html(args.errorMessage).stop(true, true).fadeIn(500).delay(3000).fadeOut(500);
        }
    </script>
    <style type="text/css">
        .sampleContents label { width: 180px; display: block; float:left; }
        .sampleContents select { width: 90px; }
        .sampleContents .resized-upload-container {min-width: 500px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="sampleContents">
		<div class="sample-container resized-upload-container">
	        <p><%= this.GetGlobalResourceObject("WebUpload", "txt_single_upload_property")%></p>
            <!--#BEGIN SNIPPET#-->
            <igjq:WebUpload ID="webUpload1" runat="server" 
                Mode="Single">
                    <ClientEvents OnError="onErrorHandlerSingle" />
            </igjq:WebUpload>
            <!--#END SNIPPET#--> 
            <div style="margin: 10px 0;">
                <label><%= this.GetGlobalResourceObject("WebUpload", "txt_auto_start_upload")%></label>
                <select id="autoStart1">
                    <option value="false"><%= this.GetGlobalResourceObject("WebUpload", "txt_false")%></option>
                    <option value="true"><%= this.GetGlobalResourceObject("WebUpload", "txt_true")%></option>
                </select>
            </div>
            <div style="margin: 10px 0;">
                <label><%= this.GetGlobalResourceObject("WebUpload", "txt_file_ext_icon")%></label>
                <select id="feIcon1">
                    <option value="true"><%= this.GetGlobalResourceObject("WebUpload", "txt_true")%></option>
                    <option value="false"><%= this.GetGlobalResourceObject("WebUpload", "txt_false")%></option>
                </select>
            </div>
            <div style="margin: 10px 0;">
                <label><%= this.GetGlobalResourceObject("WebUpload", "txt_file_size_metric")%></label>
                <select id="fzMetric1">
                    <option value="auto"><%= this.GetGlobalResourceObject("WebUpload", "txt_auto")%></option>
                    <option value="bytes"><%= this.GetGlobalResourceObject("WebUpload", "txt_bytes")%></option>
                    <option value="kbytes"><%= this.GetGlobalResourceObject("WebUpload", "txt_kbytes")%></option>
                    <option value="mbytes"><%= this.GetGlobalResourceObject("WebUpload", "txt_mbytes")%></option>
                    <option value="gbytes"><%= this.GetGlobalResourceObject("WebUpload", "txt_gbytes")%></option>
                </select>
            </div>
            <div style="margin: 10px 0;">
                <label><%= this.GetGlobalResourceObject("WebUpload", "txt_decimal_display")%></label>
                <select id="decimal1">
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2" selected>2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                </select>
            </div>
            <div style="margin: 10px 0;">
                <label><%= this.GetGlobalResourceObject("WebUpload", "txt_allowed_files")%></label>
                <select id="allowedFiles1">
                    <option value=""><%= this.GetGlobalResourceObject("WebUpload", "txt_all")%></option>
                    <option value="jpg">.jpg</option>
                    <option value="exe">.exe</option>
                    <option value="txt">.txt</option>
                </select>
            </div>
            <div id="message1" style="color: #FF0000; font-weight: bold;"></div>
        </div>


        <div class="sample-container resized-upload-container">
	        <p><%= this.GetGlobalResourceObject("WebUpload", "txt_multiple_upload_property")%></p>
	        <!--#BEGIN SNIPPET#-->
            <igjq:WebUpload ID="webUpload2" runat="server" 
                Mode="Multiple" MaxSimultaneousFilesUploads="1">
                    <ClientEvents OnError="onErrorHandlerMultiple" />
            </igjq:WebUpload>
            <!--#END SNIPPET#--> 
            <div style="margin: 10px 0;">
                <label><%= this.GetGlobalResourceObject("WebUpload", "txt_max_upload_files")%></label>
                <select id="maxFiles">
                    <option value="-1"><%= this.GetGlobalResourceObject("WebUpload", "txt_unlimited")%></option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                </select>
            </div>
            <div style="margin: 10px 0;">
                <label><%= this.GetGlobalResourceObject("WebUpload", "txt_max_sim_upload_files")%></label>
                <select id="maxSimFiles">
                    <option value="1">1</option>
                    <option value="2">2</option>
                </select>
            </div>
            <div style="margin: 10px 0;">
                <label><%= this.GetGlobalResourceObject("WebUpload", "txt_width")%></label>
                <select id="width2">
                    <option value=""><%= this.GetGlobalResourceObject("WebUpload", "txt_auto")%></option>
                    <option value="400">400</option>
                    <option value="500">500</option>
                </select>
            </div>
            <div style="margin: 10px 0;">
                <label><%= this.GetGlobalResourceObject("WebUpload", "txt_height")%></label>
                <select id="height2">
                    <option value=""><%= this.GetGlobalResourceObject("WebUpload", "txt_auto")%></option>
                    <option value="300">300</option>
                    <option value="600">600</option>
                </select>
            </div>
            <div id="message2" style="color: #FF0000; font-weight: bold;"></div>
        </div>
    </div>
</asp:Content>