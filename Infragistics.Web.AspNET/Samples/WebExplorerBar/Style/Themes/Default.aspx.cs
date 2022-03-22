using System;
using Infragistics.Web.UI.ListControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.WebDropDown1.SelectionChanged += new DropDownSelectionChangedEventHandler(WebDropDown1_SelectionChanged);
        this.ExplorerBarDataSource.DataFile = this.GetXmlLocation("SampleData.xml");
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void WebDropDown1_SelectionChanged(object sender, DropDownSelectionChangedEventArgs e)
    {
        string styleName = ((WebDropDown)sender).Items[(int)e.NewSelection].Text;
        this.WebExplorerBar1.StyleSetName = styleName;
        this.WebExplorerBar1.DataBind();
    }
}