using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Infragistics.WebUI.WebDataInput;
using Infragistics.WebUI.WebSchedule;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected System.Web.UI.WebControls.Button btnSetValues;
    protected System.Web.UI.WebControls.DropDownList DropDownList10;
    protected System.Web.UI.WebControls.DropDownList DropDownList11;
    protected System.Web.UI.WebControls.DropDownList DropDownList12;
    protected System.Web.UI.WebControls.DropDownList DropDownList9;
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
        this.WebScheduleInfo1.ReminderFormPath = "/samplesbrowser/samplescommon/aspnet/webschedule/forms/AppointmentAdd.aspx";

        this.oleDbConnection1.ConnectionString = WebSamplesCS.Config.WebScheduleMDBConnString;
        if (!IsPostBack)
        {
            this.dcActiveDay.Value = new DateTime(this.WebScheduleInfo1.ConvertUtcToTimeZoneTime(this.WebScheduleInfo1.ActiveDayUtc).Ticks);


            String[] strValues;
            int intLoop;

            this.ddBackColor.Items.AddRange(WebScheduleSamples.Util.NamedColors);
            this.ddForeColor.Items.AddRange(WebScheduleSamples.Util.NamedColors);
            this.ddBorderColor.Items.AddRange(WebScheduleSamples.Util.NamedColors);

            strValues = System.Enum.GetNames(typeof(BorderStyle));
            for (intLoop = 0; intLoop < strValues.Length; intLoop++)
            {
                this.ddBorderStyle.Items.Add(strValues[intLoop]);
            }

            foreach (System.Drawing.FontFamily fFonts in System.Drawing.FontFamily.Families)
            {
                this.ddFontType.Items.Add(fFonts.Name);
            }



            this.ddStyleCollection.Items.AddRange(WebScheduleSamples.Util.StylesForType(typeof(WebMonthView)));


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

    private void btnSetColorValues_Click(object sender, System.EventArgs e)
    {
        Infragistics.WebUI.Shared.Style chosenstyle = getStyleCollection();
        chosenstyle.BackColor = System.Drawing.Color.FromName(this.ddBackColor.SelectedItem.Value);

    }

    private Infragistics.WebUI.Shared.Style getStyleCollection()
    {
        return (Infragistics.WebUI.Shared.Style)typeof(WebMonthView).GetProperty(this.ddStyleCollection.SelectedItem.Text).GetValue(this.WebMonthView1, null);
    }

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
