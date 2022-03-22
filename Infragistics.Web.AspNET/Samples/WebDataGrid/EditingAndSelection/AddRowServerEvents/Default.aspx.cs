using System;

public partial class Samples_WebDataGrid_Editing_and_Selection_Add_Row_Server_Events_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void WebDataGrid1_RowAdding(object sender, Infragistics.Web.UI.GridControls.RowAddingEventArgs e)
    {
        string customerID = e.Values["CustomerID"].ToString();

        if (customerID.Length < 5)
        {
            WebDataGrid1.CustomAJAXResponse.Message = string.Format(this.GetGlobalResourceObject("WebDataGrid","AddNewRow_ServerMessageFail").ToString(), customerID);
            e.Cancel = true;
        }
        else
        {
            WebDataGrid1.CustomAJAXResponse.Message = this.GetGlobalResourceObject("WebDataGrid","AddNewRow_ServerMessageSuccess").ToString();
        }

    }

    protected void WebDataGrid1_RowAdded(object sender, Infragistics.Web.UI.GridControls.RowAddedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            WebDataGrid1.CustomAJAXResponse.Message = e.Exception.InnerException.Message;
        }
    }

    protected void inserting(object sender, EventArgs e)
    {

    }
}
