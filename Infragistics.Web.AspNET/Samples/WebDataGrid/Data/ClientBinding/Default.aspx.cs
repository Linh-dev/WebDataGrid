using System;

public partial class Samples_WebDataGrid_Data_Client_Binding_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataFile = this.GetMdbLocation("Nwind.mdb");
        this.WebDataGrid1.EnableClientRendering = true;
    }
}