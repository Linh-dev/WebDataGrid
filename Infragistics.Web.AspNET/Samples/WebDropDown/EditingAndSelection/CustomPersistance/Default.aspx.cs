using System;
using System.Data;
using Infragistics.Web.UI.ListControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.WebDropDown1.ItemAdded += new DropDownItemAddedEventHandler(WebDropDown1_ItemAdded);
    }

    void WebDropDown1_ItemAdded(object sender, DropDownItemAddedEventArgs e)
    {
        DataTable dt = Session["PersistenceDataTable"] as DataTable;
        DataRow dr = dt.NewRow();

        dr["AccountType"] = ((DropDownItem)e.Value).Text;
        dr["AccountTypeId"] = 123;
        dt.Rows.Add(dr);

        Session["PersistenceDataTable"] = dt;
        dt.DefaultView.Sort = "AccountType DESC";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            AccountDataSource ads = new AccountDataSource();
            System.Data.DataTable dtAccounts = ads.GetGroupedAccountDataSource();

            dtAccounts.DefaultView.Sort = "AccountType DESC";

            this.WebDropDown1.DataSource = dtAccounts.DefaultView;
            this.WebDropDown1.DataBind();

            Session["PersistenceDataTable"] = dtAccounts;
        }
    }
}