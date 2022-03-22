using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.TreeDataSource.DataFile = this.GetXmlLocation("SampleData.xml");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.SelectedDataSource.DataSourceChanged += new EventHandler(SelectedDataSource_DataSourceChanged);
        this.WebDataTreeSample.DataBound += new EventHandler(WebDataTreeSample_DataBound);

        if (!this.IsPostBack)
        {
            this.WebDataTreeSample.DataSourceID = "TreeDataSource";
        }
    }

    void WebDataTreeSample_DataBound(object sender, EventArgs e)
    {
        if (this.WebDataTreeSample.Nodes.Count > 0)
        {
            this.WebDataTreeSample.Nodes[0].Selected = true;
            this.WebDataTreeSample.Nodes[0].ExpandChildren();
        }
    }

    protected void SelectedDataSource_DataSourceChanged(object sender, EventArgs e)
    {
        new WebTreeDataCommand().SetDataSource(this.WebDataTreeSample, this.SelectedDataSource.DataSource);
    }
}