using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Samples_WebGauge_Display_101Presets_PresetViewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string presetPath = System.Web.HttpUtility.UrlDecode(this.Page.Request.QueryString["preset"]);
        if (string.IsNullOrEmpty(presetPath))
        {
            //No Preset file.. don't do anything
        }
        else
        {
            //It is not generally a good idea to load arbitrary file paths based on a query string url
            //A malicious user could mainpulate this code into loading files from the file system
            //other than the presets.  It is good to atleast ensure that the path somewhat matches
            //what you expect...
            if (!presetPath.ToLower().StartsWith("/samplesbrowser/samplescommon/aspnet/webgauge/display/101presets/presets/"))
            {
                throw new ArgumentException("The path specified is outside of the expected folder.");
            }
            this.Link.NavigateUrl = String.Format("WebGaugeXMLViewHandler.ashx?xmlDocPath={0}", presetPath);
            this.Gauge.LoadPreset(this.Page.MapPath(presetPath), true);
            this.Gauge.DeploymentScenario.Mode = Infragistics.UltraGauge.Resources.ImageDeploymentMode.Session;
			this.Gauge.DeploymentScenario.ImagePipeURL = this.ResolveUrl("GaugeImagePipe.aspx");
        }
    }
}