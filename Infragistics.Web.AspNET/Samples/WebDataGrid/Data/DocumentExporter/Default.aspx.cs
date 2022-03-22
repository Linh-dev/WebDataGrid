using System;
using System.Web;
using System.Web.UI;
using Infragistics.Documents.Reports.Report;
using Infragistics.Web.UI;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Data_Document_Exporter_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
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
    }

    protected void Page_Load(object sender, EventArgs e)
    { 
        ((WebScriptManager)ScriptManager.GetCurrent(this.Page)).InfragisticsCDN.EnableCDN = DefaultableBoolean.False;
        // InitBehaviors();
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

        this.dExporter.Export(this.wdgProducts, this.wdgCustomers);
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
