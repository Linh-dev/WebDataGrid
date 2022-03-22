using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.InputMask.ValueChanged += new Infragistics.Web.UI.EditorControls.TextEditorValueChangedEventHandler(InputMask_ValueChanged);
    }

    protected void InputMask_ValueChanged(object sender, Infragistics.Web.UI.EditorControls.TextEditorValueChangedEventArgs e)
    {
        this.DemoMaskEditor.InputMask = this.InputMask.Text;
    }
}