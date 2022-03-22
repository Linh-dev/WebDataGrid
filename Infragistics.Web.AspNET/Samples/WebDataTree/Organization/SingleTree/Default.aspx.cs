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
            this.DDWebDataTree.DataSource = ds;
            this.DDWebDataTree.DataBind();
            this.InitTree(this.DDWebDataTree, false);
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

    protected void dataTreeConnLinesChecked(object sender, EventArgs e)
    {
        this.DDWebDataTree.EnableConnectorLines = this.WebDataTree1ConnLinesCheckBox.Checked;
    }

    protected void dataTreecheckBoxChecked(object sender, EventArgs e)
    {
        if (this.WebDataTree1CheckBox.Checked)
        {
            this.DDWebDataTree.CheckBoxMode = Infragistics.Web.UI.CheckBoxMode.BiState;
        }
        else
        {
            this.DDWebDataTree.CheckBoxMode = Infragistics.Web.UI.CheckBoxMode.Off;
        }
    }

    protected void onClearImages(object sender, EventArgs e)
    {
        this.DDWebDataTree.DataSource = (DataSet)Session[DATA_SOURCE];
        this.DDWebDataTree.DataBind();
        this.InitTree(this.DDWebDataTree, this.ClearImageCheckBox.Checked);
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
                item.Text == this.GetGlobalResourceObject("WebDataTree","Pictures") ||
                item.Text == this.GetGlobalResourceObject("WebDataTree","BirthDay2010"))
            {
                item.Expanded = true;
            }
        }
    }
}
