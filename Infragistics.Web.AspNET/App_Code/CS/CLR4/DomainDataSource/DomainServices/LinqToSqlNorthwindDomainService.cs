namespace DomainDataSourceSample
{
    using System;
    using System.IO;
    using System.Linq;
    using System.Web.DomainServices;
    using System.Web.DomainServices.Providers;
    using System.ComponentModel.DataAnnotations;
    using System.Data.Linq;
    using Infragistics.Web.SamplesBrowser.AspNET.AppCode.CLR35.Models;

    public class LinqToSqlNorthwindDomainService : LinqToSqlDomainService<NorthwindDataContext>
    {

        // TODO: Consider
        // 1. Adding parameters to this method and constraining returned results, and/or
        // 2. Adding query methods taking different parameters.
        public IQueryable<Category> GetCategories()
        {
            return this.DataContext.Categories;
        }

        public void InsertCategory(Category category)
        {
            this.DataContext.Categories.InsertOnSubmit(category);
        }

        public void UpdateCategory(Category currentCategory)
        {
            this.DataContext.Categories.Attach(currentCategory, this.ChangeSet.GetOriginal(currentCategory));
        }

        public void DeleteCategory(Category category)
        {
            this.DataContext.Categories.Attach(category);
            this.DataContext.Categories.DeleteOnSubmit(category);
        }

        // TODO: Consider
        // 1. Adding parameters to this method and constraining returned results, and/or
        // 2. Adding query methods taking different parameters.
        public IQueryable<Customer> GetCustomers()
        {
            return this.DataContext.Customers;
        }

        public void InsertCustomer(Customer customer)
        {
            this.DataContext.Customers.InsertOnSubmit(customer);
        }

        public void UpdateCustomer(Customer currentCustomer)
        {
            this.DataContext.Customers.Attach(currentCustomer, this.ChangeSet.GetOriginal(currentCustomer));
        }

        public void DeleteCustomer(Customer customer)
        {
            this.DataContext.Customers.Attach(customer);
            this.DataContext.Customers.DeleteOnSubmit(customer);
        }

        // TODO: Consider
        // 1. Adding parameters to this method and constraining returned results, and/or
        // 2. Adding query methods taking different parameters.
        public IQueryable<CustomerCustomerDemo> GetCustomerCustomerDemos()
        {
            return this.DataContext.CustomerCustomerDemos;
        }

        public void InsertCustomerCustomerDemo(CustomerCustomerDemo customerCustomerDemo)
        {
            this.DataContext.CustomerCustomerDemos.InsertOnSubmit(customerCustomerDemo);
        }

        public void UpdateCustomerCustomerDemo(CustomerCustomerDemo currentCustomerCustomerDemo)
        {
            this.DataContext.CustomerCustomerDemos.Attach(currentCustomerCustomerDemo, this.ChangeSet.GetOriginal(currentCustomerCustomerDemo));
        }

        public void DeleteCustomerCustomerDemo(CustomerCustomerDemo customerCustomerDemo)
        {
            this.DataContext.CustomerCustomerDemos.Attach(customerCustomerDemo);
            this.DataContext.CustomerCustomerDemos.DeleteOnSubmit(customerCustomerDemo);
        }

        // TODO: Consider
        // 1. Adding parameters to this method and constraining returned results, and/or
        // 2. Adding query methods taking different parameters.
        public IQueryable<CustomerDemographic> GetCustomerDemographics()
        {
            return this.DataContext.CustomerDemographics;
        }

        public void InsertCustomerDemographic(CustomerDemographic customerDemographic)
        {
            this.DataContext.CustomerDemographics.InsertOnSubmit(customerDemographic);
        }

        public void UpdateCustomerDemographic(CustomerDemographic currentCustomerDemographic)
        {
            this.DataContext.CustomerDemographics.Attach(currentCustomerDemographic, this.ChangeSet.GetOriginal(currentCustomerDemographic));
        }

        public void DeleteCustomerDemographic(CustomerDemographic customerDemographic)
        {
            this.DataContext.CustomerDemographics.Attach(customerDemographic);
            this.DataContext.CustomerDemographics.DeleteOnSubmit(customerDemographic);
        }

        // TODO: Consider
        // 1. Adding parameters to this method and constraining returned results, and/or
        // 2. Adding query methods taking different parameters.
        public IQueryable<Employee> GetEmployees()
        {
            return this.DataContext.Employees;
        }

        public void InsertEmployee(Employee employee)
        {
            this.DataContext.Employees.InsertOnSubmit(employee);
        }

        public void UpdateEmployee(Employee currentEmployee)
        {
            this.DataContext.Employees.Attach(currentEmployee, this.ChangeSet.GetOriginal(currentEmployee));
        }

        public void DeleteEmployee(Employee employee)
        {
            this.DataContext.Employees.Attach(employee);
            this.DataContext.Employees.DeleteOnSubmit(employee);
        }

        // TODO: Consider
        // 1. Adding parameters to this method and constraining returned results, and/or
        // 2. Adding query methods taking different parameters.
        public IQueryable<EmployeeTerritory> GetEmployeeTerritories()
        {
            return this.DataContext.EmployeeTerritories;
        }

        public void InsertEmployeeTerritory(EmployeeTerritory employeeTerritory)
        {
            this.DataContext.EmployeeTerritories.InsertOnSubmit(employeeTerritory);
        }

        public void UpdateEmployeeTerritory(EmployeeTerritory currentEmployeeTerritory)
        {
            this.DataContext.EmployeeTerritories.Attach(currentEmployeeTerritory, this.ChangeSet.GetOriginal(currentEmployeeTerritory));
        }

        public void DeleteEmployeeTerritory(EmployeeTerritory employeeTerritory)
        {
            this.DataContext.EmployeeTerritories.Attach(employeeTerritory);
            this.DataContext.EmployeeTerritories.DeleteOnSubmit(employeeTerritory);
        }

        // TODO: Consider
        // 1. Adding parameters to this method and constraining returned results, and/or
        // 2. Adding query methods taking different parameters.
        public IQueryable<Order> GetOrders()
        {
            return this.DataContext.Orders;
        }

        public void InsertOrder(Order order)
        {
            this.DataContext.Orders.InsertOnSubmit(order);
        }

        public void UpdateOrder(Order currentOrder)
        {
            this.DataContext.Orders.Attach(currentOrder, this.ChangeSet.GetOriginal(currentOrder));
        }

        public void DeleteOrder(Order order)
        {
            this.DataContext.Orders.Attach(order);
            this.DataContext.Orders.DeleteOnSubmit(order);
        }

        // TODO: Consider
        // 1. Adding parameters to this method and constraining returned results, and/or
        // 2. Adding query methods taking different parameters.
        public IQueryable<Order_Detail> GetOrder_Details()
        {
            return this.DataContext.Order_Details;
        }

        public void InsertOrder_Detail(Order_Detail order_Detail)
        {
            this.DataContext.Order_Details.InsertOnSubmit(order_Detail);
        }

        public void UpdateOrder_Detail(Order_Detail currentOrder_Detail)
        {
            this.DataContext.Order_Details.Attach(currentOrder_Detail, this.ChangeSet.GetOriginal(currentOrder_Detail));
        }

        public void DeleteOrder_Detail(Order_Detail order_Detail)
        {
            this.DataContext.Order_Details.Attach(order_Detail);
            this.DataContext.Order_Details.DeleteOnSubmit(order_Detail);
        }

        // TODO: Consider
        // 1. Adding parameters to this method and constraining returned results, and/or
        // 2. Adding query methods taking different parameters.
        public IQueryable<Product> GetProducts()
        {
            return this.DataContext.Products;
        }

        public void InsertProduct(Product product)
        {
            this.DataContext.Products.InsertOnSubmit(product);
        }

        public void UpdateProduct(Product currentProduct)
        {
            this.DataContext.Products.Attach(currentProduct, this.ChangeSet.GetOriginal(currentProduct));
        }

        public void DeleteProduct(Product product)
        {
            this.DataContext.Products.Attach(product);
            this.DataContext.Products.DeleteOnSubmit(product);
        }

        // TODO: Consider
        // 1. Adding parameters to this method and constraining returned results, and/or
        // 2. Adding query methods taking different parameters.
        public IQueryable<Region> GetRegions()
        {
            return this.DataContext.Regions;
        }

        public void InsertRegion(Region region)
        {
            this.DataContext.Regions.InsertOnSubmit(region);
        }

        public void UpdateRegion(Region currentRegion)
        {
            this.DataContext.Regions.Attach(currentRegion, this.ChangeSet.GetOriginal(currentRegion));
        }

        public void DeleteRegion(Region region)
        {
            this.DataContext.Regions.Attach(region);
            this.DataContext.Regions.DeleteOnSubmit(region);
        }

        // TODO: Consider
        // 1. Adding parameters to this method and constraining returned results, and/or
        // 2. Adding query methods taking different parameters.
        public IQueryable<Shipper> GetShippers()
        {
            return this.DataContext.Shippers;
        }

        public void InsertShipper(Shipper shipper)
        {
            this.DataContext.Shippers.InsertOnSubmit(shipper);
        }

        public void UpdateShipper(Shipper currentShipper)
        {
            this.DataContext.Shippers.Attach(currentShipper, this.ChangeSet.GetOriginal(currentShipper));
        }

        public void DeleteShipper(Shipper shipper)
        {
            this.DataContext.Shippers.Attach(shipper);
            this.DataContext.Shippers.DeleteOnSubmit(shipper);
        }

        // TODO: Consider
        // 1. Adding parameters to this method and constraining returned results, and/or
        // 2. Adding query methods taking different parameters.
        public IQueryable<Supplier> GetSuppliers()
        {
            return this.DataContext.Suppliers;
        }

        public void InsertSupplier(Supplier supplier)
        {
            this.DataContext.Suppliers.InsertOnSubmit(supplier);
        }

        public void UpdateSupplier(Supplier currentSupplier)
        {
            this.DataContext.Suppliers.Attach(currentSupplier, this.ChangeSet.GetOriginal(currentSupplier));
        }

        public void DeleteSupplier(Supplier supplier)
        {
            this.DataContext.Suppliers.Attach(supplier);
            this.DataContext.Suppliers.DeleteOnSubmit(supplier);
        }

        // TODO: Consider
        // 1. Adding parameters to this method and constraining returned results, and/or
        // 2. Adding query methods taking different parameters.
        public IQueryable<Territory> GetTerritories()
        {
            return this.DataContext.Territories;
        }

        public void InsertTerritory(Territory territory)
        {
            this.DataContext.Territories.InsertOnSubmit(territory);
        }

        public void UpdateTerritory(Territory currentTerritory)
        {
            this.DataContext.Territories.Attach(currentTerritory, this.ChangeSet.GetOriginal(currentTerritory));
        }

        public void DeleteTerritory(Territory territory)
        {
            this.DataContext.Territories.Attach(territory);
            this.DataContext.Territories.DeleteOnSubmit(territory);
        }
    }
}