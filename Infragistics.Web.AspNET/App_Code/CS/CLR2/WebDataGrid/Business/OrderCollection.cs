using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for SalesHistoryCollection
/// </summary>
public class OrderCollection : List<Order>
{
    public OrderCollection()
    {

    }

    public void SetAmount(int month, decimal amount)
    {
        foreach (Order item in this)
        {
            if (item.Month == month)
            {
                item.SalesAmount = amount;
                break;
            }
        }

    }

}

