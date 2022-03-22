using System;
using System.IO;
using System.Web;
using System.Web.UI;
using Infragistics.Web.UI.Framework;
using Infragistics.Web.UI.Framework.Persistence;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    // <!--#BEGIN SNIPPET#-->
    private string _userIPAdress = String.Empty;
    private string _userSessionIDFromCookie = String.Empty;
    // <!--#END SNIPPET#-->

    protected bool IsSubscribed
    {
        get { return Convert.ToBoolean(Application["isSubscribed"]); }
        set { Application["isSubscribed"] = value; }
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        AppSettings.EnablePersistence = true;
    }

    // <!--#BEGIN SNIPPET#-->
    protected void Page_Init(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!IsSubscribed)
            {
                AppSettings.PersistenceManager.PersistenceLoading += this.PersistenceLoading;
                AppSettings.PersistenceManager.PersistenceSaved += this.PersistenceSaved;
                IsSubscribed = true;
            }


            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                this._userIPAdress =  this.Request.ServerVariables["REMOTE_ADDR"];

                HttpCookie cookie = Request.Cookies["UserName"];
                if (cookie == null)
                {
                    cookie = new HttpCookie("UserName");
                    cookie.Value = Session.SessionID;
                    cookie.Expires = DateTime.Now.AddHours(1);
                    Response.Cookies.Add(cookie);
                }
                _userSessionIDFromCookie = cookie.Value;
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

    // <!--#BEGIN SNIPPET#-->
    private string GetPersistenceFilePath(Page page)
    {
        string uniqueName = (this.wddAuth.SelectedValue == "0")
                        ? this._userIPAdress 
                        : this._userSessionIDFromCookie;
        string filePath = Server.MapPath(@"~\Temp\Persistence\");
        string userName = (HttpContext.Current.User.Identity.IsAuthenticated)
                        ? HttpContext.Current.User.Identity.Name
                        : page.Request.ServerVariables["REMOTE_ADDR"];
        string fileName = String.Format("{0}_{1}",
                    userName.Replace('\\', '.').Replace(":", "_"),
                    page.GetType().FullName);
        return String.Format("{0}{1}.xml", filePath, fileName);
    }
    // <!--#END SNIPPET#-->
}
