using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for Account
/// </summary>
public class Account
{
    int _account_id;
    int _account_type_id;
    int _client_id;
    decimal _balance;
    string _account_first_name;
    string _account_last_name;
    string _account_type;

    public decimal Balance
    { 
        get { return _balance; } 
        set { _balance = value; } 
    }

    public int Account_id { 
        get { return _account_id; } 
        set { _account_id = value; } 
    }

    public int Account_type_id { 
        get { return _account_type_id; } 
        set { _account_type_id = value; } 
    }

    public int Client_id { 
        get { return _client_id; } 
        set { _client_id = value; } 
    }

    public string Account_first_name { 
        get { return _account_first_name; } 
        set { _account_first_name = value; } 
    }

    public string Account_last_name { 
        get { return _account_last_name; } 
        set { _account_last_name = value; } 
    }

    public string Account_type { 
        get { return _account_type; } 
        set { _account_type = value; } 
    }


    
    public Account()
	{
		
	}

    
}
