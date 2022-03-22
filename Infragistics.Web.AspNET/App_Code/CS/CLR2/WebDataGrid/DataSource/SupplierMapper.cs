using System;
using System.Collections.Generic;
using System.Web;

public class SupplierMapper : IDataMapper<SupplierCollection>
{
    public SupplierMapper()
    {

    }
    public string ConnectString
    {
        get { return "Nwind.mdb"; }
    }

    public SupplierCollection MapData(System.Data.IDataReader dbReader)
    {
        SupplierCollection suppliersCollection = new SupplierCollection();

        while (dbReader.Read())
        {
            Supplier supplier = new Supplier();
            supplier.SupplierID = dbReader.GetInt32(dbReader.GetOrdinal("SupplierID"));
            supplier.CompanyName = dbReader.GetString(dbReader.GetOrdinal("CompanyName"));
            supplier.ContactName = dbReader.GetString(dbReader.GetOrdinal("ContactName"));
            supplier.City = dbReader.GetString(dbReader.GetOrdinal("City"));
            int regIdx = dbReader.GetOrdinal("Region");
            supplier.Region = !dbReader.IsDBNull(regIdx) ? dbReader.GetString(regIdx) : String.Empty;
            supplier.Phone = dbReader.GetString(dbReader.GetOrdinal("Phone"));
            suppliersCollection.Add(supplier);
        }
        return suppliersCollection;
    }
}