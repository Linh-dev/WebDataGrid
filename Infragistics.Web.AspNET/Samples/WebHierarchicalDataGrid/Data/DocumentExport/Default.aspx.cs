using System;
using System.Web;
using Infragistics.Documents.Reports.Report;


using Infragistics.Web.UI.GridControls;
using Infragistics.Web.SampleBrowser.Core.Framework.DataAccess;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        this.AccessDataSource1.DataFile = this.GetMdbLocation("Nwind.mdb");
        this.AccessDataSource2.DataFile = this.GetMdbLocation("Nwind.mdb");
        this.SqlDsEmployees.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //((WebScriptManager)ScriptManager.GetCurrent(this.Page)).InfragisticsCDN.EnableCDN = DefaultableBoolean.False;
        this.btnExport.Click += new EventHandler(btnExport_Click);
        // Enable Unicode characters to be exported
        dExporter.CustomFont = new System.Drawing.Font("MS UI Gothic", 11);
    }

    void btnExport_Click(object sender, EventArgs e)
    {
        string fileName = HttpUtility.UrlEncode(this.tbFileName.Text);
        fileName = fileName.Replace("+", "%20");
        fileName = HttpUtility.UrlDecode(fileName);
        this.dExporter.DownloadName = fileName;

        this.dExporter.Format = (Infragistics.Web.UI.GridControls.FileFormat)Enum.Parse(typeof(Infragistics.Web.UI.GridControls.FileFormat), this.rblDocFormat.SelectedValue);

        this.dExporter.DataExportMode = (DataExportMode)Enum.Parse(typeof(DataExportMode), this.rblExportData.SelectedValue);

        this.dExporter.TargetPaperOrientation = (PageOrientation)Enum.Parse(typeof(PageOrientation), this.rblOrientation.SelectedValue);

        this.dExporter.Margins = PageMargins.GetPageMargins(ddMargins.SelectedValue);

        this.dExporter.TargetPaperSize = PageSizes.GetPageSize(ddPaperSize.SelectedValue);
        
        this.dExporter.Export(this.whdgProducts, this.whdgEmpoyees);
    }
    protected string GetConnectionString()
    {
        DataRepository manager = new DataRepository();     
        return manager.GetSqlClientConnectionString("SamplesDB.mdf");        
    }
}
