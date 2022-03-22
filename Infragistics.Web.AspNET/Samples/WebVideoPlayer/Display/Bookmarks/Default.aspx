<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/themes/infragistics/infragistics.theme.css" rel="stylesheet"
        type="text/css" />
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/structure/infragistics.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/SamplesBrowser/SamplesCommon/aspnet/Common/Scripts/jquery/js/infragistics.js"
        language="javascript"></script>
    <link type="text/css" href="/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/Bookmarks/Bookmarks.css"
        rel="stylesheet" />
    <style type="text/css">
        .ui-igplayer-bookmark-list
        {
            overflow: auto;
            height: 67px;
        }
        
        .ui-igplayer-bookmark-list-custom
        {
            overflow: none !important;
            height: auto !important;
        }
    </style>
    <script type="text/javascript">
        var expanded = false;
        $(window).load(function () {
            $("#addBookmarkButton").igButton({ disabled: true }).click(function () {
                var player = $('#<%= this.player1.ClientID %>'),
                    timeToSet = parseInt($('#timeTextField').val());

                if (player.igVideoPlayer('currentTime') <= 0)
                    return;

                if (isNaN(timeToSet)) {
                    timeToSet = player.igVideoPlayer('currentTime');
                } else if (timeToSet >= player.igVideoPlayer('duration')) {
                    alert("Add New Bookmark: Bookmark cannot be added on a position bigger than video length.");
                    $('#timeTextField').val('');
                    return;
                }

                var bookmarks = player.igVideoPlayer('option', 'bookmarks');
                bookmarks.push({
                    title: 'Bookmark',
                    description: 'Bookmark',
                    time: timeToSet
                });

                player.igVideoPlayer('option', 'bookmarks', bookmarks.slice(0));
                if (expanded === true) {
                    $("#player1_bookmarks ul").addClass('ui-igplayer-bookmark-list-custom');
                }
            });

            $("#expandShrinkButton").igButton().click(function () {
                if (expanded === false) {
                    expanded = true;
                    $("#<%= this.player1.ClientID %>_bookmarks ul").addClass('ui-igplayer-bookmark-list-custom');
                    $("#expandShrinkButton span").html('<%= this.GetGlobalResourceObject("WebVideoPlayer", "Bookmark_Shrink") %>');
                }
                else {
                    expanded = false;
                    $("#<%= this.player1.ClientID %>_bookmarks ul").removeClass('ui-igplayer-bookmark-list-custom');
                    $("#expandShrinkButton span").html('<%= this.GetGlobalResourceObject("WebVideoPlayer", "Bookmark_Expand") %>');
                }
            });

            $("#<%= this.player1.ClientID %>").bind({
                igvideoplayerplaying: function () {
                    $("#addBookmarkButton").igButton('option', 'disabled', false);
                },
                igvideoplayerended: function () {
                    $("#addBookmarkButton").igButton('option', 'disabled', true);
                }
            });

            if ($("#<%= this.player1.ClientID %>").igVideoPlayer("supports_video") === false) {
                $("#controls").hide();
                $("#<%= this.player1.ClientID %>").igVideoPlayer("option", "width", "700px");
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="controls" class="controlsContainer">
        <div class="lineContainer">
            <div class="control textContainer">
                <%= this.GetGlobalResourceObject("WebVideoPlayer", "Bookmark_Add") %>
            </div>
            <div class="control">
                <input style="margin-top: 3px; width: 90px;" id="timeTextField" type="text" size="13" value="10" />
            </div>
            <div class="control">
                <button id="addBookmarkButton" class="buttons" type="button">
                    <%= this.GetGlobalResourceObject("WebVideoPlayer", "Bookmark_Button")%>
                </button>
            </div>
            <div class="control">
                <button id="expandShrinkButton" style="width: 150px" class="buttons" type="button">
                    <%= this.GetGlobalResourceObject("WebVideoPlayer", "Bookmark_Expand")%>
                </button>
            </div>
        </div>
    </div>
    <div class="videoPlayerContainer">
        <igjq:WebVideoPlayer ID="player1" runat="server" Width="720" FullScreen="false" BrowserControls="false"
            AutoHide="false" AutoPlay="false" VolumeAutohideDelay="2000" Title="Infragistics Presentation"
            PosterUrl="/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/Bookmarks/Infragistics_Presentation_lowRes_1.png">
            <Sources>
                <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/Infragistics_Presentation_lowRes_1.h264.mp4" />
                <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/Infragistics_Presentation_lowRes_1.webmvp8.webm" />
                <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/Infragistics_Presentation_lowRes_1.theora.ogv" />
            </Sources>
            <Bookmarks>
                <igjq:VideoPlayerBookmark Title="<%$ Resources:WebVideoPlayer, Bookmark_Design %>"
                    Time="14" />
                <igjq:VideoPlayerBookmark Title="<%$ Resources:WebVideoPlayer, Bookmark_Develop %>"
                    Time="46" />
                <igjq:VideoPlayerBookmark Title="<%$ Resources:WebVideoPlayer, Bookmark_Experience %>"
                    Time="74" />
                <igjq:VideoPlayerBookmark Title="<%$ Resources:WebVideoPlayer, Bookmark_Final %>"
                    Time="100" />
            </Bookmarks>
        </igjq:WebVideoPlayer>
    </div>
</asp:Content>
