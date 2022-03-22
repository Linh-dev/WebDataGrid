using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using WebSamplesCS;
using Infragistics.UltraChart.Core;
using Infragistics.UltraChart.Core.Primitives;
using System.Drawing;
using Infragistics.UltraChart.Core.Util;

public partial class Samples_WebCharts_Display_Chart_Customization_FillSceneGraph_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected System.Data.OleDb.OleDbCommand oleDbSelectCommand1;
    protected System.Data.OleDb.OleDbCommand oleDbInsertCommand1;
    protected System.Data.OleDb.OleDbCommand oleDbUpdateCommand1;
    protected System.Data.OleDb.OleDbCommand oleDbDeleteCommand1;
    protected System.Data.OleDb.OleDbConnection oleDbConnection1;
    protected System.Data.OleDb.OleDbDataAdapter oleDbDataAdapter1;
    protected WebSamplesCS.WebCharts.ChartData chartData1;

    protected void Page_Load(object sender, EventArgs e)
    {
        InitConnections();

        this.oleDbConnection1.ConnectionString = Config.ChartMDBConnString;
        this.oleDbDataAdapter1.Fill(this.chartData1);
        this.UltraChart1.Data.DataSource = this.chartData1.BarColumnData;
        this.UltraChart1.Data.DataBind();
    }

    protected void UltraChart1_FillSceneGraph(object sender, Infragistics.UltraChart.Shared.Events.FillSceneGraphEventArgs e)
    {
        double target = 150.0;
        IAdvanceAxis axisY = e.Grid["Y"] as IAdvanceAxis;
        IAdvanceAxis axisX = e.Grid["X"] as IAdvanceAxis;

        int targetYCoord = (int)axisY.Map(target);
        int xStart = (int)axisX.MapMinimum;
        int xEnd = (int)axisX.MapMaximum;
        Line targetLine = new Line(new Point(xStart, targetYCoord), new Point(xEnd, targetYCoord));

        targetLine.PE.Stroke = Color.Red;
        targetLine.PE.StrokeWidth = 3;

        e.SceneGraph.Add(targetLine);

        Text targetLabel = new Text();
        targetLabel.SetTextString("Target: " + target.ToString());
        Size targetLabelSize = Size.Ceiling(Platform.GetLabelSizePixels(targetLabel.GetTextString(), targetLabel.labelStyle));
        targetLabel.bounds = new Rectangle(xStart, targetYCoord - targetLabelSize.Height, targetLabelSize.Width, targetLabelSize.Height);

        e.SceneGraph.Add(targetLabel);
    }

    private void InitConnections()
    {
        this.oleDbSelectCommand1 = new System.Data.OleDb.OleDbCommand();
        this.oleDbConnection1 = new System.Data.OleDb.OleDbConnection();
        this.oleDbInsertCommand1 = new System.Data.OleDb.OleDbCommand();
        this.oleDbUpdateCommand1 = new System.Data.OleDb.OleDbCommand();
        this.oleDbDeleteCommand1 = new System.Data.OleDb.OleDbCommand();
        this.oleDbDataAdapter1 = new System.Data.OleDb.OleDbDataAdapter();
        this.chartData1 = new WebSamplesCS.WebCharts.ChartData();
        ((System.ComponentModel.ISupportInitialize)(this.chartData1)).BeginInit();
        // 
        // oleDbSelectCommand1
        // 
        this.oleDbSelectCommand1.CommandText = "SELECT ActiveX, Java, NET, [Week#] FROM BarColumnData";
        this.oleDbSelectCommand1.Connection = this.oleDbConnection1;
        // 
        // oleDbConnection1
        // 
        this.oleDbConnection1.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=ChartDataBase.mdb;";
        // 
        // oleDbInsertCommand1
        // 
        this.oleDbInsertCommand1.CommandText = "INSERT INTO BarColumnData(ActiveX, Java, NET, [Week#]) VALUES (?, ?, ?, ?)";
        this.oleDbInsertCommand1.Connection = this.oleDbConnection1;
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("ActiveX", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "ActiveX", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Java", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Java", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("NET", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "NET", System.Data.DataRowVersion.Current, null));
        this.oleDbInsertCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Week#", System.Data.OleDb.OleDbType.VarWChar, 50, "Week#"));
        // 
        // oleDbUpdateCommand1
        // 
        this.oleDbUpdateCommand1.CommandText = "UPDATE BarColumnData SET ActiveX = ?, Java = ?, NET = ?, [Week#] = ? WHERE ([Week" +
            "#] = ?)";
        this.oleDbUpdateCommand1.Connection = this.oleDbConnection1;
        this.oleDbUpdateCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("ActiveX", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "ActiveX", System.Data.DataRowVersion.Current, null));
        this.oleDbUpdateCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Java", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "Java", System.Data.DataRowVersion.Current, null));
        this.oleDbUpdateCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("NET", System.Data.OleDb.OleDbType.Integer, 0, System.Data.ParameterDirection.Input, false, ((System.Byte)(10)), ((System.Byte)(0)), "NET", System.Data.DataRowVersion.Current, null));
        this.oleDbUpdateCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Week#", System.Data.OleDb.OleDbType.VarWChar, 50, "Week#"));
        this.oleDbUpdateCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Original_Week#", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "Week#", System.Data.DataRowVersion.Original, null));
        // 
        // oleDbDeleteCommand1
        // 
        this.oleDbDeleteCommand1.CommandText = "DELETE FROM BarColumnData WHERE ([Week#] = ?)";
        this.oleDbDeleteCommand1.Connection = this.oleDbConnection1;
        this.oleDbDeleteCommand1.Parameters.Add(new System.Data.OleDb.OleDbParameter("Original_Week#", System.Data.OleDb.OleDbType.VarWChar, 50, System.Data.ParameterDirection.Input, false, ((System.Byte)(0)), ((System.Byte)(0)), "Week#", System.Data.DataRowVersion.Original, null));
        // 
        // oleDbDataAdapter1
        // 
        this.oleDbDataAdapter1.DeleteCommand = this.oleDbDeleteCommand1;
        this.oleDbDataAdapter1.InsertCommand = this.oleDbInsertCommand1;
        this.oleDbDataAdapter1.SelectCommand = this.oleDbSelectCommand1;
        this.oleDbDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
																										new System.Data.Common.DataTableMapping("Table", "BarColumnData", new System.Data.Common.DataColumnMapping[] {
																																																						 new System.Data.Common.DataColumnMapping("Week#", "Week#"),
																																																						 new System.Data.Common.DataColumnMapping("ActiveX", "ActiveX"),
																																																						 new System.Data.Common.DataColumnMapping("Java", "Java"),
																																																						 new System.Data.Common.DataColumnMapping("NET", "NET")})});
        this.oleDbDataAdapter1.UpdateCommand = this.oleDbUpdateCommand1;
        // 
        // chartData1
        // 
        this.chartData1.DataSetName = "ChartData";
        this.chartData1.Locale = new System.Globalization.CultureInfo("en-US");
        this.chartData1.Namespace = "http://www.tempuri.org/ChartData.xsd";
        this.Load += new System.EventHandler(this.Page_Load);
        ((System.ComponentModel.ISupportInitialize)(this.chartData1)).EndInit();
    }
}