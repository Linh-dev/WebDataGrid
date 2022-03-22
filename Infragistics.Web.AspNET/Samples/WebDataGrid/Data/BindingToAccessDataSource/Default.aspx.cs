using System;

public partial class Samples_WebDataGrid_Data_Binding_to_AccessDataSource_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
    }
}
