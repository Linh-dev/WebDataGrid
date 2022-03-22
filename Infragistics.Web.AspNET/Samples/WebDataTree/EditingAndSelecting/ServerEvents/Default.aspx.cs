using System;
using Infragistics.Web.UI.NavigationControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.TreeDataSource.DataFile = this.GetXmlLocation("SampleData.xml");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.WebDataTreeSample.DataBound += new EventHandler(WebDataTreeSample_DataBound);
    }

    protected void WebDataTreeSample_DataBound(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (this.WebDataTreeSample.Nodes.Count > 0)
            {
                this.WebDataTreeSample.Nodes[0].Selected = true;
                this.WebDataTreeSample.Nodes[0].ExpandChildren();
            }
        }
        this.ServerMessage.Text = this.GetGlobalResourceObject("WebDataTree","DataBound").ToString();
    }

    protected void WebDataTreeSample_TextChanged(object sender, DataTreeNodeEventArgs e)
    {
        this.ServerMessage.Text = this.GetGlobalResourceObject("WebDataTree", "TextChanged").ToString() + e.Node.Text;
    }

    protected void WebDataTreeSample_NodeExpanded(object sender, DataTreeNodeEventArgs e)
    {
        this.ServerMessage.Text = this.GetGlobalResourceObject("WebDataTree", "NodeExpanded").ToString() + e.Node.Text;
    }

    protected void WebDataTreeSample_NodeClick(object sender, DataTreeNodeEventArgs e)
    {
        this.ServerMessage.Text = this.GetGlobalResourceObject("WebDataTree", "NodeClicked").ToString() + e.Node.Text;
    }

    protected void WebDataTreeSample_NodeCollapsed(object sender, DataTreeNodeEventArgs e)
    {
        this.ServerMessage.Text = this.GetGlobalResourceObject("WebDataTree", "NodeCollapsed").ToString() + e.Node.Text;
    }
}
