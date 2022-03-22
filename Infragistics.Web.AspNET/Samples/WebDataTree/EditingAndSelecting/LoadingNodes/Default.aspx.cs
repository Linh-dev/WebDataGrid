using System;
using Infragistics.Web.UI.NavigationControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.TreeDataSource.DataFile = this.GetXmlLocation("SampleData.xml");
    }

    void Page_Load(object sender, EventArgs e)
    {
        this.AddNewFeed.Click += new EventHandler(AddNewFeed_Click);
    }

    void AddNewFeed_Click(object sender, EventArgs e)
    {
        string selectedGroup = this.GroupList.SelectedValue;

        foreach (DataTreeNode groupNode in this.WebDataTreeSample.Nodes)
        {
            if (groupNode.Text.Equals(selectedGroup))
            {
                DataTreeNode newFeed = new DataTreeNode();
                newFeed.Text = this.NewFeedName.Text;
                newFeed.Text = this.NewFeedName.Text;
                newFeed.ImageUrl = "/SamplesBrowser/SamplesCommon/aspnet/Common/OfficeBasicsIcons/RSSFeed.png";
                groupNode.Nodes.Add(newFeed);
            }
        }
    }
}