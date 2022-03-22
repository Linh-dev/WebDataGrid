public partial class Samples_WebDataGrid_Editing_and_Selection_Add_Row_Client_Events_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void WebDataGrid1_RowAdded(object sender, Infragistics.Web.UI.GridControls.RowAddedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            WebDataGrid1.CustomAJAXResponse.Message = e.Exception.InnerException.Message;
        }
    }
}
