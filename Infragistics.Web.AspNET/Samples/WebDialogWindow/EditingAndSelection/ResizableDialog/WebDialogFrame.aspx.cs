using System;

public partial class WebDialogFrame : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Localization
        this.btnShowDialog.Text = this.GetGlobalResourceObject("WebDialogWindow", "Resizable_Dialog_showDialog").ToString();
        this.btnSubmitPage.Text = this.GetGlobalResourceObject("WebDialogWindow", "Resizable_Dialog_submit").ToString();
    }
}