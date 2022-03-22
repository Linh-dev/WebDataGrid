using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Organization_Column_Fixing_Server_Side_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.GridDataSource.DataBind();
        this.rblButtonAlignment.SelectedIndexChanged += new EventHandler(rblButtonAlignment_SelectedIndexChanged);
        this.rblColumnFixing.SelectedIndexChanged += new EventHandler(rblColumnFixing_SelectedIndexChanged);
        this.EnableFixedColumns.CheckedChanged += new EventHandler(EnableFixedColumns_CheckedChanged);
        this.EnableHeightAdjustment.CheckedChanged += new EventHandler(EnableHeightAdjustment_CheckedChanged);
    }

    void EnableHeightAdjustment_CheckedChanged(object sender, EventArgs e)
    {
        if (this.GetColumnFixingBehavior() != null)
            this.GetColumnFixingBehavior().AutoAdjustCells = this.EnableHeightAdjustment.Checked;
    }

    void rblColumnFixing_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.GetColumnFixingBehavior() != null)
            this.GetColumnFixingBehavior().FixLocation = (rblColumnFixing.SelectedValue == "l") ? FixLocation.Left : FixLocation.Right;
    }


    void rblButtonAlignment_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.GetColumnFixingBehavior() != null)
            this.GetColumnFixingBehavior().FixButtonAlignment = (rblButtonAlignment.SelectedValue == "l") ? HeaderButtonAlignment.Left : HeaderButtonAlignment.Right;
    }


    protected void EnableFixedColumns_CheckedChanged(object sender, EventArgs e)
    {
        if (this.EnableFixedColumns.Checked)
        {
            ColumnFixing cf = new ColumnFixing();
            cf.FixButtonAlignment = (rblButtonAlignment.SelectedValue == "l") ? HeaderButtonAlignment.Left : HeaderButtonAlignment.Right;
            cf.FixLocation = (rblColumnFixing.SelectedValue == "l") ? FixLocation.Left : FixLocation.Right;

            WebDataGridView.Behaviors.Add(cf);
        }
        else
        {
            WebDataGridView.Behaviors.Remove(WebDataGridView.Behaviors.ColumnFixing);
        }

    }


    private ColumnFixing GetColumnFixingBehavior()
    {
        return this.WebDataGridView.Behaviors.GetBehavior<ColumnFixing>();
    }
}
