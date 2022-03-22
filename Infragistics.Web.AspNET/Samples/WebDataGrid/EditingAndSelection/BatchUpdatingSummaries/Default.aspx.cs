using System;
using System.Web;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnDefaultData.Click += new EventHandler(btnDefaultData_Click);
    }

    void btnDefaultData_Click(object sender, EventArgs e)
    {
        HttpContext.Current.Session["GridProductDataCache"] = null;
    }
}
