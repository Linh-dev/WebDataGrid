using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Samples_WebCharts_Display_Client_Side_Object_Model_Printing_Client_Side_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UltraChart1.Data.DataSource = Infragistics.UltraChart.Data.DemoTable.Table();
        this.UltraChart1.Data.DataBind();
        this.Button1.Attributes.Add("onclick", "PrintChart()");
    }
}