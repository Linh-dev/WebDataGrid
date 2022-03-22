using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.ComponentModel;
using System.Collections.Generic;
using Infragistics.Web.UI;
using Infragistics.Web.UI.GridControls;
//using Resources;

/// <summary>
/// Summary description for NwindDataSource
/// </summary>
public class NwindDataSource
{
    public NwindDataSource()
	{

    }

    #region Customers DataSource Methods

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
    public void AddCustomer(string CustomerID, string CompanyName, string ContactName, string Address, string City, string PostalCode, string Country)
    {
        if (HttpContext.Current.Session["WHDGCache_Customers"] != null)
        {
            DataTable dt = HttpContext.Current.Session["WHDGCache_Customers"] as DataTable;

            object[] addKeys = { CustomerID };
            if (dt.Rows.Find(addKeys) == null)
            {
                DataRow dr = dt.NewRow();
                dr[0] = CustomerID;
                dr[1] = CompanyName;
                dr[2] = ContactName;
                dr[3] = Address;
                dr[4] = City;
                dr[5] = PostalCode;
                dr[6] = Country;
                dt.Rows.Add(dr);
                dt.AcceptChanges();
            }
        }

    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
    public void UpdateCustomer(string CustomerID, string CompanyName, string ContactName, string Address, string City, string PostalCode, string Country)
    {
        if (HttpContext.Current.Session["WHDGCache_Customers"] != null)
        {
            DataTable dt = HttpContext.Current.Session["WHDGCache_Customers"] as DataTable;

            DataRow dr = dt.Rows.Find(CustomerID);

            if (dr != null)
            {
                dr[1] = CompanyName;
                dr[2] = ContactName;
                dr[3] = Address;
                dr[4] = City;
                dr[5] = PostalCode;
                dr[6] = Country;
                dt.AcceptChanges();
            }
        }
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
    public void DeleteCustomer(string CustomerID)
    {
        if (HttpContext.Current.Session["WHDGCache_Customers"] != null)
        {
            DataTable dt = HttpContext.Current.Session["WHDGCache_Customers"] as DataTable;

            DataRow dr = dt.Rows.Find(CustomerID);

            if (dr != null)
            {
                dr.Delete();
                dt.AcceptChanges();
            }
        }
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
    public DataTable GetCustomerDataSource()
    {
        return this.GetCustomerDataSource(false);
    }
    
    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
    public DataTable GetCustomerDataSource(bool singlePage)
    {
        if (HttpContext.Current.Session["WHDGCache_Customers"] == null)
        {
            DataTable dt = this.GetCustomersDataTable();

            CustomerCollection customerList = this.GetCustomers(singlePage);

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
            HttpContext.Current.Session["WHDGCache_Customers"] = dt;
        }

        return HttpContext.Current.Session["WHDGCache_Customers"] as DataTable;
    }

    #endregion

    #region Orders DataSource Methods

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
    public void AddOrder(string OrderID, string CustomerID, DateTime OrderDate, string ShipName, string ShipAddress, string ShipCity, string ShipCountry)
    {
        if (HttpContext.Current.Session["WHDGCache_Orders"] != null)
        {
            DataTable dt = HttpContext.Current.Session["WHDGCache_Orders"] as DataTable;

            object[] addKeys = { OrderID };
            if (dt.Rows.Find(addKeys) == null)
            {
                DataRow dr = dt.NewRow();
                dr[0] = OrderID;
                dr[1] = CustomerID;
                dr[2] = OrderDate;
                dr[3] = ShipName;
                dr[4] = ShipAddress;
                dr[5] = ShipCity;
                dr[6] = ShipCountry;

                dt.Rows.Add(dr);
                dt.AcceptChanges();
            }
        }

    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
    public void UpdateOrder(string OrderID, string CustomerID, DateTime OrderDate, string ShipName, string ShipAddress, string ShipCity, string ShipCountry)
    {
        if (HttpContext.Current.Session["WHDGCache_Orders"] != null)
        {
            DataTable dt = HttpContext.Current.Session["WHDGCache_Orders"] as DataTable;

            DataRow dr = dt.Rows.Find(OrderID);

            if (dr != null)
            {
                dr[1] = CustomerID;
                dr[2] = OrderDate;
                dr[3] = ShipName;
                dr[4] = ShipAddress;
                dr[5] = ShipCity;
                dr[6] = ShipCountry;

                dt.AcceptChanges();
            }
        }
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
    public void DeleteOrder(string OrderID)
    {
        if (HttpContext.Current.Session["WHDGCache_Orders"] != null)
        {
            DataTable dt = HttpContext.Current.Session["WHDGCache_Orders"] as DataTable;

            DataRow dr = dt.Rows.Find(OrderID);

            if (dr != null)
            {
                dr.Delete();
                dt.AcceptChanges();
            }
        }
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
    public DataTable GetOrdersDataSource()
    {
        return this.GetOrdersDataSource(false);
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
    public DataTable GetOrdersDataSource(bool singlePage)
    {
        if (HttpContext.Current.Session["WHDGCache_Orders"] == null)
        {
            DataTable dt = this.GetOrdersDataTable();

            OrderDetailsCollection ordersList = this.GetOrders(singlePage);

            foreach (OrderDetails od in ordersList)
            {
                DataRow dr = dt.NewRow();
                dr[0] = od.OrderID;
                dr[1] = od.CustomerID;
                dr[2] = od.OrderDate;
                dr[3] = od.ShipName;
                dr[4] = od.ShipAddress;
                dr[5] = od.ShipCity;
                dr[6] = od.ShipCountry;
                dt.Rows.Add(dr);
            }

            HttpContext.Current.Session["WHDGCache_Orders"] = dt;
        }

        return HttpContext.Current.Session["WHDGCache_Orders"] as DataTable;
    }

    #endregion

    public DataTable GetCustomersDataTable()
    {
        DataColumn primaryKey = new DataColumn("CustomerID");

        DataTable dt = new DataTable("Customers");
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

    public CustomerCollection GetCustomers()
    {
        return this.GetCustomers(false);
    }

    public CustomerCollection GetCustomers(bool singlePage)
    {
        string cmdText = string.Empty;
        DataCriteria criteria = new DataCriteria();
        if (singlePage)
        {
            cmdText = "SELECT TOP 25 CustomerID, CompanyName, ContactName, Address, City, PostalCode, Country FROM CUSTOMERS";
            // WHERE Country = @Country
            //criteria.AddStringParameter(new CriteriaParameter("Country", 15, "USA", string.Empty));
        }
        else
        {
            cmdText = "SELECT TOp 50 CustomerID, CompanyName, ContactName, Address, City, PostalCode, Country FROM CUSTOMERS";
            // WHERE Country IN ('USA', 'Germany', 'Switzerland', 'France')
        }

        CustomerMapper mapper = new CustomerMapper();
        DataAccessHelper dataAccess = new DataAccessHelper();
        return dataAccess.ExecuteQuery<CustomerCollection>(cmdText, criteria, mapper);
    }

    public DataTable GetOrdersDataTable()
    {
        DataColumn primaryKey = new DataColumn("OrderID");

        DataTable dt = new DataTable("Orders");
        dt.Columns.Add(primaryKey);
        dt.Columns.Add("CustomerID");
        dt.Columns.Add("OrderDate", typeof(DateTime));
        dt.Columns.Add("ShipName");
        dt.Columns.Add("ShipAddress");
        dt.Columns.Add("ShipCity");
        dt.Columns.Add("ShipCountry");

        dt.PrimaryKey = new DataColumn[] { primaryKey };

        return dt;
    }
   
    public OrderDetailsCollection GetOrders()
    {
        return this.GetOrders(false);
    }

    public OrderDetailsCollection GetOrders(bool singlePage)
    {
        string cmdText = string.Empty;
        DataCriteria criteria = new DataCriteria();
        if (singlePage)
        {
            cmdText = "SELECT OrderID, CustomerID, OrderDate, ShipName, ShipAddress, ShipCity, ShipCountry FROM Orders";
        }
        else
        {
            cmdText = "SELECT OrderID, CustomerID, OrderDate, ShipName, ShipAddress, ShipCity, ShipCountry FROM Orders";
        }

        OrderDetailsMapper mapper = new OrderDetailsMapper();
        DataAccessHelper dataAccess = new DataAccessHelper();
        return dataAccess.ExecuteQuery<OrderDetailsCollection>(cmdText, criteria, mapper);
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

}
