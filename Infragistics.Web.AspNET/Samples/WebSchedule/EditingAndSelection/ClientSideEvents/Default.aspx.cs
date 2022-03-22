using System;
using System.Web.UI;
using System.Xml;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected System.Data.OleDb.OleDbConnection oleDbConnection1;

    private XmlDocument WebScheduleData
    {
        get
        {
            if (Session["WebScheduleData"] == null)
            {
                Session["WebScheduleData"] = WebScheduleSamples.Util.GenerateDocument();
            }
            return (XmlDocument)Session["WebScheduleData"];
        }
    }

    protected void Page_Load(object sender, System.EventArgs e)
    {
        this.WebScheduleInfo1.AppointmentFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx";
        this.WebScheduleInfo1.ReminderFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/Reminder.aspx";

        this.oleDbConnection1.ConnectionString = WebSamplesCS.Config.WebScheduleMDBConnString;
            //The Custom Provider
            Infragistics.WebUI.Data.WebScheduleXMLDataProvider theCustomProvider
                = new Infragistics.WebUI.Data.WebScheduleXMLDataProvider(this.WebScheduleData);
            Page.Controls.Add(theCustomProvider);
            theCustomProvider.WebScheduleInfo = this.WebScheduleInfo1;
    }

    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        InitializeComponent();
        base.OnInit(e);
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        this.oleDbConnection1 = new System.Data.OleDb.OleDbConnection();

    }
    #endregion
}
