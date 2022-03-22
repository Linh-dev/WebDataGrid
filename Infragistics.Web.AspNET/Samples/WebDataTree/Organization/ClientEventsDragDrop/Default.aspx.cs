using System;
using System.Data;
using System.Web;
using Infragistics.Web.UI.NavigationControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = new DataSet();
            ds.DataSetName = "TreeDataSet";
            ds.ReadXml(HttpContext.Current.Server.MapPath(this.GetXmlLocation("TreeSampleData.xml")));
            this.DDWebDataTree.DataSource = ds;
            this.DDWebDataTree.DataBind();
        }

        foreach (DataTreeNode item in this.DDWebDataTree.AllNodes)
        {
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
