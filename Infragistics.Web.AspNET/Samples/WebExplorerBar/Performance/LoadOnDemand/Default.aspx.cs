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
        this.WebExplorerBar1.DataSourceID = "whds";
        this.WebExplorerBar1.InitialDataBindDepth = (this.EnabledLoadOnDemand.Checked) ? 0 : -1;
        this.WebExplorerBar1.DataBind();
    }

    protected void WebExplorerBar1_OnExplorerBarItemBound(object sender, Infragistics.Web.UI.NavigationControls.ExplorerBarItemEventArgs e)
    {

    }
}