using System;
using Infragistics.UltraChart.Resources.Appearance;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Display_Dashboard_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        this.WebDataGrid1.DataSource = new NorthwindDataSource().GetCustomers();

        if (!this.IsPostBack)
        {
            this.WebDataGrid1.DataBind();
        }
    }

    protected void Paging_PageIndexChanged(object sender, PagingEventArgs e)
    {
        this.UltraChart1.Visible = false;
    }

    public void Selection_RowSelectionChanged(object sender, Infragistics.Web.UI.GridControls.SelectedRowEventArgs e)
    {

        if (e.CurrentSelectedRows.Count > 0 && e.CurrentSelectedRows[0] != null)
        {
            object dataItem = e.CurrentSelectedRows[0].DataItem;
            if (dataItem is Customer)
            {
                string customerId = ((Customer)dataItem).CustomerID;
                this.LoadChart(customerId);
            }
            else
            {
                this.UltraChart1.Visible = false;
            }
        }
        else
        {
            this.UltraChart1.Visible = false;
        }
    }

    private void LoadChart(string customerId)
    {
        this.UltraChart1.Visible = true;
        this.UltraChart1.Data.DataSource = new NorthwindDataSource().GetOrderHistory(customerId);
        LineAppearance App1 = new LineAppearance();
        this.UltraChart1.LineChart.LineAppearances.Add(App1);
        this.UltraChart1.Data.DataBind();
    }
}
