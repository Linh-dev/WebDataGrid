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

        minWebDatePicker.MaxValue = (DateTime)maxWebDatePicker.Value;
        maxWebDatePicker.MinValue = (DateTime)minWebDatePicker.Value;
    }

    protected void minWebDatePicker_ValueChanged(object sender, Infragistics.Web.UI.EditorControls.TextEditorValueChangedEventArgs e)
    {
        MinMaxDateTimeEditor.MinValue = (DateTime)e.NewValue;
    }

    protected void maxWebDatePicker_ValueChanged(object sender, Infragistics.Web.UI.EditorControls.TextEditorValueChangedEventArgs e)
    {
        MinMaxDateTimeEditor.MaxValue = (DateTime)e.NewValue;
    }
}