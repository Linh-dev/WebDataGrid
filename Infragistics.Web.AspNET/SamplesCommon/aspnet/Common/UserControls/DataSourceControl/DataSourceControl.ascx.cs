using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;

public partial class WebFeatureBrowser_ControlPanel_DataSourceControl : System.Web.UI.UserControl
{
    #region Data Source Code Values

    public const string DATASOURCE_CODE_ACCESS = "AC";
    public const string DATASOURCE_CODE_DATATABLE = "DT";
    public const string DATASOURCE_CODE_DATASET = "DS";
    public const string DATASOURCE_CODE_XML = "XML";
    public const string DATASOURCE_CODE_COLLECTION = "CL";
    public const string DATASOURCE_CODE_ENUMERABLE = "EN";
    public const string DATASOURCE_CODE_BINDINGLIST = "BL";

    #endregion

    #region Events

    public event EventHandler DataSourceChanged;

    #endregion

    #region Constructor

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.DataSourceList.DataSource = this.GetSupportedDataSources();
            this.DataSourceList.DataBind();
            this.ChangeDataSource();
        }
    }

    #endregion

    #region Properties & Fields

    private Common.DataSourceTypes selectedDataSource = Common.DataSourceTypes.Xml;
    public Common.DataSourceTypes DataSource
    {
        get
        {
            return this.selectedDataSource;
        }
    }

    private string excludedDataSource = string.Empty;
    private string[] excludedList = new string[1];
    
    [DefaultValue("")]
    [Browsable(false)]
    public string ExcludedDataSource
    {
        get
        {
            return this.excludedDataSource;
        }
        set
        {
            this.excludedDataSource = value;
        }
    }

    #endregion

    #region ASP.NET Control Events

    protected void DataSouce_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.ChangeDataSource();
    }

    #endregion
    
    #region private Helper Methods
    
    private void AddDataSource(IList<DataSourceItem> supportedDataSources, string value, string description)
    {
        if (this.IsValidDataSource(value))
        {
            supportedDataSources.Add(new DataSourceItem(value, description));
        }
    }

    private bool IsValidDataSource(string value)
    {
        bool isValid = true;

        if (this.excludedList != null)
        {
            foreach (string item in this.excludedList)
            {
                if (item.Trim().ToUpper().Equals(value))
                {
                    isValid = false;
                    break;
                }
            }
        }

        return isValid;
    }

    private IList<DataSourceItem> GetSupportedDataSources()
    {
        this.excludedList = this.excludedDataSource.Split('|');

        IList<DataSourceItem> supportedDataSources = new List<DataSourceItem>();
        this.AddDataSource(supportedDataSources, DATASOURCE_CODE_ACCESS, this.GetGlobalResourceObject("Strings","DataSourceAccess").ToString());
        this.AddDataSource(supportedDataSources, DATASOURCE_CODE_DATATABLE, this.GetGlobalResourceObject("Strings", "DataSourceDataTable").ToString());
        this.AddDataSource(supportedDataSources, DATASOURCE_CODE_DATASET, this.GetGlobalResourceObject("Strings", "DataSourceDataSet").ToString());
        this.AddDataSource(supportedDataSources, DATASOURCE_CODE_XML, this.GetGlobalResourceObject("Strings", "DataSourceXML").ToString());
        this.AddDataSource(supportedDataSources, DATASOURCE_CODE_COLLECTION, this.GetGlobalResourceObject("Strings", "DatsaSourceCollection").ToString());
        this.AddDataSource(supportedDataSources, DATASOURCE_CODE_ENUMERABLE, this.GetGlobalResourceObject("Strings", "DataSourceEnumerable").ToString());
        this.AddDataSource(supportedDataSources, DATASOURCE_CODE_BINDINGLIST, this.GetGlobalResourceObject("Strings", "DataSourceBindingList").ToString());
        return supportedDataSources;
    }

    private void ChangeDataSource()
    {
        string selectedItem = this.DataSourceList.SelectedValue;

        string backgroundImageUrl = string.Empty;
        switch (selectedItem)
        {
            case DATASOURCE_CODE_ACCESS:
                this.selectedDataSource = Common.DataSourceTypes.AccessDataSource;
                backgroundImageUrl = "images/DatabaseAccessBG.png";
                break;
            case DATASOURCE_CODE_DATATABLE:
                this.selectedDataSource = Common.DataSourceTypes.DataTable;
                backgroundImageUrl = "images/DatabaseBG.png";
                break;
            case DATASOURCE_CODE_DATASET:
                this.selectedDataSource = Common.DataSourceTypes.DataSet;
                backgroundImageUrl = "images/DatabaseBG.png";
                break;
            case DATASOURCE_CODE_COLLECTION:
                this.selectedDataSource = Common.DataSourceTypes.ICollection;
                backgroundImageUrl = "images/DatabaseICollectionBG.png";
                break;
            case DATASOURCE_CODE_ENUMERABLE:
                this.selectedDataSource = Common.DataSourceTypes.IEnumerable;
                backgroundImageUrl = "images/DatabaseIENUMBG.png";
                break;
            case DATASOURCE_CODE_BINDINGLIST:
                this.selectedDataSource = Common.DataSourceTypes.IBindingList;
                backgroundImageUrl = "images/DatabaseIBindingBG.png";
                break;
            case DATASOURCE_CODE_XML:
            default:
                this.selectedDataSource = Common.DataSourceTypes.Xml;
                backgroundImageUrl = "images/DatabaseXMLBG.png";
                break;
        }

        this.Background.BackImageUrl = backgroundImageUrl;
        if (this.DataSourceChanged != null)
        {
            this.DataSourceChanged(this, EventArgs.Empty);
        }

    }

    #endregion

}
