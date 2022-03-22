using System;
using System.Collections;
using Infragistics.Web.UI;
using Infragistics.Web.UI.GridControls;
using Infragistics.WebUI.WebSchedule;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private const string DATA_SESSION_KEY = "AdminSample_XMLData";
    private IList _resourceList;
    private ICollection _resourceCollection;
    private Infragistics.WebUI.Data.WebScheduleDataProviderBase _Provider;
    private class ResourceProxy
    {
        private int _dataKey;
        private string _name;
        private string _emailAddress;
        private string _description;
        private bool _enableEmailReminders;

        public ResourceProxy(int dataKey, string name, string emailAddress, string description, bool enableEmailReminders)
        {
            this._dataKey = dataKey;
            this._name = name;
            this._emailAddress = emailAddress;
            this._description = description;
            this._enableEmailReminders = enableEmailReminders;
        }

        public int DataKey { get { return this._dataKey; } set { this._dataKey = value; } }
        public string Name { get { return this._name; } set { this._name = value; } }
        public string EmailAddress { get { return this._emailAddress; } set { this._emailAddress = value; } }
        public string Description { get { return this._description; } set { this._description = value; } }
        public bool EnableEmailReminders { get { return this._enableEmailReminders; } set { this._enableEmailReminders = value; } }
    }
    protected override void OnInitComplete(EventArgs e)
    {

        System.Xml.XmlDocument doc = this.Session[DATA_SESSION_KEY] as System.Xml.XmlDocument;
        if (doc == null)
        {
            doc = WebScheduleSamples.Util.GenerateDocument();
            this.Session.Add(DATA_SESSION_KEY, doc);
        }
        this._Provider = new Infragistics.WebUI.Data.WebScheduleXMLDataProvider(doc);
        this.Form.Controls.Add(this._Provider);
        this._Provider.ID = "XMLDataProvider";
        this.Provider.WebScheduleInfo = this.WebScheduleInfo1;
        base.OnInitComplete(e);
    }
    private Infragistics.WebUI.Data.WebScheduleDataProviderBase Provider
    {
        get
        {
            return this._Provider;
        }
    }
    protected void Page_Load(object sender, System.EventArgs e)
    {
        this.ConnectToData(this.WebDataGrid1, false);

        if (!this.IsPostBack)
            this.WebDataGrid1.Behaviors.Sorting.SortedColumns.Add("Name", SortDirection.Ascending);
    }

    protected void WebDataGrid1_RowAdding(object sender, RowAddingEventArgs e)
    {
        DataContext context = null;
        WebDataGrid grid = sender as WebDataGrid;

        if (grid != null)
        {
            // create a new resource and set its properties
            Resource resourceToAdd = new Resource();

            resourceToAdd.Name = e.Values["Name"].ToString();
            resourceToAdd.Description = e.Values["Description"].ToString();
            resourceToAdd.EmailAddress = e.Values["EmailAddress"].ToString();

            bool enableEmail = Convert.ToBoolean(e.Values["EnableEmailReminders"]);
            if (enableEmail == true)
                resourceToAdd.ResourcePreferences[0].EnableEmailReminders = Infragistics.WebUI.Shared.DefaultableBoolean.True;
            else
                resourceToAdd.ResourcePreferences[0].EnableEmailReminders = Infragistics.WebUI.Shared.DefaultableBoolean.False;

            //  Don't add a resource if the name is empty
            if (resourceToAdd.Name != null && resourceToAdd.Name.Length != 0)
            {
                // use the WebScheduleDataProvider's AddResource method to add a resource
                context = new AddResourceContext(resourceToAdd);
                ((IDataUpdate)this.Provider).Update(context);
            }

            ConnectToData(grid, true);
        }
    }

    protected void WebDataGrid1_RowsDeleting(object sender, RowDeletingEventArgs e)
    {
        DataContext context = null;
        WebDataGrid grid = sender as WebDataGrid;

        if (grid != null)
        {
            // get the resource from its key, which is a hidden column in the grid
            Resource resourceToDelete = this.GetResourceFromKey(e.Row.Items.FindItemByKey("DataKey").Text);

            // use the WebScheduleDataProvider's RemoveResource method to delete a resource.
            context = new RemoveResourceContext(resourceToDelete.Name);
            ((IDataUpdate)this.Provider).Update(context);
        }

        ConnectToData(grid, true);
    }

    protected void WebDataGrid1_RowUpdating(object sender, RowUpdatingEventArgs e)
    {
        DataContext context = null;
        WebDataGrid grid = sender as WebDataGrid;

        if (grid != null)
        {
            // get the resource from its key, which is a hidden column in the grid
            Resource resourceToUpdate = this.GetResourceFromKey(e.Values["DataKey"].ToString());

            // set the resource's properties to the values that were set in the grid
            resourceToUpdate.Name = e.Values["Name"].ToString();
            resourceToUpdate.Description = e.Values["Description"].ToString();
            resourceToUpdate.EmailAddress = e.Values["EmailAddress"].ToString();

            bool enableEmail2 = Convert.ToBoolean(e.Values["EnableEmailReminders"]);
            if (enableEmail2 == true)
                resourceToUpdate.ResourcePreferences[0].EnableEmailReminders = Infragistics.WebUI.Shared.DefaultableBoolean.True;
            else
                resourceToUpdate.ResourcePreferences[0].EnableEmailReminders = Infragistics.WebUI.Shared.DefaultableBoolean.False;

            // use the WebScheduleDataProvider's UpdateResource method to update a resource.
            context = new UpdateResourceContext(resourceToUpdate);
            ((IDataUpdate)this.Provider).Update(context);

            ConnectToData(grid, true);
        }
    }

    private void ConnectToData(WebDataGrid grid, bool isRebound)
    {
        // get the resources from the WebScheduleDataProvider
        Infragistics.WebUI.Data.WebScheduleXMLDataProvider xmlProvider = this.Provider as Infragistics.WebUI.Data.WebScheduleXMLDataProvider;
        if (xmlProvider != null)
        {
            this._resourceCollection = xmlProvider.FetchResources();
        }
        else
        {
            this._resourceCollection = this.WebScheduleOleDbProvider1.FetchResources();
        }

        this._resourceList = new ArrayList();

        foreach (Resource r in this._resourceCollection)
        {
            bool enableEmailReminders = false;
            if (r.ResourcePreferences[0].EnableEmailReminders == Infragistics.WebUI.Shared.DefaultableBoolean.NotSet)
            {
                enableEmailReminders = this.WebScheduleInfo1.EnableEmailReminders;
            }
            else if (r.ResourcePreferences[0].EnableEmailReminders == Infragistics.WebUI.Shared.DefaultableBoolean.True)
            {
                enableEmailReminders = true;
            }
            this._resourceList.Add(new ResourceProxy(Convert.ToInt32(r.DataKey), r.Name, r.EmailAddress, r.Description, enableEmailReminders));
        }

        if (isRebound)
        {
            grid.ClearDataSource();
            grid.DataSource = this._resourceList;
            grid.DataBind();
            grid.RequestFullAsyncRender();
        }
        else
        {
            grid.DataSource = this._resourceList;
        }
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.oleDbConnection1 = new System.Data.OleDb.OleDbConnection();
        this.Page.Load += new System.EventHandler(this.Page_Load);
        this.ID = "ManageResources";
    }

    protected System.Data.OleDb.OleDbConnection oleDbConnection1;

    // function to get a resource proxy by key
    private ResourceProxy GetResourceProxyFromKey(string key)
    {

        foreach (ResourceProxy currentResource in this._resourceList)
        {
            if (key.CompareTo(currentResource.DataKey) == 0)
            {
                return currentResource;
            }
        }
        return null;
    }

    // function to get a resource by key
    private Resource GetResourceFromKey(string key)
    {

        foreach (Resource currentResource in this._resourceCollection)
        {
            if (key.CompareTo(currentResource.Key) == 0)
            {
                return currentResource;
            }
        }
        return null;
    }

    private void WebScheduleOleDbProvider1_DataProviderError(object sender, Infragistics.WebUI.Data.DataProviderErrorEventArgs e)
    {
        Response.Write("<script  type='text/javascript'> alert('Update Error: " + e.Message + "'); </script>");
    }
}
