using System;
using Infragistics.Web.UI;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Display_Summaries_Basic_Features_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.chkEnableAnimation.CheckedChanged += new EventHandler(chkEnableAnimation_CheckedChanged);
        this.chkShowButtons.CheckedChanged += new EventHandler(chkShowButtons_CheckedChanged);
        this.chkShowOptionsInDD.CheckedChanged += new EventHandler(chkShowOptionsInDD_CheckedChanged);
        this.chkSummaryOptions.CheckedChanged += new EventHandler(chkSummaryOptions_CheckedChanged);
        this.chkEnableFilter.CheckedChanged += new EventHandler(chkFilter_CheckedChanged);
        this.ddCompactRendering.SelectedIndexChanged += new EventHandler(ddCompactRendering_SelectedIndexChanged);
        this.tboxEmptyFooter.TextChanged += new EventHandler(EmptyFooterTextBox_TextChanged);
        this.chkAddRemoveSummaries.CheckedChanged += new EventHandler(chkAddRemoveSummaries_CheckedChanged); ;
        //Behaviors
        this.chkFiltering.CheckedChanged += new EventHandler(chkFiltering_CheckedChanged);
        this.chkSorting.CheckedChanged += new EventHandler(chkSorting_CheckedChanged);
        this.chkMoving.CheckedChanged += new EventHandler(chkMoving_CheckedChanged);
        this.chkPaging.CheckedChanged += new EventHandler(chkPaging_CheckedChanged);
        this.chkFixing.CheckedChanged += new EventHandler(chkFixing_CheckedChanged);

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.ProductsDataSource.DataBind();
        if (!IsPostBack)
        {
            this.ddCompactRendering.DataSource = Enum.GetNames(typeof(Mode));
            ddCompactRendering.DataBind();
            this.ddCompactRendering.SelectedValue = "Auto";
        }
    }

    void EmptyFooterTextBox_TextChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.SummaryRow.EmptyFooterText = this.tboxEmptyFooter.Text;
    }

    void chkFilter_CheckedChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.SummaryRow.EnableSummariesFilter = this.chkEnableFilter.Checked;
    }

    void chkSummaryOptions_CheckedChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.SummaryRow.ColumnSettings["ProductID"].EnableColumnSummaryOptions = chkSummaryOptions.Checked;
    }

    void chkEnableAnimation_CheckedChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.SummaryRow.AnimationEnabled = chkEnableAnimation.Checked;
    }

    void chkShowButtons_CheckedChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.SummaryRow.ShowSummariesButtons = this.chkShowButtons.Checked;
        foreach (SummaryRowSetting setting in this.WebDataGrid1.Behaviors.SummaryRow.ColumnSettings)
            setting.ShowSummaryButton = this.chkShowButtons.Checked;
    }

    void ddCompactRendering_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.SummaryRow.CompactRendering = (Mode)Enum.Parse(typeof(Mode), this.ddCompactRendering.SelectedValue);
    }

    void chkAddRemoveSummaries_CheckedChanged(object sender, EventArgs e)
    {
        WebDataGrid1.Behaviors.SummaryRow.ColumnSummaries.Clear();
        if (chkAddRemoveSummaries.Checked)
        {
            AddSummaries("ProductName");
            AddSummaries("UnitPrice");
            AddSummaries("UnitsInStock");
            AddSummaries("UnitsOnOrder");
        }
    }

    void AddSummaries(string columnKey)
    {
        ColumnSummaryInfo info = new ColumnSummaryInfo();
        info.ColumnKey = columnKey;
        info.Summaries.Add(SummaryType.Count);
        if (columnKey != "ProductName")
        {
            info.Summaries.Add(SummaryType.Max);
            info.Summaries.Add(SummaryType.Sum);
            info.Summaries.Add(SummaryType.Average);
            info.Summaries.Add(SummaryType.Min);
        }
        this.WebDataGrid1.Behaviors.SummaryRow.ColumnSummaries.Add(info);
    }

    void chkFixing_CheckedChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.ColumnFixing.Enabled = chkFixing.Checked;
    }

    void chkPaging_CheckedChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.Paging.Enabled = chkPaging.Checked;
    }

    void chkMoving_CheckedChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.ColumnMoving.Enabled = chkMoving.Checked;
    }

    void chkSorting_CheckedChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.Sorting.Enabled = chkSorting.Checked;
    }

    void chkShowOptionsInDD_CheckedChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.SummaryRow.ColumnSettings["UnitPrice"].SummarySettings[SummaryType.Max].ShowOptionInDropDown = chkShowOptionsInDD.Checked;
		this.WebDataGrid1.Behaviors.SummaryRow.ColumnSettings["UnitPrice"].SummarySettings[SummaryType.Min].ShowOptionInDropDown = chkShowOptionsInDD.Checked;
    }

    void chkFiltering_CheckedChanged(object sender, EventArgs e)
    {
        if (chkFiltering.Checked)
        {
            this.WebDataGrid1.Behaviors.Filtering.Visibility = FilteringVisibility.Visible;
        }
        else
        {
            this.WebDataGrid1.Behaviors.Filtering.Visibility = FilteringVisibility.Hidden;
        }
    }

}
