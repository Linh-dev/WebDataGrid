using System;
using Infragistics.Web.UI.ListControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack)
        {
            WebTab1.StyleSetName = WebDropDown1.CurrentValue;
            WebTab1.EnableOverlappingTabs = this.chkOverlap.Checked;
            
        }
        this.WebDropDown1.DisplayMode = DropDownDisplayMode.DropDown;
    }
}
