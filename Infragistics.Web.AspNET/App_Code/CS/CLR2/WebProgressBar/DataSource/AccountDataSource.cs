using System;
using System.Collections.Generic;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for AccountDataSource
/// </summary>
public class AccountDataSource
{
	public AccountDataSource()
	{
		
	}

    //[System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
    //public DataTable GetAccountDataSource()
    //{
    //    return this.GetAccountDataSource(false);
    //}

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
    public DataTable GetAccountDataSource()
    {
        if (HttpContext.Current.Session["ProgBarAccountSource"] == null)
        {
            DataTable dt = this.GetDataTable();
            AccountCollection accountList = this.GetAccounts();

            foreach (Account a in accountList)
            {
                DataRow dr = dt.NewRow();

                dr[0] = a.Account_id;
                dr[1] = a.Account_type_id;
                dr[2] = a.Client_id;
                dr[3] = a.Balance;
                dr[4] = a.Account_first_name;
                dr[5] = a.Account_last_name;
                dr[6] = a.Account_type;

                dt.Rows.Add(dr);
            }

            HttpContext.Current.Session["ProgBarAccountSource"] = dt;
        }

        return HttpContext.Current.Session["ProgBarAccountSource"] as DataTable;
    }


    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
    public DataTable GetGroupedAccountDataSource()
    {
        if (HttpContext.Current.Session["GridGroupDataCache"] == null)
        {
            DataTable dt = this.GetDataTable(true);
            AccountCollection accountList = this.GetGroupedAccounts();

            foreach (Account a in accountList)
            {
                DataRow dr = dt.NewRow();

                dr[0] = a.Account_id;
                dr[1] = a.Account_type_id;
                dr[2] = a.Client_id;
                dr[3] = a.Balance;
                dr[4] = a.Account_first_name;
                dr[5] = a.Account_last_name;
                dr[6] = a.Account_type;

                dt.Rows.Add(dr);
            }

            HttpContext.Current.Session["GridGroupDataCache"] = dt;
        }

        return HttpContext.Current.Session["GridGroupDataCache"] as DataTable;
    }

    private AccountCollection GetAccounts()
    {
        string cmdText = string.Empty;
        DataCriteria criteria = new DataCriteria();
        
        cmdText = "  SELECT Account.AccountID, Account.AccountTypeID, Account.ClientID, Account.Balance, Client.FirstName, Client.LastName, AccountType.AccountType ";
        cmdText += " FROM AccountType INNER JOIN (Client INNER JOIN Account ON Client.ClientID = Account.ClientID) ON AccountType.AccountTypeID = Account.AccountTypeID";

        AccountMapper mapper = new AccountMapper();
        DataAccessHelper dataAccess = new DataAccessHelper();

        return dataAccess.ExecuteQuery<AccountCollection>(cmdText, criteria, mapper);
    }

    private AccountCollection GetGroupedAccounts()
    {
        string cmdText = string.Empty;
        DataCriteria criteria = new DataCriteria();

        cmdText = "  SELECT  Account.AccountTypeID, SUM(Account.Balance) as Balance, MAX(AccountType.AccountType) as AccountType ";
        cmdText += " FROM AccountType INNER JOIN (Client INNER JOIN Account ON Client.ClientID = Account.ClientID) ON AccountType.AccountTypeID = Account.AccountTypeID ";
        cmdText += " GROUP BY Account.AccountTypeID ";

        AccountGroupedMapper mapper = new AccountGroupedMapper();
        DataAccessHelper dataAccess = new DataAccessHelper();

        return dataAccess.ExecuteQuery<AccountCollection>(cmdText, criteria, mapper);
    }

    public DataTable GetDataTable()
    {
        return GetDataTable(false);
    }
    public DataTable GetDataTable(bool grouped)
    {

        DataColumn primaryKey = new DataColumn("AccountID");
 
        DataTable dt = new DataTable();
        dt.Columns.Add(primaryKey);

        dt.Columns.Add("AccountTypeID");
        dt.Columns.Add("ClientID");
        dt.Columns.Add("Balance", System.Type.GetType("System.Double"));
        dt.Columns.Add("FirstName");
        dt.Columns.Add("LastName");
        dt.Columns.Add("AccountType");


        if (!grouped)
        {
            dt.PrimaryKey = new DataColumn[] { primaryKey };
        }

        return dt;
    }


}
