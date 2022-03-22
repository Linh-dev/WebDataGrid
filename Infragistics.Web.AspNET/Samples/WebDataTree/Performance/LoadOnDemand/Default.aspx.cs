using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.CategoriesDS.DataFile = this.GetMdbLocation("Nwind.mdb");
        this.ProductsDS.DataFile = this.GetMdbLocation("Nwind.mdb");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.EnabledLoadOnDemand.CheckedChanged += new EventHandler(EnabledLoadOnDemand_CheckedChanged);
    }

    void EnabledLoadOnDemand_CheckedChanged(object sender, EventArgs e)
    {
        this.WebDataTreeSample.DataSourceID = "whds";
        this.WebDataTreeSample.EnableAjax = this.EnabledLoadOnDemand.Checked;
    }

    protected void WebDataTree1_NodeBound(object sender, Infragistics.Web.UI.NavigationControls.DataTreeNodeEventArgs e)
    {
        if (e.Node.Level == 1)
        {
            e.Node.TemplateId = "ChildTemplate";
        }
    }
}