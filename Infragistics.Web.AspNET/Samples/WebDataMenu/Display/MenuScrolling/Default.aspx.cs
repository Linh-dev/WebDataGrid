using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.MenuDataSource.DataFile = this.GetXmlLocation("MenuScrollingData.xml");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.WebDataMenuHorizontal.DataSourceID = "MenuDataSource";
            this.WebDataMenuVertical.DataSourceID = "MenuDataSource";

        }
    }
}