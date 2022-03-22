using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for Customer
/// </summary>
public class Customer
{

    public Customer()
    {
    }

    public Customer(string customerId, string companyName, string contactName, string address, string city, string postalCode, string country)
    {
        this._customerId = customerId;
        this._companyName = companyName;
        this._contactName = contactName;
        this._city = city;
        this._address = address;
        this._postalCode = postalCode;
        this._country = country;
    }

    string _customerId = "";
    public string CustomerID
    {
        get
        {
            return this._customerId;
        }
        set
        {
            this._customerId = value;
        }
    }

    string _companyName = "";
    public string CompanyName
    {
        get
        {
            return this._companyName;
        }
        set
        {
            this._companyName = value;
        }
    }

    string _contactName = "";
    public string ContactName
    {
        get
        {
            return this._contactName;
        }
        set
        {
            this._contactName = value;
        }
    }

    string _address = "";
    public string Address
    {
        get
        {
            return this._address;
        }
        set
        {
            this._address = value;
        }
    }

    string _city = "";
    public string City
    {
        get
        {
            return this._city;
        }
        set
        {
            this._city = value;
        }
    }

    string _postalCode = "";
    public string PostalCode
    {
        get
        {
            return this._postalCode;
        }
        set
        {
            this._postalCode = value;
        }
    }

    string _country = "";
    public string Country
    {
        get
        {
            return this._country;
        }
        set
        {
            this._country = value;
        }
    }

}
