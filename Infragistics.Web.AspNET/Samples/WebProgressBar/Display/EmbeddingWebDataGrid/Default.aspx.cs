using System;
using System.Data;
using Infragistics.Web.UI.DisplayControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private double _total;

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        WebDataGrid1.InitializeRow += new Infragistics.Web.UI.GridControls.InitializeRowEventHandler(WebDataGrid1_InitializeRow);
    }

    void WebDataGrid1_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
    {
        WebProgressBar wpb = (WebProgressBar)e.Row.Items[2].FindControl("wpbOne");
        wpb.Maximum = _total;
        wpb.Value = ((double)((DataRowView)e.Row.DataItem)["Balance"]);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            AccountDataSource account_ds = new AccountDataSource();
            DataTable dtAccounts = account_ds.GetGroupedAccountDataSource();
            int upper = 30000000;

            //randomize the balances
            Random ran = new Random();
            DataTable dtCopy = dtAccounts.Copy();

            foreach (DataRow dr in dtCopy.Rows)
            {
                dr["Balance"] = ran.Next(1, upper);
            }

            _total = (double)dtCopy.Compute("Sum(Balance)", "");

            WebDataGrid1.DataSource = dtCopy;
            WebDataGrid1.DataBind();
        }
    }
}
