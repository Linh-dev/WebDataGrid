using System;
using System.Collections.Generic;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        SetDataSource();

        this.SelectedDataSource.DataSourceChanged += new EventHandler(SelectedDataSource_DataSourceChanged);

        this.AccessDataSource1.DataFile = this.GetMdbLocation("Nwind.mdb");
        this.AccessDataSource2.DataFile = this.GetMdbLocation("Nwind.mdb");
    }

    protected void SelectedDataSource_DataSourceChanged(object sender, EventArgs e)
    {
        SetDataSource();
    }

    private void SetDataSource()
    {
        switch (this.SelectedDataSource.DataSource)
        {
            case Common.DataSourceTypes.DataSet:
                this.whdg1.GridView.ClearDataSource();
                if (this.whdg1.Bands.Count > 0)
                    this.whdg1.Bands[0].DataMember = "AccessDataSource2_Products";
                this.whdg1.DataSource = NWindClient.GetSuppliersAndProductsDataSet() as System.Data.DataSet;

                break;
            case Common.DataSourceTypes.IEnumerable:
                this.whdg1.GridView.ClearDataSource();
                if (this.whdg1.Bands.Count > 0)
                    this.whdg1.Bands[0].DataMember = "Products";
                this.whdg1.DataSource = NWindClient.GetSuppliersAndProductsIEnumerable() as IEnumerable<Supplier>;
                break;
            default:
                this.whdg1.GridView.ClearDataSource();
                if (this.whdg1.Bands.Count > 0)
                    this.whdg1.Bands[0].DataMember = "AccessDataSource2_Products";
                this.whdg1.DataSource = this.WebHierarchicalDataSource1;
                break;
        }
    }
}