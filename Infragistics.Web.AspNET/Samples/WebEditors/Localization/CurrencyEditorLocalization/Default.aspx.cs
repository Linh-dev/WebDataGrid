using System;
using System.Globalization;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!this.IsPostBack)
			this.CurrencyEditorLocalization.Value = 100.00d;
		// Added the next line so that the culture of the CurrencyEditor
		// will be initialized to the culture indicated in the drop down.
		this.CurrencyEditorLocalization.Culture = new CultureInfo(this.CultureList.SelectedValue);
    }

    protected void CultureList_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.CurrencyEditorLocalization.Culture = new CultureInfo(this.CultureList.SelectedValue);
    }
}