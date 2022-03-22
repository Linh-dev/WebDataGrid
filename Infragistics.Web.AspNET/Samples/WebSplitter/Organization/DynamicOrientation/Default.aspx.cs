using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void ChangeOrientation(object sender, EventArgs e)
    {
        this.WebSplitter1.Orientation = this.orientationList.SelectedItem.Value == "0" ? System.Web.UI.WebControls.Orientation.Horizontal : System.Web.UI.WebControls.Orientation.Vertical;
    } 
}
