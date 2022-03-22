using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using Infragistics.Web.UI.Framework;
using Infragistics.Web.UI.Framework.Persistence;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected bool IsSubscribed
    {
        get { return Convert.ToBoolean(Session["isSubscribed"]); }
        set { Session["isSubscribed"] = value; }
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        AppSettings.EnablePersistence = true;
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!IsSubscribed)
            {
                AppSettings.PersistenceManager.PersistenceLoading += this.Persistence_Loading;
                AppSettings.PersistenceManager.PersistenceSaved += this.Persistence_Saved;
                IsSubscribed = true;
            }
        }
    }

    void Persistence_Loading(object sender, PersistenceLoadingEventArgs e)
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

    protected void btnSearchJob_Click(object sender, EventArgs e)
    {
        if (wtePass.Text == wteConfPass.Text)
        {
            lblJob.Visible = true;
            lblWrongPass.Visible = false;
        }
        else
        {
            lblJob.Visible = false;
            lblWrongPass.Visible = true;
        }
    }

    // <!--#BEGIN SNIPPET#-->
    protected void Persistence_Saved(object sender, PersistenceEventArgs e)
    {
        if (e.PersistenceData == null)
        {
            return;
        }

        List<string> ignoredControls = new List<string>();
        ignoredControls.Add(this.wteUser.ID);
        ignoredControls.Add(this.wceSallary.ID);

        PersistenceData data = e.PersistenceData;
        ControlData controlToRemove = null;
        int countControls = data.Controls.Count;

        foreach (string ignoredControlID in ignoredControls)
        {
            controlToRemove = data.Controls.Find(delegate(ControlData controlToFind)
            {
                return controlToFind.ControlId == ignoredControlID;
            });
            if (controlToRemove != null)
            {
                data.Controls.Remove(controlToRemove);
                controlToRemove = null;
            }
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
            data.ToStream(fileStream);
        }
    }
    // <!--#END SNIPPET#-->

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
