using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        this.SqlDsEmployees.ConnectionString = this.GetSqlConnectionString("SamplesDB.mdf");
        this.SqlDsOrders.ConnectionString = this.GetSqlConnectionString("SamplesDB.mdf");
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
