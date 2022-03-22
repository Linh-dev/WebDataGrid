using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Samples_WebCharts_Display_Funnel_And_Pyramid_Charts_3D_Cone_Chart_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private void Page_Load(object sender, System.EventArgs e)
    {
        this.UltraChart1.Data.DataSource = MakeData();
        this.UltraChart1.Data.DataBind();
    }

    #region Create Chart Data
    /// <summary>
    /// Create data for the Funnel chart
    /// </summary>
    /// <returns></returns>
    private DataTable MakeData()
    {
        DataTable t = new DataTable();

        t.Columns.Add("Phase", typeof(string));
        t.Columns.Add("Expenses", typeof(System.Int32));

        t.Rows.Add(new object[] { "Research & Development", 88000 });
        t.Rows.Add(new object[] { "Manufacturing", 76000 });
        t.Rows.Add(new object[] { "Marketing", 45000 });
        t.Rows.Add(new object[] { "Shipping", 33500 });
        t.Rows.Add(new object[] { "Retail", 22000 });

        return t;
    }
    #endregion

    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        InitializeComponent();
        base.OnInit(e);
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        this.Load += new System.EventHandler(this.Page_Load);

    }
    #endregion
}
