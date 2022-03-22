using System;
using Infragistics.Web.UI.ListControls;
using System.Configuration;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private string iso_id = "eng";
    private const string EngLocale = "1033";
    private const string JpnLocale = "1041";

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.WebImageViewer1.ItemBound += new Infragistics.Web.UI.ListControls.ImageItemEventHandler(WebImageViewer1_ItemBound);

        string lid = ConfigurationManager.AppSettings["LanguageID"];
        if (!string.IsNullOrEmpty(lid))
        {
            if (lid.Equals(JpnLocale))
                iso_id = "jpn";
            else if (lid.Equals(EngLocale))
                iso_id = "eng";
        }

        this.SQLDataSource1.ConnectionString = GetSqlConnectionString("SamplesDB.mdf");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string selectStatement = string.Format(
                @"SELECT i.Image_Id, i.ImageUrl, i.NavigateUrl, il.Label as AltText, il.Label as ToolTip 
                  FROM images i 
                  JOIN images_labels il on i.image_id = il.image_id AND il.iso_id = '{0}'",
            iso_id);

			this.SQLDataSource1.SelectCommand = selectStatement;
        }
    }
    protected void WebImageViewer1_DataBound(object sender, EventArgs e)
    {
        WebImageViewer view = (WebImageViewer)sender;
        for (int i = 0; i < view.Items.Count; i++)
        {
            string url = view.Items[i].ImageUrl;
            url = url.Substring(url.LastIndexOf("/"));
            url = String.Concat("/SamplesBrowser/SamplesCommon/aspnet/WebImageViewer/Data/DatabindToDataSourceControl/", url);
            view.Items[i].ImageUrl = url;
        }
    }

    void WebImageViewer1_ItemBound(object sender, Infragistics.Web.UI.ListControls.ImageItemEventArgs e)
    {
        // The target where the window will open can also pulled from the datasource via 
        // the ImageItemBinding.TargetField.  However, since the datasource in this case doesn't
        // have a target field, the target can be set in this event
        e.Item.Target = "new";
    }
}
