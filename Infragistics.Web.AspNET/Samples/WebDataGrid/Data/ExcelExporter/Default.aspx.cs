using System;
using System.Web;
using Infragistics.Web.UI.GridControls;
using System.Configuration;

public partial class Samples_WebDataGrid_Data_Excel_Exporter_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private int exportedRows = 0;

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.SqlDsCustomers.DataBind();
        this.SqlDsProducts.DataBind();
        this.rblPAging.SelectedIndexChanged += new EventHandler(rblPAging_SelectedIndexChanged);
        this.btnExport.Click += new EventHandler(btnExport_Click);
        this.chkSummaries.CheckedChanged += new EventHandler(chkSummaries_CheckedChanged);
        this.chkFiltering.CheckedChanged += new EventHandler(chkFiltering_CheckedChanged);
        this.chkSorting.CheckedChanged += new EventHandler(chkSorting_CheckedChanged);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string languageID = ConfigurationManager.AppSettings["LanguageID"].ToString();
            if (languageID == "1033")
            {
                this.behaviorsFieldSet.Style.Add("width", "280px");
            }
            else
            {
                this.behaviorsFieldSet.Style.Add("width", "220px");
            }
        }
    }

    void btnExport_Click(object sender, EventArgs e)
    {
        string fileName = HttpUtility.UrlEncode(this.tbFileName.Text);
        fileName = fileName.Replace("+", "%20");
        fileName = HttpUtility.UrlDecode(fileName);
        this.eExporter.DownloadName = fileName;
        this.eExporter.DataExportMode = (DataExportMode)Enum.Parse(typeof(DataExportMode), this.rblExportData.SelectedValue);
        this.eExporter.WorkbookFormat = (Infragistics.Documents.Excel.WorkbookFormat)Enum.Parse(typeof(Infragistics.Documents.Excel.WorkbookFormat), this.rblExcelFormat.SelectedValue);
        bool singleGridPerSheet = (this.rblSheets.SelectedValue == "separate") ? true : false;
        this.eExporter.Export(singleGridPerSheet, this.wdgProducts, this.wdgCustomers);
    }

    void eExporter_RowExported(object sender, ExcelRowExportedEventArgs e)
    {
        exportedRows++;
    }

    void chkSorting_CheckedChanged(object sender, EventArgs e)
    {
        this.wdgCustomers.Behaviors.Sorting.Enabled = this.chkSorting.Checked;
        this.wdgProducts.Behaviors.Sorting.Enabled = this.chkSorting.Checked;

    }

    void chkFiltering_CheckedChanged(object sender, EventArgs e)
    {
        this.wdgCustomers.Behaviors.Filtering.Enabled = this.chkFiltering.Checked;
        this.wdgProducts.Behaviors.Filtering.Enabled = this.chkFiltering.Checked;
    }

    void chkSummaries_CheckedChanged(object sender, EventArgs e)
    {
        if (this.chkSummaries.Checked)
        {
            this.wdgProducts.Behaviors.SummaryRow.Enabled = true;
            this.wdgCustomers.Behaviors.SummaryRow.Enabled = true;
        }
        else
        {
            this.wdgCustomers.Behaviors.SummaryRow.ColumnSummaries.Clear();
            this.wdgProducts.Behaviors.SummaryRow.ColumnSummaries.Clear();
            this.wdgProducts.Behaviors.SummaryRow.Enabled = false;
            this.wdgCustomers.Behaviors.SummaryRow.Enabled = false;
        }
    }

    void rblPAging_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (this.rblPAging.SelectedValue)
        {
            case "paging":
                this.wdgCustomers.Behaviors.Paging.Enabled = true;
                this.wdgCustomers.Behaviors.VirtualScrolling.Enabled = false;

                this.wdgProducts.Behaviors.Paging.Enabled = true;
                this.wdgProducts.Behaviors.VirtualScrolling.Enabled = false;
                break;
            case "vscrolling":
                this.wdgCustomers.Behaviors.Paging.Enabled = false;
                this.wdgCustomers.Behaviors.VirtualScrolling.Enabled = true;

                this.wdgProducts.Behaviors.Paging.Enabled = false;
                this.wdgProducts.Behaviors.VirtualScrolling.Enabled = true;
                break;
        }
    }
}
