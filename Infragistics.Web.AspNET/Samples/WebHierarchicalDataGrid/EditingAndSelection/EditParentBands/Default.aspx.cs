using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.Regions.DataFile = this.GetMdbLocation("NWind.mdb");
        this.RegionProvider.EditorControl.DataSource = this.Regions;       
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
        this.AccessDataSource2.DataBind();
    }
}
