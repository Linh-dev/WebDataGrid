using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Organization_Column_Moving_Server_Side_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.NorthWndDataSource.DataBind();
    }

    protected void ColumnMovingType_SelectedIndexChanged(object sender, EventArgs e)
    {

        string selectedColumnMovingType = this.ColumnMovingType.SelectedValue;

        HeaderDragStyle dragStyle = HeaderDragStyle.Slide;
        if (selectedColumnMovingType.Equals("Follow"))
        {
            dragStyle = HeaderDragStyle.Follow;
        }
        this.WebDataGridSample.Behaviors.ColumnMoving.DragStyle = dragStyle;
    }


    protected void ColumnsList_SelectedIndexChanged(object sender, EventArgs e)
    {

        string selectedColumn = this.ColumnsList.SelectedValue;

        ColumnMoving columnMovingBehavior = this.WebDataGridSample.Behaviors.ColumnMoving;
        foreach (ColumnMoveSetting setting in columnMovingBehavior.ColumnSettings)
        {
            if (setting.ColumnKey.Equals(selectedColumn))
            {
                setting.EnableMove = false;
            }
            else
            {
                setting.EnableMove = true;
            }
        }

    }
}
