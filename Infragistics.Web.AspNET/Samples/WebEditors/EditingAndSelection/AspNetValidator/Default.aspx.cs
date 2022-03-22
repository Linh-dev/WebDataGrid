using System;
using System.Web.UI.WebControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblStatus.Text = "";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblStatus.Text = this.GetGlobalResourceObject("WebEditors","WebEditorValidationLabelStatus").ToString();
    }

    protected void PasswordEditor_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = CheckPassword(args.Value);
    }

    protected bool CheckPassword(string password)
    {
        //Very complex Algorithm for password verification
        return !String.IsNullOrEmpty(password) && password.Length > 3;
    }
}
