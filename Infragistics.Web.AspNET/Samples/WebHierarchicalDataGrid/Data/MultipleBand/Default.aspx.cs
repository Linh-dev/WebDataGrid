using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void GridInit(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataFile = this.GetMdbLocation("NWind.Mdb");
        this.AccessDataSource2.DataFile = this.GetMdbLocation("NWind.Mdb");
        this.AccessDataSource3.DataFile = this.GetMdbLocation("NWind.Mdb");
        this.AccessDataSource4.DataFile = this.GetMdbLocation("NWind.Mdb");
    }
}
