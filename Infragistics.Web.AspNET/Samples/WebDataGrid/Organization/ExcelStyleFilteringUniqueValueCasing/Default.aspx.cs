using System;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.SqlDataSource1.DataBind();
        this.UniqueValueCasingDropDown.SelectedIndexChanged += new EventHandler(UniqueValueCasingDropDown_SelectedIndexChanged);
        this.ColumnUniqueValueCasingDropDown.SelectedIndexChanged += new EventHandler(ColumnUniqueValueCasingDropDown_SelectedIndexChanged);
    }

    void ColumnUniqueValueCasingDropDown_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Web.UI.WebControls.DropDownList combo = (System.Web.UI.WebControls.DropDownList)sender;
        switch (combo.SelectedItem.Value)
        {
            case "Lower":
                this.WebDataGrid1.Behaviors.Filtering.ColumnSettings[1].UniqueValueCasing = Infragistics.Web.UI.GridControls.UniqueValueCasing.Lower;
                break;
            case "Upper":
                this.WebDataGrid1.Behaviors.Filtering.ColumnSettings[1].UniqueValueCasing = Infragistics.Web.UI.GridControls.UniqueValueCasing.Upper;
                break;
            case "Camel":
                this.WebDataGrid1.Behaviors.Filtering.ColumnSettings[1].UniqueValueCasing = Infragistics.Web.UI.GridControls.UniqueValueCasing.Camel;
                break;
        }
    }

    void UniqueValueCasingDropDown_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Web.UI.WebControls.DropDownList combo = (System.Web.UI.WebControls.DropDownList)sender;
        switch (combo.SelectedItem.Value)
        {
            case "Lower":
                this.WebDataGrid1.Behaviors.Filtering.UniqueValueCasing = Infragistics.Web.UI.GridControls.UniqueValueCasing.Lower;
                break;
            case "Upper":
                this.WebDataGrid1.Behaviors.Filtering.UniqueValueCasing = Infragistics.Web.UI.GridControls.UniqueValueCasing.Upper;
                break;
            case "Camel":
                this.WebDataGrid1.Behaviors.Filtering.UniqueValueCasing = Infragistics.Web.UI.GridControls.UniqueValueCasing.Camel;
                break;
        }
    }
}
