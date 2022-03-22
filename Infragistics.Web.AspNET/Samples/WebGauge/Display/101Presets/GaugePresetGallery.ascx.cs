using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class Samples_WebGauge_Display_101Presets_GaugePresetGallery : System.Web.UI.UserControl
{
    const bool USE_LIVE_IMAGES = false;
    static int i = 0;
    private string _PresetPathRelative;
    private Dictionary<string, Preset> _Presets;
    protected void Page_Load(object sender, EventArgs e)
    {
        this._PresetPathRelative = "/SamplesBrowser/SamplesCommon/aspnet/WebGauge/Display/101Presets/Presets/";
        if (!this.IsPostBack)
        {
            this.Repeater1.DataSource = this.Presets.Values;
            this.Repeater1.DataBind();
        }
    }
    private Dictionary<string, Preset> Presets
    {
        get
        {
            if (this._Presets == null)
            {
                //this._Presets = this.Page.Session["GaugePresets"] as Dictionary<string, Preset>;
                if (this._Presets == null)
                {
                    this._Presets = new Dictionary<string, Preset>();
                    this.LoadPresets(this._PresetPathRelative + "standard/", this._Presets);
                    //this.Page.Session.Add("GaugePresets", this._Presets);
                }
            }
            return this._Presets;
        }
    }
    private void LoadPresets(string directory, Dictionary<string, Preset> collection)
    {
        DirectoryInfo presetDir = new DirectoryInfo(this.Page.MapPath(directory));
        FileInfo[] presetFiles = presetDir.GetFiles("*.xml");
        Infragistics.WebUI.UltraWebGauge.UltraGauge dummyGauge = new Infragistics.WebUI.UltraWebGauge.UltraGauge();
        foreach (FileInfo currentPresetFile in presetFiles)
        {
            Infragistics.WebUI.Util.Serialization.PresetInfo info = Infragistics.WebUI.Util.Serialization.PresetInfo.LoadFromXml(currentPresetFile, dummyGauge);
            this._Presets.Add(info.Name, new Preset(info.Name, this.Page.ResolveClientUrl(directory + currentPresetFile.Name), this.Page.ResolveClientUrl(directory + currentPresetFile.Name.Replace(".xml", ".png"))));
        }

    }
    protected void CreateItem(object sender, RepeaterItemEventArgs e)
    {
        //IF you want to use Live Images, you must add a gauge control to the Repeater ItemTemplate
        //The gauge has been removed from the template by default, and static images are used instead
        if (USE_LIVE_IMAGES) //Create 101 Gauge Thumbnails
        {
            Infragistics.WebUI.UltraWebGauge.UltraGauge gauge = e.Item.FindControl("Gauge") as Infragistics.WebUI.UltraWebGauge.UltraGauge;
            if (gauge != null)
            {
                gauge.LoadPreset(this.Page.MapPath(((Label)e.Item.FindControl("Link")).ToolTip), false);

                Infragistics.UltraGauge.Resources.LinearGauge linearGauge = gauge.Gauges[0] as Infragistics.UltraGauge.Resources.LinearGauge;
                if (linearGauge != null && linearGauge.Orientation == Infragistics.UltraGauge.Resources.LinearOrientation.Vertical)
                {
                    double ratio = gauge.Height.Value / gauge.Width.Value;
                    gauge.Height = Unit.Pixel((int)(50 * ratio));
                    gauge.Width = Unit.Pixel(50);
                }
                else
                {
                    double ratio = gauge.Width.Value / gauge.Height.Value;
                    gauge.Width = Unit.Pixel((int)(50 * ratio));
                    gauge.Height = Unit.Pixel(50);
                }

                //Since we're output caching this usercontrol, we must hold on to the gauage
                //images, which means we can't have the Gauge clean up after itself.
                //We'll set DeleteOldImages=false, to prevent the Gauge from deleting images
                //that are still referenced in the output cached page.
                //gauge.DeploymentScenario.DeleteOldImages = false;
            }
        }
        else //use static images
        {
            //We don't need to do anything special here
        }

    }
    #region Helper Objects [Preset]
    class Preset
    {
        private string _Name;
        private string _Path;
        private string _ThumbnailUrl;
        public Preset(string name, string path, string thumb)
        {
            this._ThumbnailUrl = thumb;
            this._Name = name;
            this._Path = path;
        }
        public string ThumbnailUrl
        {
            get
            {
                return this._ThumbnailUrl;
            }
            set
            {
                this._ThumbnailUrl = value;
            }
        }
        public string Name
        {
            get
            {
                return this._Name;
            }
        }
        public string Path
        {
            get
            {
                return this._Path;
            }
        }

    }
    #endregion
}