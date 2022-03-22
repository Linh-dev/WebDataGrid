using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (WebNumericEditor1.Value == null)
        {
            WebNumericEditor1.Value = 0; 
        }
        if (WebNumericEditor2.Value == null)
        {
            WebNumericEditor2.Value = 0;
        }

        for (int i = 0; i < 5; i++)
        {

            if (WebTab1.Tabs[i].Text == WebDropDown1.CurrentValue)
            {
                WebTab1.Tabs[i].MarginLeading = Int32.Parse(WebNumericEditor1.Text);
                WebTab1.Tabs[i].MarginTrailing = Int32.Parse(WebNumericEditor2.Text);
            }


        }

    } 
        
}
