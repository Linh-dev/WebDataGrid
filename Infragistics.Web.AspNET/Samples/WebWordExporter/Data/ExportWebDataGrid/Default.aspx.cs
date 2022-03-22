using System;
using System.Web;
using Infragistics.Web.UI.GridControls;
using Infragistics.Documents.Reports.Report;



public partial class Samples_WebDataGrid_Data_Word_Exporter_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.AccessDsCustomers.DataBind();
        this.AccessDsProducts.DataBind();
        this.rblPAging.SelectedIndexChanged += new EventHandler(rblPAging_SelectedIndexChanged);
        this.btnExport.Click += new EventHandler(btnExport_Click);
        this.chkSummaries.CheckedChanged += new EventHandler(chkSummaries_CheckedChanged);
        this.chkFiltering.CheckedChanged += new EventHandler(chkFiltering_CheckedChanged);
        this.chkSorting.CheckedChanged += new EventHandler(chkSorting_CheckedChanged);
        this.chkRowSelectors.CheckedChanged += new EventHandler(chkRowSelectors_CheckedChanged);
    }

    void chkRowSelectors_CheckedChanged(object sender, EventArgs e)
    {
        this.wdgCustomers.Behaviors.RowSelectors.Enabled = this.chkRowSelectors.Checked;
        this.wdgCustomers.Behaviors.RowSelectors.RowNumbering = this.chkRowSelectors.Checked;
        this.wdgProducts.Behaviors.RowSelectors.Enabled = this.chkRowSelectors.Checked;
        this.wdgProducts.Behaviors.RowSelectors.RowNumbering = this.chkRowSelectors.Checked;
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    void btnExport_Click(object sender, EventArgs e)
    {
        string fileName = HttpUtility.UrlEncode(this.tbFileName.Text);
        fileName = fileName.Replace("+", "%20");
        fileName = HttpUtility.UrlDecode(fileName);
        this.wExporter.DownloadName = fileName;
        this.wExporter.DataExportMode = (DataExportMode)Enum.Parse(typeof(DataExportMode), rblExportData.SelectedValue);
        this.wExporter.TargetPaperOrientation = (Infragistics.Documents.Word.PageOrientation)Enum.Parse(typeof(Infragistics.Documents.Word.PageOrientation), this.rblOrientation.SelectedValue);
        this.wExporter.TargetPaperSize = Infragistics.Documents.Reports.Report.PageSizes.GetPageSize(ddPaperSize.SelectedValue);
		this.wExporter.Margins = PageMargins.GetPageMargins(ddMargins.SelectedValue);
        switch (this.gridsToExportDDList.SelectedValue.ToString())
        {
            case "1": this.wExporter.Export(this.wdgProducts);
                break;
            case "2": this.wExporter.Export(this.wdgCustomers);
                break;
            case "3": this.wExporter.Export(this.wdgProducts, this.wdgCustomers);
                break;
        }
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