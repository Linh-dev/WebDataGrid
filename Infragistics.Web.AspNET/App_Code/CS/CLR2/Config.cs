using System.Configuration;
using Infragistics.Web.SampleBrowser.Core.Framework.DataAccess;

namespace WebSamplesCS
{
    /// <summary>
    /// Summary description for Config.
    /// </summary>
    public class Config
    {
        public static string GetApplicationRoot(System.Web.HttpRequest req)
        {
            string theApplicationRoot = "http://" + req.ServerVariables["SERVER_NAME"];
            if (req.ServerVariables["SERVER_PORT"] != null && req.ServerVariables["SERVER_PORT"].Length > 0 && req.Url.Port != 80)
            {
                theApplicationRoot += ":" + req.ServerVariables["SERVER_PORT"];
            }
            theApplicationRoot += req.ServerVariables["URL"];

            theApplicationRoot = theApplicationRoot.Substring(0, theApplicationRoot.LastIndexOf("/") + 1);
            return theApplicationRoot;
        }
        private const string ACCESS_CONN_STRING = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=@FILEPATH;";

        /// <summary>
        /// This returns the Path where the Chart Custom Dial Images are located. 
        /// </summary>
        public static string ChartDialImagePath
        {
            get
            {
                return ConfigurationSettings.AppSettings["DataPath"] + @"DialImages\";
            }
        }

        /// <summary>
        /// Returns the directory wherever the Presets are installed
        /// </summary>
        public static string PathToPreset
        {
            get
            {
                return System.Web.HttpContext.Current.Server.MapPath(ConfigurationSettings.AppSettings["PresetPath"]);
            }
        }

        /// <summary>
        /// Returns the directory wherever the Data is installed
        /// </summary>
        public static string DataPath
        {
            get
            {
                return System.Web.HttpContext.Current.Server.MapPath(ConfigurationSettings.AppSettings["DataPath"]);
            }
        }
        public static bool UseAccess
        {
            get
            {
                return string.Compare("Access", ConfigurationSettings.AppSettings["DatabaseMode"], true) == 0;
            }
        }
        public static bool UseSQL
        {
            get
            {
                return !Config.UseAccess;
            }
        }
        public static string AgentManagementMDBPath
        {
            get
            {
                return Config.DataPath + "agentmanagement.mdb";
            }
        }
        public static string AgentManagementMDBConnString
        {
            get
            {
                return ACCESS_CONN_STRING.Replace("@FILEPATH", AgentManagementMDBPath);
            }
        }
        public static string SamplebrowserMDBPath
        {
            get
            {
                return (Config.DataPath + "FeatureBrowserTOC.mdb");
            }
        }
        ///// <summary>
        ///// This returns the Connection String for the Access DB "samplebrowser.mdb" that should be located
		///// in the latest installation directory of Infragistics ASP.NET.
        ///// </summary>
        //public static string SamplebrowserMDBConnString
        //{
        //    get
        //    {
        //        return ACCESS_CONN_STRING.Replace("@FILEPATH", (Config.DataPath + "FeatureBrowserTOC.mdb"));
        //    }
        //}
        public static string MessagingSampleMDBConnString
        {
            get
            {
                return ACCESS_CONN_STRING.Replace("@FILEPATH", (Config.DataPath + "MessagingSample.mdb"));
            }
        }
        /// <summary>
        /// This returns the Connection String for the Access DB "ChartDataBase.mdb" that should be located
		/// in the latest installation directory of Infragistics ASP.NET. 
        /// </summary>
        public static string ChartMDBConnString
        {
            get
            {
                
              //  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage sp = new Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage();
                return new DataRepository().GetMdbConnectionString(("ChartDataBase.mdb"));
            }
        }

        /// <summary>
        /// This returns the Connection String for the Access DB "NWind.mdb" that should be located
		/// in the latest installation directory of Infragistics ASP.NET. 
        /// </summary>
        public static string NorthwindMDBConnString
        {
            get
            {
				return new DataRepository().GetMdbConnectionString("NWind.mdb");
            }
        }

        /// <summary>
        /// This returns the Connection String for the Access DB "NWind.mdb" that should be located
		/// in the latest installation directory of Infragistics ASP.NET. 
        /// </summary>
        public static string ContactMDBConnString
        {
            get
            {
				return new DataRepository().GetMdbConnectionString("Contact.mdb");
            }
        }

        /// <summary>
        /// This returns the Connection String for the Access DB "WebSchedule1.mdb" that should be located
		/// in the latest installation directory of Infragistics ASP.NET. 
        /// </summary>
        public static string WebScheduleMDBConnString
        {
            get
            {
				return new DataRepository().GetMdbConnectionString("WebScheduleSample.mdb");
            }
        }

        /// <summary>
        /// This returns the Path where the WebSchedule Custom Provider XML Data File is located. 
        /// </summary>
        public static string WebScheduleCustomDataFilePath
        {
            get
            {
                return Config.DataPath + @"webshedule_custom_data.xml";
            }
        }

        /// <summary>
        /// This returns the Path where the WebSchedule Custom Provider XML Data File is located. 
        /// </summary>
        public static string WebScheduleCSSPath
        {
            get
            {
                string thePath = System.Configuration.ConfigurationSettings.AppSettings["CssPath"];

                if (thePath == null)
                {
                    //thePath = "http://localhost/ig_common/" + WebScheduleSamples.Util.VOL + "/Styles/";
                }
                return thePath;
            }
        }

        /// <summary> 
        /// This dermines if we want to show the Description for each page, which is located in a collapsable 
        /// Group Panel
        /// </summary>
        public static bool ShowDescription
        {
            get { return bool.Parse(ConfigurationSettings.AppSettings["ShowDescription"]); }
        }

        /// <summary>
        /// This dermines if we want to show the C# and VB Source Code tabs.
        /// </summary>
        public static bool ShowSourceCodeTabs
        {
            get { return bool.Parse(ConfigurationSettings.AppSettings["ShowSourceCodeTabs"]); }
        }


        /// <summary>
        /// This property is used to allow / disallow features and functionality that would
        /// otherwise be harmful on a live production web site. For example, You can use this
        /// property to stop any Database updating to take place on a live production server
        /// as to avoid any malicious data entry from the public.
        /// </summary>
        public static bool IsLockdownMode
        {
            get
            {
                bool retVal = false;
                if (ConfigurationSettings.AppSettings["IsLockDownMode"] != null)
                {
                    retVal = bool.Parse(ConfigurationSettings.AppSettings["IsLockDownMode"]);
                }
                return retVal;
            }
        }


        /// <summary> 
        /// This shows which is the current CLR version of the samples 
        /// </summary>
        public static string CurrentCLRVersion
        {
            get { return ConfigurationSettings.AppSettings["CurrentCLR"]; }
        }

    }
}