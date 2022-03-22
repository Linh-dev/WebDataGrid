using System;
using System.Collections.Generic;
using System.Web;
using Infragistics.Web.UI.GridControls;
using WDG = CS.WebDataGrid.Business;
using System.Data;
using System.Collections;
using System.IO;
using System.Xml;
using System.Xml.Serialization;

public class CustomDataSource
{
    private Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage _page;

    public CustomerCollection GetCustomers()
    {
        string cmdText = string.Empty;
        DataCriteria criteria = new DataCriteria();
        cmdText = "SELECT TOP 50 CustomerID, CompanyName, ContactName, Address, City, PostalCode, Country FROM CUSTOMERS";
        // WHERE Country IN ('USA', 'Germany', 'Switzerland', 'France')

        CustomerMapper mapper = new CustomerMapper();
        DataAccessHelper dataAccess = new DataAccessHelper();
        return dataAccess.ExecuteQuery<CustomerCollection>(cmdText, criteria, mapper);
    }

    public OrderCollection GetOrderHistory(string customerId)
    {
        string cmdText = "SELECT Month(Orders.OrderDate) AS MonthValue, Sum(CCur([Order Details].UnitPrice*[Quantity]*(1-[Discount])/100)*100) AS ProductSales FROM (Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID) INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID WHERE Customers.CustomerID = @CustomerID GROUP BY Month(Orders.OrderDate) ORDER BY Month(Orders.OrderDate)";
        DataCriteria criteria = new DataCriteria();
        criteria.AddStringParameter(new CriteriaParameter("CustomerID", 5, customerId, string.Empty));

        OrderMapper mapper = new OrderMapper();
        DataAccessHelper dataAccess = new DataAccessHelper();
        return dataAccess.ExecuteQuery<OrderCollection>(cmdText, criteria, mapper);
    }

    public List<WDG.City> GetCities()
    {
        List<WDG.City> cities;

        string loc = _page.GetXmlLocation("Cities.xml");
        using (FileStream fs = new FileStream(HttpContext.Current.Server.MapPath(loc), FileMode.Open, FileAccess.Read))
        {
            using (XmlReader reader = new XmlTextReader(fs))
            {
                cities = (List<WDG.City>)new XmlSerializer(typeof(List<WDG.City>)).Deserialize(reader);
            }
        }

        return cities;
    }

    public ICollection GetICollectionSource()
    {
        return GetCities();
    }

    public DataTable GetDataTableSource()
    {

        if (HttpContext.Current.Session["GridCustomSource"] == null)
        {

            DataTable dt = this.GetDataTable();

            CustomerCollection customerList = this.GetCustomers();

            foreach (Customer c in customerList)
            {
                DataRow dr = dt.NewRow();
                dr[0] = c.CustomerID;
                dr[1] = c.CompanyName;
                dr[2] = c.ContactName;
                dr[3] = c.Address;
                dr[4] = c.City;
                dr[5] = c.PostalCode;
                dr[6] = c.Country;
                dt.Rows.Add(dr);
            }

            HttpContext.Current.Session["GridCustomSource"] = dt;
        }

        return HttpContext.Current.Session["GridCustomSource"] as DataTable;
    }

    public DataTable GetDataTable()
    {

        DataColumn primaryKey = new DataColumn("CustomerID");

        DataTable dt = new DataTable();
        dt.Columns.Add(primaryKey);
        dt.Columns.Add("CompanyName");
        dt.Columns.Add("ContactName");
        dt.Columns.Add("Address");
        dt.Columns.Add("City");
        dt.Columns.Add("PostalCode");
        dt.Columns.Add("Country");

        dt.PrimaryKey = new DataColumn[] { primaryKey };

        return dt;
    }

	public CustomDataSource()
	{
        _page = new Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage();
	}

    public CustomDataSource(Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage page)
    {
        _page = page;
    }
}
