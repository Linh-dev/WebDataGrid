using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSamplesCS.WebCharts.Customization;
using Infragistics.UltraChart.Shared.Styles;
using Infragistics.UltraChart.Resources.Appearance;
using System.Collections;
using System.Drawing;
using Infragistics.UltraChart.Resources;

public partial class Samples_WebCharts_Display_Chart_Customization_Custom_Map_Layer_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private void Page_Load(object sender, System.EventArgs e)
    {
        //' create the layer
        MapLayer mp = new MapLayer(this.Server.MapPath(this.GetXmlLocation("US_STATES.xml")));

        //' set the layer
        this.UltraChart1.ChartType = ChartType.Composite;
        this.UltraChart1.CompositeChart.ChartAreas.Add(new ChartArea());
        this.UltraChart1.UserLayerIndex = new String[] { "USMap" };
        this.UltraChart1.Layer.Add("USMap", mp);

        //' set the tooltip.
        Hashtable labelRenderers = new Hashtable();
        labelRenderers.Add("USMap", new USMapLabelRenderer(ExpenseByStateData()));
        this.UltraChart1.LabelHash = labelRenderers;
        this.UltraChart1.Tooltips.FormatString = "<USMap>";

        //'set border
        this.UltraChart1.Border.CornerRadius = 20;
        this.UltraChart1.Border.Thickness = 0;
        this.UltraChart1.BackColor = Color.White;

        //' set color model
        this.UltraChart1.ColorModel.ColorBegin = Color.AliceBlue;
        this.UltraChart1.ColorModel.ColorEnd = Color.FromArgb(24, 89, 165);
        this.UltraChart1.ColorModel.AlphaLevel = 255;
        this.UltraChart1.ColorModel.ModelStyle = ColorModels.DataValueLinearRange;

        //' legend
        this.UltraChart1.Legend.Visible = true;
        this.UltraChart1.Axis.X.Extent = 10;
        this.UltraChart1.Legend.SpanPercentage = 10;
        this.UltraChart1.Legend.Location = LegendLocation.Right;

        //' set the data
        this.UltraChart1.Data.DataSource = StatesExpenseView();
        this.UltraChart1.Data.DataBind();
    }

    #region ExpenseByStateData Method
    public DataTable ExpenseByStateData()
    {
        StateExpenseViewInfo[] StateInfo = StatesExpenseView();

        DataTable dt = new DataTable("States");
        dt = InitializeStatesTable();

        for (int i = 0; i < StateInfo.Length; i++)
        {
            switch (StateInfo[i].State)
            {

                case "Alabama":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel1"))[1] = StateInfo[i].Amount;
                    break;
                case "Alaska":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel2"))[1] = StateInfo[i].Amount;
                    break;
                case "Arkansas":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel3"))[1] = StateInfo[i].Amount;
                    break;
                case "Arizona":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel4"))[1] = StateInfo[i].Amount;
                    break;
                case "California":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel5"))[1] = StateInfo[i].Amount;
                    break;
                case "Colorado":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel6"))[1] = StateInfo[i].Amount;
                    break;
                case "Connecticut":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel7"))[1] = StateInfo[i].Amount;
                    break;
                case "Delaware":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel8"))[1] = StateInfo[i].Amount;
                    break;
                case "Florida":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel9"))[1] = StateInfo[i].Amount;
                    break;
                case "Georgia":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel10"))[1] = StateInfo[i].Amount;
                    break;
                case "Hawaii":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel11"))[1] = StateInfo[i].Amount;
                    break;
                case "Idaho":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel12"))[1] = StateInfo[i].Amount;
                    break;
                case "Illinois":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel13"))[1] = StateInfo[i].Amount;
                    break;
                case "Indiana":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel14"))[1] = StateInfo[i].Amount;
                    break;
                case "Iowa":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel15"))[1] = StateInfo[i].Amount;
                    break;
                case "Kansas":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel16"))[1] = StateInfo[i].Amount;
                    break;
                case "Kentucky":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel17"))[1] = StateInfo[i].Amount;
                    break;
                case "Louisiana":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel18"))[1] = StateInfo[i].Amount;
                    break;
                case "Maine":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel19"))[1] = StateInfo[i].Amount;
                    break;
                case "Massachusetts":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel20"))[1] = StateInfo[i].Amount;
                    break;
                case "Maryland":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel21"))[1] = StateInfo[i].Amount;
                    break;
                case "Michigan":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel22"))[1] = StateInfo[i].Amount;
                    break;
                case "Minnesota":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel23"))[1] = StateInfo[i].Amount;
                    break;
                case "Missouri":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel24"))[1] = StateInfo[i].Amount;
                    break;
                case "Mississippi":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel25"))[1] = StateInfo[i].Amount;
                    break;
                case "Montana":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel26"))[1] = StateInfo[i].Amount;
                    break;
                case "North Carolina":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel27"))[1] = StateInfo[i].Amount;
                    break;
                case "North Dakota":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel28"))[1] = StateInfo[i].Amount;
                    break;
                case "Nebraska":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel29"))[1] = StateInfo[i].Amount;
                    break;
                case "New Hampshire":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel30"))[1] = StateInfo[i].Amount;
                    break;
                case "New Jersey":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel31"))[1] = StateInfo[i].Amount;
                    break;
                case "New Mexico":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel32"))[1] = StateInfo[i].Amount;
                    break;
                case "Nevada":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel33"))[1] = StateInfo[i].Amount;
                    break;
                case "New York":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel34"))[1] = StateInfo[i].Amount;
                    break;
                case "Ohio":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel35"))[1] = StateInfo[i].Amount;
                    break;
                case "Oklahoma":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel36"))[1] = StateInfo[i].Amount;
                    break;
                case "Oregon":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel37"))[1] = StateInfo[i].Amount;
                    break;
                case "Pennsylvania":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel38"))[1] = StateInfo[i].Amount;
                    break;
                case "Rhode Island":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel39"))[1] = StateInfo[i].Amount;
                    break;
                case "South Carolina":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel40"))[1] = StateInfo[i].Amount;
                    break;
                case "South Dakota":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel41"))[1] = StateInfo[i].Amount;
                    break;
                case "Tennessee":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel42"))[1] = StateInfo[i].Amount;
                    break;
                case "Texas":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel43"))[1] = StateInfo[i].Amount;
                    break;
                case "Utah":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel44"))[1] = StateInfo[i].Amount;
                    break;
                case "Virginia":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel45"))[1] = StateInfo[i].Amount;
                    break;
                case "Vermont":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel46"))[1] = StateInfo[i].Amount;
                    break;
                case "Washington":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel47"))[1] = StateInfo[i].Amount;
                    break;
                case "Wisconsin":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel48"))[1] = StateInfo[i].Amount;
                    break;
                case "West Virginia":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel49"))[1] = StateInfo[i].Amount;
                    break;
                case "Wyoming":
                    dt.Rows.Find(this.GetGlobalResourceObject("WebCharts", "MapLabel50"))[1] = StateInfo[i].Amount;
                    break;
            }
        }

        return dt;
    }
    #endregion

    #region InitializeStatesTable
    private DataTable InitializeStatesTable()
    {
        DataTable dt = new DataTable();
        DataColumn chartCol = new DataColumn("State", typeof(String));

        dt.Columns.Add(chartCol);
        dt.PrimaryKey = new DataColumn[] { dt.Columns["State"] };
        chartCol = new DataColumn("Amount", typeof(Decimal));
        dt.Columns.Add(chartCol);

        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel1"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel2"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel3"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel4"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel5"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel6"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel7"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel8"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel9"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel10"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel11"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel12"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel13"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel14"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel15"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel16"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel17"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel18"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel19"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel20"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel21"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel22"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel23"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel24"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel25"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel26"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel27"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel28"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel29"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel30"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel31"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel32"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel33"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel34"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel35"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel36"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel37"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel38"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel39"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel40"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel41"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel42"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel43"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel44"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel45"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel46"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel47"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel48"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel49"), 0 });
        dt.Rows.Add(new Object[] { this.GetGlobalResourceObject("WebCharts", "MapLabel50"), 0 });

        return dt;
    }
    #endregion

    #region Create StateExpenseView Data
    private StateExpenseViewInfo[] StatesExpenseView()
    {
        StateExpenseViewInfo[] sevi = new StateExpenseViewInfo[50];

        sevi[0] = new StateExpenseViewInfo("Alabama", 1915560.96, "");
        sevi[1] = new StateExpenseViewInfo("Alaska", 0, "");
        sevi[2] = new StateExpenseViewInfo("Arizona", 1915560.96, "");
        sevi[3] = new StateExpenseViewInfo("Arkansas", 0, "");
        sevi[4] = new StateExpenseViewInfo("California", 9577804.80, "");
        sevi[5] = new StateExpenseViewInfo("Colorado", 957780.48, "");
        sevi[6] = new StateExpenseViewInfo("Connecticut", 1915560.96, "");
        sevi[7] = new StateExpenseViewInfo("Delaware", 2873341.44, "");
        sevi[8] = new StateExpenseViewInfo("Florida", 957780.48, "");
        sevi[9] = new StateExpenseViewInfo("Georgia", 0, "");
        sevi[10] = new StateExpenseViewInfo("Hawaii", 0, "");
        sevi[11] = new StateExpenseViewInfo("Idaho", 0, "");
        sevi[12] = new StateExpenseViewInfo("Illinois", 957780.48, "");
        sevi[13] = new StateExpenseViewInfo("Indiana", 1915560.96, "");
        sevi[14] = new StateExpenseViewInfo("Iowa", 1.34, "");
        sevi[15] = new StateExpenseViewInfo("Kansas", 957780.48, "");
        sevi[16] = new StateExpenseViewInfo("Kentucky", 0, "");
        sevi[17] = new StateExpenseViewInfo("Louisiana", 0, "");
        sevi[18] = new StateExpenseViewInfo("Maine", 0, "");
        sevi[19] = new StateExpenseViewInfo("Maryland", 5746682.88, "");
        sevi[20] = new StateExpenseViewInfo("Massachusetts", 1915560.96, "");
        sevi[21] = new StateExpenseViewInfo("Michigan", 957780.48, "");
        sevi[22] = new StateExpenseViewInfo("Minnesota", 957780.48, "");
        sevi[23] = new StateExpenseViewInfo("Mississippi", 0, "");
        sevi[24] = new StateExpenseViewInfo("Missouri", 0, "");
        sevi[25] = new StateExpenseViewInfo("Montana", 0, "");
        sevi[26] = new StateExpenseViewInfo("Nebraska", 0, "");
        sevi[27] = new StateExpenseViewInfo("Nevada", 957780.48, "");
        sevi[28] = new StateExpenseViewInfo("New Hampshire", 0, "");
        sevi[29] = new StateExpenseViewInfo("New Jersey", 2873341.44, "");
        sevi[30] = new StateExpenseViewInfo("New Mexico", 0, "");
        sevi[31] = new StateExpenseViewInfo("New York", 0, "");
        sevi[32] = new StateExpenseViewInfo("North Carolina", 1915560.96, "");
        sevi[33] = new StateExpenseViewInfo("North Dakota", 0, "");
        sevi[34] = new StateExpenseViewInfo("Ohio", 1915560.96, "");
        sevi[35] = new StateExpenseViewInfo("Oklahoma", 0, "");
        sevi[36] = new StateExpenseViewInfo("Oregon", 957780.48, "");
        sevi[37] = new StateExpenseViewInfo("Pennsylvania", 2873341.44, "");
        sevi[38] = new StateExpenseViewInfo("Rhode Island", 0, "");
        sevi[39] = new StateExpenseViewInfo("South Carolina", 0, "");
        sevi[40] = new StateExpenseViewInfo("South Dakota", 0, "");
        sevi[41] = new StateExpenseViewInfo("Tennessee", 0, "");
        sevi[42] = new StateExpenseViewInfo("Texas", 957780.48, "");
        sevi[43] = new StateExpenseViewInfo("Utah", 0, "");
        sevi[44] = new StateExpenseViewInfo("Vermont", 0, "");
        sevi[45] = new StateExpenseViewInfo("Virginia", 1915560.96, "");
        sevi[46] = new StateExpenseViewInfo("Washington", 957780.48, "");
        sevi[47] = new StateExpenseViewInfo("West Virginia", 957780.48, "");
        sevi[48] = new StateExpenseViewInfo("Wisconsin", 957780.48, "");
        sevi[49] = new StateExpenseViewInfo("Wyoming", 0, "");

        return sevi;
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

/// <summary>
/// This custom tooltip uses the State data information
/// to construct a custom tooltip based on the current
/// state
/// </summary>
public class USMapLabelRenderer : IRenderLabel
{

    public USMapLabelRenderer(DataTable info)
    {
        this._InformationPerState = info;
    } //'New

    private DataTable _InformationPerState;

    #region IRenderLabel Members
    /// <summary>
    /// Locate the proper data value for the current state, 
    /// construct and return the proper tooltip string
    /// </summary>
    /// <param name="Context"></param>
    /// <returns></returns>
    string IRenderLabel.ToString(Hashtable Context)
    {
        int row;
        if (Context["DATA_ROW"] != null)
        {
            row = (int)Context["DATA_ROW"];
        }
        else
        {
            row = (int)Context["ITEM_NUMBER"];
        }

		return _InformationPerState.Rows[row][0] + ": " + HttpContext.GetGlobalResourceObject("WebCharts", "LabelExpense") + " = " + System.Convert.ToDouble(_InformationPerState.Rows[row][1]).ToString("0.0");// +": Revenue=" + System.Convert.ToDouble(_InformationPerState.Rows[row][2]).ToString("0.0");
    }
    #endregion
} //'USMapLabelRenderer
