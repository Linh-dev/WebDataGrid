using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Editing_and_Selection_Adding_New_Row_Basic_Features_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{

    protected void ChangeAlignment(object sender, EventArgs e)
    {
        switch (this.Alignment.SelectedValue)
        {
            case "Top":
                this.WebDataGrid1.Behaviors.EditingCore.Behaviors.RowAdding.Alignment = AddNewRowAlignment.Top;
                break;
            case "Bottom":
                this.WebDataGrid1.Behaviors.EditingCore.Behaviors.RowAdding.Alignment = AddNewRowAlignment.Bottom;
                break;
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
}