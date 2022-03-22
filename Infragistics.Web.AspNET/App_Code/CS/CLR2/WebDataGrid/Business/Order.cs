using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for SalesHistory
/// </summary>
public class Order
{

    public Order()
    {
    }

    public Order(int month)
    {
        this._month = month;
        this._salesAmount = 0;
    }

    private int _month;
    public int Month
    {
        get { return this._month; }
    }

    public string MonthValue
    {
        get { return this._month.ToString(); }
    }

    private decimal _salesAmount;
    public decimal SalesAmount
    {
        get { return this._salesAmount; }
        set { this._salesAmount = value; }
    }

}
