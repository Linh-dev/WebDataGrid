using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Samples_WebHierarchicalDataGrid_Organization_ExcelStyleFiltering_Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.AccessDataSource1.DataBind();
        this.AccessDataSource2.DataBind();
    }
}
