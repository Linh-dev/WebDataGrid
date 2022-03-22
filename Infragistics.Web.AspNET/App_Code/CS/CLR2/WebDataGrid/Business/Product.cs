using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for Product
/// </summary>
public class Product
{
	public Product()
	{

	}

    public Product(int productID, string productName, int supplierID, string quantityPerUnit, decimal unitPrice, int unitsInStock, int unitsOnOrder, int reorderLevel, bool discontinued)
    {
        this._productID = productID;
        this._productName = productName;
        this._supplierID = supplierID;
        this._quiantityPerUnit = quantityPerUnit;
        this._unitPrice = unitPrice;
        this._unitsInStock = unitsInStock;
        this._unitsOnOrder = unitsOnOrder;
        this._reorderLevel = reorderLevel;
        this._discontinued = discontinued;

    }

    private int _productID;
    public int ProductID 
    {
        get { return this._productID; }
        set { this._productID = value; }
    }

    private string _productName = "";
    public string ProductName
    {
        get { return this._productName; }
        set { this._productName = value; }
    }
    private int _supplierID = 0;
    public int SupplierID
    {
        get { return this._supplierID; }
        set { this._supplierID = value; }
    }
    private string _quiantityPerUnit = "";
    public string QuantityPerUnit 
    {
        get { return this._quiantityPerUnit; }
        set { this._quiantityPerUnit = value; }
    }
    private decimal _unitPrice;
    public decimal UnitPrice 
    {
        get { return this._unitPrice; }
        set { this._unitPrice = value; }
    }
    private int _unitsInStock;
    public int UnitsInStock
    {
        get { return this._unitsInStock; }
        set { this._unitsInStock = value; }
    }
    private int _unitsOnOrder;
    public int UnitsOnOrder
    {
        get { return this._unitsOnOrder; }
        set { this._unitsOnOrder = value; }
    }
    private int _reorderLevel;
    public int ReorderLevel
    {
        get { return this._reorderLevel; }
        set { this._reorderLevel = value; }
    }
    public bool _discontinued;
    public bool Discontinued 
    {
        get { return this._discontinued; }
        set { this._discontinued = value; }
    }
}