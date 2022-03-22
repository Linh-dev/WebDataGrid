using System;

public partial class Samples_WebDataMenu_Display_Vertical_Menu_Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.MenuDataSource.DataBind();
    }
}
