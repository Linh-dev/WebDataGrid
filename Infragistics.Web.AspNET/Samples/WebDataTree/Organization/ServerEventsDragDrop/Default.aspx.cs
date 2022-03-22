using Infragistics.Web.UI.NavigationControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void serverNodeAdded(object sender, DataTreeNodeRangeEventArgs e)
    {
        this.ServerMessage.Text += string.Format("{0}: {1} <br>",
                                                 this.GetGlobalResourceObject("WebDataTree","NodeAdded"),
                                                 e.Nodes[0].Text);
    }
    protected void serverNodeDropped(object sender, DataTreeNodeDroppedEventArgs e)
    {
        string dest = "None";
        if (e.DestNode != null)
        {
            if (e.DragDropPoint == Infragistics.Web.UI.DragDropPoint.On)
            {
                dest = e.DestNode.Text.ToString();
            }

            if (e.DragDropPoint == Infragistics.Web.UI.DragDropPoint.Before)
            {
                dest = string.Empty;
                dest = string.Format("{0} {1}", this.GetGlobalResourceObject("WebDataTree","Before"), e.DestNode.Text.ToString());
            }

            if (e.DragDropPoint == Infragistics.Web.UI.DragDropPoint.After)
            {
                dest = string.Empty;
                dest = string.Format("{0} {1}", this.GetGlobalResourceObject("WebDataTree","After"), e.DestNode.Text.ToString());
            }
        }

        this.ServerMessage.Text += string.Format("{0} {1}: {2}, {3}: {4} <br>",
                                                 this.GetGlobalResourceObject("WebDataTree","NodeDropped"),
                                                 this.GetGlobalResourceObject("WebDataTree","SourceNode"),
                                                 e.SourceNodes[0].Text.ToString(),
                                                 this.GetGlobalResourceObject("WebDataTree","DestinationNode"),
                                                 dest);
    }

    protected void serverNodeRemoved(object sender, DataTreeNodeRangeEventArgs e)
    {
        this.ServerMessage.Text += string.Format("{0}: {1} <br>",
                                                 this.GetGlobalResourceObject("WebDataTree","NodeRemoved"),
                                                 e.Nodes[0].Text);
    }
}
