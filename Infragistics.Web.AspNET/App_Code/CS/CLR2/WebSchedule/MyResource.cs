using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for MyResource
/// </summary>
public class MyResource
{
    private int _id;
    public int ID
    {
        get { return _id; }
        set
        {
            _id = value;
        }
    }

    private string _resourceName;
    public string ResourceName
    {
        get { return _resourceName; }
        set
        {
            _resourceName = value;
        }
    }

    private string _resourceDescription;
    public string ResourceDescription
    {
        get { return _resourceDescription; }
        set
        {
            _resourceDescription = value;
        }
    }

    private string _emailAddress;
    public string EmailAddress
    {
        get { return _emailAddress; }
        set
        {
            _emailAddress = value;
        }
    }


    public MyResource()
    {
    }

    public MyResource(int id, string resourceName, string resourceDescription, string emailAddress)
    {
        ID = id;
        ResourceName = resourceName;
        ResourceDescription = resourceDescription;
        EmailAddress = emailAddress;
    }
}
