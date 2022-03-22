using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebHierarchicalDataGrid_Organization_Column_Moving_Server_Side_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        AccessDataSource1.DataBind();
        AccessDataSource2.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ColumnMovingType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedColumnMovingType = this.ColumnMovingType.SelectedValue;

        HeaderDragStyle dragStyle = HeaderDragStyle.Slide;
        if (selectedColumnMovingType.Equals("Follow"))
        {
            dragStyle = HeaderDragStyle.Follow;
        }
        this.WebHierarchicalDataGrid1.Behaviors.ColumnMoving.DragStyle = dragStyle;
        this.WebHierarchicalDataGrid1.GridView.Behaviors.ColumnMoving.DragStyle = dragStyle;
        this.WebHierarchicalDataGrid1.Bands[0].Behaviors.ColumnMoving.DragStyle = dragStyle;
        foreach (ContainerGridRecord row in this.WebHierarchicalDataGrid1.GridView.Rows)
        {
            if (row.Expanded && row.HasRowIslands)
            {
                row.RowIslands[0].Behaviors.ColumnMoving.DragStyle = dragStyle;
            }
        }
    }

    protected void ColumnsList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedColumn = this.ColumnsList.SelectedValue;

        ColumnMoving columnMovingBehavior = this.WebHierarchicalDataGrid1.Behaviors.ColumnMoving;
        ColumnMoving bandMovingBehavior = this.WebHierarchicalDataGrid1.Bands[0].Behaviors.ColumnMoving;
        foreach (ColumnMoveSetting setting in columnMovingBehavior.ColumnSettings)
        {
            if (setting.ColumnKey.Equals(selectedColumn))
                setting.EnableMove = false;
            else
                setting.EnableMove = true;
        }
        foreach (ColumnMoveSetting setting in this.WebHierarchicalDataGrid1.GridView.Behaviors.ColumnMoving.ColumnSettings)
        {
            if (setting.ColumnKey.Equals(selectedColumn))
                setting.EnableMove = false;
            else
                setting.EnableMove = true;
        }
        foreach (ColumnMoveSetting setting in bandMovingBehavior.ColumnSettings)
        {
            if (setting.ColumnKey.Equals(selectedColumn))
                setting.EnableMove = false;
            else
                setting.EnableMove = true;
        }
        foreach (ContainerGridRecord row in this.WebHierarchicalDataGrid1.GridView.Rows)
        {
            if (row.Expanded && row.HasRowIslands)
            {
                foreach (ColumnMoveSetting setting in row.RowIslands[0].Behaviors.ColumnMoving.ColumnSettings)
                {
                    if (setting.ColumnKey.Equals(selectedColumn))
                        setting.EnableMove = false;
                    else
                        setting.EnableMove = true;
                }
            }
        }
    }
}
