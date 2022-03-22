using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Organization_Sorting_Cell_Merging_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		
        if (!this.IsPostBack)
        {
            this.ClientRenderCheckbox.Checked = this.WebDataGrid1.EnableClientRendering;
        }

        this.DefaultDataSource.DataBind();
    }

    protected void WebDataGrid1_ColumnMoved(object sender, ColumnMovingEventArgs e)
    {
        int oldIndex = e.PreviousVisibleIndex;
        int newIndex = e.Column.VisibleIndex;
        if (oldIndex != newIndex)
        {
            SortedColumnInfo info = this.WebDataGrid1.Behaviors.Sorting.SortedColumns[oldIndex];
            this.WebDataGrid1.Behaviors.Sorting.SortedColumns.RemoveAt(oldIndex);
            this.WebDataGrid1.Behaviors.Sorting.SortedColumns.Insert(newIndex, info);
			this.WebDataGrid1.Rows.Clear();
			this.WebDataGrid1.DataBind();
        }
    }

    protected void ClientRenderCheckbox_CheckedChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.EnableClientRendering = this.ClientRenderCheckbox.Checked;
    }

    protected void WebDataGrid1_FixedStateChanged(object sender, FixedStateChangedEventArgs e)
    {
        if (!e.IsFixed)
        {
            foreach (FixedColumnInfo info in e.AffectedColumns)
            {
                this.WebDataGrid1.Behaviors.ColumnFixing.ColumnSettings[info.ColumnKey].ShowFixButton = false;
                this.WebDataGrid1.Columns[info.ColumnKey].VisibleIndex = this.WebDataGrid1.Columns[info.ColumnKey].Index + this.WebDataGrid1.Behaviors.ColumnFixing.FixedColumns.Count;
                this.WebDataGrid1.Behaviors.ColumnMoving.ColumnSettings[info.ColumnKey].EnableMove = true;
                for (int x = 0; x < this.WebDataGrid1.Behaviors.Sorting.SortedColumns.Count; ++x)
                {
                    if (this.WebDataGrid1.Behaviors.Sorting.SortedColumns[x].ColumnKey == info.ColumnKey)
                    {
                        this.WebDataGrid1.Behaviors.Sorting.SortedColumns.RemoveAt(x);
                        break;
                    }
                }

            }
        }
    }
    protected void WebDataGrid1_ColumnSorted(object sender, SortingEventArgs e)
    {
		if (e.Column != null && e.SortedColumns.Count > 1)
		{
			foreach (SortedColumnInfo info in e.SortedColumns)
			{
				this.WebDataGrid1.Behaviors.ColumnFixing.FixedColumns.Add(info.Column);
				this.WebDataGrid1.Behaviors.ColumnFixing.ColumnSettings[info.Column.Key].ShowFixButton = true;
				this.WebDataGrid1.Behaviors.ColumnMoving.ColumnSettings[info.Column.Key].EnableMove = true;
			}
		}
		else
		{
			for (int x = this.WebDataGrid1.Behaviors.ColumnFixing.FixedColumns.Count - 1; x >= 0; --x)
			{
				GridField field = this.WebDataGrid1.Columns[this.WebDataGrid1.Behaviors.ColumnFixing.FixedColumns[x].ColumnKey];
				this.WebDataGrid1.Behaviors.ColumnFixing.FixedColumns.RemoveAt(x);
				field.VisibleIndex = field.Index + this.WebDataGrid1.Behaviors.ColumnFixing.FixedColumns.Count;

			}
			this.WebDataGrid1.Behaviors.ColumnFixing.ColumnSettings[e.Column.Key].ShowFixButton = false;
			this.WebDataGrid1.Behaviors.ColumnMoving.ColumnSettings[e.Column.Key].EnableMove = false;
		}
    }
}
