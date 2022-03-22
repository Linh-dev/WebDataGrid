using System;
using System.IO;
using System.Web;
using System.Web.UI;
using Infragistics.Web.UI.Framework;
using Infragistics.Web.UI.Framework.Persistence;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private string _userIPAdress = String.Empty;

    private bool IsSubscribed
    {
        get { return Convert.ToBoolean(Session["isSubscribed"]); }
        set { Session["isSubscribed"] = value; }
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        AppSettings.EnablePersistence = true;
    }

    protected void whdg1_Init(object sender, EventArgs e)
    {
        this.adsParent.DataFile = this.GetMdbLocation("Nwind.mdb");
        this.adsChild.DataFile = this.GetMdbLocation("Nwind.mdb");
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        if (!Page.IsPostBack && !IsSubscribed)
        {
            AppSettings.PersistenceManager.PersistenceLoading += this.PersistenceLoading;
            AppSettings.PersistenceManager.PersistenceSaved += this.PersistenceSaved;
            IsSubscribed = true;
        }
        this.chkShowHeader.Checked = true;
        this.chkShowBandHeader.Checked = true;
    }

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

    protected void chkShowHeader_CheckedChanged(object sender, EventArgs e)
    {
        bool childState = true;
        if (this.whdg1.Bands.Count > 0)
        {
            childState = this.whdg1.Bands[0].ShowHeader;
        }
        this.whdg1.ShowHeader = this.chkShowHeader.Checked;
        if (this.whdg1.Bands.Count > 0)
        {
            this.whdg1.Bands[0].ShowHeader = childState;
        }
    }

    protected void chkShowFooter_CheckedChanged(object sender, EventArgs e)
    {
        bool childState = false;
        if (this.whdg1.Bands.Count > 0)
        {
            childState = this.whdg1.Bands[0].ShowFooter;
        }
        this.whdg1.ShowFooter = this.chkShowFooter.Checked;
        if (this.whdg1.Bands.Count > 0)
        {
            this.whdg1.Bands[0].ShowFooter = childState;
        }
    }

    protected void chkShowBandHeader_CheckedChanged(object sender, EventArgs e)
    {
        if (this.whdg1.Bands.Count > 0)
        {
            this.whdg1.Bands[0].ShowHeader = this.chkShowBandHeader.Checked;
        }
    }

    protected void chkShowBandFooter_CheckedChanged(object sender, EventArgs e)
    {
        if (this.whdg1.Bands.Count > 0)
        {
            this.whdg1.Bands[0].ShowFooter = this.chkShowBandFooter.Checked;
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

