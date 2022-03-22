<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/themes/infragistics/infragistics.theme.css" rel="stylesheet"
        type="text/css" />
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/structure/infragistics.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/SamplesBrowser/SamplesCommon/aspnet/Common/Scripts/jquery/js/infragistics.js"
        language="javascript"></script>
    <link type="text/css" href="/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/DisplayOptions/DisplayOptions.css"
        rel="stylesheet" />
    <script type="text/javascript">
        $(window).load(function () {
            $("#browserControlsButton").igButton().click(function () {
                switchBooleanOption('browserControls', $('#browserControlsButton span'));
            });

            $("#autoHideButton").igButton().click(function () {
                switchBooleanOption('autohide', $('#autoHideButton span'));
            });

            $("#showSeekTimeButton").igButton().click(function () {
                switchBooleanOption('showSeekTime', $('#showSeekTimeButton span'));
            });

            $("#loopButton").igButton().click(function () {
                switchBooleanOption('loop', $('#loopButton span'));
            });

            $("#submitChangesButton").igButton().click(function () {
                $('#<%= this.videoPlayer1.ClientID %>').igVideoPlayer('option', 'width', parseInt($('#widthTextField').val(), 10));
                $('#<%= this.videoPlayer1.ClientID %>').igVideoPlayer('option', 'height', parseInt($('#heightTextField').val()), 10);
                $('#<%= this.videoPlayer1.ClientID %>').igVideoPlayer('option', 'volumeAutohideDelay', parseInt($('#volumeAutoHideDelayTextField').val(), 10));
                $('#<%= this.videoPlayer1.ClientID %>').igVideoPlayer('option', 'centerButtonHideDelay', parseInt($('#centralButtonAutoHideDelayTextField').val(), 10));
            });

            if ($("#<%= this.videoPlayer1.ClientID %>").igVideoPlayer("supports_video") === false) {
                $("#controls").hide();
                $("#<%= this.videoPlayer1.ClientID %>").igVideoPlayer("option", "width", "700px");
            }
        });

        function switchBooleanOption(optionName, button) {
            var optionValue = $('#<%= this.videoPlayer1.ClientID %>').igVideoPlayer('option', optionName);
            $('#<%= this.videoPlayer1.ClientID %>').igVideoPlayer('option', optionName, !optionValue);

            if (optionValue === true)
                button.html('<%= this.GetGlobalResourceObject("WebVideoPlayer", "Off") %>');
            else
                button.html('<%= this.GetGlobalResourceObject("WebVideoPlayer", "On") %>');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="controls" class="controlsContainer">
        <div class="twoColumnControlsPane">
            <div class="lineContainer">
                <div class="control textContainer">
                    <%= this.GetGlobalResourceObject("WebVideoPlayer", "Width")%>
                </div>
                <div class="inputControl">
                    <input id="widthTextField" type="text" size="4" value="720" />
                </div>
            </div>
            <div class="lineContainer">
                <div class="control textContainer">
                    <%= this.GetGlobalResourceObject("WebVideoPlayer", "Height")%>
                </div>
                <div class="inputControl">
                    <input id="heightTextField" type="text" size="4" value="270" />
                </div>
            </div>
            <div class="lineContainer">
                <div class="control textContainer">
                    <%= this.GetGlobalResourceObject("WebVideoPlayer", "Volume_Autohide_Delay")%>
                </div>
                <div class="inputControl">
                    <input id="volumeAutoHideDelayTextField" type="text" size="4" value="1500" />
                </div>
            </div>
            <div class="lineContainer">
                <div class="control textContainer">
                    <%= this.GetGlobalResourceObject("WebVideoPlayer", "Central_Button_Delay")%>
                </div>
                <div class="inputControl">
                    <input id="centralButtonAutoHideDelayTextField" type="text" size="4" value="1500" />
                </div>
            </div>
            <div class="lineContainer">
                <div class="control" style="width: 220px; text-align: right; padding-right: 10px;">
                    <button id="submitChangesButton" class="buttons" type="button" style="width: 160px;">
                        <%= this.GetGlobalResourceObject("WebVideoPlayer", "Submit_Changes")%>
                    </button>
                </div>
            </div>
        </div>
        <div class="twoColumnControlsPane">
            <div class="lineContainer">
                <div class="control textContainer">
                    <%= this.GetGlobalResourceObject("WebVideoPlayer", "Browser_Controls")%>
                </div>
                <div class="inputControl">
                    <button id="browserControlsButton" class="buttons" type="button">
                        <%= this.GetGlobalResourceObject("WebVideoPlayer", "Off")%>
                    </button>
                </div>
            </div>
            <div class="lineContainer">
                <div class="control textContainer">
                    <%= this.GetGlobalResourceObject("WebVideoPlayer", "Autohide")%>
                </div>
                <div class="inputControl">
                    <button id="autoHideButton" class="buttons" type="button">
                        <%= this.GetGlobalResourceObject("WebVideoPlayer", "On")%>
                    </button>
                </div>
            </div>
            <div class="lineContainer">
                <div class="control textContainer">
                    <%= this.GetGlobalResourceObject("WebVideoPlayer", "Show_Seek_Time")%>
                </div>
                <div class="inputControl">
                    <button id="showSeekTimeButton" class="buttons" type="button">
                        <%= this.GetGlobalResourceObject("WebVideoPlayer", "On")%>
                    </button>
                </div>
            </div>
            <div class="lineContainer">
                <div class="control textContainer">
                    <%= this.GetGlobalResourceObject("WebVideoPlayer", "Loop")%>
                </div>
                <div class="inputControl">
                    <button id="loopButton" class="buttons" type="button">
                        <%= this.GetGlobalResourceObject("WebVideoPlayer", "Off")%>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div id="videoPlayerContainer" style="width: 720px; height: 290px; overflow: auto;">
        <igjq:WebVideoPlayer ID="videoPlayer1" runat="server" Width="720" Height="270" FullScreen="false"
            BrowserControls="false" AutoHide="true" AutoPlay="false" Muted="false" VolumeAutohideDelay="1500"
            Title="Infragistics Presentation" Volume="0.8" ShowSeekTime="true" Loop="false"
            PosterUrl="/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/DisplayOptions/Infragistics_Presentation_lowRes_1.png">
            <Sources>
                <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/Infragistics_Presentation_lowRes_1.h264.mp4" />
                <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/Infragistics_Presentation_lowRes_1.webmvp8.webm" />
                <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/Infragistics_Presentation_lowRes_1.theora.ogv" />
            </Sources>
        </igjq:WebVideoPlayer>
    </div>
</asp:Content>
