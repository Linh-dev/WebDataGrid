using System;
using System.Collections.Generic;
using System.Web;

namespace IG
{
    /// <summary>
    /// Summary description for Product
    /// </summary>
    public class Product
    {
        private int _id;
        private string _name;
        private string _description;
        private string _suite;

        public int ProductID { get { return _id; } set { _id = value; } }
        public string ProductName { get { return _name; } set { _name = value; } }
        public string ProductDescription { get { return _description; } set { _description = value; } }
        public string SuiteName { get { return _suite; } set { _suite = value; } }

        public Product( int id, string productName, string productDescription, string suiteName )
        {
            _id = id;
            _name = productName;
            _description = productDescription;
            _suite = suiteName;
        }

        public Product()
        {

        }

        public List<Product> GetProducts()
        {
            List<Product> list = new List<Product>();

			list.Add(new Product(0, "Infragistics ASP.NET", Resources.WebTab.WebTab_ContentTemplateAndUrl_ProductDescription1, "Web Client"));
			list.Add(new Product(1, "Infragistics Windows Forms", Resources.WebTab.WebTab_ContentTemplateAndUrl_ProductDescription2, "Win Client"));
			list.Add(new Product(2, "Infragistics WPF", Resources.WebTab.WebTab_ContentTemplateAndUrl_ProductDescription3, "Win Client"));
			list.Add(new Product(3, "Infragistics Silverlight", Resources.WebTab.WebTab_ContentTemplateAndUrl_ProductDescription4, "Web Client"));
			list.Add(new Product(4, "Infragistics Silverlight Data Visualization", Resources.WebTab.WebTab_ContentTemplateAndUrl_ProductDescription5, "Data Visualization"));

            return list;
        }

    }

}
