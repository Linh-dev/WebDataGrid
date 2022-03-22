using System;
using System.ComponentModel;
using System.Web.UI.WebControls;
using Infragistics.Web.UI;
using Infragistics.Web.UI.DisplayControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitValues();

            wpbOne.Value = 25;
            txtStartValue.Text = "25";

            DataBind();
        }
        else
        {
            SetValues();
        }
    }

    private void InitValues()
    {
        ddAnimationType.DataSource = Enum.GetNames(typeof(AnimationEquationType));
        ddFillMode.DataSource = Enum.GetNames(typeof(ProgressBarFillMode));
        ddFillDirection.DataSource = Enum.GetNames(typeof(ProgressBarFillDirection));
        ddLabelAlignment.DataSource = Enum.GetNames(typeof(ProgressBarLabelAlignment));
        ddOrientation.DataSource = Enum.GetNames(typeof(Orientation));

        System.ComponentModel.AttributeCollection attr;
        DefaultValueAttribute attribute;

        attr = TypeDescriptor.GetProperties(wpbOne)["AnimationType"].Attributes;
        attribute = (DefaultValueAttribute)attr[typeof(DefaultValueAttribute)];

        ddAnimationType.SelectedValue = attribute.Value.ToString();

        attr = TypeDescriptor.GetProperties(wpbOne)["FillMode"].Attributes;
        attribute = (DefaultValueAttribute)attr[typeof(DefaultValueAttribute)];

        ddFillMode.SelectedValue = attribute.Value.ToString();

        attr = TypeDescriptor.GetProperties(wpbOne)["FillDirection"].Attributes;
        attribute = (DefaultValueAttribute)attr[typeof(DefaultValueAttribute)];

        ddFillDirection.SelectedValue = attribute.Value.ToString();

        attr = TypeDescriptor.GetProperties(wpbOne)["LabelAlignment"].Attributes;
        attribute = (DefaultValueAttribute)attr[typeof(DefaultValueAttribute)];

        ddLabelAlignment.SelectedValue = attribute.Value.ToString();

        attr = TypeDescriptor.GetProperties(wpbOne)["Orientation"].Attributes;
        attribute = (DefaultValueAttribute)attr[typeof(DefaultValueAttribute)];

        ddOrientation.SelectedValue = attribute.Value.ToString();

        attr = TypeDescriptor.GetProperties(wpbOne)["AnimationDuration"].Attributes;
        attribute = (DefaultValueAttribute)attr[typeof(DefaultValueAttribute)];

        txtAnimationDuration.Value = attribute.Value;

        attr = TypeDescriptor.GetProperties(wpbOne)["AnimationThreshold"].Attributes;
        attribute = (DefaultValueAttribute)attr[typeof(DefaultValueAttribute)];

        txtAnimationThreshold.Value = attribute.Value;

        attr = TypeDescriptor.GetProperties(wpbOne)["LabelFormatString"].Attributes;
        attribute = (DefaultValueAttribute)attr[typeof(DefaultValueAttribute)];

        txtLabelFormat.Text = attribute.Value.ToString();

        attr = TypeDescriptor.GetProperties(wpbOne)["Maximum"].Attributes;
        attribute = (DefaultValueAttribute)attr[typeof(DefaultValueAttribute)];

        txtMaximum.Value = attribute.Value;

        attr = TypeDescriptor.GetProperties(wpbOne)["Minimum"].Attributes;
        attribute = (DefaultValueAttribute)attr[typeof(DefaultValueAttribute)];

        txtMinimum.Value = attribute.Value;

        attr = TypeDescriptor.GetProperties(wpbOne)["SnapInterval"].Attributes;
        attribute = (DefaultValueAttribute)attr[typeof(DefaultValueAttribute)];

        txtSnapInterval.Text = attribute.Value.ToString();
    }


    private void SetValues()
    {
        wpbOne.AnimationType = (AnimationEquationType)Enum.Parse(typeof(AnimationEquationType), ddAnimationType.SelectedValue);
        wpbOne.AnimationDuration = txtAnimationDuration.ValueInt;
        wpbOne.AnimationThreshold = txtAnimationThreshold.ValueDouble;
        wpbOne.FillDirection = (ProgressBarFillDirection)Enum.Parse(typeof(ProgressBarFillDirection), ddFillDirection.SelectedValue);
        wpbOne.FillMode = (ProgressBarFillMode)Enum.Parse(typeof(ProgressBarFillMode), ddFillMode.SelectedValue);
        wpbOne.LabelAlignment = (ProgressBarLabelAlignment)Enum.Parse(typeof(ProgressBarLabelAlignment), ddLabelAlignment.SelectedValue);
        wpbOne.LabelFormatString = txtLabelFormat.Text;
        wpbOne.Maximum = txtMaximum.ValueDouble;
        wpbOne.Minimum = txtMinimum.ValueDouble;
        wpbOne.Orientation = (Orientation)Enum.Parse(typeof(Orientation), ddOrientation.SelectedValue);

        try
        {
            wpbOne.SnapInterval = Unit.Parse(txtSnapInterval.Text);
        }
        catch (Exception)
        {
            Unit noPx = Unit.Pixel(0);
            wpbOne.SnapInterval = noPx;
            txtSnapInterval.Text = noPx.ToString();
        }

        wpbOne.Value = txtStartValue.ValueDouble;

        wpbOne.DataBind();
    }
}
