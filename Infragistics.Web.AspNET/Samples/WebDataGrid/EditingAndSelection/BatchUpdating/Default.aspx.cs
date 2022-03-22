using System;
using System.Web;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnDefaultData.Click += new EventHandler(btnDefaultData_Click);
    }

    protected void chkBatch_CheckedChanged(object sender, EventArgs e)
    {
        this.wdg1.Behaviors.EditingCore.BatchUpdating = this.chkBatch.Checked;
        this.wdg1.Behaviors.Selection.RowSelectType = (this.chkBatch.Checked)
                                                        ? Infragistics.Web.UI.GridControls.SelectType.Multiple
                                                        : Infragistics.Web.UI.GridControls.SelectType.Single;
        this.tbBatchInfo.InnerHtml = (this.chkBatch.Checked)
                                        ? this.GetGlobalResourceObject("WebDataGrid", "BatchUpdatingEnabledDescription").ToString()
                                        : this.GetGlobalResourceObject("WebDataGrid", "BatchUpdatingDisabledDescription").ToString();
    }

    void btnDefaultData_Click(object sender, EventArgs e)
    {
        HttpContext.Current.Session["GridDataCache"] = null;
    }
}
