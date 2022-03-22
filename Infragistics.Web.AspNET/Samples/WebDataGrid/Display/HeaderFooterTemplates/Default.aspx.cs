using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Display_Header_Footer_Templates_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        this.AccessDataSource1.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
}