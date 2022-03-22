using System.Collections.Generic;
using System.Web;
using System.Xml;
using Infragistics.Web.SampleBrowser.Core.Framework.DataAccess;



/// <summary>
/// Summary description for WebDropDownDataCommand
/// </summary>
public class WebDropDownDataCommand
{

    public IList<WebDropDownItem> GetData() 
    {
        return GetList("//countries/country");
    }

    public IList<WebDropDownItem> GetData(string country)
    {
        return GetList("//countries/country[@name=\"" + country + "\"]/state");
    }

    public IList<WebDropDownItem> GetData(string country, string state)
    {
        return GetList("countries/country[@name=\"" + country + "\"]/state[@name=\"" + state + "\"]/city");
    }

    private IList<WebDropDownItem> GetList(string path)
    {
        IList<WebDropDownItem> countries = new List<WebDropDownItem>();
        DataRepository manager = new DataRepository();
        string dataSource = HttpContext.Current.Server.MapPath(manager.GetXmlFileVirtualLocation("CountryStateCity.xml"));

        XmlDocument documentSource = new XmlDocument();
        documentSource.Load(dataSource);

        XmlNodeList countryData = documentSource.SelectNodes(path);

        foreach (XmlNode countryNode in countryData)
        {
            WebDropDownItem topMenu = this.CreateItem(countryNode);
            countries.Add(topMenu);
        }
        return countries;
    }

    private WebDropDownItem CreateItem(XmlNode source)
    {
        WebDropDownItem menuItem = new WebDropDownItem();
        menuItem.Text = source.Attributes["name"].Value;
        menuItem.Value = source.Attributes["name"].Value;
        return menuItem;
    }

}
