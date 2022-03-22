using System;

public partial class Samples_WebDataMenu_Data_Hierarchical_Data_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.RootItems.DataBind();
        this.SubMenus.DataBind();
    }
}
