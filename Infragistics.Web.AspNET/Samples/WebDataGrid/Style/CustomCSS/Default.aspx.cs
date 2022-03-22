using System;
using MyMail;

public partial class Samples_WebDataGrid_Style_Custom_CSS_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
	protected const string WEBDATAGRID_SCENARIOS_EMAIL_IMAGE_PATH = "/SamplesBrowser/SamplesCommon/aspnet/Common/MyMail/images/";

    protected void Page_Load(object sender, EventArgs e)
    {
        this.ItemViewer.DataSource = new EmailCommand().GetDefaultFolder(true).Children;

        if (!this.IsPostBack)
        {
            this.ItemViewer.DataBind();
        }
    }

    protected string GetImageTag(string path, string name)
    {
        return string.Format("<img src='{0}{1}' />", path, name);
    }

    protected string FormatMessage(object isNew, object value)
    {
        string messageFormat = string.Empty;
        if (bool.Parse(isNew.ToString()))
        {
            messageFormat = string.Format("<b>{0}</b>", value.ToString());
        }
        else
        {
            messageFormat = value.ToString();
        }

        return messageFormat;
    }

    protected string GetPriorityImage(object value)
    {

        EmailItem.MessagePriority priority = (EmailItem.MessagePriority)Enum.Parse(typeof(EmailItem.MessagePriority), value.ToString());

        string imageTag = string.Empty;
        switch (priority)
        {
            case EmailItem.MessagePriority.High:
                imageTag = this.GetImageTag(WEBDATAGRID_SCENARIOS_EMAIL_IMAGE_PATH, "high.gif");
                break;
            case EmailItem.MessagePriority.Low:
                imageTag = this.GetImageTag(WEBDATAGRID_SCENARIOS_EMAIL_IMAGE_PATH, "low.gif");
                break;
            case EmailItem.MessagePriority.Normal:
            default:
                imageTag = string.Empty;
                break;
        }
        return imageTag;
    }

    protected string GetStatusImage(object value)
    {

        EmailItem.MessageStatus status = (EmailItem.MessageStatus)Enum.Parse(typeof(EmailItem.MessageStatus), value.ToString());

        string imageTag = string.Empty;
        switch (status)
        {
            case EmailItem.MessageStatus.New:
                imageTag = this.GetImageTag(WEBDATAGRID_SCENARIOS_EMAIL_IMAGE_PATH, "IsNew.png");
                break;
            case EmailItem.MessageStatus.RespondSent:
                imageTag = this.GetImageTag(WEBDATAGRID_SCENARIOS_EMAIL_IMAGE_PATH, "RespondSent.png");
                break;
            case EmailItem.MessageStatus.Open:
            default:
                imageTag = this.GetImageTag(WEBDATAGRID_SCENARIOS_EMAIL_IMAGE_PATH, "IsOpen.png");
                break;
        }
        return imageTag;
    }

    protected string GetAttachmentImage(object value)
    {

        bool hasAttachment = bool.Parse(value.ToString());
        string imageTag = string.Empty;
        if (hasAttachment)
        {
            imageTag = this.GetImageTag(WEBDATAGRID_SCENARIOS_EMAIL_IMAGE_PATH, "attach.gif");
        }
        return imageTag;
    }

    protected string GetFlagImage(object value)
    {
        bool isFlagged = bool.Parse(value.ToString());
        string imageTag = string.Empty;
        if (isFlagged)
        {
            imageTag = this.GetImageTag(WEBDATAGRID_SCENARIOS_EMAIL_IMAGE_PATH, "FlagOn.png");
        }
        return imageTag;
    }
}
