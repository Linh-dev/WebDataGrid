using System;
using System.Xml;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			this.DefaultDataSource.DataFile = this.GetMdbLocation("Nwind.mdb");
			this.TreeDataSource.DataFile = this.GetXmlLocation("SampleData.xml");

			ddCustomTemplateTable.DataSourceID = "DefaultDataSource";
			ddCustomTemplateTable.TextField = "Contact";
			ddCustomTemplateTable.DataBind();
			ddCustomTemplateTable.CurrentValue = "";

			XmlDocument doc = this.TreeDataSource.GetXmlDocument();
			XmlNodeList list = doc.SelectNodes("/Data/ProductList/Product");
			System.Collections.Generic.List<WebDropDownItem> glist = new System.Collections.Generic.List<WebDropDownItem>();
			WebDropDownItem i;

			foreach (XmlNode node in list)
			{
				i = new WebDropDownItem();
				i.Text = node.Attributes["Text"].Value.ToString();
				i.Value = node.Attributes["Text"].Value.ToString();
				i.ImageUrl = node.Attributes["ImageUrl"].Value.ToString();
				glist.Add(i);
			}

			ddCustomList.DataSource = glist;
			ddCustomList.TextField = "Text";
			ddCustomList.DataBind();
			ddCustomList.CurrentValue = "";

		}
	}
}
