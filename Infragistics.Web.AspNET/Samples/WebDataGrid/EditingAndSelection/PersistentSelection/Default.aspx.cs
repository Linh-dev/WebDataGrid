using System;
using System.Collections.Generic;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Editing_and_Selection_Persistent_Selection_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.ds.DataBind();
    }

    protected void grid_RowSelectionChanged(object sender, SelectedRowEventArgs e)
    {
        IList<int> ids = new List<int>();
        int id = 0;
        int index = 0;

        foreach (GridRecord row in e.CurrentSelectedRows)
        {
            if (row == null)
            {
                IDPair pair = e.CurrentSelectedRows.GetIDPair(index);
                id = Convert.ToInt32(pair.Key[0]);
            }
            else
            {
                id = Convert.ToInt32(row.DataKey[0]);
            }

            if (!ids.Contains(id))
            {
                ids.Add(id);
            }

            index++;
        }

        //TODO: use the selected IDs to update the database, call a 
        // service, or any other operation
        System.Diagnostics.Debug.WriteLine(ids.Count);
    }
}
