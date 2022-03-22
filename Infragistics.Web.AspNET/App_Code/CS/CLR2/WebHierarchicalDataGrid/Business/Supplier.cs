using System;
using System.Collections.Generic;
using System.Web;
using System.Collections;

/// <summary>
/// Summary description for Supplier
/// </summary>
public class Supplier
{
    public Supplier()
    {
    }

    public Supplier(int supplierID, string companyName, string contactName, string region)
    {
        this._supplierID = supplierID;
        this._companyName = companyName;
        this._contactName = contactName;
        this._region = region;
    }

    public Supplier(int supplierID, string companyName, string contactName, string city, string region, string phone)
        : this(supplierID, companyName, contactName, region)
    {
        this._city = city;
        this._phone = phone;
    }

    public Supplier(int supplierID, string companyName, string contactName, string region, IEnumerable products): 
        this(supplierID, companyName, contactName, region)
    {
        this._products = products;
    }

    int _supplierID = 0;
    public int SupplierID
    {
        get
        {
            return this._supplierID;
        }
        set
        {
            this._supplierID = value;
        }
    }

    string _companyName = String.Empty;
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

    string _contactName = String.Empty;
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

    string _city = String.Empty;
    public string City
    {
        get { return this._city; }
        set { this._city = value; }
    }

    string _region = String.Empty;
    public string Region
    {
        get
        {
            return this._region;
        }
        set
        {
            this._region = value;
        }
    }

    string _phone = String.Empty;
    public string Phone
    {
        get { return this._phone; }
        set { this._phone = value; }
    }

    private IEnumerable _products;
    public IEnumerable Products
    {
        get { return this._products; }
        set { this._products = value; }
    }
}
