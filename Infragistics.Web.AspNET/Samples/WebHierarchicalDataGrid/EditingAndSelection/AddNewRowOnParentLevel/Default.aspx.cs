using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.CountrysObjectDataSource.DataFile = this.GetMdbLocation("Nwind.mdb");
        this.CountrysObjectDataSource.DataBind();
    }
    protected void WHDG_RowAdding(object sender, Infragistics.Web.UI.GridControls.RowAddingEventArgs e)
    {
       e.Values["CustomerID"] = new Random().Next().ToString();
    }
    protected void DDInit(object sender, EventArgs e)
    {
 
    }

}
