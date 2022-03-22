using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DDList1.Enabled = this.EnableScrollingCheckBox.Checked;
        Page.Session["DDListSelection"] = this.DDList1.SelectedItem.Value;
        Page.Session["EnableScrolling"] = this.EnableScrollingCheckBox.Checked;
        Page.Session["Orientation"] = this.OrientationDropDownList.SelectedItem.Value;
        Page.Session["ScrollingSpeed"] = this.ScrollingSpeedList.SelectedItem.Value;
        Page.Session["ActivateOnHover"] = this.EnableScrollingCheckBox.Checked;
        HtmlControl frame = MainIFrame as HtmlControl;
        frame.Attributes["src"] = this.ResolveUrl("IEWebDataMenu.aspx");
        switch (Convert.ToInt32(this.FrameSizeDropDownList.SelectedItem.Value))
        {
            case 1:
                {
                    if (Convert.ToInt32(this.OrientationDropDownList.SelectedItem.Value) == 2)
                    {
                        this.DDList1.Items[1].Selected = false;
                        this.DDList1.Items[2].Selected = false;
                        this.DDList1.Items[3].Selected = false;
                        this.DDList1.Items[0].Selected = true;
                        Page.Session["DDListSelection"] = this.DDList1.SelectedItem.Value;
                    }
                    this.WebDialogWindow1.Height = new Unit("250px");
                    this.Panel1.Height = new Unit("250px");
                    frame.Attributes["Width"] = "300px";
                    frame.Attributes["Height"] = "150px";
                    break;
                }

            case 2:
                {
                    this.WebDialogWindow1.Height = new Unit("360px");
                    this.Panel1.Height = new Unit("360px");
                    frame.Attributes["Width"] = "400px";
                    frame.Attributes["Height"] = "280px";
                    break;
                }

            case 3:
                {
                    this.WebDialogWindow1.Height = new Unit("430px");
                    this.Panel1.Height = new Unit("430px");
                    frame.Attributes["Width"] = "500px";
                    frame.Attributes["Height"] = "350px";
                    break;
                }
        }
        switch (Convert.ToBoolean(this.EnableScrollingCheckBox.Checked))
        {
            case true:
                {
                    this.ScrollingLabel.Visible = false;                    
                    frame.Attributes["scrolling"] = "no";
                    break;
                }
            case false:
                {
                    this.ScrollingLabel.Visible = true;
                    frame.Attributes["Height"] = "400px";
                    frame.Attributes["scrolling"] = "yes";
                    break;
                }
        }

    }
}