using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Display_Alternating_Row_Templates_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
    }
}