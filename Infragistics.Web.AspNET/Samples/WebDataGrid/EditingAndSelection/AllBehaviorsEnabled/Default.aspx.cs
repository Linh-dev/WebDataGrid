using System;
using System.Collections;
using System.Web.UI;
using Infragistics.Web.UI;

public partial class Samples_WebDataGrid_Editing_and_Selection_All_Behaviors_Enabled_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ((WebScriptManager)ScriptManager.GetCurrent(this.Page)).InfragisticsCDN.EnableCDN = DefaultableBoolean.False;
        this.WebDataGrid1.DataSource = this.GetDataSource();

        if (!this.Page.IsPostBack)
        {
            this.WebDataGrid1.DataBind();
        }

    }

    private ICollection GetDataSource()
    {
        ICollection dataSource = null;

        if (this.Session["AllBehaviorsDS"] == null)
        {
            dataSource = new NorthwindDataSource().GetCustomers();
            this.Session.Add("AllBehaviorsDS", dataSource);
        }
        else
        {
            dataSource = (ICollection)this.Session["AllBehaviorsDS"];
        }

        return dataSource;
    }
}
