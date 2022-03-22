using System;
using Infragistics.Web.UI;
using Infragistics.Web.UI.NavigationControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{

    protected void Page_Init(object sender, EventArgs e)
    {
        this.TreeDataSource.DataFile = this.GetXmlLocation("SampleData.xml");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.WebDataTreeSample.DataBound += new EventHandler(WebDataTreeSample_DataBound);
        if (!this.IsPostBack)
        {
            this.SetupPropertyExplorer();
        }
        else
        {
            this.SetPropertyValues();
        }
    }

    protected void WebDataTreeSample_DataBound(object sender, EventArgs e)
    {
        if (this.WebDataTreeSample.Nodes.Count > 0)
        {
            this.WebDataTreeSample.Nodes[0].Selected = true;
            this.WebDataTreeSample.Nodes[0].ExpandChildren();
        }
    }

    private void SetupPropertyExplorer()
    {
        PropertyExplorer.GetEnumValues(this.AnimationEquation, this.WebDataTreeSample.AnimationEquationType);
        PropertyExplorer.GetEnumValues(this.CheckBoxMode, this.WebDataTreeSample.CheckBoxMode);
        PropertyExplorer.GetEnumValues(this.SelectionType, this.WebDataTreeSample.SelectionType);
        this.chkEnableAutoChecking.Checked = true;
    }

    private void SetPropertyValues()
    {
        this.WebDataTreeSample.EnableConnectorLines = this.EnableConnectorLines.Checked;
        this.WebDataTreeSample.AnimationEquationType = PropertyExplorer.GetEnumValue<Infragistics.Web.UI.NavigationControls.AnimationEquationTypes>(this.WebDataTreeSample.AnimationEquationType, this.AnimationEquation.SelectedValue);
        this.WebDataTreeSample.AnimationDuration = PropertyExplorer.GetNumericValue(this.AnimationDuration.SelectedValue);

        this.SetCheckBoxProperty();
        this.SetSelectionTypeProperty();

        this.WebDataTreeSample.EnableAutoChecking = this.chkEnableAutoChecking.Checked;

        foreach (DataTreeNode d in WebDataTreeSample.AllNodes)
        {
            if (d.CheckState == Infragistics.Web.UI.CheckBoxState.Checked || d.CheckState == Infragistics.Web.UI.CheckBoxState.Partial)
                d.CheckState = Infragistics.Web.UI.CheckBoxState.Unchecked;
        }
    }

    private void SetCheckBoxProperty()
    {
        CheckBoxMode currentMode = this.WebDataTreeSample.CheckBoxMode;
        CheckBoxMode selectedMode = PropertyExplorer.GetEnumValue<Infragistics.Web.UI.CheckBoxMode>(this.WebDataTreeSample.CheckBoxMode, this.CheckBoxMode.SelectedValue);

        if (currentMode != selectedMode)
        {
            this.WebDataTreeSample.CheckBoxMode = selectedMode;

            // Clear checked nodes when switching check box mode
            foreach (DataTreeNode node in this.WebDataTreeSample.AllNodes)
            {
                if (node.CheckState != CheckBoxState.Unchecked)
                {
                    node.CheckState = CheckBoxState.Unchecked;
                }
            }
        }
    }

    private void SetSelectionTypeProperty()
    {
        NodeSelectionTypes currentSelectionType = this.WebDataTreeSample.SelectionType;
        NodeSelectionTypes selectedSelectionType = PropertyExplorer.GetEnumValue<Infragistics.Web.UI.NavigationControls.NodeSelectionTypes>(this.WebDataTreeSample.SelectionType, this.SelectionType.SelectedValue);

        if (currentSelectionType != selectedSelectionType)
        {
            this.WebDataTreeSample.SelectionType = selectedSelectionType;

            // Clear selected nodes when switching the selection type
            foreach (DataTreeNode node in this.WebDataTreeSample.AllNodes)
            {
                if (node.Selected)
                {
                    node.Selected = false;
                }
            }
        }
    }

}