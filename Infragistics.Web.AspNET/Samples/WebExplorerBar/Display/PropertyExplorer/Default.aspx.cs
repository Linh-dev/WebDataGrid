using System;
using System.Web.UI.WebControls;
using Infragistics.Web.UI.NavigationControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.ExplorerBarDataSource.DataFile = this.GetXmlLocation("SampleData.xml");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.InitializeValues();           
            this.WebExplorerBar1.DataSourceID = "ExplorerBarDataSource";
        }
        else
        {
            this.SetValues();

        }
    }

    protected void InitializeValues()
    {
        this.ebBehaveMode.DataSource = Enum.GetNames(typeof(GroupExpandBehavior));
        this.ebBehaveMode.DataBind();
        this.ebExpandMode.DataSource = Enum.GetNames(typeof(GroupExpandAction));
        this.ebExpandMode.DataBind();
        this.ebAnimationEquation.DataSource = Enum.GetNames(typeof(AnimationEquationTypes));
        this.ebAnimationEquation.DataBind();

        this.txtExplorerBarContainerMaxGroupHeight.Text = "150";
        this.txtExplorerBarContainerWidth.Text = "300";
        this.txtExplorerBarContainerHeight.Text = "330";
        this.txtExplorerBarItemIndent.Text = "10";
        this.txtExplorerBarContainerGroupContentsHeight.Text = "80";
        this.ebAnimationDuration.SelectedValue = "500";
        this.ebBehaveMode.SelectedValue = "AnyExpandable";
        this.ebExpandMode.SelectedValue = "HeaderClick";
        this.ebAnimationEquation.SelectedValue = "EaseOut";
        this.WebExplorerBar1.Height = Unit.Pixel(330);
        this.WebExplorerBar1.GroupContentsHeight = Unit.Pixel(80);
        this.WebExplorerBar1.GroupExpandBehavior = GroupExpandBehavior.AnyExpandable;
        this.WebExplorerBar1.GroupExpandAction = GroupExpandAction.HeaderClick;
        this.WebExplorerBar1.Width = Unit.Pixel(300);
        this.WebExplorerBar1.MaxGroupHeight = Unit.Pixel(150);
        this.WebExplorerBar1.ItemIndent = 10;

    }

    protected void SetValues()
    {
        int container_height, container_width, container_max_group_height, container_group_contents_height, item_indent;

        if (!int.TryParse(txtExplorerBarContainerHeight.Text, out container_height))
        {
            this.WebExplorerBar1.Height = Unit.Empty;
        }
        else
        {
            this.WebExplorerBar1.Height = Unit.Pixel(container_height);
        }

        if (!int.TryParse(txtExplorerBarContainerWidth.Text, out container_width))
        {
            this.WebExplorerBar1.Width = Unit.Empty;
        }
        else
        {
            this.WebExplorerBar1.Width = Unit.Pixel(container_width);
        }

        if (!int.TryParse(txtExplorerBarContainerMaxGroupHeight.Text, out container_max_group_height))
        {
            this.WebExplorerBar1.MaxGroupHeight = Unit.Empty;
        }
        else
        {
            this.WebExplorerBar1.MaxGroupHeight = Unit.Pixel(container_max_group_height);
        }

        if (!int.TryParse(txtExplorerBarContainerGroupContentsHeight.Text, out container_group_contents_height))
        {
            this.WebExplorerBar1.GroupContentsHeight = Unit.Empty;
        }
        else
        {
            this.WebExplorerBar1.GroupContentsHeight = Unit.Pixel(container_group_contents_height);
        }

        if (!int.TryParse(txtExplorerBarItemIndent.Text, out item_indent))
        {
            item_indent = 0;
        }

        this.WebExplorerBar1.ItemIndent = item_indent;
        this.WebExplorerBar1.EnableExpandButtons = this.chkExpandImages.Checked;
        this.WebExplorerBar1.AnimationDuration = Convert.ToInt32(this.ebAnimationDuration.SelectedValue);
        this.WebExplorerBar1.AnimationEquationType = (AnimationEquationTypes)Enum.Parse(typeof(AnimationEquationTypes), this.ebAnimationEquation.SelectedValue);
        this.WebExplorerBar1.GroupExpandBehavior = (GroupExpandBehavior)Enum.Parse(typeof(GroupExpandBehavior), this.ebBehaveMode.SelectedValue);
        this.WebExplorerBar1.GroupExpandAction = (GroupExpandAction)Enum.Parse(typeof(GroupExpandAction), this.ebExpandMode.SelectedValue);
    }
}