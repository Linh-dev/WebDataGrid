using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataFile = this.GetMdbLocation("NWind.mdb");
        this.WebHierarchicalDataGrid1_DropDownProvider1.EditorControl.DataSource = this.AccessDataSource1;
    }
    protected void InitWHDG(object sender, EventArgs e)
    {      
        this.AccessDataSource2.DataFile = this.GetMdbLocation("Nwind.mdb");
    }
}
