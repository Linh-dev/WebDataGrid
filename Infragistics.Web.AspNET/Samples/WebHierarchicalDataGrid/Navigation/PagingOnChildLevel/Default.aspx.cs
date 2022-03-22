using System;
using Infragistics.Web.UI.GridControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
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
            this.ApplayPagerAppearance(PagerAppearance.Bottom);
        }
    }

    protected void PagerLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.PagerLocation.SelectedIndex == 0)
        {
            this.ApplayPagerAppearance(PagerAppearance.Bottom);
        }
        else if (this.PagerLocation.SelectedIndex == 1)
        {
            this.ApplayPagerAppearance(PagerAppearance.Top);
        }
        else
        {
            this.ApplayPagerAppearance(PagerAppearance.Both);
        }


    }

    protected void NumberofItems_SelectedIndexChanged(object sender, EventArgs e)
    {
        int numberOfItems = int.Parse(this.NumberofItems.SelectedValue);

        this.ApplayPageSize(numberOfItems);
    }

    protected void ApplayPagerAppearance(PagerAppearance appearance)
    {
        foreach (Band band in this.whdg1.Bands)
            band.Behaviors.Paging.PagerAppearance = appearance;

        this.whdg1.RefreshBehaviors();
    }

    protected void ApplayPageSize(int numberOfItems)
    {
        foreach (Band band in this.whdg1.Bands)
        {
            band.Behaviors.Paging.PageIndex = 0;
            band.Behaviors.Paging.PageSize = numberOfItems;
        }

        this.whdg1.RefreshBehaviors();
    }
}
