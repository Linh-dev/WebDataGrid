using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            this.AccessDataSource1.DataFile = this.GetMdbLocation("Nwind.mdb");
        }
    }
}
