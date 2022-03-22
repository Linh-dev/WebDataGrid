public partial class Samples_WebDataGrid_Editing_and_Selection_Delete_Rows_Server_Events_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void WebDataGrid1_RowDeleting(object sender, Infragistics.Web.UI.GridControls.RowDeletingEventArgs e)
    {
        string result = string.Empty;
        foreach (string key in e.Row.DataKey)
        {
            if (key.Equals("LONEP"))
            {
                e.Cancel = true;
                result = this.GetGlobalResourceObject("WebDataGrid","RowDelete_ServerMessageFail").ToString();
                break;
            }
            else
            {
                result += key + " ";
            }
        }

        if (!e.Cancel)
        {
            result = string.Format(this.GetGlobalResourceObject("WebDataGrid","RowDelete_ServerMessageSuccess").ToString(), result.Trim());
        }

        WebDataGrid1.CustomAJAXResponse.Message += result + "\n<br />";
    }
}
