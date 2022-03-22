using System;
using System.Collections.Generic;
using System.Web;
using System.Data.Common;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Data;
using System.Data.OleDb;
using System.ComponentModel;
using Infragistics.Web.SampleBrowser.Core.Framework.DataAccess;

public class NWindClient
{
    public static DataSet GetSuppliersAndProductsDataSet()
    {
        string commandTextSuppliers = "SELECT SupplierID, CompanyName, ContactName, Region FROM Suppliers";
        string commandTextProducts = "SELECT ProductID, ProductName, SupplierID, QuantityPerUnit FROM Products";

        DataSet ds = new DataSet();
        DataTable dtSuppliers = new DataTable("Suppliers");
        DataTable dtProducts = new DataTable("Products");

        ds.Tables.Add(dtSuppliers);
        ds.Tables.Add(dtProducts);

        using (DbDataAdapter ad = (DbDataAdapter)CreateDataAdapter<OleDbDataAdapter, OleDbCommand>(commandTextSuppliers))
        {
            ad.Fill(dtSuppliers);
        }

        using (DbDataAdapter ad = (DbDataAdapter)CreateDataAdapter<OleDbDataAdapter, OleDbCommand>(commandTextProducts))
        {
            ad.Fill(dtProducts);
        }

        DataRelation dRelation = new DataRelation("SupplierID_Relation",
            dtSuppliers.Columns["SupplierID"],
            dtProducts.Columns["SupplierID"]);

        ds.Relations.Add(dRelation);

        return ds;
    }

    public static IEnumerable<Supplier> GetSuppliersAndProductsIEnumerable()
    {
        string commandTextSuppliers = "SELECT SupplierID, CompanyName, ContactName, Region FROM Suppliers";
        string commandTextProducts = "SELECT ProductID, ProductName, SupplierID, QuantityPerUnit FROM Products WHERE SupplierID = @SupplierID";

        List<Supplier> suppliers = new List<Supplier>();

        using (IDataReader suppliersReader = CreateDataReader<OleDbCommand>(commandTextSuppliers))
        {
            while (suppliersReader.Read())
            {
                List<Products> products = new List<Products>();

                using (IDataReader productsReader =
                    CreateDataReader<OleDbCommand>(commandTextProducts, new OleDbParameter("@SupplierID", suppliersReader["SupplierID"])))
                {
                    while (productsReader.Read())
                    {
                        Products p = new Products(
                            (productsReader["ProductID"] != null ? Convert.ToInt32(productsReader["ProductID"]) : -1),
                            (productsReader["ProductName"] != null ? productsReader["ProductName"].ToString() : ""),
                            (productsReader["SupplierID"] != null ? productsReader["SupplierID"].ToString() : ""),
                            (productsReader["QuantityPerUnit"] != null ? productsReader["QuantityPerUnit"].ToString() : ""));

                        products.Add(p);
                    }
                }

                Supplier sp = new Supplier(
                    ((int)suppliersReader["SupplierID"]),
                    (suppliersReader["CompanyName"] != null ? suppliersReader["CompanyName"].ToString() : ""),
                    (suppliersReader["ContactName"] != null ? suppliersReader["ContactName"].ToString() : ""),
                    (suppliersReader["Region"] != null ? suppliersReader["Region"].ToString() : ""),
                     products);

                suppliers.Add(sp);
            }
        }

        return suppliers;
    }

    public static IEnumerable<Supplier> GetSuppliers()
    {
        string commandTextSuppliers = "SELECT SupplierID, CompanyName, ContactName, Region FROM Suppliers";

        List<Supplier> suppliers = new List<Supplier>();
        List<Products> products = new List<Products>();
        products.Add(new Products());

        using (IDataReader suppliersReader = CreateDataReader<OleDbCommand>(commandTextSuppliers))
        {
            while (suppliersReader.Read())
            {
                Supplier sp = new Supplier(
                    ((int)suppliersReader["SupplierID"]),
                    (suppliersReader["CompanyName"] != null ? suppliersReader["CompanyName"].ToString() : ""),
                    (suppliersReader["ContactName"] != null ? suppliersReader["ContactName"].ToString() : ""),
                    (suppliersReader["Region"] != null ? suppliersReader["Region"].ToString() : ""), products);

                suppliers.Add(sp);
            }
        }

        return suppliers;
    }

    public static IEnumerable<Products> GetProducts(int SupplierID)
    {
        string commandTextProducts = "SELECT ProductID, ProductName, SupplierID, QuantityPerUnit FROM Products WHERE SupplierID = @SupplierID";

        List<Products> products = new List<Products>();

        using (IDataReader productsReader =
            CreateDataReader<OleDbCommand>(commandTextProducts, new OleDbParameter("@SupplierID", SupplierID)))
        {
            while (productsReader.Read())
            {
                Products p = new Products(
                    (productsReader["ProductID"] != null ? Convert.ToInt32(productsReader["ProductID"]) : -1),
                    (productsReader["ProductName"] != null ? productsReader["ProductName"].ToString() : ""),
                    (productsReader["SupplierID"] != null ? productsReader["SupplierID"].ToString() : ""),
                    (productsReader["QuantityPerUnit"] != null ? productsReader["QuantityPerUnit"].ToString() : ""));

                products.Add(p);
            }
        }

        return products;
    }

    public static IDbCommand CreateCommand<DataCommandType>(string commandText, params IDbDataParameter[] @params) where DataCommandType : IDbCommand, new()
    {
        DataRepository manager = new DataRepository();
        
        DataCommandType command = new DataCommandType();
        command.CommandText = commandText;
        command.Connection = new OleDbConnection(manager.GetMdbConnectionString("Nwind.mdb"));//ConfigurationManager.ConnectionStrings["NorthWindConnectionString"].ConnectionString);
        command.CommandType = System.Data.CommandType.Text;

        if (@params != null)
        {
            foreach (IDbDataParameter p in @params)
                command.Parameters.Add(p);
        }

        return command;
    }

    public static IDbDataAdapter CreateDataAdapter<DataAdapterType, DataCommandType>(string commandText, params IDbDataParameter[] @params)
        where DataAdapterType : IDbDataAdapter, new()
        where DataCommandType : IDbCommand, new()
    {
        DataAdapterType adapter = new DataAdapterType();
        adapter.SelectCommand = CreateCommand<DataCommandType>(commandText, @params);

        return adapter;
    }

    public static IDbDataAdapter CreateDataAdapter<DataAdapterType, DataCommandType>(string commandText)
        where DataAdapterType : IDbDataAdapter, new()
        where DataCommandType : IDbCommand, new()
    {
        DataAdapterType adapter = new DataAdapterType();
        adapter.SelectCommand = CreateCommand<DataCommandType>(commandText, null);

        return adapter;
    }

    public static IDataReader CreateDataReader<DataCommandType>(string commandText)
        where DataCommandType : IDbCommand, new()
    {
        IDbCommand command = CreateCommand<DataCommandType>(commandText, null);
        command.Connection.Open();

        return command.ExecuteReader();
    }

    public static IDataReader CreateDataReader<DataCommandType>(string commandText, params IDbDataParameter[] @params)
        where DataCommandType : IDbCommand, new()
    {
        IDbCommand command = CreateCommand<DataCommandType>(commandText, @params);
        command.Connection.Open();

        return command.ExecuteReader();
    }


}
