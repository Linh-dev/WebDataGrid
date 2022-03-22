using System;
using System.Web;

public partial class Samples_WebDataGrid_Data_SelectiveRowExporting_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.AccessDsShips.DataBind();
        this.AccessDsCountries.DataBind();
        this.citiesDDList.DataBind(); 
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.citiesDDList.Items[0].Selected = true;
        }
        this.btnExport.Click += new EventHandler(btnExport_Click);
        this.wExporter.RowExporting +=new EventHandler<Infragistics.Web.UI.GridControls.WordRowExportingEventArgs>(wExporter_RowExporting);
    }
    void wExporter_RowExporting(object sender, Infragistics.Web.UI.GridControls.WordRowExportingEventArgs e)
    {
        string country = this.citiesDDList.CurrentValue;
        if(!e.IsHeaderRow)
        {
            string temp = e.GridRow.Items.FindItemByKey("ShipCity").Value.ToString();
           if (country != temp)
               e.Cancel = true;
        }
    }

    void btnExport_Click(object sender, EventArgs e)
    {
        string fileName = HttpUtility.UrlEncode(this.tbFileName.Text);
        fileName = fileName.Replace("+", "%20");
        fileName = HttpUtility.UrlDecode(fileName);
        this.wExporter.DownloadName = fileName;
        this.wExporter.DataExportMode = Infragistics.Web.UI.GridControls.DataExportMode.AllDataInDataSource;
        this.wExporter.Export(this.wdgShips);
    }
}