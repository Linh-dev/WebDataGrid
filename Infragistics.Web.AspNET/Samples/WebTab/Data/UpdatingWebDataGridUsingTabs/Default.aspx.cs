using System;
using System.Collections.Generic;
using System.Data.OleDb;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected override void OnInit(EventArgs e)
    {

        base.OnInit(e);

        this.WebTab1.Load += new EventHandler(WebTab1_Load);
    }

    void WebTab1_Load(object sender, EventArgs e)
    {
        if (Session["CustomerList"] == null)
        {
            Session["CustomerList"] = GetCustomerList();
        }

        List<WebTabBusinessLayer.Customer> customerList = (List<WebTabBusinessLayer.Customer>)Session["CustomerList"];

        this.WebDataGrid1.DataSource = customerList;

        this.WebDataGrid1.DataBind();
    }



    public void WebDataGrid1_RowsDeleting(object sender, Infragistics.Web.UI.GridControls.RowDeletingEventArgs e)
    {
        List<WebTabBusinessLayer.Customer> customerList = (List<WebTabBusinessLayer.Customer>)Session["CustomerList"];

        string customerId = e.Row.DataKey.GetValue(0).ToString();
        WebTabBusinessLayer.Customer c = customerList.Find(delegate(WebTabBusinessLayer.Customer customer) { return customer.CustomerID == customerId; });

        if (c != null)
        {
            customerList.Remove(c);
        }
    }

    public void WebDataGrid1_RowAdding(object sender, Infragistics.Web.UI.GridControls.RowAddingEventArgs e)
    {
        List<WebTabBusinessLayer.Customer> customerList = (List<WebTabBusinessLayer.Customer>)Session["CustomerList"];

        WebTabBusinessLayer.Customer customer = new WebTabBusinessLayer.Customer(e.Values["CustomerID"].ToString().ToUpper(), (string)e.Values["CompanyName"],
            (string)e.Values["ContactName"], (string)e.Values["ContactTitle"]);

        customerList.Add(customer);
    }

    private List<WebTabBusinessLayer.Customer> GetCustomerList()
    {
        List<WebTabBusinessLayer.Customer> customerList;

        customerList = new List<WebTabBusinessLayer.Customer>();
        string path = this.GetMdbConnectionString("Nwind.mdb");
        OleDbConnection con = new OleDbConnection(@"Provider =Microsoft.JET.OLEDB.4.0;" + "Data Source=" + path);
        OleDbCommand cmd = new OleDbCommand("SELECT [CustomerID], [CompanyName], [ContactName], [ContactTitle] FROM [Customers]");
        cmd.Connection = con;

        con.Open();

        OleDbDataReader reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            customerList.Add(new WebTabBusinessLayer.Customer(reader.GetString(0), reader.GetString(1), reader.GetString(2), reader.GetString(3)));
        }

        reader.Close();
        con.Close();

        return customerList;
    }
}
