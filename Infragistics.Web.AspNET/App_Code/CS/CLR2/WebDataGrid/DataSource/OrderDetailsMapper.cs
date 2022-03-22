using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for OrderMapper
/// </summary>
public class OrderDetailsMapper : IDataMapper<OrderDetailsCollection>
{
    public OrderDetailsMapper()
	{
    }

    #region IDataMapper<OrderDetailsCollection> Members

    public string ConnectString
    {
        get { return "Nwind.mdb"; }
    }

    public OrderDetailsCollection MapData(System.Data.IDataReader dbReader)
    {
        OrderDetailsCollection orders = new OrderDetailsCollection();

        while (dbReader.Read())
        {
            OrderDetails order = new OrderDetails();
            
            order.OrderID = int.Parse(dbReader[dbReader.GetOrdinal("OrderID")].ToString());
            order.CustomerID = dbReader[dbReader.GetOrdinal("CustomerID")].ToString();
            order.OrderDate = (DateTime)dbReader[dbReader.GetOrdinal("OrderDate")];
            order.ShipName = dbReader[dbReader.GetOrdinal("ShipName")].ToString();
            order.ShipAddress = dbReader[dbReader.GetOrdinal("ShipAddress")].ToString();
            order.ShipCity = dbReader[dbReader.GetOrdinal("ShipCity")].ToString();
            order.ShipCountry = dbReader[dbReader.GetOrdinal("ShipCountry")].ToString();

            orders.Add(order);
        }
        return orders;
    }

    #endregion
}
