using System;

public partial class Samples_WebHierarchicalDataGrid_Data_Unbound_Checkbox_Column_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void OnInit(object sender, EventArgs e)
    {
        this.AccessDataSource2.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.WebHierarchicalDataGrid1.ClientEvents.HeaderCheckBoxClicked = "headerCheckBoxClicked";
        this.WebHierarchicalDataGrid1.ClientEvents.HeaderCheckBoxClicking = "headerCheckBoxClicking";
        this.WebHierarchicalDataGrid1.Behaviors.EditingCore.EditingClientEvents.CellValueChanging = "cellValueChanging";
        this.WebHierarchicalDataGrid1.Behaviors.EditingCore.EditingClientEvents.CellValueChanged = "cellValueChanged";

        this.WebHierarchicalDataGrid1.EnableViewState = true;
    }
}
