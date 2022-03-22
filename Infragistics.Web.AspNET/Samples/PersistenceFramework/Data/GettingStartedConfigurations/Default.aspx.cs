using System;
using System.IO;
using System.Web;
using System.Web.UI;
using Infragistics.Web.UI.Framework;
using Infragistics.Web.UI.Framework.Persistence;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected bool IsSubscribed
    {
        get { return Convert.ToBoolean(Session["isSubscribed"]); }
        set { Session["isSubscribed"] = value; }
    }

    protected void wdg1_Init(object sender, EventArgs e)
    {
        this.adsProduct.DataFile = this.GetMdbLocation("Nwind.mdb");
    }

    // <!--#BEGIN SNIPPET#-->
    protected void Page_PreInit(object sender, EventArgs e)
    {
        // Enable Persistence manually for the current page. 
        // The other option is to set it globally in the web.config file. 
        // Then it will work automatically for all the pages.
        AppSettings.EnablePersistence = true;
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!this.IsSubscribed)
            {
                AppSettings.PersistenceManager.PersistenceLoading += this.PersistenceLoading;
                AppSettings.PersistenceManager.PersistenceLoaded += this.PersistenceLoaded;
                AppSettings.PersistenceManager.PersistenceSaving += this.PersistenceSaving;
                AppSettings.PersistenceManager.PersistenceSaved += this.PersistenceSaved;
                IsSubscribed = true;
            }
        }
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
        string filePath = Server.MapPath(@"~\Temp\Persistence\");
        string userName = (HttpContext.Current.User.Identity.IsAuthenticated)
                        ? HttpContext.Current.User.Identity.Name
                        : page.Request.ServerVariables["REMOTE_ADDR"];
        string fileName = String.Format("{0}_{1}",
                    userName.Replace('\\', '.').Replace(":", "_"),
                    page.GetType().FullName);
        return String.Format("{0}{1}.xml", filePath, fileName);
    }
}