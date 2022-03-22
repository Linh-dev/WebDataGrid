using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for SideBySideEventArgs
/// </summary>
public class SideBySideEventArgs: EventArgs
{
    private string _resourceName = null;
    public string ResourceName
    {
        get { return _resourceName; }
        set { _resourceName = value; }
    }

    public SideBySideEventArgs(string resourceName)
    {
        _resourceName = resourceName;
    }
}
