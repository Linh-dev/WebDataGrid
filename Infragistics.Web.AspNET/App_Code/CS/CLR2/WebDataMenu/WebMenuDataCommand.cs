using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Xml;


using Infragistics.Web.UI.NavigationControls;
using Infragistics.Web.SampleBrowser.Core.Framework.DataAccess;

public class WebMenuDataCommand
{
	public WebMenuDataCommand()
	{
	}

    public void SetDataSource(WebDataMenu target, Common.DataSourceTypes dataSourceType)
    {
        switch (dataSourceType)
        {
            case Common.DataSourceTypes.ICollection:
            case Common.DataSourceTypes.IEnumerable:
                target.DataSourceID = null;
                target.DataSource = this.GetMenuData();
                target.DataBind();
                break;
            case Common.DataSourceTypes.IBindingList:
                target.DataSourceID = null;
                target.DataSource = new BindingList<MenuItem>(this.GetMenuData());
                target.DataBind();
                break;
            case Common.DataSourceTypes.Xml:
            default:
                target.DataSourceID = "MenuDataSource";
                break;
        }
    }

    private MenuItem CreateMenuItem(XmlNode source)
    {
        MenuItem menuItem = new MenuItem(source.Attributes["Value"].Value);
        menuItem.Text = source.Attributes["Text"].Value;
        menuItem.URL = source.Attributes["URL"].Value;
        menuItem.ImageUrl = source.Attributes["ImageUrl"].Value;
        return menuItem;
    }

    private IList<MenuItem> GetMenuData()
    {
        DataRepository igdbm = new DataRepository();
        string dataSource = igdbm.ResolveXmlFileLocation("MenuData.xml");
        
        XmlDocument documentSource = new XmlDocument();
        documentSource.Load(dataSource);

        IList<MenuItem> items = new List<MenuItem>();

        XmlNodeList menuData = documentSource.SelectNodes("/MenuData/CommunitySiteMenu/Menu");
        foreach (XmlNode menuNode in menuData)
        {
            MenuItem topMenu = this.CreateMenuItem(menuNode);
            items.Add(topMenu);

            foreach (XmlNode childNode in menuNode.ChildNodes)
            {
                topMenu.AddChild(this.CreateMenuItem(childNode));
            }
        }

        return items;
    }


}
