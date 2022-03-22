using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        
    }

    protected void enableAjaxIndicatorCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        if (this.enableAjaxIndicatorCheckBox.Checked)
            this.whdg1.AjaxIndicator.Enabled = Infragistics.Web.UI.DefaultableBoolean.True;
        else
            this.whdg1.AjaxIndicator.Enabled = Infragistics.Web.UI.DefaultableBoolean.False;
    }
    protected void GridInit(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataFile = this.GetMdbLocation("Nwind.mdb");
        this.AccessDataSource2.DataFile = this.GetMdbLocation("Nwind.mdb");
    }
}
