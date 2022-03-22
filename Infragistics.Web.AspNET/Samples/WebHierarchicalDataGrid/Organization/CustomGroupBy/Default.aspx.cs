using System;
using System.Web.UI;
using Infragistics.Web.UI.GridControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.AccessDataSource1.DataBind();
        if (!Page.IsPostBack)
        {
            ColumnGroupingSetting setting = new ColumnGroupingSetting();
            setting.ColumnKey = "LastName";
            setting.GroupComparer = new AlphabetGroupComparer();

            this.WebHierarchicalDataGrid1.GroupingSettings.ColumnSettings.Add(setting);
            this.WebHierarchicalDataGrid1.GroupingSettings.GroupedColumns.Add("LastName");
        }
        else
            this.WebHierarchicalDataGrid1.GroupingSettings.ColumnSettings["LastName"].GroupComparer = new AlphabetGroupComparer();

    }

    public class AlphabetGroupComparer : GroupEqualityComparer<string>
    {
        public override bool Equals(string x, string y)
        {
            if (x.Substring(0, 1).ToLower() == y.Substring(0, 1).ToLower())
                return true;
            return false;
        }

        public override string GroupName(string value)
        {
            if (value.Length == 0)
                return string.Empty;
            return value.Substring(0, 1).ToUpper();
        }
    }
}
