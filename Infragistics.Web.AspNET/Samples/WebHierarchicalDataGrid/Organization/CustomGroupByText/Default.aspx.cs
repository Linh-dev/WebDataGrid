using System;
using Infragistics.Web.UI.GridControls; 

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.WebHierarchicalDataGrid1.GroupedRowInitialized += new Infragistics.Web.UI.GridControls.GroupedRowInitializedEventHandler(WebHierarchicalDataGrid1_GroupedRowInitialized);
        //this.WebHierarchicalDataGrid1.GroupingSettings.GroupedRowTextMask = "Data: {0}, Value: {1}, Items: {2}";

        this.WebHierarchicalDataGrid1.GroupingSettings.GroupedColumns.Add("ReportsTo");
        this.WebHierarchicalDataGrid1.GroupingSettings.GroupAreaVisibility = Visibility.Hidden;
    }

    void WebHierarchicalDataGrid1_GroupedRowInitialized(object sender, Infragistics.Web.UI.GridControls.GroupedRowEventArgs e)
    {
        // Set custom text for ReportsTo column
        if (e.GroupedRow.ColumnGroupedBy.Key == "ReportsTo")
        {
            // If value does not exist, the employee reports to no one
            if (e.GroupedRow.Value == DBNull.Value)
            {
                // Get number of items from default text
                string numItems = e.GroupedRow.Text.Substring(e.GroupedRow.Text.Length - 3, 3);

                e.GroupedRow.Text = this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_CustomGroupByText_ReportsToNoOne") + " " + numItems;
            }
            else
            {
                string numItems = e.GroupedRow.Text.Substring(e.GroupedRow.Text.Length - 3, 3);

                // Get value being grouped by
                int value = (int)e.GroupedRow.Value;

                // Get the row with EmployeeID equal to the value being grouped by from the ReportsTo column.
                // This returns the row for the employee that the rows that are being grouped reports to.
                GridRecord record = this.WebHierarchicalDataGrid1.Rows.FromKey(new object[] { value });

                if (record != null)
                {
                    // Get the name of the person to report to
                    string name = record.Items[1].Value.ToString() + " " + record.Items[2].Value.ToString();
                    e.GroupedRow.Text = this.GetGlobalResourceObject("WebHierarchicalDataGrid","WebHierarchicalDataGrid_CustomGroupByText_ReportsTo") + " " + name + " " + numItems;

                }
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
    }

}
