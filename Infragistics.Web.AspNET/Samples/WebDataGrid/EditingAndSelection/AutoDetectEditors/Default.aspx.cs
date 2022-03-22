using System;
using System.Web.UI.WebControls;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Editing_and_Selection_Auto_Detect_Editors_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    // view state for old selected index of drop-down list
    private HiddenField _field;
    // verify that data sourse is not changed, and rebind data to new source
    protected override void OnPreRender(EventArgs e)
    {
        this.SetDataSource(true);
        base.OnPreRender(e);
    }
    // implement view state for old selected index of drop-down list
    protected override void OnInit(EventArgs e)
    {
        this._field = new HiddenField();
        this._field.ID = "OldSelectedIndexField";
        this.Form.Controls.Add(this._field);
        base.OnInit(e);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.SetDataSource(false);
    }

    private void SetDataSource(bool preRender)
    {
        string old = this._field.Value;
        if (string.IsNullOrEmpty(old))
            old = this._field.Value = this.DropDownList1.SelectedIndex.ToString();
        int index = int.Parse(old);
        // check if selected index of dropdown was changed
        if (preRender)
        {
            if (this.DropDownList1.SelectedIndex == index)
                return;
            index = this.DropDownList1.SelectedIndex;
            this._field.Value = index.ToString();
            // if sorting is enabled, then
            //this.WebDataGrid1.Behaviors.Sorting.SortedColumns.Clear();
            this.WebDataGrid1.ClearDataSource();
            this.WebDataGrid1.Behaviors.Paging.PageIndex = 0;
        }
        this.WebDataGrid1.Columns.Clear();
        CustomDataSource dataSources = new CustomDataSource(this);
        switch (index)
        {
            case 0:
                this.AccessDataSource1.DataBind();
                this.WebDataGrid1.DataKeyFields = "OrderID";
                this.WebDataGrid1.DataSourceID = "AccessDataSource1";
                break;
            case 1:
                this.WebDataGrid1.DataKeyFields = "CustomerID";
                this.WebDataGrid1.DataSource = dataSources.GetDataTableSource();
                break;
            case 2:
                this.WebDataGrid1.DataKeyFields = "CityID";
                this.WebDataGrid1.DataSource = dataSources.GetICollectionSource();
                break;
        }
        this.AddReadyOnlyColumn(this.WebDataGrid1.DataKeyFields);
        this.WebDataGrid1.DataBind();
    }

    protected void AddReadyOnlyColumn(string columnKey)
    {
        EditingColumnSetting cSetting = new EditingColumnSetting();
        cSetting.ColumnKey = columnKey;
        cSetting.ReadOnly = true;

        if (GetColumnSettings().IndexOf(cSetting) == -1)
            GetColumnSettings().Add(cSetting);
    }

    protected EditingColumnSettings GetColumnSettings()
    {
        return WebDataGrid1.Behaviors.EditingCore.Behaviors.CellEditing.ColumnSettings;
    }

    protected void WebDataGrid1_RowUpdating(object sender, Infragistics.Web.UI.GridControls.RowUpdatingEventArgs e)
    {
        // This samples does not support updating.
        e.Cancel = true;
    }
}
