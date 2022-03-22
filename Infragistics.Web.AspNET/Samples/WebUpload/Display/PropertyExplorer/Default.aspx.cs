using System;
using System.IO;
using Infragistics.Web.UI.EditorControls;
using Infragistics.Samples.WebUpload;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.webUpload1.ProgressUrl = this.ResolveUrl("~/IGUploadStatusHandler.ashx");
        this.webUpload2.ProgressUrl = this.ResolveUrl("~/IGUploadStatusHandler.ashx");

        // This event handler is used for internal purposes by the samples browser infrastructure
        this.webUpload1.UploadFinishing += new EventHandler<UploadFinishingEventArgs>(WebUploadEventHandlers.OnUploadFinishing);
        this.webUpload2.UploadFinishing += new EventHandler<UploadFinishingEventArgs>(WebUploadEventHandlers.OnUploadFinishing);
    }
}
