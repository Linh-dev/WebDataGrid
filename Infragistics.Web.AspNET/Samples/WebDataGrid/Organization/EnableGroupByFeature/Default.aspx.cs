﻿using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        this.AccessDataSource1.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        this.WebHierarchicalDataGrid1.GroupingSettings.EnableColumnGrouping = this.CheckBox1.Checked ? Infragistics.Web.UI.DefaultableBoolean.True : Infragistics.Web.UI.DefaultableBoolean.False;
    }
}
