using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for CustomerMapper
/// </summary>
public class CustomerMapper : IDataMapper<CustomerCollection>
{
	public CustomerMapper()
	{
	}

    #region IDataMapper<CustomerCollection> Members

    public string ConnectString
    {
        get { return "Nwind.mdb"; }
    }

    public CustomerCollection MapData(System.Data.IDataReader dbReader)
    {
        CustomerCollection customers = new CustomerCollection();

        while (dbReader.Read())
        {
            Customer customer = new Customer();
            customer.CustomerID = dbReader.GetString(dbReader.GetOrdinal("CustomerID")); ;
            customer.CompanyName = dbReader.GetString(dbReader.GetOrdinal("CompanyName"));
            customer.ContactName = dbReader.GetString(dbReader.GetOrdinal("ContactName"));
            customer.Address = dbReader.GetString(dbReader.GetOrdinal("Address"));
            customer.City = dbReader.GetString(dbReader.GetOrdinal("City"));
            object postalCodevalue = dbReader[dbReader.GetOrdinal("PostalCode")];
            if (postalCodevalue!= null)
            {
                customer.PostalCode = postalCodevalue.ToString();
            }
            customer.Country = dbReader.GetString(dbReader.GetOrdinal("Country"));
            customers.Add(customer);
        }

        return customers;
    }

    #endregion
}
