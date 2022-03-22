using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for ProductMapper
/// </summary>
public class ProductMapper : IDataMapper<ProductCollection>
{
	public ProductMapper()
	{
		
	}
     public string ConnectString
    {
        get { return "Nwind.mdb"; }
    }

     public ProductCollection MapData(System.Data.IDataReader dbReader)
     {
         ProductCollection productsCollection = new ProductCollection();

         while (dbReader.Read())
         {
             Product product = new Product();
             product.ProductID = dbReader.GetInt32(dbReader.GetOrdinal("ProductID"));
             product.ProductName = dbReader.GetString(dbReader.GetOrdinal("ProductName"));
             product.SupplierID = dbReader.GetInt32(dbReader.GetOrdinal("SupplierID"));
             product.QuantityPerUnit = dbReader.GetString(dbReader.GetOrdinal("QuantityPerUnit"));
             product.ReorderLevel = dbReader.GetInt16(dbReader.GetOrdinal("ReorderLevel"));
             product.UnitPrice = dbReader.GetDecimal(dbReader.GetOrdinal("UnitPrice"));
             product.UnitsInStock = dbReader.GetInt16(dbReader.GetOrdinal("UnitsInStock"));
             product.UnitsOnOrder = dbReader.GetInt16(dbReader.GetOrdinal("UnitsOnOrder"));
             product.Discontinued = dbReader.GetBoolean(dbReader.GetOrdinal("Discontinued"));

             productsCollection.Add(product);
         }
         return productsCollection;
     }
}