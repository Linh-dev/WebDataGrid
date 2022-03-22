using System;
using System.Web.UI;
using Infragistics.Web.UI.Framework;
using Infragistics.Web.UI.Framework.Persistence;
using System.Web.UI.WebControls;
using System.IO;
using System.Web;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private string _userIPAdress = String.Empty;

    protected void Page_InitComplete(object sender, EventArgs e)
    {
        ManualLoad();
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        if (!HttpContext.Current.User.Identity.IsAuthenticated)
        {
            _userIPAdress = Request.ServerVariables["REMOTE_ADDR"];
        }
    }

    protected void ddl_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        ListItem selectedItem = this.ddl.SelectedItem;
        this.inpHTML.Value = string.IsNullOrEmpty(selectedItem.Value)
                ? String.Empty 
                : String.Format("'{0}' has value {1} ", selectedItem.Text, selectedItem.Value);
        if (this.chkIsPersisted.Checked)
        {
            ManualPersistence();
        }
    }

    protected void chkIsPersisted_OnCheckedChanged(object sender, EventArgs e)
    {
        ManualPersistence();
    }

    // <!--#BEGIN SNIPPET#-->
    private void ManualLoad()
    {
        PersistenceData data = null;
        string filePath = this.GetPersistenceFilePath();
        if (!File.Exists(filePath))
        {
            return;
        }

        using (FileStream fileStream = File.OpenRead(filePath))
        {
             data = PersistenceData.FromStream(fileStream);
        }
        if (data == null)
        {
            return;
        }

        PersistenceManager manager = PersistenceManager.GetInstance();
        foreach (ControlData controlData in data.Controls)
        {
            if (!string.IsNullOrEmpty(controlData.ControlId))
            {
                Control control = PersistenceSamples.Helper.
                    FindControlRecursive(this, controlData.ControlId);
                manager.LoadControl(control, controlData);
            }
        }
    }

    private void ManualPersistence()
    {
        PersistenceManager manager = PersistenceManager.GetInstance();
        PersistenceData data = new PersistenceData();
        data.Controls.Add(manager.SaveControl(this.ddl, this.ddl.ID));
        data.Controls.Add(manager.SaveControl(this.inpHTML, this.inpHTML.ID));
        data.Controls.Add(manager.SaveControl(this.chkIsPersisted, this.chkIsPersisted.ID));

        string filePath = this.GetPersistenceFilePath();
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

    private string GetPersistenceFilePath()
    {
        string filePath = Server.MapPath(@"~\Temp\Persistence\");
        string userName = (HttpContext.Current.User.Identity.IsAuthenticated)
                        ? HttpContext.Current.User.Identity.Name
                        : _userIPAdress;
        string fileName = String.Format("{0}_{1}",
                    userName.Replace('\\', '.').Replace(":", "_"),
                    this.GetType().FullName);
        return String.Format("{0}{1}.xml", filePath, fileName);
    }
}
