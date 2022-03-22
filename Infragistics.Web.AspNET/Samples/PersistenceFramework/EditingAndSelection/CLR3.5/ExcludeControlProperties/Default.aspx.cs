using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using Infragistics.Web.UI.Framework;
using Infragistics.Web.UI.Framework.Persistence;
using Infragistics.Web.UI.ListControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
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
                AppSettings.PersistenceManager.PersistenceLoading += this.PersistenceLoading;
                AppSettings.PersistenceManager.PersistenceSaved += this.PersistenceSaved;
                IsSubscribed = true;
            }
        }
        this.adsProduct.DataFile = this.GetMdbLocation("Nwind.mdb");
    }

    protected void PersistenceLoading(object sender, PersistenceLoadingEventArgs e)
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

    protected void wddAnime_SelectionChanged(object sender, Infragistics.Web.UI.ListControls.DropDownSelectionChangedEventArgs e)
    {
        this.wddPersisted.DropDownAnimationType = this.wddNotPersisted.DropDownAnimationType =
                (DropDownAnimationTypes)Enum.Parse(typeof(DropDownAnimationTypes), wddAnime.SelectedValue.ToString());
    }

    protected void wddPageSize_SelectionChanged(object sender, Infragistics.Web.UI.ListControls.DropDownSelectionChangedEventArgs e)
    {

        this.wddPersisted.PageSize = this.wddNotPersisted.PageSize = Int32.Parse(wddPageSize.SelectedValue.ToString());
    }

    protected void PersistenceSaved(object sender, PersistenceEventArgs e)
    {
        if (e.PersistenceData == null)
        {
            return;
        }

        List<string> listIgnoredControlsID = new List<string>(); ;
        listIgnoredControlsID.Add(this.wddPersisted.ID);
        listIgnoredControlsID.Add(this.wddAnime.ID);
        listIgnoredControlsID.Add(this.wddPageSize.ID);

        List<string> listIgnoredPropertiesID = new List<string>();
        listIgnoredPropertiesID.Add("DropDownAnimationType");
        listIgnoredPropertiesID.Add("PageSize");

        PersistenceData data = e.PersistenceData;
        ControlData controlToRemove = null;

        foreach (string ignoredControlID in listIgnoredControlsID)
        {
            controlToRemove = data.Controls.Find(delegate(ControlData controlToFind)
            {
                return controlToFind.ControlId == ignoredControlID;
            });

            if (controlToRemove != null)
            {
                RemovePropertiesFromControl(controlToRemove, listIgnoredPropertiesID);
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
            e.PersistenceData.ToStream(fileStream);
        }
    }

    // <!--#BEGIN SNIPPET#-->
    private void RemovePropertiesFromControl(ControlData controlToRemove, List<string> listIgnoredPropertiesID)
    {
        PropertyData propertyToRemove = null;
        foreach (string ignoredPropertyID in listIgnoredPropertiesID)
        {
            propertyToRemove = controlToRemove.Properties.Find(delegate(PropertyData propertyToFind)
            {
                return propertyToFind.Name == ignoredPropertyID;
            });
            if (propertyToRemove != null)
            {
                controlToRemove.Properties.Remove(propertyToRemove);
                propertyToRemove = null;
            }
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
