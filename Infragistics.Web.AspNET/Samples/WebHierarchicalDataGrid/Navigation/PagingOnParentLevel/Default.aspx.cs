using System;
using Infragistics.Web.UI.GridControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataFile = this.GetMdbLocation("Nwind.mdb");
        this.AccessDataSource2.DataFile = this.GetMdbLocation("Nwind.mdb");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.whdg1.Behaviors.Paging.PagerAppearance = PagerAppearance.Bottom;
        }
    }

    protected void PagerLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.PagerLocation.SelectedIndex == 0)
        {
            this.whdg1.Behaviors.Paging.PagerAppearance = PagerAppearance.Bottom;
        }
        else if (this.PagerLocation.SelectedIndex == 1)
        {
            this.whdg1.Behaviors.Paging.PagerAppearance = PagerAppearance.Top;
        }
        else
        {
            this.whdg1.Behaviors.Paging.PagerAppearance = PagerAppearance.Both;
        }

        this.whdg1.RefreshBehaviors();
    }

    protected void NumberofItems_SelectedIndexChanged(object sender, EventArgs e)
    {
        int numberOfItems = int.Parse(this.NumberofItems.SelectedValue);
        this.whdg1.Behaviors.Paging.PageIndex = 0;
        this.whdg1.Behaviors.Paging.PageSize = numberOfItems;

        this.whdg1.RefreshBehaviors();
    }
}
