using System;
using System.Collections.Generic;
using System.Web;

namespace WebTabBusinessLayer
{
    /// <summary>
    /// Summary description for Customer
    /// </summary>
    public class Customer
    {
        private string _id;
        private string _companyName;
        private string _contactName;
        private string _title;

        public Customer()
        {

        }

        public string CustomerID { get { return _id; } set { _id = value; } }
        public string CompanyName { get { return _companyName; } set { _companyName = value; } }
        public string ContactName { get { return _contactName; } set { _contactName = value; } }
        public string ContactTitle { get { return _title; } set { _title = value; } }

        public Customer(string id, string company, string contact, string title)
        {
            CustomerID = id;
            CompanyName = company;
            ContactName = contact;
            ContactTitle = title;
        }



    }
}
