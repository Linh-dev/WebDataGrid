using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for Products
/// </summary>
public class Products
{
    public Products()
    {
    }

    public Products(int productID, string productName, string supplierID, string quantityPerUnit)
    {
        this._productID = productID;
        this._productName = productName;
        this._supplierID = supplierID;
        this._quantityPerUnit = quantityPerUnit;
    }

    private int _productID;
    public int ProductID
    {
        get { return this._productID; }
        set { this._productID = value;}
    }

    string _supplierID = "";
    public string SupplierID
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

    string _productName = "";
    public string ProductName
    {
        get
        {
            return this._productName;
        }
        set
        {
            this._productName = value;
        }
    }

    private string _quantityPerUnit;
    public string QuantityPerUnit
    {
        get { return this._quantityPerUnit; }
        set { this._quantityPerUnit = value; }
    }

}
