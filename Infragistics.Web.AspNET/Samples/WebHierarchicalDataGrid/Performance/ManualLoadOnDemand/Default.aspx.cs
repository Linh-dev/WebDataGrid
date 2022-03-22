using System;
using System.Collections.Generic;
using Infragistics.Web.UI.GridControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        this.whdg1.RowIslandsPopulating += new ContainerRowCancelEventHandler(whdg1_RowIslandsPopulating);
        if (Session["SuppliersAndProductsDataSet"] == null)
            Session["SuppliersAndProductsDataSet"] = NWindClient.GetSuppliers();

        this.whdg1.DataSource = Session["SuppliersAndProductsDataSet"];
    }

    void whdg1_RowIslandsPopulating(object sender, ContainerRowCancelEventArgs e)
    {
        e.Cancel = true;

        Supplier sp = (((Infragistics.Web.UI.Framework.Data.ListNode)e.Row.DataItem)).Item as Supplier;
        sp.Products = new List<Products>(NWindClient.GetProducts(Convert.ToInt32(sp.SupplierID)));

        ContainerGrid child = new ContainerGrid();

        e.Row.RowIslands.Add(child);

        child.DataSource = sp.Products;
        child.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.whdg1.DataBind();
        }
    }
}
