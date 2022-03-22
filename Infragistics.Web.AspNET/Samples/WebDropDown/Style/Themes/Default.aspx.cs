using System;
using Infragistics.Web.UI.ListControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		this.WebDropDown1.SelectionChanged += new DropDownSelectionChangedEventHandler(WebDropDown1_SelectionChanged);
    }

	protected void WebDropDown1_SelectionChanged(object sender, DropDownSelectionChangedEventArgs e)
	{
        int index = (int)e.NewSelection;
        if (index >= 0) 
        {
		    string styleSetName = ((WebDropDown)sender).Items[index].Text;
		    this.WebDropDown1.StyleSetName = styleSetName;
        }
	}
}