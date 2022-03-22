using System;
using System.Web;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnDefaultData.Click += new EventHandler(btnDefaultData_Click);
        this.chkBatch.CheckedChanged +=new EventHandler(chkBatch_CheckedChanged);
        this.chkBatchChild.CheckedChanged += new EventHandler(chkBatchChild_CheckedChanged);
    }

    void btnDefaultData_Click(object sender, EventArgs e)
    {
        HttpContext.Current.Session["GridDataCache"] = null;
        HttpContext.Current.Session["WHDGCache_Orders"] = null;
    }

    protected void chkBatch_CheckedChanged(object sender, EventArgs e)
    {
        this.whdg1.Behaviors.EditingCore.BatchUpdating = this.chkBatch.Checked;
        this.whdg1.Behaviors.Selection.RowSelectType = (this.chkBatch.Checked)
                                                        ? Infragistics.Web.UI.GridControls.SelectType.Multiple
                                                        : Infragistics.Web.UI.GridControls.SelectType.Single;
        this.whdg1.RefreshBehaviors();
    }

    void chkBatchChild_CheckedChanged(object sender, EventArgs e)
    {
        this.whdg1.Bands[0].Behaviors.EditingCore.BatchUpdating = this.chkBatchChild.Checked;
        this.whdg1.RefreshBehaviors();
    }
}
