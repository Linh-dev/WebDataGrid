using System;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Organization_Fixed_Column_Calculations_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.GridDataSource.DataBind();
        if (!this.IsPostBack)
            this.GetColumnFixingBehavior().FixedColumns.Add(new FixedColumnInfo("QTYFGT", FixLocation.Right));
    }

    private ColumnFixing GetColumnFixingBehavior()
    {
        return this.WebDataGridView.Behaviors.GetBehavior<ColumnFixing>();
    }

    public static decimal Calculate(object quantity, object freight)
    {
        return Convert.ToDecimal(quantity) + Convert.ToDecimal(freight);
    }
}
