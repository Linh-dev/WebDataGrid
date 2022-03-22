<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/themes/infragistics/infragistics.theme.css" rel="stylesheet"
        type="text/css" />
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/structure/infragistics.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/SamplesBrowser/SamplesCommon/aspnet/Common/Scripts/jquery/js/infragistics.js"
        language="javascript"></script>
    <script type="text/javascript" src="/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/FallbackVideo/Silverlight.js"
        language="javascript"></script>
    <style type="text/css">
        #silverlightControlHost
        {
            display: none;
        }
    </style>
    <script type="text/javascript">
        function onBrowserNotSupported(sender, args) {
            $("#silverlightControlHost").css("display", "block");
            $("#<%= this.player1.ClientID %>").css("display", "none");
            args.cancel = true;
        }

        function onSilverlightError(sender, args) {
            var appSource = "";
            if (sender != null && sender != 0) {
                appSource = sender.getHost().Source;
            }

            var errorType = args.ErrorType;
            var iErrorCode = args.ErrorCode;

            if (errorType == "ImageError" || errorType == "MediaError") {
                return;
            }

            var errMsg = "Unhandled Error in Silverlight Application " + appSource + "\n";

            errMsg += "Code: " + iErrorCode + "    \n";
            errMsg += "Category: " + errorType + "       \n";
            errMsg += "Message: " + args.ErrorMessage + "     \n";

            if (errorType == "ParserError") {
                errMsg += "File: " + args.xamlFile + "     \n";
                errMsg += "Line: " + args.lineNumber + "     \n";
                errMsg += "Position: " + args.charPosition + "     \n";
            }
            else if (errorType == "RuntimeError") {
                if (args.lineNumber != 0) {
                    errMsg += "Line: " + args.lineNumber + "     \n";
                    errMsg += "Position: " + args.charPosition + "     \n";
                }
                errMsg += "MethodName: " + args.methodName + "     \n";
            }

            throw new Error(errMsg);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <igjq:WebVideoPlayer ID="player1" runat="server" Width="720" Height="560" FullScreen="false"
        BrowserControls="false" AutoHide="true" AutoPlay="false" VolumeAutohideDelay="1500"
        Title="Quince Presentation Part 1" PosterUrl="/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/FallbackVideo/QuinceIntro_1.png">
        <Sources>
            <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_1.h264.mp4" />
            <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_1.webmvp8.webm" />
            <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_1.theora.ogv" />
        </Sources>
        <ClientEvents BrowserNotSupported="onBrowserNotSupported" />
    </igjq:WebVideoPlayer>
    <div id="silverlightControlHost">
        <object data="data:application/x-silverlight-2," type="application/x-silverlight-2"
            width="720px" height="540px">
            <param name="source" value="/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/FallbackVideo/SilverlightApplication1.xap" />
            <param name="onError" value="onSilverlightError" />
            <param name="background" value="white" />
            <param name="minRuntimeVersion" value="4.0.50826.0" />
            <param name="autoUpgrade" value="true" />
            <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=4.0.50826.0" style="text-decoration: none">
                <img src="/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/FallbackVideo/SLMedallion_ENU.png" alt="Get Microsoft Silverlight"
                    style="border-style: none" />
            </a>
        </object>
        <iframe id="_sl_historyFrame" style="visibility: hidden; height: 0px; width: 0px;
            border: 0px"></iframe>
    </div>
</asp:Content>
