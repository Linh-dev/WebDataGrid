using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Infragistics.Web.UI.GridControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        this.AccessDataSource1.DataBind();
        this.AccessDataSource2.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) 
        {
            this.WebHierarchicalDataGrid1.GroupingSettings.GroupedColumns.Add("CategoryID");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        ListItem item = this.DropDownList1.SelectedItem;
        int bandIndex = Convert.ToInt32(item.Value);

        if (bandIndex < 0)
        {
            this.WebHierarchicalDataGrid1.GroupingSettings.GroupedColumns.Add(item.Text);
        }
        else
        {
            this.WebHierarchicalDataGrid1.Bands[0].GroupingSettings.GroupedColumns.Add(item.Text);
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        ListItem item = this.DropDownList1.SelectedItem;
        int bandIndex = Convert.ToInt32(item.Value);

        if (bandIndex < 0)
        {
            GroupedColumn groupedColumn = this.WebHierarchicalDataGrid1.GroupingSettings.GroupedColumns[item.Text];
            if (groupedColumn != null)
            {
                this.WebHierarchicalDataGrid1.GroupingSettings.GroupedColumns.Remove(groupedColumn);
            }
        }
        else
        {
            GroupedColumn groupedColumn = this.WebHierarchicalDataGrid1.Bands[0].GroupingSettings.GroupedColumns[item.Text];
            if (groupedColumn != null)
            {
                this.WebHierarchicalDataGrid1.Bands[0].GroupingSettings.GroupedColumns.Remove(groupedColumn);
            }
        }
    }
}
