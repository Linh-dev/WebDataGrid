using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Infragistics.Web.UI.EditorControls;

public partial class Samples_WebCaptcha_Display_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.TimeoutSubmit.Click += new EventHandler(TimeoutSubmit_Click);
    }



    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            InitialValues();
            DataBind();
        }
        else
        {
            SetProtectionaMode();
            LblValidation.Text = string.Empty;
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "id", "PropertyFadeAnimation();", true);

    }

    protected void SetProtectionaMode()
    {
        switch (ddProtectionMode.SelectedIndex)
        {
            case 0:
                SetCaptchaModeValues();
                break;
            case 1:
                SetTimeoutModeValues();
                break;
            case 2:
                SetInvisibleModeValues();
                break;
        }
    }

    protected void InitialValues()
    {

        ddProtectionMode.DataSource = Enum.GetNames(typeof(ProtectionMode));
        ddDictionaryMode.DataSource = Enum.GetNames(typeof(CaptchaDictionaryMode));
        InitNoiseDropDown(ddBackgroundNoise);
        InitNoiseDropDown(ddFontWarping);
        InitNoiseDropDown(ddLinesNoise);
        InitNoiseDropDown(ddRotationNoise);
    }

    protected void SetCaptchaModeValues()
    {
        SetDictionaryMode();
        this.WebCaptcha1.ProtectionMode = ProtectionMode.Captcha;
        this.WebCaptcha1.CaptchaImageSettings.TextLength = (this.WebCaptcha1.CaptchaDictionaryMode == CaptchaDictionaryMode.Words) ? 8 : Convert.ToInt32(ddTextLength.SelectedValue);
        this.WebCaptcha1.CaptchaImageSettings.TextColor = System.Drawing.Color.FromName(ddTextColor.SelectedValue);
        this.WebCaptcha1.CaptchaImageSettings.BackgroundColor = System.Drawing.Color.FromName(ddBackgroundColor.SelectedValue);
        this.WebCaptcha1.CaptchaImageSettings.EnableRandomFonts = this.CheckBoxRandomFonts.Checked;
        this.WebCaptcha1.CaptchaImageSettings.EnableCaseSensitivity = this.CheckBoxCaseSensitivity.Checked;
        this.WebCaptcha1.CaptchaImageSettings.EnableUniqueChars = this.CheckBoxUniqueChars.Checked;
        this.WebCaptcha1.CaptchaImageSettings.FontWarping = (NoiseLevel)Enum.Parse(typeof(NoiseLevel), ddFontWarping.SelectedValue);
        this.WebCaptcha1.CaptchaImageSettings.BackgroundNoise = (NoiseLevel)Enum.Parse(typeof(NoiseLevel), ddBackgroundNoise.SelectedValue);
        this.WebCaptcha1.CaptchaImageSettings.RotationNoise = (NoiseLevel)Enum.Parse(typeof(NoiseLevel), ddRotationNoise.SelectedValue);
        this.WebCaptcha1.CaptchaImageSettings.LinesNoise = (NoiseLevel)Enum.Parse(typeof(NoiseLevel), ddLinesNoise.SelectedValue);
    }

    protected void SetDictionaryMode()
    {
        switch (ddDictionaryMode.SelectedIndex)
        {
            case 0:
                this.WebCaptcha1.CaptchaDictionaryMode = CaptchaDictionaryMode.Off;
                break;
            case 1:
                this.WebCaptcha1.CaptchaDictionaryMode = CaptchaDictionaryMode.Words;
                this.WebCaptcha1.CaptchaDictionaryPath = "/SamplesBrowser/SamplesCommon/aspnet/WebCaptcha/Display/PropertyExplorer/WordsDictionary.txt";
                break;
            case 2:
                this.WebCaptcha1.CaptchaDictionaryMode = CaptchaDictionaryMode.LogicalQuestionAnswer;
                this.WebCaptcha1.CaptchaDictionaryPath = this.GetGlobalResourceObject("WebCaptcha", "PropertyExplorerQAFilePath").ToString(); //"LogicalQuestionsAndAnswers.txt";
                break;
        }
    }

    protected void SetTimeoutModeValues()
    {
        this.WebCaptcha1.ProtectionMode = ProtectionMode.FormSubmissionTimeout;
        this.WebCaptcha1.FormSubmissionTimeoutSeconds = Convert.ToInt32(this.ddTimeoutSeconds.SelectedValue);
    }

    protected void SetInvisibleModeValues()
    {
        this.WebCaptcha1.ProtectionMode = ProtectionMode.InvisibleInputField;
    }

    protected void InitNoiseDropDown(DropDownList dropDown)
    {
        dropDown.DataSource = Enum.GetNames(typeof(NoiseLevel));
        dropDown.SelectedValue = "Medium";
    }

    protected void TimeoutSubmit_Click(object sender, EventArgs e)
    {
        if (this.WebCaptcha1.IsValid)
        {
            LblValidation.Text = this.GetGlobalResourceObject("WebCaptcha", "PropertyExplorerFormSubmition").ToString();
        }
        else
        {
            LblValidation.Text = string.Empty;
        }
    }

}
