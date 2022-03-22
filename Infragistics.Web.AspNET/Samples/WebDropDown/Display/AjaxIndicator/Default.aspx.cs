using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


using Infragistics.Documents;

public partial class Samples_AjaxIndicator_Display_Using_WebDropDown : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
		
		
        if (ddlRequestDelay.SelectedIndex > 0 && Infragistics.Web.UI.Framework.AppSettings.IsAjaxPostBack)
            System.Threading.Thread.Sleep(Int32.Parse(ddlRequestDelay.SelectedValue));
    }

	protected void WebDropDown1_Init(object sender, EventArgs e)
	{
		DefaultDataSource.DataFile = this.GetMdbLocation("Nwind.mdb");
		DefaultDataSource.DataBind();
	}

    protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.WebDropDown1.AjaxIndicator.Location =
            (Infragistics.Web.UI.RelativeLocation)Int32.Parse(ddlLocation.SelectedValue);
    }

    protected void ddlFadeInEquationType_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.WebDropDown1.AjaxIndicator.FadeInEquationType =
            (Infragistics.Web.UI.AnimationEquationType)Int32.Parse(ddlFadeInEquationType.SelectedValue);

        this.WebDropDown1.AjaxIndicator.FadeOutEquationType = this.WebDropDown1.AjaxIndicator.FadeInEquationType;

        if (ddlRequestDelay.SelectedIndex > 0)
        {
            this.WebDropDown1.AjaxIndicator.FadeInDuration = Int32.Parse(ddlRequestDelay.SelectedValue) / 3;
            this.WebDropDown1.AjaxIndicator.FadeOutDuration = this.WebDropDown1.AjaxIndicator.FadeInDuration;
        }
    }

    protected void ddlBlockArea_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.WebDropDown1.AjaxIndicator.BlockArea =
            (Infragistics.Web.UI.AjaxIndicatorBlockArea)Int32.Parse(ddlBlockArea.SelectedValue);
    }

}
