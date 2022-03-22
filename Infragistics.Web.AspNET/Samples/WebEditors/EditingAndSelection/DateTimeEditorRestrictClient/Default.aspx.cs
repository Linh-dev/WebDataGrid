using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            minWebDatePicker.Value = DateTime.Today;
            maxWebDatePicker.Value = DateTime.Today.AddDays(5);

            MinMaxDateTimeEditor.MinValue = (DateTime)minWebDatePicker.Value;
            MinMaxDateTimeEditor.MaxValue = (DateTime)maxWebDatePicker.Value;
        }
    }
}