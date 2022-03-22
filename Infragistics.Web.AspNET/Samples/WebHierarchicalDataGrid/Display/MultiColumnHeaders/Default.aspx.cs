using System;
using Infragistics.Web.UI.GridControls;
using System.Web.UI.WebControls;

public partial class Samples_WebHierarchicalDataGrid_Display_MultiColumnHeaders_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        this.AccessDataSource1.DataBind();
        this.AccessDataSource2.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.Page.IsPostBack)
        {
            /* Creating a GroupedField */
            GroupField groupField = new GroupField();
            groupField.Key = "PhoneNumbers";
            groupField.Header.Text = this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_HeaderText_PhoneNumbers").ToString();

            /* Creating a  BoundDataField */
            BoundDataField field = new BoundDataField();
            field.DataFieldName = "Phone";
            field.Key = "Phone";
            field.Header.Text = this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_HeaderText_Phone").ToString();

            /* Adding the BoundDataField to be under the GroupedField 
             * which was created above
             */
            groupField.Columns.Add(field);

            /* Creating a  BoundDataField */
            field = new BoundDataField();
            field.DataFieldName = "Fax";
            field.Key = "Fax";
            field.Header.Text = this.GetGlobalResourceObject("WebHierarchicalDataGrid", "WebHierarchicalDataGrid_HeaderText_Fax").ToString();

            /* Adding the BoundDataField to be under the GroupedField 
             * which was created above
             */
            groupField.Columns.Add(field);

            /* Adding the GroupField to WebDataGrid's Columns collection*/
            this.WebHierarchicalDataGrid1.Columns.Add(groupField);
        }
    }
}