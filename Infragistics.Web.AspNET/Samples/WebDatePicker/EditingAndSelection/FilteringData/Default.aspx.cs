using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.Orders.DataFile = this.GetMdbLocation("Nwind.mdb");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            WebDatePicker1.Date = new DateTime(1996, 7, 4);
            WebDatePicker2.Date = new DateTime(1998, 3, 11);
        }
    }

    protected void bSubmit_Click(object sender, EventArgs e)
    {
        WebDataGrid1.DataBind();
    }
}