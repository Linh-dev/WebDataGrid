using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Infragistics.Web.UI.ListControls;

public partial class Samples_WebCaptcha_Style_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		this.WebDropDown1.SelectionChanged += new DropDownSelectionChangedEventHandler(WebDropDown1_SelectionChanged);
    }

	protected void WebDropDown1_SelectionChanged(object sender, DropDownSelectionChangedEventArgs e)
	{
		string styleSetName = ((WebDropDown)sender).Items[(int)e.NewSelection].Text;
		this.WebCaptcha1.StyleSetName = styleSetName;
	}
}