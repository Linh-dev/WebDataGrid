using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


using Infragistics.Web.UI.GridControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        WebDataGrid1.DataSource = new List<Customer>();
    }

    protected void WebDataGrid1_CustomDataBinding(object sender, DataBindingEventArgs e)
    {
        WebDataGrid grid = sender as WebDataGrid;
        grid.ScrollTop = 0;
        int currentPage = grid.Behaviors.Paging.PageIndex;
        int pageSize = grid.Behaviors.Paging.PageSize;
        int startIndex = currentPage * pageSize;
        CustomerRepository customers = new CustomerRepository();

        e.Cancel = true;
        e.DataSource = customers.GetCustomerRange(startIndex, pageSize);
        e.SelectArguments.TotalRowCount = customers.Count;
    }

    private class CustomerRepository
    {
        private List<Customer> customerData;

        public CustomerRepository()
        {
            customerData = new NorthwindDataSource().GetCustomers();
        }

        public List<Customer> GetCustomerRange(int startIndex, int count)
        {
            int rangeCount = count;
            int repositoryCount = Count;

            if (startIndex + count > repositoryCount)
                rangeCount = repositoryCount - startIndex;

            return customerData.GetRange(startIndex, rangeCount);
        }

        public int Count
        {
            get { return customerData.Count; }
        }
    }

}
