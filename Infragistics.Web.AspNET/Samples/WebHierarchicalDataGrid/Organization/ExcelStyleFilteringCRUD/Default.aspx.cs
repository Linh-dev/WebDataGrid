using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.Page.Session["id"] = this.WebHierarchicalDataGrid1.Rows.Count;
        }
        this.WebHierarchicalDataGrid1.RowAdding += new Infragistics.Web.UI.GridControls.RowAddingHandler(WebHierarchicalDataGrid1_RowAdding);
    }

    void WebHierarchicalDataGrid1_RowAdding(object sender, Infragistics.Web.UI.GridControls.RowAddingEventArgs e)
    {
        int id;
        if (this.Page.Session["id"] == null)
            id = this.WebHierarchicalDataGrid1.Rows.Count;
        else
            id = (int)this.Page.Session["id"];
        id++;
        this.Session["id"] = id;
        e.Values["SupplierID"] = id;
    }
}
