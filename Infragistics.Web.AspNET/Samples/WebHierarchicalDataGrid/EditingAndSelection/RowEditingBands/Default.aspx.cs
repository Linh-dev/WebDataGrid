using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Samples_WebHierarchicalDataGrid_EditingAndSelection_RowEditingBands_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataFile = this.GetMdbLocation("NWind.mdb");
        this.AccessDataSource2.DataFile = this.GetMdbLocation("NWind.mdb");
    }
}