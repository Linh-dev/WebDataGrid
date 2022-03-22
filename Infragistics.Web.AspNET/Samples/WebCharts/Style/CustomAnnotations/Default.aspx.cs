using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Infragistics.UltraChart.Core;
using Infragistics.UltraChart.Core.Primitives;
using Infragistics.UltraChart.Resources.Appearance;
using Infragistics.UltraChart.Shared.Styles;



/// <summary>
/// This sample demontrates how you can easily add a custom 
/// annotation shape to your chart.  To do this you simply 
/// create a class that implements the IAnnotation interface, 
/// and then use the RenderAnnotation method to define and 
/// output your annotation shape.  In the sample a custom star 
/// shaped annotation is created and added to the chart.
/// </summary>
public partial class Samples_WebCharts_Style_Custom_Annotations_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    /// <summary>
    /// Occurs when the server control is loaded into the Page object.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">An EventArgs that contains the event data.</param>
    private void Page_Load(object sender, System.EventArgs e)
    {
        // Create chart data
        this.UltraChart1.Data.DataSource =
            new double[] { 10f, 15f, 20f, 25f, 17.5f, 12.5f };
        this.UltraChart1.Data.DataBind();

        // Create initial annotation set at the top of 
        // the first data point
        WebCharts.AnnotationsDemo.MyCustomAnnotation myAnnotation = new WebCharts.AnnotationsDemo.MyCustomAnnotation();
        myAnnotation.Location.Type = LocationType.RowColumn;
        myAnnotation.Location.Column = 0;
        myAnnotation.Location.Row = 0;
        myAnnotation.Text = (String)GetGlobalResourceObject("WebCharts", "CustomAnnotations_Label");

        this.UltraChart1.Annotations.Add(myAnnotation);
    }

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
