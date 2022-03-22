using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for PropertyExplorer
/// </summary>
public class PropertyExplorer
{
	public PropertyExplorer()
	{
	}

    public static void GetEnumValues(BaseDataBoundControl target, object source)
    {
        string[] items = Enum.GetNames(source.GetType());
        if (items != null && items.Length > 0)
        {
            target.DataSource = items;
        }
        target.DataBind();
    }

    public static T GetEnumValue<T>(object source, string value)
    {
        return (T)Enum.Parse(source.GetType(), value);
    }

    public static int GetNumericValue(string value)
    {
        int result = 0;
        int.TryParse(value, out result);
        return result;
    }


}
