using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Navigation_Paging_Basic_Features_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.DefaultDataSource.DataBind();

        if (!this.IsPostBack)
        {
            this.WebDataGridView.Behaviors.Paging.PagerAppearance = PagerAppearance.Bottom;
        }
    }

    protected void PagerLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.PagerLocation.SelectedIndex == 0)
        {
            this.WebDataGridView.Behaviors.Paging.PagerAppearance = PagerAppearance.Bottom;
        }
        else if (this.PagerLocation.SelectedIndex == 1)
        {
            this.WebDataGridView.Behaviors.Paging.PagerAppearance = PagerAppearance.Top;
        }
        else
        {
            this.WebDataGridView.Behaviors.Paging.PagerAppearance = PagerAppearance.Both;
        }
    }

    protected void NumberofItems_SelectedIndexChanged(object sender, EventArgs e)
    {
        int numberOfItems = int.Parse(this.NumberofItems.SelectedValue);
        this.WebDataGridView.Behaviors.Paging.PageIndex = 0;
        this.WebDataGridView.Behaviors.Paging.PageSize = numberOfItems;
    }
}