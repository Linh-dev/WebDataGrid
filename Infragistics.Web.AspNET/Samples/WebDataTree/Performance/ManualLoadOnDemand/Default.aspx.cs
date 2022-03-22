using System;
using System.Collections.Generic;
using Infragistics.Web.UI.NavigationControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    WebTreeDataCommand dc = new WebTreeDataCommand();

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.WebDataTreeSample.NodeBound += new DataTreeNodeEventHandler(WebDataTreeSample_NodeBound);
        this.WebDataTreeSample.NodePopulate += new DataTreeNodeEventHandler(WebDataTreeSample_NodePopulate);
    }

    void WebDataTreeSample_NodePopulate(object sender, DataTreeNodeEventArgs e)
    {
        if (!e.Node.HasChildren)
        {
            IList<Chapter> chapters = dc.GetChapeters(e.Node.Text);
            foreach (Chapter chap in chapters)
            {
                DataTreeNode dtn = new DataTreeNode();
                dtn.Text = chap.Title;
                dtn.Value = chap.Value;
                dtn.ImageUrl = chap.ImageUrl;

                e.Node.Nodes.Add(dtn);
            }
        }
    }

    void WebDataTreeSample_NodeBound(object sender, DataTreeNodeEventArgs e)
    {
        //You would have business logic that determines if IsEmptyParent should be set or not.  For this sample we are just turning it on.
        e.Node.IsEmptyParent = true;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            IList<Book> books = dc.GetBooks();
            WebDataTreeSample.DataSource = books;
            WebDataTreeSample.DataBind();
        }
    }
}