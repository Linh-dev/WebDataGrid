using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for OrderDetails
/// </summary>
public class OrderDetails
{
   
    public OrderDetails()
    {

    }

    private int _orderID;
    public int OrderID
    {
        get { return this._orderID; }
        set { this._orderID = value; }
    }

    private string _customerID;
    public string CustomerID
    {
        get { return this._customerID; }
        set { this._customerID = value; }
    }

    private DateTime _orderDate;
    public DateTime OrderDate
    {
        get { return this._orderDate; }
        set { this._orderDate = value; }
    }

    private string _shipName;
    public string ShipName
    {
        get { return this._shipName; }
        set { this._shipName = value; }
    }

    private string _shipAddress;
    public string ShipAddress
    {
        get { return this._shipAddress; }
        set { this._shipAddress = value; }
    }

    private string _shipCity;
    public string ShipCity
    {
        get { return this._shipCity; }
        set { this._shipCity = value; }
    }

    private string _shipCountry;
    public string ShipCountry
    {
        get { return this._shipCountry; }
        set { this._shipCountry = value; }
    }

}
