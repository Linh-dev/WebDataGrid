using System;
using System.Data;
using System.Web;
using System.Web.UI;
using Infragistics.Web.UI.NavigationControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    #region Constants

    private const string DATA_SOURCE = "DataSource";

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = new DataSet();
            ds.DataSetName = "TreeDataSet";
            ds.ReadXml(HttpContext.Current.Server.MapPath(this.GetXmlLocation("TreeSampleData.xml")));
            Page.Session[DATA_SOURCE] = ds;
            this.DDWebDataTree1.DataSource = ds;
            this.DDWebDataTree2.DataSource = ds;
            this.DDWebDataTree1.DataBind();
            this.DDWebDataTree2.DataBind();
            this.InitTree(this.DDWebDataTree1, false);
            this.InitTree(this.DDWebDataTree2, false);
        }
    }

    public void DDWebDataTree1_DataBound(object sender, EventArgs e)
    {
        WebDataTree tree = sender as WebDataTree;
        if (tree == null) 
            return;

        if (tree.Nodes == null || tree.Nodes.Count == 0)
            return;

        tree.Nodes[0].Expanded = true;
    }

    protected void allowDropCheckChanged(object sender, EventArgs e)
    {
        this.DDWebDataTree1.DragDropSettings.AllowDrop = this.AllowDropCheckBox.Checked;
        this.DDWebDataTree2.DragDropSettings.AllowDrop = this.AllowDropCheckBox.Checked;
    }

    protected void enableDragDropChanged(object sender, EventArgs e)
    {
        this.DDWebDataTree1.DragDropSettings.EnableDragDrop = this.EnableDragDropCheckBox.Checked;
        this.DDWebDataTree2.DragDropSettings.EnableDragDrop = this.EnableDragDropCheckBox.Checked;
    }

    protected void dataTreeConnLinesChecked(object sender, EventArgs e)
    {
        this.DDWebDataTree1.EnableConnectorLines = this.WebDataTree1ConnLinesCheckBox.Checked;
        this.DDWebDataTree2.EnableConnectorLines = this.WebDataTree2ConnLinesCheckBox.Checked;
    }

    protected void dataTree1checkBoxChecked(object sender, EventArgs e)
    {
        if (this.WebDataTree1CheckBox.Checked)
        {
            this.DDWebDataTree1.CheckBoxMode = Infragistics.Web.UI.CheckBoxMode.BiState;
        }
        else
        {
            this.DDWebDataTree1.CheckBoxMode = Infragistics.Web.UI.CheckBoxMode.Off;
        }
    }

    protected void dataTree2checkBoxChecked(object sender, EventArgs e)
    {
        if (this.WebDataTree2CheckBox.Checked)
        {
            this.DDWebDataTree2.CheckBoxMode = Infragistics.Web.UI.CheckBoxMode.BiState;
        }
        else
        {
            this.DDWebDataTree2.CheckBoxMode = Infragistics.Web.UI.CheckBoxMode.Off;
        }
    }

    protected void onLeftTreeClearImages(object sender, EventArgs e)
    {
        if (Page.Session[DATA_SOURCE] != null)
        {
            this.DDWebDataTree1.DataSource = ((DataSet)Page.Session[DATA_SOURCE]);
            this.DDWebDataTree1.DataBind();
            this.InitTree(this.DDWebDataTree1, this.LeftTreeClearImagesCheckBox.Checked);
        }
    }

    protected void onRightTreeClearImages(object sender, EventArgs e)
    {
        if (Page.Session[DATA_SOURCE] != null)
        {
            this.DDWebDataTree2.DataSource = ((DataSet)Page.Session[DATA_SOURCE]);
            this.DDWebDataTree2.DataBind();
            this.InitTree(this.DDWebDataTree2, this.RightTreeClearImagesCheckBox.Checked);
        }
    }

    protected void InitTree(WebDataTree tree, bool clearImages)
    {
        foreach (DataTreeNode item in tree.AllNodes)
        {
            if (clearImages)
            {
                item.ImageUrl = string.Empty;
            }

            if (item.Text == this.GetGlobalResourceObject("WebDataTree","Computer") ||
                item.Text == this.GetGlobalResourceObject("WebDataTree","Music") ||
                item.Text == this.GetGlobalResourceObject("WebDataTree","ACDC") ||
                item.Text == this.GetGlobalResourceObject("WebDataTree","Rock") ||
                item.Text == this.GetGlobalResourceObject("WebDataTree","MyDocuments") ||
                item.Text == this.GetGlobalResourceObject("WebDataTree","number2009") ||
                item.Text == this.GetGlobalResourceObject("WebDataTree", "Pictures") ||
                item.Text == this.GetGlobalResourceObject("WebDataTree", "BirthDay2010"))
            {
                item.Expanded = true;
            }
        }
    }
}
