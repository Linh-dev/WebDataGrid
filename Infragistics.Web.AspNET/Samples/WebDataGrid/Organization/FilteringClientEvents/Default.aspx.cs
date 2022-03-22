using System;

public partial class Samples_WebDataGrid_Organization_Filtering_Client_Events_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
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