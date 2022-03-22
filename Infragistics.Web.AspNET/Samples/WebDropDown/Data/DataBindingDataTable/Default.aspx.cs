using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NorthwindDataSource northwindDataSources = new NorthwindDataSource();
        this.WebDropDown1.DataSource = northwindDataSources.GetCustomerDataSource();
    }
}