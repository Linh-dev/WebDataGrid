using System;
using System.Web.UI;
using System.Xml;
using Infragistics.Web.UI.NavigationControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.MenuDataSource.DataFile = this.GetXmlLocation("MenuScrollingData.xml");
        this.WebMenuDataSource.DataFile = this.GetXmlLocation("MenuScrollingData.xml");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
			this.WinMenu.DataSourceID = "MenuDataSource";
			this.WinMenu.DataBind();
        }
        this.MenuDataSource.DataBind();
        this.WebMenuDataSource.DataBind();

        foreach (DataMenuItem item in this.WinMenu.Allitems)
        {
            if (item.Text == "[Separator]")
            {
                item.IsSeparator = true;
            }

            XmlElement xmlElement = (XmlElement)((IHierarchyData)item.DataItem).Item;
            if (xmlElement.HasAttribute("Target"))
            {
                item.ImageUrl = (((System.Xml.XmlElement)(((IHierarchyData)item.DataItem).Item))).Attributes["Target"].Value;
            }

            if (xmlElement.HasAttribute("Enabled"))
            {
                item.Enabled = false;
            }
        }
    }
}