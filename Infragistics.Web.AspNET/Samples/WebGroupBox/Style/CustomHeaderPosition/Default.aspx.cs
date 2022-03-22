using System;
using System.Web.UI.WebControls;
using Infragistics.WebUI.Misc;

public partial class Samples_WebGroupBox_Style_Custom_Header_Position_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.DropDownList1.Items.Add(new ListItem((string)this.GetGlobalResourceObject("WebGroupBox", "GroupBox_Left"), "Left"));
            this.DropDownList1.Items.Add(new ListItem((string)this.GetGlobalResourceObject("WebGroupBox", "GroupBox_Center"), "Center"));
            this.DropDownList1.Items.Add(new ListItem((string)this.GetGlobalResourceObject("WebGroupBox", "GroupBox_Right"), "Right"));
        }

        Style style = new Style();
        style.CssClass = "groupBox";
        this.WebGroupBox1.ApplyStyle(style);
        this.WebGroupBox1.EnableAppStyling = Infragistics.WebUI.Shared.DefaultableBoolean.True;
        this.WebGroupBox1.Text = (string)this.GetGlobalResourceObject("WebGroupBox", "GroupBox_Header");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.WebGroupBox1.TitleAlignment = (TextAlignment)Enum.Parse(typeof(TextAlignment), this.DropDownList1.SelectedValue);
    }

}
