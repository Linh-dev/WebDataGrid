using System;
using System.Web.UI.WebControls;

public partial class Samples_WebTab_Display_PropertyExplorer_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.DropDownList1.SelectedIndex == 0)
        {
            this.WebTab1.TabOrientation = Orientation.Horizontal;
        }
        else
        {
            this.WebTab1.TabOrientation = Orientation.Vertical;
        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.DropDownList2.SelectedIndex == 0)
        {
            this.WebTab1.TabLocation = Infragistics.Web.UI.LayoutControls.TabLocation.BottomLeft;
        }
        if (this.DropDownList2.SelectedIndex == 1)
        {
            this.WebTab1.TabLocation = Infragistics.Web.UI.LayoutControls.TabLocation.BottomRight;
        }
        if (this.DropDownList2.SelectedIndex == 2)
        {
            this.WebTab1.TabLocation = Infragistics.Web.UI.LayoutControls.TabLocation.TopLeft;
        }
        if (this.DropDownList2.SelectedIndex == 3)
        {
            this.WebTab1.TabLocation = Infragistics.Web.UI.LayoutControls.TabLocation.TopRight;
        }
        if (this.DropDownList2.SelectedIndex == 4)
        {
            this.WebTab1.TabLocation = Infragistics.Web.UI.LayoutControls.TabLocation.LeftTop;
        }
        if (this.DropDownList2.SelectedIndex == 5)
        {
            this.WebTab1.TabLocation = Infragistics.Web.UI.LayoutControls.TabLocation.LeftBottom;
        }
        if (this.DropDownList2.SelectedIndex == 6)
        {
            this.WebTab1.TabLocation = Infragistics.Web.UI.LayoutControls.TabLocation.RightTop;
        }
        if (this.DropDownList2.SelectedIndex == 7)
        {
            this.WebTab1.TabLocation = Infragistics.Web.UI.LayoutControls.TabLocation.RightBottom;
        }
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.WebTab1.SelectedIndex = this.DropDownList3.SelectedIndex;
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        this.WebTab1.EnableOverlappingTabs = this.CheckBox1.Checked;
    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        this.WebTab1.EnableActivation = this.CheckBox2.Checked;
    }
    protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
    {
        this.WebTab1.TabMoving.Enabled = this.CheckBox3.Checked;
    }
}