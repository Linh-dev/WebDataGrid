using System;
using System.Web.UI;
using System.Xml;
using Infragistics.WebUI.WebSchedule;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
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
        this.InitView();
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

    #region InitView
    private void InitView()
    {

        {
            //The Custom Provider
            Infragistics.WebUI.Data.WebScheduleXMLDataProvider theCustomProvider
                = new Infragistics.WebUI.Data.WebScheduleXMLDataProvider(this.WebScheduleData);
            theCustomProvider.ID = "WebScheduleXMLDataProvider1";
            Page.Controls.Add(theCustomProvider);
            theCustomProvider.WebScheduleInfo = this.WebScheduleInfo1;
        }

        string user = (this.UserNameList.SelectedItem == null) ? "Javier Lamoreaux" : this.UserNameList.SelectedItem.Text;
        this.WebScheduleInfo1.ActiveResourceName = user;

        // Example to use WebScheduleInfoID-property to connect WebScheduleInfo to view
        this.WebDayView1.WebScheduleInfoID = this.WebScheduleInfo1.ID;
        this.WebDayView2.WebScheduleInfo = this.WebScheduleInfo1;
        this.WebMonthView1.WebScheduleInfo = this.WebScheduleInfo1;
        this.WebCalendarView1.WebScheduleInfo = this.WebScheduleInfo1;

    }
    #endregion

    #region Enable smart callbacks
    public void chkSmartCallbacks_CheckChanged(object sender, System.EventArgs e)
    {
        this.WebScheduleInfo1.EnableSmartCallbacks = this.chkSmartCallbacks.Checked;
    }
    #endregion
}
