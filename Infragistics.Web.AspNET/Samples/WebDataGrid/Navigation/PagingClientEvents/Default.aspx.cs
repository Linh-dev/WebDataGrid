using System;

public partial class Samples_WebDataGrid_Navigation_Paging_Client_Events_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.DefaultDataSource.DataBind();
    }
}