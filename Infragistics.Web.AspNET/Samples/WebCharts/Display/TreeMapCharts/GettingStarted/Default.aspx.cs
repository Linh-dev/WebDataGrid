using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Samples_WebCharts_Display_TreeMap_Charts_Getting_Started_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private System.Data.DataSet dataSet1;
    private System.Data.DataTable dataTable1;


    protected void Page_Load(object sender, EventArgs e)
    {
        this.dataTable1 = new System.Data.DataTable();
        //this.dataTable1.TableName = "Meal Expenses";
        //this.dataSet1 = new System.Data.DataSet();


        this.dataTable1.Columns.Add("COL1", typeof(string));
        this.dataTable1.Columns.Add("COL2", typeof(string));
        this.dataTable1.Columns.Add("COL3", typeof(string));
        this.dataTable1.Columns.Add("Cost ($)", typeof(double));
        this.dataTable1.Columns.Add("COL5", typeof(double));
        this.dataTable1.Rows.Add("Food", "Crunchies", "Crackers", 15.0, 9.00);
        this.dataTable1.Rows.Add("Food", "Crunchies", "Biscuits", 1.5, 0.9);
        this.dataTable1.Rows.Add("Food", "Fruit", "Bananas", 11.2, 0.8);
        this.dataTable1.Rows.Add("Food", "Fruit", "Apples", 14.3, 0.7);
        this.dataTable1.Rows.Add("Candy", "CandyBars", "", 9.4, 0.5);
        this.dataTable1.Rows.Add("Food", "Fruit", "Oranges", 10.9, 0.2);
        this.dataTable1.Rows.Add("Drink", "Coke", "", 2.4, 0.1);
        this.dataTable1.Rows.Add("Drink", "Milk", "", 15.9, 0.0);
        this.dataTable1.Rows.Add("Drink", "OJ Soda", "", 3.0, -0.1);
        this.dataTable1.Rows.Add("Drink", "Water", "", 8.1, -0.3);
        this.dataTable1.Rows.Add("Drink", "Cran-Ras", "", 8.0, -0.5);
        this.dataTable1.Rows.Add("Drink", "Gatorade", "", 8.0, -0.7);
        this.dataTable1.Rows.Add("Candy", "Skittles", "", 20.0, -1.0);
        this.UltraChart1.Data.DataSource = this.dataTable1;
        this.UltraChart1.Data.DataBind();


    }    
}