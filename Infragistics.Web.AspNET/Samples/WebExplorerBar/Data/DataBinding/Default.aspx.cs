﻿using System;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.ExplorerBarDataSource.DataFile = this.GetXmlLocation("Books.xml");
        if (!this.IsPostBack)
        {
            this.WebExplorerBar1.DataSourceID = "ExplorerBarDataSource";
        }
    }
}