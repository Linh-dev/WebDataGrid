using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Samples_AjaxIndicator_Display_Using_WebDataGrid_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.SetDataSource(!this.IsPostBack);
    }

    private void SetDataSource(bool dataBind)
    {
        this.WebDataGridView.DataSourceID = "";

        NorthwindDataSource dataSources = new NorthwindDataSource();

        dataSources.SetWebDataGridDataSource(this.WebDataGridView, "ICollection");

        if (dataBind)
        {
            this.WebDataGridView.DataBind();
        }

        if (ddlRequestDelay.SelectedIndex > 0 && Infragistics.Web.UI.Framework.AppSettings.IsAjaxPostBack)
            System.Threading.Thread.Sleep(Int32.Parse(ddlRequestDelay.SelectedValue));
    }

    protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.WebDataGridView.AjaxIndicator.Location =
            (Infragistics.Web.UI.RelativeLocation)Int32.Parse(ddlLocation.SelectedValue);
    }

    protected void ddlFadeInEquationType_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.WebDataGridView.AjaxIndicator.FadeInEquationType =
            (Infragistics.Web.UI.AnimationEquationType)Int32.Parse(ddlFadeInEquationType.SelectedValue);

        this.WebDataGridView.AjaxIndicator.FadeOutEquationType = this.WebDataGridView.AjaxIndicator.FadeInEquationType;

        if (ddlRequestDelay.SelectedIndex > 0)
        {
            this.WebDataGridView.AjaxIndicator.FadeInDuration = Int32.Parse(ddlRequestDelay.SelectedValue) / 3;
            this.WebDataGridView.AjaxIndicator.FadeOutDuration = this.WebDataGridView.AjaxIndicator.FadeInDuration;
        }
    }

    protected void ddlBlockArea_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.WebDataGridView.AjaxIndicator.BlockArea =
            (Infragistics.Web.UI.AjaxIndicatorBlockArea)Int32.Parse(ddlBlockArea.SelectedValue);
    }

}