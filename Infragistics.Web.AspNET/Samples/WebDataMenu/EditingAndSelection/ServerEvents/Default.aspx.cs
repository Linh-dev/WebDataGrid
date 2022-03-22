using System;
using Infragistics.Web.UI.NavigationControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.MenuDataSource.DataFile = this.GetXmlLocation("MenuData.xml");
    }

    protected void WebDataMenuSample_DataBound(object sender, EventArgs e)
    {
        this.ServerMessage.Text = this.GetGlobalResourceObject("WebDataMenu", "DataBound").ToString();
    }

    protected void WebDataMenu_ItemSelected(object sender, Infragistics.Web.UI.NavigationControls.DataMenuItemEventArgs e)
    {
        //this.ServerMessage.Text = this.GetGlobalResourceObject("WebDataMenu","ItemSelectedCaption") + e.Item.Text;
    }

    protected void WebDataMenu_ItemClick(object sender, Infragistics.Web.UI.NavigationControls.DataMenuItemEventArgs e)
    {

        if (e.Item != null)
        {
            string menuItemClicked = string.Empty;

            DataMenuItem parent = e.Item.ParentItem;
            if (parent != null)
            {
                menuItemClicked = parent.Text + ": " + e.Item.Text;
            }
            else
            {
                menuItemClicked = e.Item.Text;
            }



            this.ServerMessage.Text = this.GetGlobalResourceObject("WebDataMenu","ItemClickedCaption") + menuItemClicked;
        }
    }
}
