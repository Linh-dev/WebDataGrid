using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void OnInit(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
        this.AccessDataSource2.DataBind();
    }
}

