using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using NG = Infragistics.Web.UI.NavigationControls;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool enableActivateOnHover = Page.Session["ActivateOnHover"] != null ? (bool)Page.Session["ActivateOnHover"] : true;
        this.IEMenu.ActivateOnHover = enableActivateOnHover;
		bool enableScrolling = Page.Session["EnableScrolling"] != null ? (bool)Page.Session["EnableScrolling"] : false;
		this.IEMenu.EnableScrolling = enableScrolling;
		int scrollingSpeed = Page.Session["ScrollingSpeed"] != null ? Convert.ToInt32(Page.Session["ScrollingSpeed"]) : 3;
        switch (scrollingSpeed)
        {
            case 1: this.IEMenu.ScrollingSpeed = NG.ScrollingSpeed.VerySlow; break;
            case 2: this.IEMenu.ScrollingSpeed = NG.ScrollingSpeed.Slow; break;
            case 3: this.IEMenu.ScrollingSpeed = NG.ScrollingSpeed.Normal; break;
            case 4: this.IEMenu.ScrollingSpeed = NG.ScrollingSpeed.Fast; break;
            case 5: this.IEMenu.ScrollingSpeed = NG.ScrollingSpeed.VeryFast; break;
        }

		int orientation = Page.Session["Orientation"] != null ? Convert.ToInt32(Page.Session["Orientation"]) : 1;
		switch (orientation)
		{
			case 1: IEMenu.GroupSettings.Orientation = NG.Orientation.Horizontal; break;
			case 2: IEMenu.GroupSettings.Orientation = NG.Orientation.Vertical; break;
		}

        if (!this.IEMenu.EnableScrolling)
        {
            Page.Session["DDListSelection"] = this.GetGlobalResourceObject("WebDataMenu","MenuInIFrame_Auto");
        }

        string value = Page.Session["DDListSelection"] != null ? Page.Session["DDListSelection"].ToString() : string.Empty;
        if (!value.Equals(this.GetGlobalResourceObject("WebDataMenu", "MenuInIFrame_Auto").ToString()))
			this.AdjustRootItemsWidthAndHeight(new Unit(value));
    }

	/// <summary>
	/// Specifies width & height for the scroll container on the root level.
	/// Specifies height & width for the scroll containers for the children of the root items.
	/// </summary>
	/// <param name="value">How many pixels will be the scroll container size.</param>
    protected void AdjustRootItemsWidthAndHeight(Unit value)
    {
        IEMenu.GroupSettings.Width = value;
        IEMenu.GroupSettings.Height = value;
        if (value.ToString() == "300px")
        {
            foreach (NG.DataMenuItem item in IEMenu.Items)
            {
                if (item.Text == this.GetGlobalResourceObject("WebDataMenu", "IEMenu_Toolbars").ToString())
                {
                    item.GroupSettings.Width = value;
                    item.GroupSettings.Height = value;
                }
            }
        }
        else if (value.ToString() == "250px")
        {
            foreach (NG.DataMenuItem item in IEMenu.Items)
            {
                if ((item.Text != this.GetGlobalResourceObject("WebDataMenu", "IEMenu_GoTo").ToString()) &&
                    (item.Text != this.GetGlobalResourceObject("WebDataMenu", "IEMenu_TextSize").ToString()) &&
                    (item.Text != this.GetGlobalResourceObject("WebDataMenu", "IEMenu_Style").ToString()) &&
                    (item.Text != this.GetGlobalResourceObject("WebDataMenu", "IEMenu_Encoding").ToString()))
                {
                    item.GroupSettings.Width = value;
                    item.GroupSettings.Height = value;
                }
            }
        }
        else if (value.ToString() == "200px")
        {
            foreach (NG.DataMenuItem item in IEMenu.Items)
            {
                if ((item.Text != this.GetGlobalResourceObject("WebDataMenu", "IEMenu_GoTo").ToString()) &&
                    (item.Text != this.GetGlobalResourceObject("WebDataMenu", "IEMenu_TextSize").ToString()) &&
                    (item.Text != this.GetGlobalResourceObject("WebDataMenu", "IEMenu_Style").ToString()))
                {
                    item.GroupSettings.Width = value;
                    item.GroupSettings.Height = value;
                }
            }
        }
    }
}
