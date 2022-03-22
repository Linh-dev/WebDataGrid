using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for OrderMapper
/// </summary>
public class OrderMapper : IDataMapper<OrderCollection>
{
	public OrderMapper()
	{
	}

    #region IDataMapper<CustomerCollection> Members

    public string ConnectString
    {
        get { return "Nwind.mdb"; }
    }

    public OrderCollection MapData(System.Data.IDataReader dbReader)
    {
        OrderCollection history = new OrderCollection();

        history.Add(new Order(1));
        history.Add(new Order(2));
        history.Add(new Order(3));
        history.Add(new Order(4));
        history.Add(new Order(5));
        history.Add(new Order(6));
        history.Add(new Order(7));
        history.Add(new Order(8));
        history.Add(new Order(9));
        history.Add(new Order(10));
        history.Add(new Order(11));
        history.Add(new Order(12));

        while (dbReader.Read())
        {
            Order order = new Order();
            int month = int.Parse(dbReader[dbReader.GetOrdinal("MonthValue")].ToString());
            history.SetAmount(month, dbReader.GetDecimal(dbReader.GetOrdinal("ProductSales")));
        }
        return history;
    }

    #endregion
}
