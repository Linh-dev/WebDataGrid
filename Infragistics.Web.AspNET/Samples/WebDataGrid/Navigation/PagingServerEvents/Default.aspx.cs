using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Navigation_Paging_Server_Events_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        this.DefaultDataSource.DataBind();
    }

    protected void WebDataGrid1_PageIndexChanged(object sender, PagingEventArgs e)
    {
        int currentPageNumber = this.WebDataGridView.Behaviors.Paging.PageIndex + 1;
        this.ServerMessage.Text = this.GetGlobalResourceObject("WebDataGrid","Paging_ServerEventMessage").ToString() + currentPageNumber;
    }
}
