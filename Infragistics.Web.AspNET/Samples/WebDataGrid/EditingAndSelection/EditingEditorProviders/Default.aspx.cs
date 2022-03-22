using System;
using System.Web.UI;

public partial class Samples_WebDataGrid_Editing_and_Selection_Editing_Editor_Providers_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected override void OnInit(EventArgs e)
    {
        ScriptManager.GetCurrent(this).EnableScriptGlobalization = true;
        base.OnInit(e);

        this.DefaultDataSource.DataBind();
    }

    protected void WebDataGrid1_RowUpdating(object sender, Infragistics.Web.UI.GridControls.RowUpdatingEventArgs e)
    {
        // This samples does not support updating.
        e.Cancel = true;
    }
}
