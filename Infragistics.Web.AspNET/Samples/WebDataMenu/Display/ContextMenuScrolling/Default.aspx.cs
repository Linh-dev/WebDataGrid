using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.MenuScrollingSimpleDataSource.DataFile = this.GetXmlLocation("MenuScrollingDataSimple.xml");
        this.ContexMenuDataSource.DataFile = this.GetXmlLocation("MenuScrollingDataSimple.xml");
    }
}