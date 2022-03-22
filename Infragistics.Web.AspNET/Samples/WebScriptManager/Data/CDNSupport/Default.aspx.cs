using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;



public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        
        this.SqlCustomerSource.ConnectionString = this.GetSqlConnectionString("SamplesDB.mdf");
        this.SqlCustomerContactSource.ConnectionString = this.GetSqlConnectionString("SamplesDB.mdf");
    }

    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        this.CdnLog.InnerHtml = "<h3>" + (string)(this.GetGlobalResourceObject("WebScriptManager", "CDN_LogTitle")) + "</h3>";
        object useCDNObject = this.Session["UseCDN"];
        Infragistics.Web.UI.WebScriptManager scriptManager = FindControlRecursive(this.Master, "WebScriptManager1") as Infragistics.Web.UI.WebScriptManager;

        if(useCDNObject != null)
        {
            bool useCDN = (bool) useCDNObject;
            if(!useCDN)
            {
                if(scriptManager != null)
                {
                    scriptManager.InfragisticsCDN.EnableCDN = Infragistics.Web.UI.DefaultableBoolean.False;
                    scriptManager.ResolveScriptReference += new EventHandler<ScriptReferenceEventArgs>(WebScriptManager_ResolveScriptReference);
                }
                this.CdnLog.InnerHtml += (string)(this.GetGlobalResourceObject("WebScriptManager", "CDN_LoadedEverything"));
                return;
            }
        }

        if(scriptManager != null)
        {
            scriptManager.InfragisticsCDN.EnableCDN = Infragistics.Web.UI.DefaultableBoolean.True;
            scriptManager.ResolveScriptReference += new EventHandler<ScriptReferenceEventArgs>(WebScriptManager_ResolveScriptReference);
            this.Session["UseCDN"] = true;
        }
    }

    private Control FindControlRecursive(Control rootControl, string controlID)
    {
        if (rootControl.ID == controlID) return rootControl;

        foreach (Control controlToSearch in rootControl.Controls)
        {
            Control controlToReturn = 
                FindControlRecursive(controlToSearch, controlID);
            if (controlToReturn != null) return controlToReturn;
        }
        return null;
    }


    protected void WebScriptManager_ResolveScriptReference(object sender, ScriptReferenceEventArgs e)
    {
        this.CdnLog.InnerHtml += e.Script.Path + "<br />";
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CheckBox1_OnCheckedChanged(object sender, EventArgs e)
    {
        this.Session["UseCDN"] = this.CheckBox1.Checked;
    }
}
