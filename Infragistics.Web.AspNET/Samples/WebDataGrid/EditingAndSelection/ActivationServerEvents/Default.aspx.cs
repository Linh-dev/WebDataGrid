using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Editing_and_Selection_Activation_Server_Events_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.DefaultDataSource.DataBind();
    }

    protected void Active_CellChanged(object sender, ActiveCellEventArgs e)
    {
        this.ServerMessage.Text = this.GetGlobalResourceObject("WebDataGrid","Activation_ServerEventMessage") + e.CurrentActiveCell.Text;
    }
}

