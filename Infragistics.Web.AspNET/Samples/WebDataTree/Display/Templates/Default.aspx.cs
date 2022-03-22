using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.TreeDataSource.DataFile = this.GetXmlLocation("SampleData.xml");
    }

    protected void WebDataTree1_NodeBound(object sender, Infragistics.Web.UI.NavigationControls.DataTreeNodeEventArgs e)
    {
        e.Node.TemplateId = "Template1";
    }
}