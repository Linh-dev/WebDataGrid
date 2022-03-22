using System;
using Infragistics.Web.UI.ListControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            for (int i = 1; i <= 8; i++)
            {
                ImageItem image = new ImageItem("/SamplesBrowser/SamplesCommon/aspnet/WebImageViewer/image" + i.ToString() + ".jpg", "", "");
                this.WebImageViewer1.Items.Add(image);
            }
        }
    }
}
