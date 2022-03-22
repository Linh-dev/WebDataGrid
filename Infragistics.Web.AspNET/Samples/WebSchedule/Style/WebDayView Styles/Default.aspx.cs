using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Infragistics.WebUI.WebDataInput;
using Infragistics.WebUI.WebSchedule;
using WebScheduleSamples;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
	protected System.Web.UI.WebControls.Label Label31;
	protected System.Web.UI.WebControls.TextBox txtWidthRight;
	protected System.Web.UI.WebControls.TextBox txtWidthLeft;
	protected System.Web.UI.WebControls.TextBox txtWidthBottom;
	protected System.Web.UI.WebControls.TextBox txtWidthTop;

	protected System.Web.UI.WebControls.DropDownList ddStyleTop;
	protected System.Web.UI.WebControls.DropDownList ddStyleBottom;
	protected System.Web.UI.WebControls.DropDownList ddStyleRight;
	protected System.Web.UI.WebControls.DropDownList ddStyleLeft;
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

		if (!IsPostBack)
		{
			String[] strValues;
			int intLoop;

			this.dcActiveDay.Value = new DateTime(this.WebScheduleInfo1.ConvertUtcToTimeZoneTime(this.WebScheduleInfo1.ActiveDayUtc).Ticks);



			this.ddBackColor.Items.AddRange(Util.NamedColors);
			this.ddForeColor.Items.AddRange(Util.NamedColors);
			this.ddBorderColor.Items.AddRange(Util.NamedColors);

			strValues = System.Enum.GetNames(typeof(BorderStyle));
			for (intLoop = 0; intLoop < strValues.Length; intLoop++)
			{
				this.ddBorderStyle.Items.Add(strValues[intLoop]);
			}


			foreach (System.Drawing.FontFamily fFonts in System.Drawing.FontFamily.Families)
			{
				this.ddFontType.Items.Add(fFonts.Name);
			}

			this.ddStyleCollection.Items.AddRange(Util.StylesForType(typeof(WebDayView)));
		}

		if (WebSamplesCS.Config.IsLockdownMode)
		{
			//The Custom Provider
			Infragistics.WebUI.Data.WebScheduleXMLDataProvider theCustomProvider
				= new Infragistics.WebUI.Data.WebScheduleXMLDataProvider(this.WebScheduleData);
			Page.Controls.Add(theCustomProvider);
			theCustomProvider.WebScheduleInfo = this.WebScheduleInfo1;
		}

		this.WebScheduleInfo1.ActiveResourceName = "Unassigned";
		this.WebScheduleInfo1.DataBind();
	}

	private Infragistics.WebUI.Shared.Style getStyleCollection()
	{
		return (Infragistics.WebUI.Shared.Style)typeof(WebDayView).GetProperty(this.ddStyleCollection.SelectedItem.Text).GetValue(this.WebDayView1, null);
	}

	#region Web Form Designer generated code
	override protected void OnInit(EventArgs e)
	{
		//
		// CODEGEN: This call is required by the ASP.NET Web Form Designer.
		//
		InitializeComponent();
		this.btnApplyBorder.Click += new EventHandler(buttons_Click);
		this.btnSetFontDetails.Click += new EventHandler(buttons_Click);
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

	protected void buttons_Click(object sender, EventArgs e)
	{
		Infragistics.WebUI.Shared.Style chosenstyle = getStyleCollection();
		if (sender == this.btnChangeActiveDay)
		{
			this.WebScheduleInfo1.ActiveDayUtc = this.WebScheduleInfo1.ConvertTimeZoneTimeToUtc(new Infragistics.WebUI.Shared.SmartDate(this.dcActiveDay.Value.ToString()));
		}
		else if (sender == this.btnSetFontDetails)
		{
			chosenstyle.Font.Bold = this.ddFontBold.Checked;
			chosenstyle.Font.Italic = this.ddFontItalic.Checked;
			chosenstyle.Font.Underline = this.ddFontUnderline.Checked;
			chosenstyle.Font.Name = this.ddFontType.SelectedItem.ToString();
		}
		else if (sender == this.btnApplyBorder)
		{
			chosenstyle.BorderColor = System.Drawing.Color.FromName(this.ddBorderColor.SelectedItem.Value);
			chosenstyle.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), this.ddBorderStyle.SelectedItem.Text);
			chosenstyle.BorderWidth = Convert.ToInt32(this.txtBorderWidth.Text);

		}
		else if (sender == this.btnSetBackColor)
		{
			chosenstyle.BackColor = System.Drawing.Color.FromName(this.ddBackColor.SelectedItem.Value);
		}
		else if (sender == this.btnSetForeColor)
		{
			chosenstyle.ForeColor = System.Drawing.Color.FromName(this.ddForeColor.SelectedItem.Value);
		}
		else if (sender == this.btnSetHeight)
		{
			chosenstyle.Height = Convert.ToInt32(this.txtHeight.Text);
		}
		else if (sender == this.btnSetWidth)
		{
			chosenstyle.Width = Convert.ToInt32(this.txtWidth.Text);
		}

	}
	
}
