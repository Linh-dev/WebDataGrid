public partial class Samples_WebDataGrid_Editing_and_Selection_Editing_Rows_Server_Events_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(System.EventArgs e)
    {
        base.OnInit(e);
        
        this.ObjectDataSource1.DataBind();
    }

    protected void WebDataGrid1_RowUpdating(object sender, Infragistics.Web.UI.GridControls.RowUpdatingEventArgs e)
    {

        string fieldToVerify = e.Values["CompanyName"] != null ? e.Values["CompanyName"].ToString() : string.Empty;

        if (string.IsNullOrEmpty(fieldToVerify))
        {
            WebDataGrid1.CustomAJAXResponse.Message = this.GetGlobalResourceObject("WebDataGrid","UpdateRow_ServerMessageFailed").ToString();
            e.Cancel = true;
        }
        else
        {
            WebDataGrid1.CustomAJAXResponse.Message = this.GetGlobalResourceObject("WebDataGrid","UpdateRow_ServerMessageSuccess").ToString();
        }
        this.eventList.InnerHtml = WebDataGrid1.CustomAJAXResponse.Message;
    }
}
