using System;
using System.Web.UI.WebControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void WebDataMenu1_ItemBound(object sender, Infragistics.Web.UI.NavigationControls.DataMenuItemEventArgs e)
    {
        e.Item.GroupSettings.Height = new Unit("140px");
    }

    protected void OnInit(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
        this.AccessDataSource2.DataBind();
    }
}
