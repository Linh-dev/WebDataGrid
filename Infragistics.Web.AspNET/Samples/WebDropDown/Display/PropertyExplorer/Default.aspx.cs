using System;
using System.Web.UI.WebControls;
using Infragistics.Web.UI.ListControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        this.DefaultDataSource.DataFile = this.GetMdbLocation("Nwind.mdb");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitialValues();
            DataBind();
            this.WebDropDown1.CurrentValue = "";
        }
        else
        {
            SetValues();
        }
    }

    private void InitialValues()
    {
        ddOrientationType.DataSource = Enum.GetNames(typeof(DropDownOrientation));
        ddDisplayMode.DataSource = Enum.GetNames(typeof(DropDownDisplayMode));
        ddAnimationType.DataSource = Enum.GetNames(typeof(DropDownAnimationTypes));

        txtOffSetX.Text = "0";
        txtOffSetY.Text = "0";
        txtDropDownContainerHeight.Text = "200";
        txtDropDownContainerMaxHeight.Text = "200";
        txtDropDownContainerWidth.Text = "250";

        ddOrientationType.SelectedValue = "Default";
        ddDisplayMode.SelectedValue = "DropDown";
        ddAnimationDuration.SelectedValue = "2000";
        ddAnimationType.SelectedValue = "EaseOut";


        this.WebDropDown1.DisplayMode = DropDownDisplayMode.DropDown;
        this.WebDropDown1.DropDownAnimationDuration = 2000;
        this.WebDropDown1.DropDownAnimationType = DropDownAnimationTypes.EaseOut;
        this.WebDropDown1.DropDownOrientation = DropDownOrientation.Default;

        this.WebDropDown1.DropDownOffsetX = 0;
        this.WebDropDown1.DropDownOffsetY = 0;

        this.WebDropDown1.EnableAnimations = true;
        this.WebDropDown1.EnableCaseSensitivity = true;
        this.WebDropDown1.EnableAutoCompleteFirstMatch = true;
        this.WebDropDown1.DropDownContainerHeight = Unit.Pixel(200);
        this.WebDropDown1.DropDownContainerMaxHeight = Unit.Pixel(200);
        this.WebDropDown1.DropDownContainerWidth = Unit.Pixel(250);


        this.WebDropDown1.AutoSelectOnMatch = false;

    }

    private void SetValues()
    {
        this.WebDropDown1.DisplayMode = (DropDownDisplayMode)Enum.Parse(typeof(DropDownDisplayMode), ddDisplayMode.SelectedValue);
        this.WebDropDown1.DropDownAnimationDuration = int.Parse(ddAnimationDuration.SelectedValue);
        this.WebDropDown1.DropDownAnimationType = (DropDownAnimationTypes)Enum.Parse(typeof(DropDownAnimationTypes), ddAnimationType.SelectedValue);
        this.WebDropDown1.DropDownOrientation = (DropDownOrientation)Enum.Parse(typeof(DropDownOrientation), ddOrientationType.SelectedValue);

        this.WebDropDown1.EnableAnimations = chkAnimations.Checked;
        this.WebDropDown1.EnableCaseSensitivity = chkCaseSensitivity.Checked;
        this.WebDropDown1.EnableAutoCompleteFirstMatch = chkAutoCompleteFirstMatch.Checked;
        this.WebDropDown1.AutoSelectOnMatch = chkAutoSelectOnMatch.Checked;

        int x_value, y_value, container_height, container_max_height, container_width, page_size;

        if (!int.TryParse(txtOffSetX.Text, out x_value))
        {
            x_value = 0;
        }

        if (!int.TryParse(txtOffSetY.Text, out y_value))
        {
            y_value = 0;
        }

        if (!int.TryParse(txtDropDownContainerHeight.Text, out container_height))
        {
            container_height = (int)this.WebDropDown1.Width.Value;
        }

        if (!int.TryParse(txtDropDownContainerMaxHeight.Text, out container_max_height))
        {
            container_max_height = 0;
        }

        if (!int.TryParse(txtDropDownContainerWidth.Text, out container_width))
        {
            container_width = 0;
        }

        this.WebDropDown1.DropDownOffsetX = x_value;
        this.WebDropDown1.DropDownOffsetY = y_value;

        this.WebDropDown1.DropDownContainerHeight = Unit.Pixel(container_height);
        this.WebDropDown1.DropDownContainerMaxHeight = Unit.Pixel(container_max_height);
        this.WebDropDown1.DropDownContainerWidth = Unit.Pixel(container_width);

    }
}