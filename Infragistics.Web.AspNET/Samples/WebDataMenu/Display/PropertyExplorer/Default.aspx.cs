using System;
using System.Web.UI.WebControls;
using Infragistics.Web.UI;
using IGN = Infragistics.Web.UI.NavigationControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{

    protected void Page_Init(object sender, EventArgs e)
    {
        this.MenuDataSource.DataFile = this.GetXmlLocation("MenuData.xml");
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {
            this.WebDataMenuSample.DataBind();
            this.SetupPropertyExplorer();
        }
        else
        {
            this.SetPropertyValues();
        }
    }

    private void SetupPropertyExplorer()
    {
        IGN.DataMenuGroupSettings menuGroupSettings = this.WebDataMenuSample.GroupSettings;
        PropertyExplorer.GetEnumValues(this.AnimationType, menuGroupSettings.AnimationType);
        PropertyExplorer.GetEnumValues(this.AnimationEquation, menuGroupSettings.AnimationEquationType);
        PropertyExplorer.GetEnumValues(this.ExpandDirection, menuGroupSettings.ExpandDirection);

        this.WebDataMenuSample.Width = new Unit("100%");

        foreach (IGN.DataMenuItem item in this.WebDataMenuSample.Allitems)
        {
            item.GroupSettings.ExpandDirection = PropertyExplorer.GetEnumValue<IGN.ExpandDirection>(menuGroupSettings.ExpandDirection, this.ExpandDirection.SelectedValue);
            item.GroupSettings.OffsetX = PropertyExplorer.GetNumericValue(this.OffSetX.Text);
            item.GroupSettings.OffsetY = PropertyExplorer.GetNumericValue(this.OffSetY.Text);
        }
    }

    private void SetPropertyValues()
    {
        IGN.DataMenuGroupSettings menuGroupSettings = this.WebDataMenuSample.GroupSettings;
        if (this.OrientationHorizontal.Checked == true)
        {
            menuGroupSettings.Orientation = IGN.Orientation.Horizontal;
            this.WebDataMenuSample.Width = new Unit("100%");
        }
        else
        {
            menuGroupSettings.Orientation = IGN.Orientation.Vertical;
            this.WebDataMenuSample.Width = Unit.Empty;
        }
        menuGroupSettings.AnimationType = PropertyExplorer.GetEnumValue<IGN.AnimationType>(menuGroupSettings.AnimationType, this.AnimationType.SelectedValue);
        menuGroupSettings.AnimationEquationType = PropertyExplorer.GetEnumValue<AnimationEquationType>(menuGroupSettings.AnimationEquationType, this.AnimationEquation.SelectedValue);
        menuGroupSettings.ExpandDirection = PropertyExplorer.GetEnumValue<IGN.ExpandDirection>(menuGroupSettings.ExpandDirection, this.ExpandDirection.SelectedValue);
        menuGroupSettings.AnimationDuration = PropertyExplorer.GetNumericValue(this.AnimationDuration.SelectedValue);
        menuGroupSettings.OffsetX = PropertyExplorer.GetNumericValue(this.OffSetX.Text);
        menuGroupSettings.OffsetY = PropertyExplorer.GetNumericValue(this.OffSetY.Text);
        foreach (IGN.DataMenuItem item in this.WebDataMenuSample.Allitems)
        {
            item.GroupSettings.ExpandDirection = PropertyExplorer.GetEnumValue<IGN.ExpandDirection>(menuGroupSettings.ExpandDirection, this.ExpandDirection.SelectedValue);
            item.GroupSettings.OffsetX = PropertyExplorer.GetNumericValue(this.SubMenuOffSetX.Text);
            item.GroupSettings.OffsetY = PropertyExplorer.GetNumericValue(this.SubMenuOffSetY.Text);
        }
    }

}