using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.DefaultDataSource.DataFile = this.GetMdbLocation("Nwind.mdb");
    }
}