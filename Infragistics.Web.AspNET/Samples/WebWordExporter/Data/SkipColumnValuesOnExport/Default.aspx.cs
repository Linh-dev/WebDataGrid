using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Samples_WebDataGrid_Data_SkipColumnValuesOnExport_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
            base.OnInit(e);
            this.AccessDsEmployees.DataBind();
            this.wdgEmplyees.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnExport.Click += new EventHandler(btnExport_Click);
        this.wExporter.CellExporting += new EventHandler<Infragistics.Web.UI.GridControls.WordCellExportingEventArgs>(wExporter_CellExporting);
    }

    void wExporter_CellExporting(object sender, Infragistics.Web.UI.GridControls.WordCellExportingEventArgs e)
    {
        if (e.IsHeaderCell && e.ExportValue.Equals(this.GetGlobalResourceObject("WebDataGrid","WordExporter_Salary").ToString()))
        {
            e.ExportValue = this.GetGlobalResourceObject("WebDataGrid", "WordExporter_Sign").ToString();
        }
        else if(!e.IsHeaderCell)
        {
            if(e.GridCell.Column.Header.Text.Equals(this.GetGlobalResourceObject("WebDataGrid", "WordExporter_Salary")))
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
        this.wExporter.Export(this.wdgEmplyees);
    }

}