using System;

public partial class Samples_WebDataMenu_Data_Data_Binding_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.SelectedDataSource.DataSourceChanged += new EventHandler(SelectedDataSource_DataSourceChanged);

        if (!this.IsPostBack)
        {
            this.WebDataMenuSample.DataSourceID = "MenuDataSource";
        }
        this.MenuDataSource.DataBind();
    }

    void SelectedDataSource_DataSourceChanged(object sender, EventArgs e)
    {
        new WebMenuDataCommand().SetDataSource(this.WebDataMenuSample, this.SelectedDataSource.DataSource);
    }
}
