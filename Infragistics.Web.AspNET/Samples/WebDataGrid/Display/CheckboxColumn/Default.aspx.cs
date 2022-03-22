using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Display_Checkbox_Column_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ((BoundCheckBoxField)this.WebDataGrid1.Columns["UnitPrice"]).ValueConverter = new DecimalBooleanConverter();
    }
}

public class DecimalBooleanConverter : IBooleanConverter
{

    public object DefaultFalseValue
    {
        get { return 0.0m; }
    }

    public object DefaultTrueValue
    {
        get { return 20.1m; }
    }

    public bool IsFalse(object value)
    {
        if (value == null)
            return true;

        return (decimal)value <= 20.0m;
    }

    public bool IsTrue(object value)
    {
        if (value == null)
            return false;

        return (decimal)value > 20.0m;
    }
}
