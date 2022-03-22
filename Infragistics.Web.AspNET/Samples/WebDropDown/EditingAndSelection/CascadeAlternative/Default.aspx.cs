using System;
using System.Collections;
using System.Collections.Generic;
using Infragistics.Web.UI.ListControls;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.WebDropDownCountry.SelectionChanged += new DropDownSelectionChangedEventHandler(WebDropDownCountry_SelectionChanged);
        this.WebDropDownState.SelectionChanged += new DropDownSelectionChangedEventHandler(WebDropDownState_SelectionChanged);
    }

    void WebDropDownState_SelectionChanged(object sender, DropDownSelectionChangedEventArgs e)
    {
        WebDropDownCity.Items.Clear();

        WebDropDownDataCommand wddc = new WebDropDownDataCommand();
        IList<WebDropDownItem> list = wddc.GetData(WebDropDownCountry.SelectedValue, WebDropDownState.SelectedValue);

        WebDropDownCity.DataSource = list;
        WebDropDownCity.TextField = "Text";
        WebDropDownCity.ValueField = "Value";
        WebDropDownCity.DataBind();
        WebDropDownCity.CurrentValue = "";
    }

    void WebDropDownCountry_SelectionChanged(object sender, DropDownSelectionChangedEventArgs e)
    {
        WebDropDownCity.Items.Clear();

        WebDropDownDataCommand wddc = new WebDropDownDataCommand();
        IList<WebDropDownItem> list = wddc.GetData(WebDropDownCountry.SelectedValue);

        WebDropDownState.DataSource = list;
        WebDropDownState.TextField = "Text";
        WebDropDownState.ValueField = "Value";
        WebDropDownState.DataBind();
        WebDropDownState.CurrentValue = "";
        WebDropDownCity.CurrentValue = "";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            WebDropDownCountry.Items.Clear();

            WebDropDownDataCommand wddc = new WebDropDownDataCommand();
            IList<WebDropDownItem> list = wddc.GetData();

            WebDropDownCountry.DataSource = list;
            WebDropDownCountry.TextField = "Text";
            WebDropDownCountry.ValueField = "Value";
            WebDropDownCountry.DataBind();
            WebDropDownCountry.CurrentValue = "";
        }
    }

}