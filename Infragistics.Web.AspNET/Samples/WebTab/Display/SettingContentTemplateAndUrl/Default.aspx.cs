using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataFile = this.GetMdbLocation("Nwind.mdb");
        this.WebTab1.Tabs[0].Text = this.GetGlobalResourceObject("WebTab", "WebTab_ContentTemplateAndUrl_Tab1_Label").ToString();
        this.WebTab1.Tabs[1].Text = this.GetGlobalResourceObject("WebTab", "WebTab_ContentTemplateAndUrl_Tab2_Label").ToString(); 
    }
}
