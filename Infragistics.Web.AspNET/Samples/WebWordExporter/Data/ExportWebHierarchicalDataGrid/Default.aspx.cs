using System;
using System.Web;
using Infragistics.Web.SampleBrowser.Core.Framework.DataAccess;
using Infragistics.Web.UI.GridControls;
using Infragistics.Documents.Reports.Report;


public partial class Samples_WebHierarchicalDataGrid_Data_WordExport_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnExport.Click += new EventHandler(btnExport_Click);
    }

    void btnExport_Click(object sender, EventArgs e)
    {

        string fileName = HttpUtility.UrlEncode(this.textBoxFileName.Text);
        fileName = fileName.Replace("+", "%20");
        fileName = HttpUtility.UrlDecode(fileName);
        this.wExporter.DownloadName = fileName;
        this.wExporter.DataExportMode = (DataExportMode)Enum.Parse(typeof(DataExportMode), rblExportData.SelectedValue);
        this.wExporter.TargetPaperOrientation = (Infragistics.Documents.Word.PageOrientation)Enum.Parse(typeof(Infragistics.Documents.Word.PageOrientation), this.rblOrientation.SelectedValue);
        this.wExporter.TargetPaperSize = Infragistics.Documents.Reports.Report.PageSizes.GetPageSize(ddPaperSize.SelectedValue);
		this.wExporter.Margins = PageMargins.GetPageMargins(ddMargins.SelectedValue);
        switch (this.gridsToExportDDList.SelectedValue.ToString())
        {
            case "1": this.wExporter.Export(this.whdgProducts);
                break;
            case "2": this.wExporter.Export(this.whdgEmpoyees);
                break;
            case "3": this.wExporter.Export(this.whdgProducts, this.whdgEmpoyees);
                break;
        }
    }
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        this.AccessDataSource1.DataFile = this.GetMdbLocation("Nwind.mdb");
        this.AccessDataSource2.DataFile = this.GetMdbLocation("Nwind.mdb");
        this.SqlDsEmployees.DataBind();
    }
    protected string GetConnectionString()
    {
        DataRepository manager = new DataRepository();
        return manager.GetSqlClientConnectionString("SamplesDB.mdf");
    }
}