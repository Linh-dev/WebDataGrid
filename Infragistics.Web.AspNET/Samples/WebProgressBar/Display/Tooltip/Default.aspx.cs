using System;

public partial class Samples_WebProgressBar_Display_Tooltip_Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            this.DropDownList1.Items.Add(this.GetGlobalResourceObject("WebProgressBar", "txt_progress_value").ToString());
            this.DropDownList1.Items.Add(this.GetGlobalResourceObject("WebProgressBar", "txt_progress_percentage").ToString());
            this.DropDownList1.Items.Add(this.GetGlobalResourceObject("WebProgressBar", "txt_remaining_percentage").ToString());
            this.DropDownList1.Items.Add(this.GetGlobalResourceObject("WebProgressBar", "txt_min_max").ToString());
            this.wpbOne.ToolTip = String.Format("{0}: {{ProgressValue}}", this.GetGlobalResourceObject("WebProgressBar", "txt_progress_value").ToString());
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (this.DropDownList1.SelectedIndex)
        {
            case 0 :
                this.wpbOne.ToolTip = String.Format("{0}: {{ProgressValue}}", this.GetGlobalResourceObject("WebProgressBar", "txt_progress_value").ToString());
                break;
            case 1 :
                this.wpbOne.ToolTip = String.Format("{0}: {{PercentProgress}}%", this.GetGlobalResourceObject("WebProgressBar", "txt_progress_percentage").ToString());
                break;
            case 2 :
                this.wpbOne.ToolTip = String.Format("{0}: {{PercentageRemaining}}%", this.GetGlobalResourceObject("WebProgressBar", "txt_remaining_percentage").ToString());
                break;
            case 3 :
                this.wpbOne.ToolTip = String.Format("{0}: {{Min}}; {1}: {{Max}}", this.GetGlobalResourceObject("WebProgressBar", "txt_min").ToString(), this.GetGlobalResourceObject("WebProgressBar", "txt_max").ToString());
                break;
        }
    }
}
