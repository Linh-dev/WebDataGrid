using System;

public partial class Samples_WebDataGrid_Data_Unbound_Checkbox_Column_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.WebDataGrid1.ClientEvents.HeaderCheckBoxClicked = "headerCheckBoxClicked";
        this.WebDataGrid1.ClientEvents.HeaderCheckBoxClicking = "headerCheckBoxClicking";
        this.WebDataGrid1.Behaviors.EditingCore.EditingClientEvents.CellValueChanging = "cellValueChanging";
        this.WebDataGrid1.Behaviors.EditingCore.EditingClientEvents.CellValueChanged = "cellValueChanged";

        this.WebDataGrid1.EnableViewState = true;
    }
}
