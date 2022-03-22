using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Samples_AjaxIndicator_Display_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ddlRequestDelay.SelectedIndex > 0 && Infragistics.Web.UI.Framework.AppSettings.IsAjaxPostBack)
            System.Threading.Thread.Sleep(Int32.Parse(ddlRequestDelay.SelectedValue));
    }

	public void whdg1_Init(object sender, EventArgs e)
	{
		AccessDataSource1.DataFile = this.GetMdbLocation("Nwind.mdb");
		AccessDataSource2.DataFile = this.GetMdbLocation("Nwind.mdb");
		AccessDataSource3.DataFile = this.GetMdbLocation("Nwind.mdb");

		AccessDataSource1.DataBind();
		AccessDataSource2.DataBind();
		AccessDataSource3.DataBind();
	}

    protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.whdg1.AjaxIndicator.Location =
            (Infragistics.Web.UI.RelativeLocation)Int32.Parse(ddlLocation.SelectedValue);
    }

    protected void ddlFadeInEquationType_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.whdg1.AjaxIndicator.FadeInEquationType =
            (Infragistics.Web.UI.AnimationEquationType)Int32.Parse(ddlFadeInEquationType.SelectedValue);

        this.whdg1.AjaxIndicator.FadeOutEquationType = this.whdg1.AjaxIndicator.FadeInEquationType;

        if (ddlRequestDelay.SelectedIndex > 0)
        {
            this.whdg1.AjaxIndicator.FadeInDuration = Int32.Parse(ddlRequestDelay.SelectedValue) / 3;
            this.whdg1.AjaxIndicator.FadeOutDuration = this.whdg1.AjaxIndicator.FadeInDuration;
        }
    }

    protected void ddlBlockArea_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.whdg1.AjaxIndicator.BlockArea =
            (Infragistics.Web.UI.AjaxIndicatorBlockArea)Int32.Parse(ddlBlockArea.SelectedValue);
    }
}