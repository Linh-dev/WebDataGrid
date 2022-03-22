using System.ComponentModel;
using System.Data;
using System.Web;
using Infragistics.Web.UI.GridControls;

/// <summary>
/// Summary description for NorthwindDataSource
/// </summary>
public class NorthwindDataSource
{
    public NorthwindDataSource()
    {
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
    public void AddCustomer(string CustomerID, string CompanyName, string ContactName, string Address, string City, string PostalCode, string Country)
    {

        if (HttpContext.Current.Session["GridDataCache"] != null)
        {
            DataTable dt = HttpContext.Current.Session["GridDataCache"] as DataTable;

            object[] addKeys = { CustomerID };
            if (dt.Rows.Find(addKeys) == null)
            {
                DataRow dr = dt.NewRow();
                dr[0] = CustomerID;
                dr[1] = CompanyName;
                dr[2] = ContactName;
                dr[3] = Address;
                dr[4] = City;
                dr[5] = PostalCode;
                dr[6] = Country;
                dt.Rows.Add(dr);
                dt.AcceptChanges();
            }
        }
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
    public void AddSupplier(int SupplierID, string CompanyName, string ContactName, string City)
    {

        if (HttpContext.Current.Session["GridDataCache"] != null)
        {
            DataTable dt = HttpContext.Current.Session["GridDataCache"] as DataTable;

            object[] addKeys = { SupplierID };
            if (dt.Rows.Find(addKeys) == null)
            {
                DataRow dr = dt.NewRow();
                dr[0] = SupplierID;
                dr[1] = CompanyName;
                dr[2] = ContactName;
                dr[3] = City;
                dt.Rows.Add(dr);
                dt.AcceptChanges();
            }
        } 
        else if (HttpContext.Current.Session["GridSupplierDataCache"] != null)
        {
            DataTable dt = HttpContext.Current.Session["GridSupplierDataCache"] as DataTable;

            object[] addKeys = { SupplierID };
            if (dt.Rows.Find(addKeys) == null)
            {
                DataRow dr = dt.NewRow();
                dr[0] = SupplierID;
                dr[1] = CompanyName;
                dr[2] = ContactName;
                dr[3] = City;
                dt.Rows.Add(dr);
                dt.AcceptChanges();
            }
        }

    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
    public void UpdateCustomer(string CustomerID, string CompanyName, string ContactName, string Address, string City, string PostalCode, string Country)
    {

        if (HttpContext.Current.Session["GridDataCache"] != null)
        {
            DataTable dt = HttpContext.Current.Session["GridDataCache"] as DataTable;

            DataRow dr = dt.Rows.Find(CustomerID);

            if (dr != null)
            {
                dr[1] = CompanyName;
                dr[2] = ContactName;
                dr[3] = Address;
                dr[4] = City;
                dr[5] = PostalCode;
                dr[6] = Country;
                dt.AcceptChanges();
            }
        }
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
    public void DeleteCustomer(string CustomerID)
    {

        if (HttpContext.Current.Session["GridDataCache"] != null)
        {
            DataTable dt = HttpContext.Current.Session["GridDataCache"] as DataTable;

            DataRow dr = dt.Rows.Find(CustomerID);

            if (dr != null)
            {
                dr.Delete();
                dt.AcceptChanges();
            }
        }
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
    public void DeleteSupplier(int SupplierID)
    {
        if (HttpContext.Current.Session["GridSupplierDataCache"] != null)
        {
            DataTable dt = HttpContext.Current.Session["GridSupplierDataCache"] as DataTable;
            DataRow dr = dt.Rows.Find(SupplierID);
            if (dr != null)
            {
                dr.Delete();
                dt.AcceptChanges();
            }
        }
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
    public DataTable GetSuppliersDataSource()
    {
        return GetSuppliersDataSource(false);
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
    public DataTable GetSuppliersDataSource(bool singlePage)
    {
        if (HttpContext.Current.Session["GridSupplierDataCache"] == null)
        {

            DataTable dt = this.CreateSuppliersDataTable();

            SupplierCollection supplierList = this.GetSuppliers();

            foreach (Supplier s in supplierList)
            {
                DataRow dr = dt.NewRow();
                dr[0] = s.SupplierID;
                dr[1] = s.CompanyName;
                dr[2] = s.ContactName;
                dr[3] = s.City;
                dr[4] = s.Region;
                dr[5] = s.Phone;
                dt.Rows.Add(dr);
            }

            HttpContext.Current.Session["GridSupplierDataCache"] = dt;
        }
        return HttpContext.Current.Session["GridSupplierDataCache"] as DataTable;
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
    public void UpdateSupplier(int SupplierID, string CompanyName, string ContactName, string City, string Region, string Phone)
    {
        if (HttpContext.Current.Session["GridSupplierDataCache"] != null)
        {
            DataTable dt = HttpContext.Current.Session["GridSupplierDataCache"] as DataTable;

            DataRow dr = dt.Rows.Find(SupplierID);

            if (dr != null)
            {
                dr[0] = SupplierID;
                dr[1] = CompanyName;
                dr[2] = ContactName;
                dr[3] = City;
                dr[4] = Region;
                dr[5] = Phone;
                dt.AcceptChanges();
            }
        }
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
    public DataTable GetCustomerDataSource()
    {
        return this.GetCustomerDataSource(false);
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
    public DataTable GetCustomerDataSource(bool singlePage)
    {

        if (HttpContext.Current.Session["GridDataCache"] == null)
        {

            DataTable dt = this.GetDataTable();

            CustomerCollection customerList = this.GetCustomers(singlePage);

            foreach (Customer c in customerList)
            {
                DataRow dr = dt.NewRow();
                dr[0] = c.CustomerID;
                dr[1] = c.CompanyName;
                dr[2] = c.ContactName;
                dr[3] = c.Address;
                dr[4] = c.City;
                dr[5] = c.PostalCode;
                dr[6] = c.Country;
                dt.Rows.Add(dr);
            }

            HttpContext.Current.Session["GridDataCache"] = dt;
        }

        return HttpContext.Current.Session["GridDataCache"] as DataTable;
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
    public DataTable GetProductsDataSource()
    {
        if (HttpContext.Current.Session["GridProductDataCache"] == null)
        {

            DataTable dt = this.CreateDataTable();

            ProductCollection productList = this.GetProducts();

            foreach (Product p in productList)
            {
                DataRow dr = dt.NewRow();
                dr[0] = p.ProductID;
                dr[1] = p.ProductName;
                dr[2] = p.SupplierID;
                dr[3] = p.QuantityPerUnit;
                dr[4] = p.UnitPrice;
                dr[5] = p.UnitsInStock;
                dr[6] = p.UnitsOnOrder;
                dr[7] = p.Discontinued;
                dt.Rows.Add(dr);
            }

            HttpContext.Current.Session["GridProductDataCache"] = dt;
        }
        return HttpContext.Current.Session["GridProductDataCache"] as DataTable;
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
    public void AddProduct(string ProductName, decimal UnitPrice, int UnitsInStock, int UnitsOnOrder)
    {

        if (HttpContext.Current.Session["GridProductDataCache"] != null)
        {
            DataTable dt = HttpContext.Current.Session["GridProductDataCache"] as DataTable;

            DataRow dr = dt.NewRow();
            dr[1] = ProductName;
            dr[2] = UnitPrice;
            dr[3] = UnitsInStock;
            dr[4] = UnitsOnOrder;
            dt.Rows.Add(dr);
            dt.AcceptChanges();
        }
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
    public void AddProduct(int ProductID, string ProductName, int SupplierID, string QuantityPerUnit, decimal UnitPrice, int UnitsInStock, int UnitsOnOrder, bool Discontinued)
    {

        if (HttpContext.Current.Session["GridProductDataCache"] != null)
        {
            DataTable dt = HttpContext.Current.Session["GridProductDataCache"] as DataTable;

            object[] addKeys = { ProductID };

            if (dt.Rows.Find(addKeys) == null)
            {
                DataRow dr = dt.NewRow();
                dr[0] = ProductID;
                dr[1] = ProductName;
                dr[2] = SupplierID;
                dr[3] = QuantityPerUnit;
                dr[4] = UnitPrice;
                dr[5] = UnitsInStock;
                dr[6] = UnitsOnOrder;
                dr[7] = Discontinued;
                dt.Rows.Add(dr);
                dt.AcceptChanges();
            }
        }
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
    public void UpdateProduct(int ProductID, string ProductName, int SupplierID, string QuantityPerUnit, decimal UnitPrice, int UnitsInStock, int UnitsOnOrder)
    {
        UpdateProduct(ProductID, ProductName, SupplierID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, false, false);
    }
    
    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
    public void UpdateProduct(int ProductID, string ProductName, int SupplierID, string QuantityPerUnit, decimal UnitPrice, int UnitsInStock, int UnitsOnOrder, bool Discontinued)
    {
        UpdateProduct(ProductID, ProductName, SupplierID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, Discontinued, true);
    }
    
    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
    public void UpdateProduct(int ProductID, string ProductName, int SupplierID, string QuantityPerUnit, decimal UnitPrice, int UnitsInStock, int UnitsOnOrder, bool Discontinued, bool UpdateDiscontinued)
    {
        if (HttpContext.Current.Session["GridProductDataCache"] != null)
        {
            DataTable dt = HttpContext.Current.Session["GridProductDataCache"] as DataTable;

            DataRow dr = dt.Rows.Find(ProductID);

            if (dr != null)
            {
                dr[0] = ProductID;
                dr[1] = ProductName;
                dr[2] = SupplierID;
                dr[3] = QuantityPerUnit;
                dr[4] = UnitPrice;
                dr[5] = UnitsInStock;
                dr[6] = UnitsOnOrder;
                if (UpdateDiscontinued)
                    dr[7] = Discontinued;
               
                dt.AcceptChanges();
            }
        }
    }
    
    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
    public void DeleteProduct(int ProductID)
    {

        if (HttpContext.Current.Session["GridProductDataCache"] != null)
        {
            DataTable dt = HttpContext.Current.Session["GridProductDataCache"] as DataTable;

            DataRow dr = dt.Rows.Find(ProductID);

            if (dr != null)
            {
                dr.Delete();
                dt.AcceptChanges();
            }
        }
    }

    public DataTable CreateSuppliersDataTable()
    {
        DataColumn primaryKey = new DataColumn("SupplierID");
        primaryKey.DataType = System.Type.GetType("System.Int32");
        primaryKey.AutoIncrement = true;

        DataTable dt = new DataTable();
        dt.Columns.Add(primaryKey);
        dt.Columns.Add("CompanyName", System.Type.GetType("System.String"));
        dt.Columns.Add("ContactName", System.Type.GetType("System.String"));
        dt.Columns.Add("City", System.Type.GetType("System.String"));
        dt.Columns.Add("Region", System.Type.GetType("System.String"));
        dt.Columns.Add("Phone", System.Type.GetType("System.String"));

        dt.PrimaryKey = new DataColumn[] { primaryKey };

        return dt;
    }

    public DataTable CreateDataTable()
    {
        DataColumn primaryKey = new DataColumn("ProductID");
        primaryKey.DataType = System.Type.GetType("System.Int32");
        primaryKey.AutoIncrement = true;

        DataTable dt = new DataTable();
        dt.Columns.Add(primaryKey);
        dt.Columns.Add("ProductName", System.Type.GetType("System.String"));
        dt.Columns.Add("SupplierID", System.Type.GetType("System.Int32"));
        dt.Columns.Add("QuantityPerUnit", System.Type.GetType("System.String"));
        dt.Columns.Add("UnitPrice", System.Type.GetType("System.Decimal"));
        dt.Columns.Add("UnitsInStock", System.Type.GetType("System.Int16"));
        dt.Columns.Add("UnitsOnOrder", System.Type.GetType("System.Int16"));
        dt.Columns.Add("Discontinued", System.Type.GetType("System.Boolean"));

        dt.PrimaryKey = new DataColumn[] { primaryKey };

        return dt;
        
    }

    public DataTable GetDataTable()
    {

        DataColumn primaryKey = new DataColumn("CustomerID");

        DataTable dt = new DataTable();
        dt.Columns.Add(primaryKey);
        dt.Columns.Add("CompanyName");
        dt.Columns.Add("ContactName");
        dt.Columns.Add("Address");
        dt.Columns.Add("City");
        dt.Columns.Add("PostalCode");
        dt.Columns.Add("Country");

        dt.PrimaryKey = new DataColumn[] { primaryKey };

        return dt;
    }

    public void SetWebDataGridDataSource(WebDataGrid grid, string dataSourceType)
    {
        if (string.IsNullOrEmpty(dataSourceType) || dataSourceType == "DataTable")
        {
            grid.DataSource = this.GetCustomerDataSource();
        }
        else if (dataSourceType == "ICollection")
        {
            grid.DataSource = this.GetCustomers();
        }
        else if (dataSourceType == "AccessDataSource")
        {
            grid.DataSourceID = "AccessDataSource1";
        }
        else if (dataSourceType == "IEnumerable")
        {
            grid.DataSource = this.GetEmployees();
        }
        else if (dataSourceType == "IBindingList")
        {
            grid.DataSource = new BindingList<Product>(this.GetProducts());
        }
    }

    public void SetDropDownDataSouce(Infragistics.Web.UI.ListControls.WebDropDown li, Common.DataSourceTypes dataSourceType)
    {
        switch (dataSourceType)
        {
            case Common.DataSourceTypes.ICollection:
                li.DataSourceID = string.Empty;
                li.DataSource = this.GetCustomers();
                li.ValueField = "CustomerID";
                li.TextField = "ContactName";
                li.DataBind();
                break;
            case Common.DataSourceTypes.IEnumerable:
                li.DataSourceID = string.Empty;
                li.DataSource = this.GetProducts();
                li.ValueField = "ProductID";
                li.TextField = "ProductName";
                li.DataBind();
                break;
            default:
                li.DataSourceID = "DropDownDataSource";
                li.ValueField = "CustomerID";
                li.TextField = "ContactName";
                li.DataBind();
                break;
        }

    }

    public SupplierCollection GetSuppliers()
    {
        DataCriteria criteria = new DataCriteria();
        string cmdText = "SELECT SupplierID, CompanyName, ContactName, City, Region, Phone FROM Suppliers ";

        SupplierMapper mapper = new SupplierMapper();
        DataAccessHelper dataAccess = new DataAccessHelper();
        return dataAccess.ExecuteQuery<SupplierCollection>(cmdText, criteria, mapper);
    }
    
    public CustomerCollection GetCustomers()
    {
        return this.GetCustomers(false);
    }

    public CustomerCollection GetCustomers(bool singlePage)
    {
        string cmdText = string.Empty;
        DataCriteria criteria = new DataCriteria();
        if (singlePage)
        {
            cmdText = "SELECT TOP 25 CustomerID, CompanyName, ContactName, Address, City, PostalCode, Country FROM CUSTOMERS";
            // WHERE Country = @Country
            //criteria.AddStringParameter(new CriteriaParameter("Country", 15, "USA", string.Empty));
        }
        else
        {
            cmdText = "SELECT TOP 50 CustomerID, CompanyName, ContactName, Address, City, PostalCode, Country FROM CUSTOMERS ";
            //WHERE Country IN ('USA', 'Germany', 'Switzerland', 'France')
        }

        CustomerMapper mapper = new CustomerMapper();
        DataAccessHelper dataAccess = new DataAccessHelper();
        return dataAccess.ExecuteQuery<CustomerCollection>(cmdText, criteria, mapper);
    }

    public EmployeeCollection GetEmployees()
    {
        DataCriteria criteria = new DataCriteria();

        string cmdText = "SELECT EmployeeID, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, City, Country FROM Employees";

        EmployeeMapper mapper = new EmployeeMapper();
        DataAccessHelper dataAccess = new DataAccessHelper();

        return dataAccess.ExecuteQuery<EmployeeCollection>(cmdText, criteria, mapper);
        //return dataAccess.ExecuteQuery<EmployeeCollection>(cmdText, criteria, mapper);
    }

    public ProductCollection GetProducts()
    {

        DataCriteria criteria = new DataCriteria();

        string cmdText = "SELECT TOP 50 ProductID, ProductName, SupplierID, QuantityPerUnit, ReorderLevel, UnitPrice, UnitsInStock, UnitsOnOrder, Discontinued FROM Products ";

        ProductMapper mapper = new ProductMapper();
        DataAccessHelper dataAccess = new DataAccessHelper();
        return dataAccess.ExecuteQuery<ProductCollection>(cmdText, criteria, mapper);
    }

    public OrderCollection GetOrderHistory(string customerId)
    {

        string cmdText = "SELECT Month(Orders.OrderDate) AS MonthValue, Sum(CCur([Order Details].UnitPrice*[Quantity]*(1-[Discount])/100)*100) AS ProductSales FROM (Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID) INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID WHERE Customers.CustomerID = @CustomerID GROUP BY Month(Orders.OrderDate) ORDER BY Month(Orders.OrderDate)";
        DataCriteria criteria = new DataCriteria();
        criteria.AddStringParameter(new CriteriaParameter("CustomerID", 5, customerId, string.Empty));

        OrderMapper mapper = new OrderMapper();
        DataAccessHelper dataAccess = new DataAccessHelper();
        return dataAccess.ExecuteQuery<OrderCollection>(cmdText, criteria, mapper);
    }
}
