using System;
using System.Web;


using Infragistics.Web.UI.GridControls;
using Infragistics.Web.SampleBrowser.Core.Framework.DataAccess;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private int exportedRows = 0;

	protected override void OnInit(EventArgs e)
	{
		base.OnInit(e);
		this.btnExport.Click += new EventHandler(btnExport_Click);

        this.AccessDataSource1.DataFile = this.GetMdbLocation("Nwind.mdb");
        this.AccessDataSource2.DataFile = this.GetMdbLocation("Nwind.mdb");
        this.SqlDsEmployees.DataBind();
	}
    


    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    void btnExport_Click(object sender, EventArgs e)
    {
        if (this.eExporter.DataExportMode == DataExportMode.AllDataInDataSource)
        {
            this.whdgProducts.InitialDataBindDepth = -1;
            this.whdgProducts.DataBind();
        }
        string fileName = HttpUtility.UrlEncode(this.tbFileName.Text);
        fileName = fileName.Replace("+", "%20");
        fileName = HttpUtility.UrlDecode(fileName);
        this.eExporter.DownloadName = fileName;
        bool singleGridPerSheet = (this.rblSheets.SelectedValue == "separate") ? true : false;
        this.eExporter.DataExportMode = (DataExportMode)Enum.Parse(typeof(DataExportMode), this.rblExportData.SelectedValue);
        this.eExporter.WorkbookFormat = (Infragistics.Documents.Excel.WorkbookFormat) Enum.Parse(typeof(Infragistics.Documents.Excel.WorkbookFormat), this.rblExcelFormat.SelectedValue);

        this.eExporter.Export(singleGridPerSheet, this.whdgProducts, this.wdgEmpoyees);
    }

    void eExporter_RowExported(object sender, ExcelRowExportedEventArgs e)
    {
        exportedRows++;
    }
    protected string GetConnectionString()
    {
        DataRepository manager = new DataRepository();        
        return manager.GetSqlClientConnectionString("SamplesDB.mdf");        
    }
}
