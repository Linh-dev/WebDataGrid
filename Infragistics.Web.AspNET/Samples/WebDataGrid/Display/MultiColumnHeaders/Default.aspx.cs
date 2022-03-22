using System;
using Infragistics.Web.UI.GridControls;
using System.Web.UI.WebControls;

public partial class Samples_WebDataGrid_Display_Multi_Column_Headers_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
	protected override void OnInit(EventArgs e)
	{
		base.OnInit(e);

		this.AccessDataSource1.DataBind();
	}
	protected void Page_Load(object sender, EventArgs e)
    {
		
		if (!this.Page.IsPostBack)
		{
			/* Creating a GroupedField */
			GroupField groupField = new GroupField();
			groupField.Key = "PhoneNumbers";
			groupField.Header.Text = this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderPhoneNumbers").ToString();

			/* Creating a  BoundDataField */
			BoundDataField field = new BoundDataField();
			field.DataFieldName = "Phone";
			field.Key = "Phone";
			field.Header.Text = this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderPhone").ToString();

			/* Adding the BoundDataField to be under the GroupedField 
			 * which was created above
			 */
			groupField.Columns.Add(field);

			/* Creating a  BoundDataField */
			field = new BoundDataField();
			field.DataFieldName = "Fax";
			field.Key = "Fax";
			field.Header.Text = this.GetGlobalResourceObject("WebDataGrid", "ColumnHeaderFax").ToString();

			/* Adding the BoundDataField to be under the GroupedField 
			 * which was created above
			 */
			groupField.Columns.Add(field);

			/* Adding the GroupField to WebDataGrid's Columns collection*/
			this.WebDataGridView.Columns.Add(groupField);

			/* You can use the function below to find any column (BoundDataField or GroupField),
			 * it will search through the grid's column collection and through all the GroupField's
			 * column collection to find the column.
			 */
			ControlDataField column = this.WebDataGridView.FindColumn("Address");
			((BoundDataField)column).Width = Unit.Pixel(150);
		}
    }
}