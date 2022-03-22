using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Infragistics.UltraChart.Shared.Styles;

public partial class Samples_WebCharts_Display_Funnel_And_Pyramid_Charts_Funnel_Chart_Styles_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private void Page_Load(object sender, System.EventArgs e)
    {
        this.UltraChart1.Data.DataSource = MakeData();
        this.UltraChart1.Data.DataBind();

        if (!Page.IsPostBack)
        {
            string[] axisLayout = System.Enum.GetNames(typeof(HierarchicalChartAxis));
            foreach (string s in axisLayout)
            {
                this.DropDownList1.Items.Add(s);
            }
            this.DropDownList1.Items.FindByText(System.Enum.GetName(typeof(HierarchicalChartAxis), this.UltraChart1.FunnelChart.Axis)).Selected = true;

            string[] sortStyle = System.Enum.GetNames(typeof(SortStyle));
            foreach (string s in sortStyle)
            {
                this.DropDownList2.Items.Add(s);
            }
            this.DropDownList2.Items.FindByText(System.Enum.GetName(typeof(SortStyle), this.UltraChart1.FunnelChart.Sort)).Selected = true;

            this.WebNumericEdit2.Value = this.UltraChart1.FunnelChart.RadiusMin;
            this.WebNumericEdit1.Value = this.UltraChart1.FunnelChart.RadiusMax;
            this.WebNumericEdit3.Value = this.UltraChart1.FunnelChart.Spacing;
        }
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

        t.Rows.Add(new object[] { "Research & Develop.", 88000 });
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
        this.Button1.Click += new System.EventHandler(this.Button1_Click);
        this.Load += new System.EventHandler(this.Page_Load);

    }
    #endregion

    private void Button1_Click(object sender, System.EventArgs e)
    {
        this.UltraChart1.FunnelChart.Axis = (HierarchicalChartAxis)System.Enum.Parse(typeof(HierarchicalChartAxis), this.DropDownList1.SelectedItem.ToString());
        this.UltraChart1.FunnelChart.Sort = (SortStyle)System.Enum.Parse(typeof(SortStyle), this.DropDownList2.SelectedItem.ToString());
        this.UltraChart1.FunnelChart.RadiusMin = (double)this.WebNumericEdit2.Value;
        this.UltraChart1.FunnelChart.RadiusMax = (double)this.WebNumericEdit1.Value;
        this.UltraChart1.FunnelChart.Spacing = (double)this.WebNumericEdit3.Value;
    }
}