﻿using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        AccessDataSource1.DataBind();
        AccessDataSource2.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
