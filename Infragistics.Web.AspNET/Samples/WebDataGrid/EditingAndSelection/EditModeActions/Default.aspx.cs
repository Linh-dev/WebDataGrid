using System;
using System.Web.UI.WebControls;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Editing_and_Selection_Edit_Mode_Actions_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.WebDataGrid1.DataSourceID = "ObjectDataSource1";

            this.WebDataGrid1.Behaviors.Activation.Enabled = true;
            this.WebDataGrid1.Behaviors.EditingCore.Behaviors.CellEditing.Enabled = true;
            this.WebDataGrid1.Behaviors.EditingCore.Behaviors.CellEditing.EditModeActions.MouseClick = EditMouseClickAction.Single;

            /* Mark the CustomerID column as ReadOnly*/
            EditingColumnSetting editor = new EditingColumnSetting(this.WebDataGrid1);
            editor.ColumnKey = "CustomerID";
            editor.ReadOnly = true;
            this.WebDataGrid1.Behaviors.EditingCore.Behaviors.CellEditing.ColumnSettings.Add(editor);

            this.EnableF2CB.Checked = this.WebDataGrid1.Behaviors.EditingCore.Behaviors.CellEditing.EditModeActions.EnableF2;
            this.EnableOnActiveCB.Checked = this.WebDataGrid1.Behaviors.EditingCore.Behaviors.CellEditing.EditModeActions.EnableOnActive;
            this.EnableOnKeyPressCB.Checked = this.WebDataGrid1.Behaviors.EditingCore.Behaviors.CellEditing.EditModeActions.EnableOnKeyPress;
        }
    }

    protected void EnableF2Checked(object sender, EventArgs e)
    {
        CheckBox cbx = (CheckBox)sender;
        if (cbx.Checked == true)
        {
            this.EnableOnKeyPressCB.Checked = false;
            this.EnableOnKeyPressCB.Enabled = false;
            this.WebDataGrid1.Behaviors.EditingCore.Behaviors.CellEditing.EditModeActions.EnableOnKeyPress = false;

            this.EnableOnActiveCB.Checked = false;
            this.EnableOnActiveCB.Enabled = false;
            this.WebDataGrid1.Behaviors.EditingCore.Behaviors.CellEditing.EditModeActions.EnableOnActive = false;

            this.WebDataGrid1.Behaviors.EditingCore.Behaviors.CellEditing.EditModeActions.EnableF2 = true;
        }
        else
        {
            this.EnableOnKeyPressCB.Enabled = true;
            this.EnableOnActiveCB.Enabled = true;
            this.WebDataGrid1.Behaviors.EditingCore.Behaviors.CellEditing.EditModeActions.EnableF2 = false;
        }
    }

    protected void EnableOnActiveChecked(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.EditingCore.Behaviors.CellEditing.EditModeActions.EnableOnActive = !this.WebDataGrid1.Behaviors.EditingCore.Behaviors.CellEditing.EditModeActions.EnableOnActive;
    }

    protected void EnableOnKeyPressChecked(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.EditingCore.Behaviors.CellEditing.EditModeActions.EnableOnKeyPress = !this.WebDataGrid1.Behaviors.EditingCore.Behaviors.CellEditing.EditModeActions.EnableOnKeyPress;
    }

    protected void MouseClickChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.EditingCore.Behaviors.CellEditing.EditModeActions.MouseClick = (EditMouseClickAction)Enum.Parse(typeof(EditMouseClickAction), this.MousClickDDL.SelectedItem.Text);
    }
}
