using System;
using System.Web.UI.WebControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        wizOne.SideBarButtonClick += new WizardNavigationEventHandler(wizOne_SideBarButtonClick);
        wizOne.FinishButtonClick += new WizardNavigationEventHandler(wizOne_FinishButtonClick);
    }

    void wizOne_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        lblEmail.Text = emailaddress.Text;
        lblName.Text = name.Text;
        lblAddress.Text = address.Text;
        lblCity.Text = city.Text;
        lblState.Text = state.Text;
        lblPostalCode.Text = postalcode.Text;
        lblPhone.Text = phone.Text;
        lblFax.Text = fax.Text;
        litComments.Text = comments.Text;
    }

    void wizOne_SideBarButtonClick(object sender, WizardNavigationEventArgs e)
    {
        e.Cancel = true;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
    }
}
