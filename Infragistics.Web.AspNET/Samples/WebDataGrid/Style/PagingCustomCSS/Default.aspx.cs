using System;

public partial class Samples_WebDataGrid_Style_Paging_Custom_CSS_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AccessDataSource1.DataFile = this.GetMdbLocation("Nwind.mdb");    
    }
}