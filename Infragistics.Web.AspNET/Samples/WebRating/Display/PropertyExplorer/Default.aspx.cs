using System;
using System.Web.UI.WebControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.DropDownList1.Text == "Async")
            this.WebRating1.AutoPostBackFlags.Rated = Infragistics.Web.UI.AutoPostBackFlag.Async;
        else if (this.DropDownList1.Text == "On")
            this.WebRating1.AutoPostBackFlags.Rated = Infragistics.Web.UI.AutoPostBackFlag.On;
        else
            this.WebRating1.AutoPostBackFlags.Rated = Infragistics.Web.UI.AutoPostBackFlag.Off;
    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        this.WebRating1.EnableContinuousSelection = this.CheckBox2.Checked;
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.DropDownList2.Text == "Exact")
            this.WebRating1.Precision = Infragistics.Web.UI.EditorControls.RatingPrecision.Exact;
        else if (this.DropDownList2.Text == "Half")
            this.WebRating1.Precision = Infragistics.Web.UI.EditorControls.RatingPrecision.Half;
        else
            this.WebRating1.Precision = Infragistics.Web.UI.EditorControls.RatingPrecision.Whole;
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        this.WebRating1.EnableShowSelectionOnHover = this.CheckBox1.Checked;
    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        this.WebRating1.Orientation = Orientation.Horizontal;
    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        this.WebRating1.Orientation = Orientation.Vertical;
    }
}
