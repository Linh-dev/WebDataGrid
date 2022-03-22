<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/themes/infragistics/infragistics.theme.css" rel="stylesheet"
        type="text/css" />
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/structure/infragistics.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/SamplesBrowser/SamplesCommon/aspnet/Common/Scripts/jquery/js/infragistics.js"
        language="javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#showCommercials").bind({
                change: function () {
                    var alwaysPlay = $(this).val() === "False" ? false : true;
                    var commercials = $("#<%= this.player1.ClientID %>").igVideoPlayer("option", "commercials");
                    commercials.alwaysPlayCommercials = alwaysPlay;
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="margin-bottom: 10px;">
        <div style="float: left;">
            <%= this.GetGlobalResourceObject("WebVideoPlayer", "Commercials_ShowAlways") %>
        </div>
        <div style="float: left; padding-left: 20px;">
            <select id="showCommercials">
                <option selected="selected">True</option>
                <option>False</option>
            </select>
        </div>
        <div style="clear: both;">
        </div>
    </div>
    <div>
        <igjq:WebVideoPlayer ID="player1" runat="server" Width="720" Height="270" FullScreen="false"
            BrowserControls="false" AutoHide="true" AutoPlay="false" VolumeAutohideDelay="2000"
            Title="Infragistics Presentation" Commercials-AlwaysPlayCommercials="true" PosterUrl="/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/CommercialsSupport/Infragistics_Presentation_lowRes_1.png">
            <Sources>
                <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/Infragistics_Presentation_lowRes_1.h264.mp4" />
                <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/Infragistics_Presentation_lowRes_1.webmvp8.webm" />
                <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/Infragistics_Presentation_lowRes_1.theora.ogv" />
            </Sources>
            <Commercials>
                <LinkedCommercials>
                    <igjq:VideoPlayerLinkedSource StartTime="20" Title="Quince Presentation p1" Link="http://quince.infragistics.com/">
                        <Sources>
                            <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_1.h264.mp4" />
                            <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_1.webmvp8.webm" />
                            <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_1.theora.ogv" />
                        </Sources>
                    </igjq:VideoPlayerLinkedSource>
                    <igjq:VideoPlayerLinkedSource StartTime="100" Title="Quince Presentation p3" Link="http://quince.infragistics.com/">
                        <Sources>
                            <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_Part3_1.h264.mp4" />
                            <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_Part3_1.webmvp8.webm" />
                            <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_Part3_1.theora.ogv" />
                        </Sources>
                    </igjq:VideoPlayerLinkedSource>
                </LinkedCommercials>
            </Commercials>
        </igjq:WebVideoPlayer>
    </div>
</asp:Content>
