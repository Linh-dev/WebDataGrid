using System;
using System.Drawing;
using System.Web.UI.WebControls;

public partial class Samples_WebResizingExtender_Display_Customization_Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private const int MAX_WIDTH = 500;
    private const int MAX_HEIGHT = 480;
    protected const int MIN_WIDTH = 150;
    protected const int MIN_HEIGHT = 100;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.DropDownList1.Items.Add(this.GetGlobalResourceObject("WebResizingExtender","Transparent").ToString());
            this.DropDownList1.Items.Add(this.GetGlobalResourceObject("WebResizingExtender", "Green_Dots").ToString());
            this.DropDownList1.Items.Add(this.GetGlobalResourceObject("WebResizingExtender", "Coarse_Dots").ToString());
            this.DropDownList1.Items.Add(this.GetGlobalResourceObject("WebResizingExtender", "Fine_Dots").ToString());
            this.DropDownList1.Items.Add(this.GetGlobalResourceObject("WebResizingExtender", "Brown_Angle").ToString());
            this.DropDownList1.Items.Add(this.GetGlobalResourceObject("WebResizingExtender", "Blue_Angle").ToString());
        }

        this.WebResizingExtender1.HandleImage = String.Format("/SamplesBrowser/SamplesCommon/aspnet/WebResizingExtender/Display/Customization/Handle{0}.gif", this.DropDownList1.SelectedIndex + 1);

        AssignBoundaries();

        this.WidthTextBox.Attributes.Add("onfocus", String.Format("onTextBoxFocus('{0}');", this.WidthTextBox.ClientID));
        this.HeightTextBox.Attributes.Add("onfocus", String.Format("onTextBoxFocus('{0}');", this.HeightTextBox.ClientID));
    }

    private void AssignBoundaries()
    {
        int chosenWidth, chosenHeight;
        bool widthWarn = false; bool heightWarn = false;

        if (!int.TryParse(this.WidthTextBox.Text, out chosenWidth))
        {
            chosenWidth = MAX_WIDTH;
            widthWarn = true;
        }
        if (!int.TryParse(this.HeightTextBox.Text, out chosenHeight))
        {
            chosenHeight = MAX_HEIGHT;
            heightWarn = true;
        }

        if (chosenWidth < MIN_WIDTH || chosenWidth > MAX_WIDTH)
        {
            chosenWidth = MAX_WIDTH;
            widthWarn = true;
        }

        if (chosenHeight < MIN_HEIGHT || chosenHeight > MAX_HEIGHT)
        {
            chosenHeight = MAX_HEIGHT;
            heightWarn = true;
        }

        this.WebResizingExtender1.MaximumWidth = chosenWidth;
        this.WebResizingExtender1.MaximumHeight = chosenHeight;

        this.WidthTextBox.Text = chosenWidth.ToString();
        this.HeightTextBox.Text = chosenHeight.ToString();

        this.Container.Style.Add("width", new Unit(chosenWidth).ToString());
        this.Container.Style.Add("height", new Unit(chosenHeight).ToString());

        this.HeightTextBox.ForeColor = heightWarn ? Color.Red : Color.Black;
        this.WidthTextBox.ForeColor = widthWarn ? Color.Red : Color.Black;
    }
}
