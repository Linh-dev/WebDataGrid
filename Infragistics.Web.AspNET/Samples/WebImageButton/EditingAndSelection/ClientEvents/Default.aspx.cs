using System;

public partial class Samples_WebButtons_Performance_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        WebDateTimeEdit1.Value = new DateTime(2011, 2, 14, 7, 20, 0);
    }
}