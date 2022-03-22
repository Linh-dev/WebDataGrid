using System;
using System.Web.UI;
using Infragistics.Web.UI.ListControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ImageItem wpf = new ImageItem("/SamplesBrowser/SamplesCommon/aspnet/WebImageViewer/Display/Selection/green_thumb.jpg", "Green Car", "");
        // Create a javascript array of an Image and description for the image, and store them in the key.
        wpf.Key = this.BuildKey("/SamplesBrowser/SamplesCommon/aspnet/WebImageViewer/Display/Selection/green.jpg", "Green car");
        this.WebImageViewer1.Items.Add(wpf);

        ImageItem winForm = new ImageItem("/SamplesBrowser/SamplesCommon/aspnet/WebImageViewer/Display/Selection/yellow_thumb.jpg", "Yellow car", "");
        winForm.Key = this.BuildKey("/SamplesBrowser/SamplesCommon/aspnet/WebImageViewer/Display/Selection/yellow.jpg", "Yellow car");
        this.WebImageViewer1.Items.Add(winForm);

        ImageItem jsf = new ImageItem("/SamplesBrowser/SamplesCommon/aspnet/WebImageViewer/Display/Selection/red_thumb.jpg", "Red Car", "");
        jsf.Key = this.BuildKey("/SamplesBrowser/SamplesCommon/aspnet/WebImageViewer/Display/Selection/red.jpg", "Red car");
        this.WebImageViewer1.Items.Add(jsf);

        ImageItem aspnet = new ImageItem("/SamplesBrowser/SamplesCommon/aspnet/WebImageViewer/Display/Selection/gray_thumb.jpg", "Gray Car", "");
        aspnet.Key = this.BuildKey("/SamplesBrowser/SamplesCommon/aspnet/WebImageViewer/Display/Selection/gray.jpg", "Gray car");
        this.WebImageViewer1.Items.Add(aspnet);

        ImageItem svc = new ImageItem("/SamplesBrowser/SamplesCommon/aspnet/WebImageViewer/Display/Selection/purple_thumb.jpg", "Purple car", "");
        svc.Key = this.BuildKey("/SamplesBrowser/SamplesCommon/aspnet/WebImageViewer/Display/Selection/purple.jpg", "purple car");
        this.WebImageViewer1.Items.Add(svc);

        foreach (ImageItem item in this.WebImageViewer1.Items)
        {
            item.SelectedCssClass = "mySelectedImageItem";
            item.CssClass = "myImageItem";
        }

    }

    private string BuildKey(string path, string description)
    {
        return "['" + Page.ResolveClientUrl(path) + "', '" + description + "']";
    }
}
