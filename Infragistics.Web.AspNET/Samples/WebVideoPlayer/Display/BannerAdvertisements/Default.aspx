<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/themes/infragistics/infragistics.theme.css"
        rel="stylesheet" type="text/css" />
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/Styles/jquery/css/structure/infragistics.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript" src="/SamplesBrowser/SamplesCommon/aspnet/Common/Scripts/jquery/js/infragistics.js"
        language="javascript"></script>
    <script type="text/javascript">
        var alternate = false;

        function bannerVisible(sender, eventArgs) {
            if (alternate === true)
                eventArgs.bannerElement.css('top', 130);
            else
                eventArgs.bannerElement.css('top', 0);

            alternate = !alternate;
        }

        function bannerClick(sender, eventArgs) {
            $("#<%= this.videoPlayer1.ClientID %>").igVideoPlayer('pause');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <igjq:WebVideoPlayer ID="videoPlayer1" runat="server" Width="720" Height="272" FullScreen="false"
        BrowserControls="false" AutoHide="false" AutoPlay="false" VolumeAutohideDelay="2000"
        Title="Infragistics Presentation" PosterUrl="/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/BannerAdvertisements/Infragistics_Presentation_lowRes_1.png">
        <Sources>
            <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/Infragistics_Presentation_lowRes_1.h264.mp4" />
            <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/Infragistics_Presentation_lowRes_1.webmvp8.webm" />
            <igjq:VideoPlayerSource Source="http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/Infragistics_Presentation_lowRes_1.theora.ogv" />
        </Sources>
        <Banners>
            <igjq:VideoPlayerBanner ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/BannerAdvertisements/Banner1.png"
                Link="http://quince.infragistics.com/" Times="5, 20, 60" Visible="false" CloseBanner="true"
                Animate="true" Autohide="true" HideDelay="10000" Width="200" Height="67" />
        </Banners>
        <ClientEvents BannerClick="bannerClick" BannerVisible="bannerVisible" />
    </igjq:WebVideoPlayer>
</asp:Content>
