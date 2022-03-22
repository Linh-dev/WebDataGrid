using System;
using System.Globalization;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!this.IsPostBack)
			this.DateTimeEditorLocalization.Value = DateTime.Now;
        // Added the next line so that the culture of the DateTimeEditor
        // will be initialized to the culture indicated in the drop down.
        this.DateTimeEditorLocalization.Culture = new CultureInfo(this.CultureList.SelectedValue);
    }

    protected void CultureList_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.DateTimeEditorLocalization.Culture = new CultureInfo(this.CultureList.SelectedValue);
    }
}