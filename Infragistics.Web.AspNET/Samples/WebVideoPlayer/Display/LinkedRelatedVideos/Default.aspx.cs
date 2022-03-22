using System;
using Infragistics.Web.UI.DisplayControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool displaySecondVideo = Page.Request.QueryString["param"] != null && Page.Request.QueryString["param"].Equals("2");

        string posterVideo1 = "/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/LinkedRelatedVideos/QuinceIntro_1.png";
        string posterVideo2 = "/SamplesBrowser/SamplesCommon/aspnet/WebVideoPlayer/Display/LinkedRelatedVideos/QuinceIntro_Part3.png";

        string titleVideo1 = "Quince Presentation Part 1";
        string titleVideo2 = "Quince Presentation Part 3";

        if (!displaySecondVideo)
        {
            this.player1.PosterUrl = posterVideo1;
            this.player1.Title = titleVideo1;

            this.player1.Sources.Add(new VideoPlayerSource());
            this.player1.Sources.Add(new VideoPlayerSource());
            this.player1.Sources.Add(new VideoPlayerSource());

            this.player1.Sources[0].Source = "http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_1.h264.mp4";
            this.player1.Sources[1].Source = "http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_1.webmvp8.webm";
            this.player1.Sources[2].Source = "http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_1.theora.ogv";

            VideoPlayerRelatedVideo vprv = new VideoPlayerRelatedVideo();
            vprv.Css = "relatedVideosBanner";
            vprv.ImageUrl = posterVideo2;
            vprv.Title = titleVideo2;
            vprv.Link = String.Format("?cn={0}&sid={1}&param=2", this.Component.RouteName, this.Sample.SampleId);

            this.player1.RelatedVideos.Add(vprv);
        }
        else
        {
            this.player1.PosterUrl = posterVideo2;
            this.player1.Title = titleVideo2;

            this.player1.Sources.Add(new VideoPlayerSource());
            this.player1.Sources.Add(new VideoPlayerSource());
            this.player1.Sources.Add(new VideoPlayerSource());

            this.player1.Sources[0].Source = "http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_Part3_1.h264.mp4";
            this.player1.Sources[1].Source = "http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_Part3_1.webmvp8.webm";
            this.player1.Sources[2].Source = "http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/QuinceIntro_Part3_1.theora.ogv";

            VideoPlayerRelatedVideo vprv = new VideoPlayerRelatedVideo();
            vprv.Css = "relatedVideosBanner";
            vprv.ImageUrl = posterVideo1;
            vprv.Title = titleVideo1;
            vprv.Link = String.Format("?cn={0}&sid={1}", this.Component.RouteName, this.Sample.SampleId);

            this.player1.RelatedVideos.Add(vprv);
        }
    }
}
