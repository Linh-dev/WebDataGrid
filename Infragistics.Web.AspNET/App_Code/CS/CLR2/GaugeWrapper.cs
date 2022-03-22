using System;
using System.Data;
using System.Configuration;
using System.Web.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Infragistics.WebUI.UltraWebGauge;
using Infragistics.UltraGauge.Resources;

namespace Infragistics.Guidance.Web
{
    /// <summary>
    /// This is a simple wrapper around the Gauge.  The purpose of this wrapper is simply to enable
    /// setting DeploymentScenario settings via the Web.config file.  We replace all Gauges with
    /// this wrapper by taking advantage of the "TagMapping" section of the web.config file
    /// </summary>
    public class GaugeWrapper : Infragistics.WebUI.UltraWebGauge.UltraGauge
    {
        public GaugeWrapper()
            : base()
        {
        }
        /// <summary>
        /// Override default OnLoad.  We can adjust the DeploymentScenario of the control here
        /// withouth overriding page_load level settings, but still overriding settings defined
        /// in the aspx, which are loaded during the control's init cycle.
        /// </summary>
        /// <param name="e"></param>
        protected override void OnLoad(EventArgs e)
        {

            //Check the scenario defined in the config file.
            string scenario = WebConfigurationManager.AppSettings["ResourceDeploymentScenario"];
            switch (scenario)
            {
                case "Session": //Use Session based scenario
                    //Change DeploymentMode
                    this.DeploymentScenario.Mode = ImageDeploymentMode.Session;
                    //Adjust ImagePipeUrl to value defined in Web.config
                    this.DeploymentScenario.ImagePipeURL = this.ResolveClientUrl("/samplesbrowser/Samples/WebGauge/Display/101Presets/GaugeImagePipe.aspx");
                    //this.DeploymentScenario.ImagePipeURL = this.ResolveClientUrl(WebConfigurationManager.AppSettings["GaugeImagePipeUrl"]);
                    break;
                case "File":
                    //Change deployment mode
                    this.DeploymentScenario.Mode = ImageDeploymentMode.FileSystem;
                    break;
                default:
                    //do nothing, let the control level settings take effect
                    break;
            }
            //call base functionality
            base.OnLoad(e);
        }
    }

    /// <summary>
    /// This is a simple wrapper around the Chart.  The purpose of this wrapper is simply to enable
    /// setting DeploymentScenario settings via the Web.config file.  We replace all Chart with
    /// this wrapper by taking advantage of the "TagMapping" section of the web.config file
    /// </summary>
    public class ChartWrapper : Infragistics.WebUI.UltraWebChart.UltraChart
    {
        public ChartWrapper():base()
        {
        }
        /// <summary>
        /// Override default OnLoad.  We can adjust the DeploymentScenario of the control here
        /// withouth overriding page_load level settings, but still overriding settings defined
        /// in the aspx, which are loaded during the control's init cycle.
        /// </summary>
        /// <param name="e"></param>
        protected override void OnLoad(EventArgs e)
        {
            //Check the scenario defined in the config file.
            string scenario = WebConfigurationManager.AppSettings["ResourceDeploymentScenario"];
            switch (scenario)
            {
                case "Session":
                    this.DeploymentScenario.Scenario = Infragistics.UltraChart.Shared.Styles.ImageDeploymentScenario.Session;
                    this.ImagePipePageName = this.ResolveClientUrl(WebConfigurationManager.AppSettings["ChartImagePipeUrl"]);
                    break;
                case "File":
                    this.DeploymentScenario.Scenario = Infragistics.UltraChart.Shared.Styles.ImageDeploymentScenario.FileSystem;
                    break;
                default:
                    break;
            }
            //Call base functionality
            base.OnLoad(e);
        }
    }

}