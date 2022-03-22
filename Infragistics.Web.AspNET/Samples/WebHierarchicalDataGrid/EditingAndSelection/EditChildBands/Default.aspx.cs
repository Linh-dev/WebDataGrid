using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataFile = this.GetMdbLocation("NWind.mdb");
        this.AccessDataSource2.DataFile = this.GetMdbLocation("NWind.mdb");
    }
}
