using System;
using System.Collections.Generic;
using Infragistics.Web.UI.GridControls;

public partial class Samples_WebDataGrid_Display_Summaries_with_Unbound_Column_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void WebDataGrid1_InitializeRow(object sender, Infragistics.Web.UI.GridControls.RowEventArgs e)
    {
        decimal unitPrice = (decimal)e.Row.Items.FindItemByKey("UnitPrice").Value;
        decimal unitsOnOrder = (decimal)(short)e.Row.Items.FindItemByKey("UnitsOnOrder").Value;
        e.Row.Items.FindItemByKey("Total").Value = Decimal.Multiply(unitPrice, unitsOnOrder);
    }
}

