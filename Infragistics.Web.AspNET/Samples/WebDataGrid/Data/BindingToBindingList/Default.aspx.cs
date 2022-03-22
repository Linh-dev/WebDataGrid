using System;

public partial class Samples_WebDataGrid_Data_Binding_to_BindingList_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NorthwindDataSource nwindDataSource = new NorthwindDataSource();
        nwindDataSource.SetWebDataGridDataSource(this.WebDataGrid1, "IBindingList");
    }
}
