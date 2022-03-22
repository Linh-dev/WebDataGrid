using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
/// Summary description for FormatUtility
/// </summary>
public class FormatUtility
{
	protected FormatUtility()
	{
	}

    public static string FormatDate(DateTime value)
    {
        return value.ToShortDateString();
    }

    public static string FormatCurrency(decimal value)
    {
        return String.Format("{0:C2}", value);
    }

    public static string FormatCurrencyNoDecimals(decimal value)
    {
        return String.Format("{0:C0}", value);
    }

    public static string FormatImageTag(string value, string altText, string cssClass)
    {
        return string.Format("<img src='{0}' alt='{1}' class='{2}' />", value, altText, cssClass);
    }
}
