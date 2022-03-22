using System;
using System.Web.UI.WebControls;
using Infragistics.Web.UI.ListControls;

public partial class Samples_WebImageViewer_Display_Horizontal_and_Vertical_Orientation_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            for (int i = 1; i <= 7; i++)
            {
                ImageItem image = new ImageItem("/SamplesBrowser/SamplesCommon/aspnet/WebImageViewer/image" + i.ToString() + ".jpg", "", "");
                this.WebImageViewer1.Items.Add(image);
            }

            this.DropDownList1.Items.Add("Vertical");
            this.DropDownList1.Items.Add("Horizontal");

            this.WebImageViewer1.Orientation = Orientation.Vertical;
            this.WebImageViewer1.Height = new Unit("500px");
            this.WebImageViewer1.Width = new Unit("180px");
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.WebImageViewer1.Orientation == Orientation.Vertical)
        {
            this.WebImageViewer1.Orientation = Orientation.Horizontal;
            this.WebImageViewer1.Height = new Unit("100px");
            this.WebImageViewer1.Width = new Unit("500px");
        }
        else
        {
            this.WebImageViewer1.Orientation = Orientation.Vertical;
            this.WebImageViewer1.Height = new Unit("500px");
            this.WebImageViewer1.Width = new Unit("180px");
        }
    }
}
