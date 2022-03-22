using System;
using Infragistics.Web.UI.Framework;
using Infragistics.Web.UI.Framework.Persistence;
using System.Web.UI;
using System.Web;
using System.IO;

namespace PersistenceFrameworkSettings
{
    public class Global : System.Web.HttpApplication
    {
        // <!--#BEGIN SNIPPET#-->
        void Application_Start(object sender, EventArgs e)
        {
            AppSettings.PersistenceManager.PersistenceLoading += this.PersistenceLoading;
            AppSettings.PersistenceManager.PersistenceLoaded += this.PersistenceLoaded;
            AppSettings.PersistenceManager.PersistenceSaving += this.PersistenceSaving;
            AppSettings.PersistenceManager.PersistenceSaved += this.PersistenceSaved;
        }
        // <!--#END SNIPPET#-->

        void PersistenceLoading(object sender, PersistenceLoadingEventArgs e)
        {
            string filePath = this.GetPersistenceFilePath(e.Page);

            if (!File.Exists(filePath))
            {
                return;
            }

            using (FileStream fileStream = File.OpenRead(filePath))
            {
                e.PersistenceData = PersistenceData.FromStream(fileStream);
            }
        }

        void PersistenceLoaded(object sender, PersistenceEventArgs e)
        {
        }

        void PersistenceSaving(object sender, PersistenceSavingEventArgs e)
        {
        }

        private void PersistenceSaved(object sender, PersistenceEventArgs e)
        {
            if (e.PersistenceData == null)
            {
                return;
            }

            string filePath = this.GetPersistenceFilePath(e.Page);

            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }

            string directory = Path.GetDirectoryName(filePath);
            if (!Directory.Exists(directory))
            {
                Directory.CreateDirectory(directory);
            }

            using (FileStream fileStream = File.Create(filePath))
            {
                e.PersistenceData.ToStream(fileStream);
            }
        }

        private string GetPersistenceFilePath(Page page)
        {
            string userName = (HttpContext.Current.User.Identity.IsAuthenticated)
                        ? HttpContext.Current.User.Identity.Name
                        : page.Request.ServerVariables["REMOTE_ADDR"];
            return string.Format("{0}.{1}",
                        userName.Replace('\\', '.'),
                        page.GetType().FullName);
        }
    }
}