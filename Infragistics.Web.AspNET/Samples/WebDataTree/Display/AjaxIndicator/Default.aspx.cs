using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Samples_AjaxIndicator_Display_Using_WebDataTree_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.WebDataTreeSample.DataBound += new EventHandler(WebDataTreeSample_DataBound);
        TreeDataSource.DataBind();
        if (ddlRequestDelay.SelectedIndex > 0 && Infragistics.Web.UI.Framework.AppSettings.IsAjaxPostBack)
            System.Threading.Thread.Sleep(Int32.Parse(ddlRequestDelay.SelectedValue));

    }

    void WebDataTreeSample_DataBound(object sender, EventArgs e)
    {   
        if (this.WebDataTreeSample.Nodes.Count > 0)
        {
            this.WebDataTreeSample.Nodes[0].Selected = true;
            this.WebDataTreeSample.Nodes[0].ExpandChildren();
        }
    }

    protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.WebDataTreeSample.AjaxIndicator.Location =
            (Infragistics.Web.UI.RelativeLocation)Int32.Parse(ddlLocation.SelectedValue);
    }

    protected void ddlFadeInEquationType_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.WebDataTreeSample.AjaxIndicator.FadeInEquationType =
            (Infragistics.Web.UI.AnimationEquationType)Int32.Parse(ddlFadeInEquationType.SelectedValue);

        this.WebDataTreeSample.AjaxIndicator.FadeOutEquationType = this.WebDataTreeSample.AjaxIndicator.FadeInEquationType;

        if (ddlRequestDelay.SelectedIndex > 0)
        {
            this.WebDataTreeSample.AjaxIndicator.FadeInDuration = Int32.Parse(ddlRequestDelay.SelectedValue) / 3;
            this.WebDataTreeSample.AjaxIndicator.FadeOutDuration = this.WebDataTreeSample.AjaxIndicator.FadeInDuration;
        }
    }

    protected void ddlBlockArea_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.WebDataTreeSample.AjaxIndicator.BlockArea =
            (Infragistics.Web.UI.AjaxIndicatorBlockArea)Int32.Parse(ddlBlockArea.SelectedValue);
    }
}