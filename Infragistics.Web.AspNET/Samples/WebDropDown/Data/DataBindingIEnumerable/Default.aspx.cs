using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NorthwindDataSource nwindDataSource = new NorthwindDataSource();
        nwindDataSource.SetDropDownDataSouce(this.WebDropDown1, Common.DataSourceTypes.IEnumerable);
    }
}