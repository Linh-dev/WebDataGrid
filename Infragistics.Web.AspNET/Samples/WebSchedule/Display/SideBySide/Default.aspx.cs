using System;
using System.Collections.Generic;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (colorsCheckBox.Checked)
        {
            List<SideBySideStyle> styles = SideBySideHelper.GetSideBySideStyles();

            this.rView.SydeBySideStyles.AddRange(styles);
        }
        else
        {
            this.rView.SydeBySideStyles.Add(new SideBySideStyle());
        }

        this.AccessDataSource1.DataFile = this.GetMdbLocation("WebScheduleSample.mdb");
        this.rView.HideSynchronizedScrollbars = hideScrollbarsCheckBox.Checked;
        this.rView.HideViewModesMenu = hideViewModesMenuCheckBox.Checked;
        this.rView.EnableScrollbarsSynchronization = syncScrollBarsCheckBox.Checked;

        if (!IsPostBack)
        {
            this.rView.ViewMode = SideBySideViewMode.Day;
            this.rView.VisibleResources.AddRange(new string[] { "Allyson Tuley", "Chandra Rochford", "Ted Redfern", "Jamie Gadomski", "Javier Lamoreaux" });

            this.rView.ActiveDay = new DateTime(2009, 09, 16);

            this.rView.ConnectionString = this.AccessDataSource1.ConnectionString;

            this.rView.AddSideBySideView("Jamie Gadomski");
            this.rView.AddSideBySideView("Allyson Tuley");

            this.rView.DisableActivityDialog = true;
            this.rView.DisableActivityUpdating = true;
        }
    }
}
