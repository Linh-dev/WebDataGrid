using System;
using Infragistics.Web.SampleBrowser.Core.Framework.DataAccess;



public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected string GetConnectionString()
    {
        DataRepository manager = new DataRepository();
        return manager.GetSqlClientConnectionString("SamplesDB.mdf");
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        this.SqlDataSource1.DataBind();
    }

}