using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Display_Cell_Column_Templates_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.DefaultDataSource.DataBind();
        this.WebDataGridView.InitializeRow += new Infragistics.Web.UI.GridControls.InitializeRowEventHandler(WebDataGridView_InitializeRow);
    }

    protected void WebDataGridView_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
    {
        GridRecordItem recordItem = e.Row.Items[5];

        if (recordItem != null)
        {
            recordItem.CssClass = this.GetDisplayStyle(recordItem.Value);
        }

    }

    protected bool CheckCondtion(object parameter)
    {
        double value = double.Parse(parameter.ToString());

        bool returnValue = false;

        if (value > 25)
        {
            returnValue = true;
        }

        return returnValue;
    }

    protected string GetDisplayStyle(object parameter)
    {

        int value = int.Parse(parameter.ToString());

        string returnValue = "igg_ColumnHighlightOff";

        if (value >= 25)
        {
            returnValue = "igg_ColumnHighlightOn";
        }

        return returnValue;
    }
}
