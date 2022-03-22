using System;
using Infragistics.Web.UI;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Organization_Filtering_Basic_Features_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
    }

    protected void DataSourceInit(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
    }

    protected void AlignmentTop_CheckedChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.Filtering.Alignment = FilteringAlignment.Top;
    }

    protected void AlignmentBottom_CheckedChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.Filtering.Alignment = FilteringAlignment.Bottom;
    }

    protected void Visibility_CheckedChanged(object sender, EventArgs e)
    {
        if (this.Visibility.Checked)
        {
            this.WebDataGrid1.Behaviors.Filtering.Visibility = FilteringVisibility.Visible;
        }
        else
        {
            this.WebDataGrid1.Behaviors.Filtering.Visibility = FilteringVisibility.Hidden;
        }
    }

    protected void Animation_CheckedChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.Filtering.AnimationEnabled = this.Animation.Checked;
    }

    protected void AnimationType_SelectedIndexChanged(object sender, EventArgs e)
    {
        AnimationEquationType selectedAnimationEquationType = AnimationEquationType.Bounce;

        switch (this.AnimationType.SelectedValue)
        {
            case "Bounce":
                selectedAnimationEquationType = AnimationEquationType.Bounce;
                break;
            case "EaseIn":
                selectedAnimationEquationType = AnimationEquationType.EaseIn;
                break;
            case "EaseInOut":
                selectedAnimationEquationType = AnimationEquationType.EaseInOut;
                break;
            case "EaseOut":
                selectedAnimationEquationType = AnimationEquationType.EaseOut;
                break;
            case "Linear":
                selectedAnimationEquationType = AnimationEquationType.Linear;
                break;

        }

        this.WebDataGrid1.Behaviors.Filtering.AnimationType = selectedAnimationEquationType;
    }

    protected void AnimationDuration_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.WebDataGrid1.Behaviors.Filtering.AnimationDurationMs = int.Parse(this.AnimationDuration.SelectedValue);
    }
}
