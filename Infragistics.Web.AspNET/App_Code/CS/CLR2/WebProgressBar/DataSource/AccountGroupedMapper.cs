using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for AccountGroupedMapper
/// </summary>
public class AccountGroupedMapper : IDataMapper<AccountCollection>
{
	public AccountGroupedMapper()
	{
	}

    #region IDataMapper<AccountCollection> Members

    public string ConnectString
    {
        get { return "PortfolioManager"; }
    }

    public AccountCollection MapData(System.Data.IDataReader dbReader)
    {
        AccountCollection accounts = new AccountCollection();

        while (dbReader.Read())
        {
            Account account = new Account();

            //account.Account_id = dbReader.GetInt32(dbReader.GetOrdinal("AccountID"));
            //account.Account_first_name = dbReader.GetString(dbReader.GetOrdinal("FirstName"));
            //account.Account_last_name = dbReader.GetString(dbReader.GetOrdinal("LastName"));
            account.Account_type = dbReader.GetString(dbReader.GetOrdinal("AccountType")); ;
            account.Account_type_id = dbReader.GetInt32(dbReader.GetOrdinal("AccountTypeID"));
            account.Balance = dbReader.GetDecimal(dbReader.GetOrdinal("Balance"));
            //account.Client_id = dbReader.GetInt32(dbReader.GetOrdinal("ClientID"));

            accounts.Add(account);
        }

        return accounts;
    }

    #endregion
}
