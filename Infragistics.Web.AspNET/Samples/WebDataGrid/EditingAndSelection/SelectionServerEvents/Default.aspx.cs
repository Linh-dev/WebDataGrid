using System;

public partial class Samples_WebDataGrid_Editing_and_Selection_Selection_Server_Events_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
    }

    protected void WebDataGridView_CellSelectionChanged(object sender, Infragistics.Web.UI.GridControls.SelectedCellEventArgs e)
    {
        if (e.CurrentSelectedCells.Count > 0)
        {
            this.ServerMessage.Text = this.GetGlobalResourceObject("WebDataGrid","Selection_ServerEventMessage") + e.CurrentSelectedCells[0].Text;
        }
    }
}
