using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Organization_Column_Hiding_Client_Side_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    System.Web.UI.WebControls.ListItem li;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.NorthWndDataSource.DataBind();
    }

    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        foreach (GridField col in this.WebDataGridView.Columns)
        {
            li = new System.Web.UI.WebControls.ListItem(col.Header.Text, col.Index.ToString());
            li.Attributes.Add("onclick", "setColumn(this, " + col.Index + ");");
            chklColumns.Items.Add(li);
        }

    }
}
