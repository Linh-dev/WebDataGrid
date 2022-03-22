<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/themes/infragistics/infragistics.theme.css" rel="stylesheet"
        type="text/css" />
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/structure/infragistics.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/SamplesBrowser/SamplesCommon/aspnet/Common/Scripts/jquery/js/infragistics.js"
        language="javascript"></script>
    <style type="text/css">
        .relatedVideosBanner
        {
            width: 80px;
            height: 80px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <igjq:WebVideoPlayer ID="player1" runat="server" Width="720" Height="560" FullScreen="false"
        BrowserControls="false" AutoHide="true" AutoPlay="false" VolumeAutohideDelay="1500"
        Title="Quince Presentation Part 1" PosterUrl="/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/EmbedRelatedVideos/QuinceIntro_1.png">
        <Sources>
            <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_1.h264.mp4" />
            <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_1.webmvp8.webm" />
            <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_1.theora.ogv" />
        </Sources>
        <RelatedVideos>
            <igjq:VideoPlayerRelatedVideo Css="relatedVideosBanner" Title="Quince Presentation Part 3"
                ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/EmbedRelatedVideos/QuinceIntro_Part3.png">
                <Sources>
                    <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_Part3_1.h264.mp4" />
                    <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_Part3_1.webmvp8.webm" />
                    <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_Part3_1.theora.ogv" />
                </Sources>
            </igjq:VideoPlayerRelatedVideo>
        </RelatedVideos>
    </igjq:WebVideoPlayer>
</asp:Content>
