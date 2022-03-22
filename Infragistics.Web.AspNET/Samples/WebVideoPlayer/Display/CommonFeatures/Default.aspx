<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/themes/infragistics/infragistics.theme.css" rel="stylesheet"
        type="text/css" />
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/structure/infragistics.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/SamplesBrowser/SamplesCommon/aspnet/Common/Scripts/jquery/js/infragistics.js"
        language="javascript"></script>
    <link type="text/css" href="/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/CommonFeatures/CommonFeatures.css"
        rel="stylesheet" />
    <script type="text/javascript">
        var playing = false;
        var yes = '<%= this.GetGlobalResourceObject("WebVideoPlayer", "Yes") %>';
        var no = '<%= this.GetGlobalResourceObject("WebVideoPlayer", "No") %>';

        $(window).load(function () {
            if ($("#<%= this.videoPlayer1.ClientID %>").igVideoPlayer("supports_video"))
                $("#html5Video").html($("#html5Video").html() + '<span class="green">' + yes + '</span>');
            else
                $("#html5Video").html($("#html5Video").html() + '<span class="red">' + no + '</span>');

            if ($("#<%= this.videoPlayer1.ClientID %>").igVideoPlayer("supports_h264_baseline_video"))
                $("#h264Video").html($("#h264Video").html() + '<span class="green">' + yes + '</span>');
            else
                $("#h264Video").html($("#h264Video").html() + '<span class="red">' + no + '</span>');

            if ($("#<%= this.videoPlayer1.ClientID %>").igVideoPlayer("supports_ogg_theora_video"))
                $("#oggVideo").html($("#oggVideo").html() + '<span class="green">' + yes + '</span>');
            else
                $("#oggVideo").html($("#oggVideo").html() + '<span class="red">' + no + '</span>');

            if ($("#<%= this.videoPlayer1.ClientID %>").igVideoPlayer("supports_webm_video"))
                $("#webMVideo").html($("#webMVideo").html() + '<span class="green">' + yes + '</span>');
            else
                $("#webMVideo").html($("#webMVideo").html() + '<span class="red">' + no + '</span>');

            $("#btnAddScreenShot").igButton().click(function () {
                var canvas = $("#<%= this.videoPlayer1.ClientID %>").igVideoPlayer("screenshot");

                $(canvas).addClass("screenshot");
                $("#screenShots").append(canvas);
            });

            $("#btnPlay").igButton().click(function () {
                if (playing)
                    $("#<%= this.videoPlayer1.ClientID %>").igVideoPlayer("pause");
                else
                    $("#<%= this.videoPlayer1.ClientID %>").igVideoPlayer("play");
            });

            $("#slider").slider({ value: 50 }).bind("slide", function (event, ui) {
                var value = ui.value;
                $("#<%= this.videoPlayer1.ClientID %>").igVideoPlayer("option", "volume", value / 100);
            });

            if ($("#<%= this.videoPlayer1.ClientID %>").igVideoPlayer("supports_video") === false) {
                $("#rightControls").hide();
                $("#copyrightContainer").hide();
            }
        });

        function videoPlayerPlaying(sender, args) {
            playing = true;
            $('#btnPlay span').html('<%= this.GetGlobalResourceObject("WebVideoPlayer", "Pause") %>');
        }
        function videoPlayerEnded(sender, args) {
            playing = false;
            $('#btnPlay span').html('<%= this.GetGlobalResourceObject("WebVideoPlayer", "Play") %>');
        }

        function videoPlayerPaused(sender, args) {
            playing = false;
            $('#btnPlay span').html('<%= this.GetGlobalResourceObject("WebVideoPlayer", "Play") %>');
        }
        function videoPlayerProgress(sender, args) {
            $("#currentTime span").html($("#<%= this.videoPlayer1.ClientID %>").igVideoPlayer("currentTime"));
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="width: 100%; overflow: hidden;">
        <div class="videoPlayerContainer">
            <igjq:WebVideoPlayer ID="videoPlayer1" runat="server" Width="380" FullScreen="false"
                BrowserControls="false" AutoHide="false" AutoPlay="false" Title="Big Buck Bunny"
                PosterUrl="/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/CommonFeatures/Big_Buck_Bunny.png">
                <Sources>
                    <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/big_buck_bunny.mp4" />
                    <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/big_buck_bunny.webm" />
                    <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/big_buck_bunny.ogv" />
                </Sources>
                <Bookmarks>
                    <igjq:VideoPlayerBookmark Title="<%$ Resources:WebVideoPlayer, Bookmark_River %>"
                        Time="13" />
                    <igjq:VideoPlayerBookmark Title="<%$ Resources:WebVideoPlayer, Bookmark_BigBuckBunnyAppears %>"
                        Time="33" />
                </Bookmarks>
                <ClientEvents Playing="videoPlayerPlaying" Ended="videoPlayerEnded" Paused="videoPlayerPaused"
                    Progress="videoPlayerProgress" />
            </igjq:WebVideoPlayer>
        </div>
        <div id="rightControls" class="controlsContainer">
            <div id="controls" class="leftContainer">
                <center>
                    <button id="btnPlay" class="buttons" type="button">
                        <%= this.GetGlobalResourceObject("WebVideoPlayer", "Play")%>
                    </button>
                    <button id="btnAddScreenShot" class="buttons" type="button">
                        <%= this.GetGlobalResourceObject("WebVideoPlayer", "Add_Screenshot")%>
                    </button>
                    <div style="width: 120px; height: 20px; margin-top: 10px;">
                        <div style="width: 50px; height:20px; float: left; margin-right: 10px;">
                            <p>
                                <%= this.GetGlobalResourceObject("WebVideoPlayer", "Volume")%>
                            </p>
                        </div>
                        <div id="slider" style="width: 60px; float: left; background-color: White; margin-top: 7px;">
                        </div>
                        <div style="clear: both;">
                        </div>
                    </div>
                </center>
                <p id="currentTime">
                    <%= this.GetGlobalResourceObject("WebVideoPlayer", "Current_Time")%>
                    <span style="display: inline; color: blue;">0</span>
                </p>
                <p id="html5Video">
                    <%= this.GetGlobalResourceObject("WebVideoPlayer", "Support_HTML5")%>
                </p>
                <p id="h264Video">
                    <%= this.GetGlobalResourceObject("WebVideoPlayer", "Support_H264")%>
                </p>
                <p id="oggVideo">
                    <%= this.GetGlobalResourceObject("WebVideoPlayer", "Support_Ogv")%>
                </p>
                <p id="webMVideo">
                    <%= this.GetGlobalResourceObject("WebVideoPlayer", "Support_WebM")%>
                </p>
            </div>
            <div id="screenShots" class="rightContainer">
                <center>
                    <p style="font-weight: bold;">
                        <%= this.GetGlobalResourceObject("WebVideoPlayer", "Screenshots")%>
                    </p>
                </center>
            </div>
        </div>
        <div style="clear: both;">
        </div>
    </div>
    <div id="copyrightContainer" style="width: 100%; margin-top: 10px;">
        <p style="width: 100%; text-align: right;">
            <%= this.GetGlobalResourceObject("WebVideoPlayer", "Copyright")%>
            <a href="http://www.bigbuckbunny.org">www.bigbuckbunny.org</a>
        </p>
    </div>
</asp:Content>
