using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Samples_WebCharts_Display_Statistical_Charts_Histogram_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    #region Name Generation
    private static string[] firstNames = new string[] { "Aaron", "Belinda", "Corey", "Damian", "Erica", "Fernando", "Gina", "Hugo", "Iris", "John", "Kayleigh", "Lamont", "Michelle", "Ned", "Oprah", "Paul", "Rachel", "Steve", "Tamara", "Urlich", "Vanessa", "William", "Xena", "Yanni", "Zara", "Darla", "Darren", "Deitrich", "Denise", "David", "Dirk", "Doyle", "Dylan", "Deanna", "Dewey" };
    private static string[] lastNames = new string[] { "Alfredson", "Beauregart", "Ciapello", "Dagwood", "Ericson", "Faroul", "Hart", "Iggitovich", "Johnson", "Klein", "Lott", "Michaels", "Newhart", "O'Connell", "Paulsen", "Rudolph", "Tice", "Unis", "Veitch", "Welles", "X", "Yeller", "Zauner", "Timmerman", "Tynes", "Tyler", "Tudor", "Tollefson" };

    private int indexFirst = 0;
    private int indexLast = 0;

    // Utility function to generate over a thousand names.
    private string GetNextName()
    {
        string nextName = Samples_WebCharts_Display_Statistical_Charts_Histogram_Default.firstNames[indexFirst] + " " + Samples_WebCharts_Display_Statistical_Charts_Histogram_Default.lastNames[indexLast];
        indexFirst = (indexFirst + 1) % Samples_WebCharts_Display_Statistical_Charts_Histogram_Default.firstNames.Length;
        if (indexFirst == 0)
        {
            indexLast = (indexLast + 1) % Samples_WebCharts_Display_Statistical_Charts_Histogram_Default.lastNames.Length;
        }
        return nextName;
    }
    #endregion // Name Generation


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DropDownList ddl = this.columnsDropDown;
            ddl.Items.Add("On");
            ddl.Items.Add("Off");
            ddl.SelectedIndex = 0;

            ddl = this.normalCurveDropDown;
            ddl.Items.Add("On");
            ddl.Items.Add("Off");
            ddl.SelectedIndex = 0;

            ddl = this.normalCurveFillDropDown;
            ddl.Items.Add("On");
            ddl.Items.Add("Off");
            ddl.SelectedIndex = 1;

            ddl = this.tickMarkDropDown;
            ddl.Items.Add("1 year");
            ddl.Items.Add("8 years");
            ddl.Items.Add("12 years");
            ddl.Items.Add("20 years");
            ddl.SelectedIndex = 1;
        }

        //  Generate data to be displayed and bind to chart
        BindDataToChart();

        //  X-Axis tickmarks: Get selected value from UI and configure chart
        string val = this.tickMarkDropDown.SelectedValue;
        if (val.StartsWith("1 "))
        {
            this.UltraChart1.Axis.X.TickmarkInterval = 1.0;
            this.UltraChart1.Axis.X.TickmarkStyle = Infragistics.UltraChart.Shared.Styles.AxisTickStyle.Smart;
        }
        else if (val.StartsWith("8"))
        {
            this.UltraChart1.Axis.X.TickmarkStyle = Infragistics.UltraChart.Shared.Styles.AxisTickStyle.DataInterval;
            this.UltraChart1.Axis.X.TickmarkInterval = 8.0;
        }
        else if (val.StartsWith("12"))
        {
            this.UltraChart1.Axis.X.TickmarkStyle = Infragistics.UltraChart.Shared.Styles.AxisTickStyle.DataInterval;
            this.UltraChart1.Axis.X.TickmarkInterval = 12.0;
        }
        else if (val.StartsWith("20"))
        {
            this.UltraChart1.Axis.X.TickmarkStyle = Infragistics.UltraChart.Shared.Styles.AxisTickStyle.DataInterval;
            this.UltraChart1.Axis.X.TickmarkInterval = 20.0;
        }

        //  Columns, Curve, and Curve Fill: Get selected values from UI and configure chart
        this.UltraChart1.HistogramChart.ColumnAppearance.Visible = (this.columnsDropDown.SelectedValue.IndexOf("On") != -1);
        this.UltraChart1.HistogramChart.LineAppearance.Visible = (this.normalCurveDropDown.SelectedValue.IndexOf("On") != -1);
        this.UltraChart1.HistogramChart.LineAppearance.FillArea = (this.normalCurveFillDropDown.SelectedValue.IndexOf("On") != -1);
    }

    private void BindDataToChart()
    {
        //  Generate data to be displayed in the chart
        DataSet usNongenderSingleLife03mortality = new DataSet("usNongenderSingleLife03mortality");

        // Create Mortality Table, based on Nongender Single Life products (2003)
        DataTable mortTable = new DataTable("Mortality");
        mortTable.Columns.Add(new DataColumn("Age", typeof(int)));
        mortTable.Columns.Add(new DataColumn("Qx", typeof(decimal)));
        mortTable.Columns.Add(new DataColumn("Ix", typeof(int)));
        mortTable.Columns.Add(new DataColumn("PerMillion", typeof(int)));

        //  Generate mortality data and to table
        GenerateMortalityData(mortTable);

        // Create Claims table, similar to the sort of table that
        // exists in many Insurance Claims applications.
        // 
        // As a simplification, Age is assumed to have been calculated
        // from Date Of Birth and Claim Date.
        //
        DataTable claimsTable = new DataTable("Claims");
        claimsTable.Columns.Add(new DataColumn("Name", typeof(string)));
        claimsTable.Columns.Add(new DataColumn("PolicyID", typeof(Guid)));
        claimsTable.Columns.Add(new DataColumn("Age", typeof(int)));

        // Point to "Age" column, note that this is the zero-based
        // index *excluding* any string columns in the DataTable.
        this.UltraChart1.HistogramChart.ColumnIndex = 1;

        // Generate Claims data based on expected mortality rate.
        foreach (DataRow r in mortTable.Rows)
        {
            int age = (int)(r.ItemArray[0]);

            // Ix is measured in a sample space of per-million,
            // so convert to per-thousand; in some Age Ranges
            // this may produce columns of zero-height if there
            // would have been less than 500 incidents in that
            // Age Range.
            //
            int incidentsPerM = (int)(r.ItemArray[3]);
            int incidentsPerK = incidentsPerM / 1000;
            if ((incidentsPerM % 1000) >= 500)
                ++incidentsPerK;

            for (; incidentsPerK > 0; --incidentsPerK)
            {
                claimsTable.Rows.Add(new object[] { this.GetNextName(), Guid.NewGuid(), age });
            }
        }

        usNongenderSingleLife03mortality.Tables.Add(claimsTable);
        usNongenderSingleLife03mortality.Tables.Add(mortTable);

        // Data bind the UltraChart control to the DataSet, from
        // which it reads the claimsTable.
        this.UltraChart1.DataSource = usNongenderSingleLife03mortality;
        this.UltraChart1.DataBind();
    }

    private static void GenerateMortalityData(DataTable mortTable)
    {
        mortTable.Rows.Add(new object[] { 0, 0.001982, 1000000, 1982 });
        mortTable.Rows.Add(new object[] { 1, 0.000802, 998018, 800 });
        mortTable.Rows.Add(new object[] { 2, 0.000433, 997218, 432 });
        mortTable.Rows.Add(new object[] { 3, 0.000337, 996786, 336 });
        mortTable.Rows.Add(new object[] { 4, 0.000284, 996450, 283 });
        mortTable.Rows.Add(new object[] { 5, 0.000248, 996167, 247 });
        mortTable.Rows.Add(new object[] { 6, 0.000221, 995920, 220 });
        mortTable.Rows.Add(new object[] { 7, 0.000201, 995700, 200 });
        mortTable.Rows.Add(new object[] { 8, 0.000222, 995500, 221 });
        mortTable.Rows.Add(new object[] { 9, 0.000241, 995279, 240 });
        mortTable.Rows.Add(new object[] { 10, 0.000259, 995039, 258 });
        mortTable.Rows.Add(new object[] { 11, 0.000277, 994781, 276 });
        mortTable.Rows.Add(new object[] { 12, 0.000292, 994505, 290 });
        mortTable.Rows.Add(new object[] { 13, 0.000306, 994215, 304 });
        mortTable.Rows.Add(new object[] { 14, 0.000318, 993911, 316 });
        mortTable.Rows.Add(new object[] { 15, 0.000331, 993595, 329 });
        mortTable.Rows.Add(new object[] { 16, 0.000344, 993266, 342 });
        mortTable.Rows.Add(new object[] { 17, 0.000359, 992924, 356 });
        mortTable.Rows.Add(new object[] { 18, 0.000375, 992568, 372 });
        mortTable.Rows.Add(new object[] { 19, 0.000392, 992196, 389 });
        mortTable.Rows.Add(new object[] { 20, 0.000411, 991807, 408 });
        mortTable.Rows.Add(new object[] { 21, 0.000432, 991399, 428 });
        mortTable.Rows.Add(new object[] { 22, 0.000454, 990971, 450 });
        mortTable.Rows.Add(new object[] { 23, 0.000476, 990521, 471 });
        mortTable.Rows.Add(new object[] { 24, 0.000501, 990050, 496 });
        mortTable.Rows.Add(new object[] { 25, 0.000524, 989554, 519 });
        mortTable.Rows.Add(new object[] { 26, 0.000547, 989035, 541 });
        mortTable.Rows.Add(new object[] { 27, 0.000567, 988494, 560 });
        mortTable.Rows.Add(new object[] { 28, 0.000584, 987934, 577 });
        mortTable.Rows.Add(new object[] { 29, 0.000598, 987357, 590 });
        mortTable.Rows.Add(new object[] { 30, 0.000608, 986767, 600 });
        mortTable.Rows.Add(new object[] { 31, 0.000615, 986167, 606 });
        mortTable.Rows.Add(new object[] { 32, 0.000619, 985561, 610 });
        mortTable.Rows.Add(new object[] { 33, 0.000622, 984951, 613 });
        mortTable.Rows.Add(new object[] { 34, 0.000625, 984338, 615 });
        mortTable.Rows.Add(new object[] { 35, 0.000629, 983723, 619 });
        mortTable.Rows.Add(new object[] { 36, 0.000636, 983104, 625 });
        mortTable.Rows.Add(new object[] { 37, 0.000657, 982479, 645 });
        mortTable.Rows.Add(new object[] { 38, 0.000696, 981834, 683 });
        mortTable.Rows.Add(new object[] { 39, 0.000749, 981151, 735 });
        mortTable.Rows.Add(new object[] { 40, 0.000818, 980416, 802 });
        mortTable.Rows.Add(new object[] { 41, 0.000904, 979614, 886 });
        mortTable.Rows.Add(new object[] { 42, 0.001007, 978728, 986 });
        mortTable.Rows.Add(new object[] { 43, 0.00113, 977742, 1105 });
        mortTable.Rows.Add(new object[] { 44, 0.00127, 976637, 1240 });
        mortTable.Rows.Add(new object[] { 45, 0.001426, 975397, 1391 });
        mortTable.Rows.Add(new object[] { 46, 0.001597, 974006, 1555 });
        mortTable.Rows.Add(new object[] { 47, 0.001783, 972451, 1734 });
        mortTable.Rows.Add(new object[] { 48, 0.001979, 970717, 1921 });
        mortTable.Rows.Add(new object[] { 49, 0.002187, 968796, 2119 });
        mortTable.Rows.Add(new object[] { 50, 0.002409, 966677, 2329 });
        mortTable.Rows.Add(new object[] { 51, 0.002646, 964348, 2552 });
        mortTable.Rows.Add(new object[] { 52, 0.002896, 961796, 2785 });
        mortTable.Rows.Add(new object[] { 53, 0.003167, 959011, 3037 });
        mortTable.Rows.Add(new object[] { 54, 0.003453, 955974, 3301 });
        mortTable.Rows.Add(new object[] { 55, 0.003754, 952673, 3576 });
        mortTable.Rows.Add(new object[] { 56, 0.004069, 949097, 3862 });
        mortTable.Rows.Add(new object[] { 57, 0.004398, 945235, 4157 });
        mortTable.Rows.Add(new object[] { 58, 0.004736, 941078, 4457 });
        mortTable.Rows.Add(new object[] { 59, 0.005101, 936621, 4778 });
        mortTable.Rows.Add(new object[] { 60, 0.005509, 931843, 5134 });
        mortTable.Rows.Add(new object[] { 61, 0.005975, 926709, 5537 });
        mortTable.Rows.Add(new object[] { 62, 0.006512, 921172, 5999 });
        mortTable.Rows.Add(new object[] { 63, 0.007137, 915173, 6532 });
        mortTable.Rows.Add(new object[] { 64, 0.007854, 908641, 7136 });
        mortTable.Rows.Add(new object[] { 65, 0.00867, 901505, 7816 });
        mortTable.Rows.Add(new object[] { 66, 0.009591, 893689, 8571 });
        mortTable.Rows.Add(new object[] { 67, 0.01062, 885118, 9400 });
        mortTable.Rows.Add(new object[] { 68, 0.011778, 875718, 10314 });
        mortTable.Rows.Add(new object[] { 69, 0.013072, 865404, 11313 });
        mortTable.Rows.Add(new object[] { 70, 0.014519, 854091, 12401 });
        mortTable.Rows.Add(new object[] { 71, 0.016139, 841690, 13584 });
        mortTable.Rows.Add(new object[] { 72, 0.01795, 828106, 14865 });
        mortTable.Rows.Add(new object[] { 73, 0.019958, 813241, 16231 });
        mortTable.Rows.Add(new object[] { 74, 0.022198, 797010, 17692 });
        mortTable.Rows.Add(new object[] { 75, 0.024699, 779318, 19248 });
        mortTable.Rows.Add(new object[] { 76, 0.027484, 760070, 20890 });
        mortTable.Rows.Add(new object[] { 77, 0.030582, 739180, 22606 });
        mortTable.Rows.Add(new object[] { 78, 0.03401, 716574, 24371 });
        mortTable.Rows.Add(new object[] { 79, 0.037807, 692203, 26170 });
        mortTable.Rows.Add(new object[] { 80, 0.04201, 666033, 27980 });
        mortTable.Rows.Add(new object[] { 81, 0.046652, 638053, 29766 });
        mortTable.Rows.Add(new object[] { 82, 0.051766, 608287, 31489 });
        mortTable.Rows.Add(new object[] { 83, 0.057392, 576798, 33104 });
        mortTable.Rows.Add(new object[] { 84, 0.063583, 543694, 34570 });
        mortTable.Rows.Add(new object[] { 85, 0.070397, 509124, 35841 });
        mortTable.Rows.Add(new object[] { 86, 0.077892, 473283, 36865 });
        mortTable.Rows.Add(new object[] { 87, 0.086124, 436418, 37586 });
        mortTable.Rows.Add(new object[] { 88, 0.095238, 398832, 37984 });
        mortTable.Rows.Add(new object[] { 89, 0.105068, 360848, 37914 });
        mortTable.Rows.Add(new object[] { 90, 0.115518, 322934, 37305 });
        mortTable.Rows.Add(new object[] { 91, 0.126487, 285629, 36128 });
        mortTable.Rows.Add(new object[] { 92, 0.137876, 249501, 34400 });
        mortTable.Rows.Add(new object[] { 93, 0.149419, 215101, 32140 });
        mortTable.Rows.Add(new object[] { 94, 0.161176, 182961, 29489 });
        mortTable.Rows.Add(new object[] { 95, 0.173067, 153472, 26561 });
        mortTable.Rows.Add(new object[] { 96, 0.185008, 126911, 23480 });
        mortTable.Rows.Add(new object[] { 97, 0.19692, 103431, 20368 });
        mortTable.Rows.Add(new object[] { 98, 0.210337, 83063, 17471 });
        mortTable.Rows.Add(new object[] { 99, 0.224861, 65592, 14749 });
        mortTable.Rows.Add(new object[] { 100, 0.241017, 50843, 12254 });
        mortTable.Rows.Add(new object[] { 101, 0.259334, 38589, 10007 });
        mortTable.Rows.Add(new object[] { 102, 0.280356, 28582, 8013 });
        mortTable.Rows.Add(new object[] { 103, 0.303142, 20569, 6235 });
        mortTable.Rows.Add(new object[] { 104, 0.329482, 14333, 4723 });
        mortTable.Rows.Add(new object[] { 105, 0.359886, 9611, 3459 });
        mortTable.Rows.Add(new object[] { 106, 0.394865, 6152, 2429 });
        mortTable.Rows.Add(new object[] { 107, 0.434933, 3723, 1619 });
        mortTable.Rows.Add(new object[] { 108, 0.480599, 2104, 1011 });
        mortTable.Rows.Add(new object[] { 109, 0.532376, 1093, 582 });
        mortTable.Rows.Add(new object[] { 110, 0.590774, 511, 302 });
        mortTable.Rows.Add(new object[] { 111, 0.656307, 209, 137 });
        mortTable.Rows.Add(new object[] { 112, 0.729484, 72, 52 });
        mortTable.Rows.Add(new object[] { 113, 0.810817, 19, 16 });
        mortTable.Rows.Add(new object[] { 114, 0.900819, 4, 3 });
    }
}
