using System;
using System.Data;
using System.Web.UI.WebControls;
using Infragistics.Web.UI.GridControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //A group
        DataSet dsA = new DataSet();
        dsA.ReadXml(Server.MapPath(this.GetXmlLocation("CountriesA.xml")));

        DataTable dtA = dsA.Tables["Country"];

        WebDataGrid_CountriesA.DataSource = dsA;
        WebDataGrid_CountriesA.DataBind();

        //B group
        DataSet dsB = new DataSet();
        dsB.ReadXml(Server.MapPath(this.GetXmlLocation("CountriesB.xml")));

        DataTable dtB = dsB.Tables["Country"];

        WebDataGrid_CountriesB.DataSource = dsB;
        WebDataGrid_CountriesB.DataBind();

        //C group
        DataSet dsC = new DataSet();
        dsC.ReadXml(Server.MapPath(this.GetXmlLocation("CountriesC.xml")));

        DataTable dtC = dsC.Tables["Country"];

        WebDataGrid_CountriesC.DataSource = dsC;
        WebDataGrid_CountriesC.DataBind();

        //D group
        DataSet dsD = new DataSet();
        dsD.ReadXml(Server.MapPath(this.GetXmlLocation("CountriesD.xml")));

        DataTable dtD = dsD.Tables["Country"];

        WebDataGrid_CountriesD.DataSource = dsD;
        WebDataGrid_CountriesD.DataBind();

        //E group
        DataSet dsE = new DataSet();
        dsE.ReadXml(Server.MapPath(this.GetXmlLocation("CountriesE.xml")));

        DataTable dtE = dsE.Tables["Country"];

        WebDataGrid_CountriesE.DataSource = dsE;
        WebDataGrid_CountriesE.DataBind();

        //F group
        DataSet dsF = new DataSet();
        dsF.ReadXml(Server.MapPath(this.GetXmlLocation("CountriesF.xml")));

        DataTable dtF = dsF.Tables["Country"];

        WebDataGrid_CountriesF.DataSource = dsF;
        WebDataGrid_CountriesF.DataBind();

        //G group
        DataSet dsG = new DataSet();
        dsG.ReadXml(Server.MapPath(this.GetXmlLocation("CountriesG.xml")));

        DataTable dtG = dsG.Tables["Country"];

        WebDataGrid_CountriesG.DataSource = dsG;
        WebDataGrid_CountriesG.DataBind();

        //H group
        DataSet dsH = new DataSet();
        dsH.ReadXml(Server.MapPath(this.GetXmlLocation("CountriesH.xml")));

        DataTable dtH = dsH.Tables["Country"];

        WebDataGrid_CountriesH.DataSource = dsH;
        WebDataGrid_CountriesH.DataBind();
    }

    protected void WebDataGrid_Countries_InitializeRow(object sender, RowEventArgs e)
    {
        HiddenField hf = (HiddenField)e.Row.Items[0].FindControl("hf_CountryID");
        Image img = (Image)e.Row.Items[0].FindControl("img_CountryID");
        img.ImageUrl = "/SamplesBrowser/SamplesCommon/aspnet/WebRating/EditingAndSelection/DisplayAverages/" + hf.Value + ".png";
    }
}
