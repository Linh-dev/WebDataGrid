using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            minWebNumericEditor.Value = 0;
            maxWebNumericEditor.Value = 10;
            RangedNumericEditor.MinValue = Convert.ToDouble(minWebNumericEditor.Value);
            RangedNumericEditor.MaxValue = Convert.ToDouble(maxWebNumericEditor.Value);
        }
    }
}