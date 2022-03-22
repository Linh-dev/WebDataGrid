using System;
using System.IO;
using System.Web;
using System.Web.UI;
using Infragistics.Web.UI.Framework;
using Infragistics.Web.UI.Framework.Persistence;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{	
	protected int Counter
    {
        get { return Convert.ToInt32(Session["ListCounter"]); }
        set { Session["ListCounter"] = value; }
    }

    protected string EventsList
    {
        get { return Convert.ToString(Session["EventList"]); }
        set { Session["EventList"] = value; }
    }

    protected bool IsSubscribed
    {
        get { return Convert.ToBoolean(Session["isSubscribed"]); }
        set { Session["isSubscribed"] = value; }
    }

    protected void wdg1_Init(object sender, EventArgs e)
    {
        this.adsProduct.DataFile = this.GetMdbLocation("Nwind.mdb");
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
                AppSettings.PersistenceManager.PersistenceLoading += this.PersistenceLoading;
                AppSettings.PersistenceManager.PersistenceLoaded += this.PersistenceLoaded;
                AppSettings.PersistenceManager.PersistenceSaving += this.PersistenceSaving;
                AppSettings.PersistenceManager.PersistenceSaved += this.PersistenceSaved;
                IsSubscribed = true;
            }
            this.Counter = 1;
            this.EventsList = String.Empty;
        }

        this.EventsList += String.Format("<div class='normal-events'>{0}. {1}</div>", this.Counter++, "Init");
    }
    protected void Page_InitComplete(object sender, EventArgs e)
    {
        this.EventsList += String.Format("<div class='normal-events'>{0}. {1}</div>", this.Counter++, "InitComplete");
    }

    protected void PersistenceLoading(object sender, PersistenceLoadingEventArgs e)
    {
        this.EventsList += String.Format("<div class='highlighted-events'>{0}. {1}</div>", this.Counter++, "PersistenceLoading");
        
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

    protected void PersistenceLoaded(object sender, PersistenceEventArgs e)
    {
        this.EventsList += String.Format("<div class='highlighted-events'>{0}. {1}</div>", this.Counter++, "PersistenceLoaded");
    }

    protected void Page_PreLoad(object sender, EventArgs e)
    {
        this.EventsList += String.Format("<div class='normal-events'>{0}. {1} </div>", this.Counter++, "PreLoad");
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        this.EventsList += String.Format("<div class='normal-events'>{0}. {1}</div>", this.Counter++, "Load");
    }
    
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        this.EventsList += String.Format("<div class='normal-events'>{0}. {1}</div>", this.Counter++, "LoadComplete");
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        this.EventsList += String.Format("<div class='normal-events'>{0}. {1}</div>", this.Counter++, "PreRender");
    }
    protected void Page_PreRenderComplete(object sender, EventArgs e)
    {
        this.EventsList += String.Format("<div class='normal-events'>{0}. {1}</div>", this.Counter++, "PreRenderComplete");
    }

    protected void PersistenceSaving(object sender, PersistenceSavingEventArgs e)
    {
        this.EventsList += String.Format("<div class='highlighted-events'>{0}. {1}</div>", this.Counter++, "PersistenceSaving");
    }

    protected void PersistenceSaved(object sender, PersistenceEventArgs e)
    {
        this.EventsList += String.Format("<div class='highlighted-events'>{0}. {1}</div>", this.Counter++, "PersistenceSaved");

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

    protected void Page_SaveStateComplete(object sender, EventArgs e)
    {
        this.EventsList += String.Format("<div class='normal-events bottom-events'>{0}. {1}</div>", this.Counter++, "SaveStateComplete");
        this.eventList.InnerHtml = this.EventsList;
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