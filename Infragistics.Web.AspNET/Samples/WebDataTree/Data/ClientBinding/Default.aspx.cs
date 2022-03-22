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
        this.WebDataTree1.EnableClientRendering = true;
    }
}