using System;
using Infragistics.Web.UI.ListControls;


public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.MenuDataSource.DataFile = this.GetXmlLocation("MenuData.xml");
		this.WebDropDown1.SelectionChanged += new DropDownSelectionChangedEventHandler(WebDropDown1_SelectionChanged);
    }

	protected void WebDropDown1_SelectionChanged(object sender, DropDownSelectionChangedEventArgs e)
	{
		string styleSetName = ((WebDropDown)sender).Items[(int)e.NewSelection].Text;
		this.WebDialogWindow1.StyleSetName = styleSetName;
        this.WebDialogWindow1.Header.CaptionText = styleSetName;
		this.WebDataMenu1.StyleSetName = styleSetName;
	}
}