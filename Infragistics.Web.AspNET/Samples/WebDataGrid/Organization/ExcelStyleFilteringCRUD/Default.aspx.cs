using System;


public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.Page.Session["id"] = this.WebDataGrid1.Rows.Count;
        }
        this.WebDataGrid1.RowUpdating += new Infragistics.Web.UI.GridControls.RowUpdatingHandler(WebDataGrid1_RowUpdating);
        this.WebDataGrid1.RowAdding += new Infragistics.Web.UI.GridControls.RowAddingHandler(WebDataGrid1_RowAdding);
    }

    void WebDataGrid1_RowAdding(object sender, Infragistics.Web.UI.GridControls.RowAddingEventArgs e)
    {
        int id;
        if (this.Page.Session["id"] == null)
            id = this.WebDataGrid1.Rows.Count;
        else
            id = (int)this.Page.Session["id"];
        id++;
        this.Page.Session["id"] = id;
        e.Values["ProductID"] = id;
        e.Values["SupplierID"] = null;
        e.Values["UnitsOnOrder"] = null;
        e.Values["Discontinued"] = false;
    }

    void WebDataGrid1_RowUpdating(object sender, Infragistics.Web.UI.GridControls.RowUpdatingEventArgs e)
    {
        e.Values["SupplierID"] = null;
        e.Values["UnitsOnOrder"] = null;
        e.Values["Discontinued"] = false;
    }

}
