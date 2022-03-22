using System;
using System.Collections;

public partial class Samples_WebDataGrid_Editing_and_Selection_Custom_Edit_Row_Template_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();

        this.WebDataGrid1.DataSource = this.GetDataSource();

        if (!this.Page.IsPostBack)
        {
            this.WebDataGrid1.DataBind();
        }

    }

    private ICollection GetDataSource()
    {
        ICollection dataSource = null;

        if (this.Session["EditRowTemplate"] == null)
        {
            dataSource = new NorthwindDataSource().GetCustomers();
            this.Session.Add("EditRowTemplate", dataSource);
        }
        else
        {
            dataSource = (ICollection)this.Session["EditRowTemplate"];
        }

        return dataSource;
    }
}
