using System;
using Infragistics.Web.UI.ListControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.WebDropDown1.SelectionChanged += new DropDownSelectionChangedEventHandler(WebDropDown1_SelectionChanged);
        this.WebDropDown1.ItemAdded += new DropDownItemAddedEventHandler(WebDropDown1_ItemAdded);
        this.WebDropDown1.ItemRemoved += new DropDownItemRemovedEventHandler(WebDropDown1_ItemRemoved);
        this.WebDropDown1.ValueChanged += new DropDownValueChangedEventHandler(WebDropDown1_ValueChanged);
        this.DefaultDataSource.DataFile = this.GetMdbLocation("Nwind.mdb");

    }

    void WebDropDown1_ValueChanged(object sender, DropDownValueChangedEventArgs e)
    {
        this.ServerMessage.Text += this.GetGlobalResourceObject("WebDropDown","ServerEventsValueChanged") + " " + e.NewValue.ToString() + "<br />";
    }

    void WebDropDown1_ItemRemoved(object sender, DropDownItemRemovedEventArgs e)
    {
        this.ServerMessage.Text += this.GetGlobalResourceObject("WebDropDown","ServerEventsItemRemoved") + " " + e.Value.ToString();
    }

    void WebDropDown1_ItemAdded(object sender, DropDownItemAddedEventArgs e)
    {
        this.ServerMessage.Text += this.GetGlobalResourceObject("WebDropDown","ServerEventsItemAdded") + " " + e.Value.ToString();
    }

    void WebDropDown1_SelectionChanged(object sender, DropDownSelectionChangedEventArgs e)
    {
        this.ServerMessage.Text += this.GetGlobalResourceObject("WebDropDown","ServerEventsSelectionChanged") + " " + ((WebDropDown)sender).Items[(int)e.NewSelection].Text + "<br />";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.ServerMessage.Text = string.Empty;
    }
}
