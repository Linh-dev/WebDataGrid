using System;
using System.Data;
using Infragistics.Web.UI.ListControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            AccountDataSource account_ds = new AccountDataSource();
            DataTable dtAccounts = account_ds.GetGroupedAccountDataSource();

            DD.DataSource = dtAccounts;
            DD.ValueField = "AccountTypeID";
            DD.TextField = "AccountType";
            DD.DataBind();

            DropDownItem ddi = new DropDownItem();
            ddi.Text = "";
            ddi.Value = "";

            DD.Items.Insert(0, ddi);
        }

    }
}