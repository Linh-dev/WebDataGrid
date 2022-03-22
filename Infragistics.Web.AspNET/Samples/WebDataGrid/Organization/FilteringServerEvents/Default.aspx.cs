using System;
using System.Text;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Organization_Filtering_Server_Events_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        this.AccessDataSource1.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Data_Filtered(object sender, FilteredEventArgs e)
    {
        bool firstTime = true;
        StringBuilder filterMessage = new StringBuilder();
        foreach (ColumnFilter column in e.ColumnFilters)
        {
            if (String.IsNullOrEmpty(column.ColumnKey))
                continue;

            if (!firstTime)
            {
                filterMessage.Append(" | ");
            }
            string filter = string.Format(this.GetGlobalResourceObject("WebDataGrid","Filtering_ColumnFilterMessage").ToString(), column.ColumnKey, column.Condition.GetFilterRuleString(column.ColumnKey));
            filterMessage.Append(filter);
            firstTime = false;
        }
        this.ServerMessage.Text = this.GetGlobalResourceObject("WebDataGrid","Filtering_ServerEventMessage") + filterMessage.ToString();
    }
}
