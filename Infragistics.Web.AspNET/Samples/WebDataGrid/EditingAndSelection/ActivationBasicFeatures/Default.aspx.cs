using System;

public partial class Samples_WebDataGrid_Editing_and_Selection_Activation_Basic_Features_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
    }

    protected void ActivationOn_CheckedChanged(object sender, EventArgs e)
    {
        this.WebDataGridView.Behaviors.Activation.Enabled = this.ActivationOn.Checked;
    }
}
