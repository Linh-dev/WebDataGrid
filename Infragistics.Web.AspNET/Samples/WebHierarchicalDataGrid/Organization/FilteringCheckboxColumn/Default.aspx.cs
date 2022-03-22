using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebHierarchicalDataGrid_Organization_Filtering_a_Checkbox_Column_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void OnInit(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        ((BoundCheckBoxField)this.WebHierarchicalDataGrid1.Columns["Region"]).ValueConverter = new StringBooleanConverter();
    }
}

public class StringBooleanConverter : IBooleanConverter
{

    public object DefaultFalseValue
    {
        get { return String.Empty; }
    }

    public object DefaultTrueValue
    {
        get { return "1"; }
    }

    public bool IsFalse(object value)
    {
        if ((value as string) == null)
            return true;

        return ((string)value).Length == 0;
    }

    public bool IsTrue(object value)
    {
        if ((value as string) == null)
            return false;

        return ((string)value).Length > 0;
    }
}