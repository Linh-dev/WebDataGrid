using System;
using System.Data;
using Infragistics.Web.UI.ListControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        WebDropDown1.SelectionChanged += new DropDownSelectionChangedEventHandler(wpdDropDown1_SelectionChanged);
    }

    void wpdDropDown1_SelectionChanged(object sender, DropDownSelectionChangedEventArgs e)
    {
        DataTable dtAccounts = Session["ProgBarAccountSource"] as DataTable;
        DataView dvAccounts = dtAccounts.DefaultView;

        if (WebDropDown1.SelectedItems[0].Value != string.Empty)
        {
            dvAccounts.RowFilter = "AccountTypeID = " + WebDropDown1.SelectedItems[0].Value;
        }
        else
        {
            dvAccounts.RowFilter = "";
        }

        WebDataGrid1.DataSource = dvAccounts;
        WebDataGrid1.DataBind();

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            AccountDataSource account_ds = new AccountDataSource();
            DataTable dtAccountsGrp = account_ds.GetGroupedAccountDataSource();
            DataTable dtAccounts = account_ds.GetAccountDataSource();

            WebDropDown1.DataSource = dtAccountsGrp;
            WebDropDown1.ValueField = "AccountTypeID";
            WebDropDown1.TextField = "AccountType";
            WebDropDown1.DataBind();



            DropDownItem ddi = new DropDownItem();
            ddi.Text = "All";
            ddi.Value = "";

            WebDropDown1.Items.Insert(0, ddi);
            //WebDropDown1.CurrentValue = "";

            WebDataGrid1.DataSource = dtAccounts;
            WebDataGrid1.DataBind();

        }
    }
}