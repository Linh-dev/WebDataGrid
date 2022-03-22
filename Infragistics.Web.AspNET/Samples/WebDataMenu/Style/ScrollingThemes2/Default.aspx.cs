using System;
using System.Web.UI.WebControls;
using Infragistics.Web.UI.NavigationControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.MenuScrollingSimpleDataSource.DataFile = this.GetXmlLocation("MenuScrollingDataSimple.xml");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.InitMenu(WebDataMenu1);
            this.InitMenu(WebDataMenu2);
            this.InitMenu(WebDataMenu3);
            this.InitMenu(WebDataMenu4);
            this.InitMenu(WebDataMenu5);
            this.InitMenu(WebDataMenu6);
            this.InitMenu(WebDataMenu7);
            this.InitMenu(WebDataMenu8);
            this.InitMenu(WebDataMenu9);
        }
    }

    /// <summary>
    /// This method sets the orientation of the menu to Vertical, enables the animation.
    /// Sets the animation type to - OpacityAnimation.
    /// In GroupSettings sets the height to 100px.
    /// Binds the menu to MenuScrollingSimpleDataSource and sets the ActiveOnHover property of the menu to false.
    /// </summary>
    /// <param name="menu">The menu that will be initialized.</param>
    protected void InitMenu(WebDataMenu menu)
    {
        menu.ActivateOnHover = false;
        menu.DataSourceID = "MenuScrollingSimpleDataSource";
        menu.DataBind();

        foreach (DataMenuItem item in menu.Items)
        {
            if (item.Level == 0)
            {
                item.GroupSettings.Orientation = Infragistics.Web.UI.NavigationControls.Orientation.Vertical;
                item.GroupSettings.EnableAnimation = true;
                item.GroupSettings.AnimationType = AnimationType.OpacityAnimation;
                item.GroupSettings.Height = new Unit("100px");
            }
        }
    }
}