using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.SelectedDataSource.DataSourceChanged += new EventHandler(SelectedDataSource_DataSourceChanged);
        this.DropDownDataSource.DataFile = this.GetMdbLocation("Nwind.mdb");

    }

    void SelectedDataSource_DataSourceChanged(object sender, EventArgs e)
    {
        new NorthwindDataSource().SetDropDownDataSouce(this.WebDropDown1, this.SelectedDataSource.DataSource);
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            WebDropDown1.DataSourceID = "DropDownDataSource";
            WebDropDown1.ValueField = "CustomerID";
            WebDropDown1.TextField = "ContactName";
            WebDropDown1.DataBind();
        }
    }
}