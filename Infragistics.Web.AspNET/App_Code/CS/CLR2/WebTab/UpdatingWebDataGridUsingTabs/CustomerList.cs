using System;
using System.Collections.Generic;
using System.Web;
using System.Data.SqlClient;
using System.Data.Odbc;
using System.Data.OleDb;
using System.Web.Hosting;

namespace WebTabBusinessLayer
{
    /// <summary>
    /// Summary description for CustomerList
    /// </summary>
    public class CustomerList
    {
        static List<Customer> customerList;

        static CustomerList()
        {
            customerList = new List<Customer>();

            string path = HostingEnvironment.MapPath("~/App_Data/Nwind.mdb");
            OleDbConnection con = new OleDbConnection(@"Provider =Microsoft.JET.OLEDB.4.0;" + "Data Source=" + path);
            OleDbCommand cmd = new OleDbCommand("SELECT [CustomerID], [CompanyName], [ContactName], [ContactTitle] FROM [Customers]");
            cmd.Connection = con;

            con.Open();

            OleDbDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                customerList.Add(new Customer(reader.GetString(0), reader.GetString(1), reader.GetString(2), reader.GetString(3)));
            }

            reader.Close();
            con.Close();
        }
        public CustomerList()
        {

        }

        public List<Customer> GetCustomers()
        {
            return customerList;
        }
        public void AddCustomer(string CustomerID, string CompanyName, string ContactName, string ContactTitle)
        {
            customerList.Add(new Customer(CustomerID, CompanyName, ContactName, ContactTitle));
        }
        public void DeleteCustomer(string customerId)
        {
            Customer c = customerList.Find(delegate(Customer customer) { return customer.CustomerID == customerId; });

            if (c != null)
            {
                customerList.Remove(c);
            }
        }
    }
}
