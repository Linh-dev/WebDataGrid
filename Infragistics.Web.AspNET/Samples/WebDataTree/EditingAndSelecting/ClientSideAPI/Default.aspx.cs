using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void dataTreeConnLinesChecked(object sender, EventArgs e)
    {
        this.DDWebDataTree.EnableConnectorLines = this.WebDataTree1ConnLinesCheckBox.Checked;
    }

    protected void dataTreecheckBoxChecked(object sender, EventArgs e)
    {
        if (this.WebDataTree1CheckBox.Checked)
        {
            this.DDWebDataTree.CheckBoxMode = Infragistics.Web.UI.CheckBoxMode.BiState;
        }
        else
        {
            this.DDWebDataTree.CheckBoxMode = Infragistics.Web.UI.CheckBoxMode.Off;
        }
    }
}