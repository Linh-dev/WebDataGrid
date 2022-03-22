using System;
using System.Collections;
using System.Drawing;
using System.Web.UI;
using System.Xml;
using Infragistics.WebUI.Data;
using Infragistics.WebUI.WebDataInput;
using Infragistics.WebUI.WebSchedule;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
	protected System.Web.UI.WebControls.Button Button1;
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
		WebScheduleXMLDataProvider theCustomProvider = new WebScheduleXMLDataProvider(this.WebScheduleData);
		theCustomProvider.WebScheduleInfo = this.WebScheduleInfo1;
		Page.Controls.Add(theCustomProvider);

		// Call DataBind() to populate the WebScheduleInfo's collection properties
		// from the data provider before server-side event handlers fire.
		this.WebScheduleInfo1.DataBind();

		if (!Page.IsPostBack)
		{
			ICollection resources = theCustomProvider.FetchResources();

			if (resources != null)
			{
				this.ddResourceName.Items.Clear();
				foreach (Resource currentResource in resources)
				{
					this.ddResourceName.Items.Add(currentResource.Name);
				}
			}

			this.ddResourceName.SelectedIndex = 0;
			this.dcActiveDay.Value = new DateTime(this.WebScheduleInfo1.ConvertUtcToTimeZoneTime(this.WebScheduleInfo1.ActiveDayUtc).Ticks);

			this.ApplyAeroToCalendarView(this.WebCalendarView1);
		}
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
		this.ddResourceName.SelectedIndexChanged += new System.EventHandler(this.ddResourceName_SelectedIndexChanged);

		this.btnResources.Click += new Infragistics.WebUI.WebDataInput.ClickHandler(this.buttons_Click);
		this.btnAppointments.Click += new Infragistics.WebUI.WebDataInput.ClickHandler(this.buttons_Click);
		this.btnCountAppointments.Click += new Infragistics.WebUI.WebDataInput.ClickHandler(this.buttons_Click);

	}
	#endregion

	private void ddResourceName_SelectedIndexChanged(object sender, System.EventArgs e)
	{
		if (this.ddResourceName.SelectedItem != null)
		{
			this.WebScheduleInfo1.ActiveResourceName = this.ddResourceName.SelectedItem.ToString();

			this.ListBox1.Items.Clear();
			this.lstAppointments.Items.Clear();
		}
	}

	private void buttons_Click(object sender, ButtonEventArgs e)
	{
		if (sender == this.btnCountAppointments && this.WebScheduleInfo1.ActiveResource != null)
		{
			AppointmentsSubsetCollection c = this.WebScheduleInfo1.GetAppointmentsForDate(this.WebScheduleInfo1.ActiveResource, this.WebScheduleInfo1.ActiveDayUtc.Date);

			// When no appointments exist on a particular date, GetAppointmentsForDate()
			// returns null.
			if (c != null)
				this.txtAppointments.Text = c.Count.ToString();
			else
				this.txtAppointments.Text = "0";
		}
		else if (sender == this.btnAppointments)
		{
			this.WebScheduleInfo1.ActiveResourceName = this.ddResourceName.SelectedItem.ToString();

			this.WebScheduleInfo1.DataBind();
			Infragistics.WebUI.WebSchedule.AppointmentsSubsetCollection appcollection = this.WebScheduleInfo1.GetAppointmentsForDate(this.WebScheduleInfo1.ActiveResource, this.WebScheduleInfo1.ActiveDayUtc);
			this.lstAppointments.Items.Clear();

			if (appcollection == null)
			{
				this.lstAppointments.Items.Add("null");
				return;
			}
			else if (appcollection.Count == 0)
			{
				this.lstAppointments.Items.Add("empty");
				return;
			}
			for (int i = 0; i < appcollection.Count; i++)
			{
				this.lstAppointments.Items.Add("AllDayEvent: " + appcollection[i].AllDayEvent.ToString());
				this.lstAppointments.Items.Add("EnableReminder: " + appcollection[i].EnableReminderResolved.ToString());
				if (appcollection[i].HasResource)
				{
					this.lstAppointments.Items.Add("Resource Name: " + appcollection[i].Resource.Name.ToString());
					this.lstAppointments.Items.Add("Resource Key: " + appcollection[i].ResourceKey.ToString());
				}
				this.lstAppointments.Items.Add("Start DateTime: " + appcollection[i].StartDateTime.ToString());
				this.lstAppointments.Items.Add("End DateTime: " + appcollection[i].EndDateTime.ToString());
				this.lstAppointments.Items.Add("Status: " + appcollection[i].Status.ToString());
				this.lstAppointments.Items.Add("ShowTimeAs: " + appcollection[i].ShowTimeAs.ToString());
				this.lstAppointments.Items.Add("---------------------------");
			}
		}
		else if (sender == this.btnResources)
		{
			this.WebScheduleInfo1.DataBind();
			this.ListBox1.Items.Clear();
			for (int i = 0; i < this.WebScheduleInfo1.VisibleResources.Count; i++)
			{
				this.ListBox1.Items.Add(this.WebScheduleInfo1.VisibleResources[i].Name.ToString());
			}
		}
	}

	private void ApplyAeroToCalendarView(Infragistics.WebUI.WebSchedule.WebCalendarView calendarView)
	{
		// Behind the WebCalendarView, place a gelatinous rounded-edge bitmap.
		//calendarView.Style.Add("background-image", "url(" + this.ResolveUrl("/SamplesBrowser/SamplesCommon/aspnet/WebSchedule/Display/WebScheduleInfoProperties1/aeroCalendarCaption.png") + ")");

		// Apply the Aero style sheet (note: A <style> block in the .aspx page
		// overrides a few rules from this style sheet, and that's what allows
		// the background image to show through.)
		calendarView.StyleSheetFileName = this.GetStyleSheetFileName("Aero", "ig_webcalendarview.css");

		// Month days are transparent. Give them BackColor to prevent the
		// background image from showing through below the CaptionHeader.
		calendarView.OtherMonthDayStyle.BackColor = Color.White;
		calendarView.DayStyle.BackColor = Color.White;
		calendarView.ActiveDayStyle.BackColor = Color.Azure;
	}
	public string GetStyleSheetFileName(string styleName, string fileName)
	{
		return "/SamplesBrowser/SamplesCommon/aspnet/Common/Webschedule/styles/" + styleName + "/" + fileName;
	}

}

