using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.DefaultDataSource.DataFile = this.GetMdbLocation("Nwind.mdb");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddPagingMode.DataSource = Enum.GetNames(typeof(Infragistics.Web.UI.ListControls.PagerMode)); ;
            ddPagingMode.DataBind();
        }
    }

    protected void ddPagingMode_SelectedIndexChanged(object sender, EventArgs e)
    {
        int itemIndex = WebDropDown1.SelectedItemIndex;

        WebDropDown1.PagerSettings.PagerMode = (Infragistics.Web.UI.ListControls.PagerMode)Enum.Parse(typeof(Infragistics.Web.UI.ListControls.PagerMode), ddPagingMode.SelectedValue);
        WebDropDown1.DataBind();

        WebDropDown1.SelectedItemIndex = itemIndex;
    }

    protected void ddPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        int oldItemIndex = (WebDropDown1.CurrentPage * WebDropDown1.PageSize) + WebDropDown1.SelectedItemIndex;
        int oldPageSize = WebDropDown1.PageSize;

        int newPageSize = int.Parse(ddPageSize.SelectedValue);
        
        int reminder;
        int quotient = Math.DivRem(oldItemIndex, newPageSize, out reminder);

        WebDropDown1.PageSize = newPageSize;
        WebDropDown1.CurrentPage = quotient;
        WebDropDown1.DataBind();

        WebDropDown1.SelectedItemIndex = reminder;
    }
}