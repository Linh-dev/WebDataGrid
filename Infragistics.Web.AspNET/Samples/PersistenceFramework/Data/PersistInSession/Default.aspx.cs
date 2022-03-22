using System;
using System.Web.UI;
using Infragistics.Web.UI.Framework;
using Infragistics.Web.UI.Framework.Persistence;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    // <!--#BEGIN SNIPPET#-->
    protected string StoredData
    {
        get { return Convert.ToString(Session[String.Format("{0}_StoredData", this.GetType().FullName)]); }
        set { Session[String.Format("{0}_StoredData", this.GetType().FullName)] = value; }
    }
    // <!--#END SNIPPET#-->
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
                AppSettings.PersistenceManager.PersistenceLoading += this.PersistenceLoading;
                AppSettings.PersistenceManager.PersistenceSaved += this.PersistenceSaved;
                IsSubscribed = true;
            }
        }

    }
    // <!--#BEGIN SNIPPET#-->
    protected void PersistenceLoading(object sender, PersistenceLoadingEventArgs e)
    {
        if (!string.IsNullOrEmpty(this.StoredData))
        {
            e.PersistenceData = PersistenceData.FromXml(this.StoredData);
        }
    }

    protected void PersistenceSaved(object sender, PersistenceEventArgs e)
    {
        if (e.PersistenceData == null)
        {
            return;
        }

        this.StoredData = e.PersistenceData.ToXml();
    }
    // <!--#END SNIPPET#-->
}
