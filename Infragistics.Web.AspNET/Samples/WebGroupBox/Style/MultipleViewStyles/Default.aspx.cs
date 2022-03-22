using System;
using System.Web.UI.WebControls;

public partial class Samples_WebGroupBox_Style_Multiple_ViewStyles_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.WebGroupBox1.EnableAppStyling = Infragistics.WebUI.Shared.DefaultableBoolean.True;
        this.WebGroupBox1.StyleSetName = this.DDList1.SelectedValue;
    }
}
