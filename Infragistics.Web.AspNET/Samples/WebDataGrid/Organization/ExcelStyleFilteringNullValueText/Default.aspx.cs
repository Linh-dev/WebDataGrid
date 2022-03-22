using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.SqlDataSource1.DataBind();
        this.ApplyButton.Click += new EventHandler(ApplyButton_Click);
    }

    void ApplyButton_Click(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.Filtering.NullValueText = this.NullValueTextBox.Text.ToString();
    }
}
