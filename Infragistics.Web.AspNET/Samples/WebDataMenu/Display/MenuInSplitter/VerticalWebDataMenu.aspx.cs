using System;
using Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET;

public partial class VerticalWebDataMenu : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.MenuDataSource.DataFile = this.GetXmlLocation("MenuScrollingData.xml");
        this.WebDataMenuVertical.DataSourceID = "MenuDataSource";
    }
}

