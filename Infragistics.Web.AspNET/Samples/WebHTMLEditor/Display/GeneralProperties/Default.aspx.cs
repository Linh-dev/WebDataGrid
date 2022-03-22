using System;
using System.Web.UI.WebControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private void Page_Load(object sender, System.EventArgs e)
    {
        if (!this.IsPostBack)
        {
            DropDownList ddl = this.colorPaletteSize;
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.ColorPaletteSize.Average.ToString());
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.ColorPaletteSize.Extended.ToString());
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.ColorPaletteSize.Large.ToString());
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.ColorPaletteSize.Small.ToString());
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.ColorPaletteSize.VeryLarge.ToString());
            ddl.SelectedIndex = 0;

            ddl = this.localizationType;
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.LocalizationType.English.ToString());
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.LocalizationType.French.ToString());
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.LocalizationType.German.ToString());
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.LocalizationType.Spanish.ToString());
            ddl.SelectedIndex = 0;

            ddl = this.rightClickBehavior;
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.RightClickBehavior.HtmlBoxMenu.ToString());
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.RightClickBehavior.Nothing.ToString());
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.RightClickBehavior.WindowsMenu.ToString());
            ddl.SelectedIndex = 0;

            ddl = this.startUpMode;
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.StartupMode.Design.ToString());
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.StartupMode.HTML.ToString());
            ddl.SelectedIndex = 0;

            ddl = this.tabStripDisplay;
            ddl.Items.Add("True");
            ddl.Items.Add("False");
            ddl.SelectedIndex = 0;

            ddl = this.focus;
            ddl.Items.Add("True");
            ddl.Items.Add("False");
            ddl.SelectedIndex = 0;

            ddl = this.readOnly;
            ddl.Items.Add("True");
            ddl.Items.Add("False");
            ddl.SelectedIndex = 1;

            ddl = this.effects;
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.ExpandEffectsMode.None.ToString());
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.ExpandEffectsMode.Fast.ToString());
            ddl.Items.Add(Infragistics.WebUI.WebHtmlEditor.ExpandEffectsMode.Slow.ToString());
            ddl.SelectedIndex = 0;


        }
    }

    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        this.colorPaletteSize.SelectedIndexChanged += new System.EventHandler(this.selectedIndexChanged);       
        this.localizationType.SelectedIndexChanged += new System.EventHandler(this.selectedIndexChanged);
        this.rightClickBehavior.SelectedIndexChanged += new System.EventHandler(this.selectedIndexChanged);
        this.startUpMode.SelectedIndexChanged += new System.EventHandler(this.selectedIndexChanged);
        this.tabStripDisplay.SelectedIndexChanged += new System.EventHandler(this.selectedIndexChanged);
        this.focus.SelectedIndexChanged += new System.EventHandler(this.selectedIndexChanged);
        this.readOnly.SelectedIndexChanged += new System.EventHandler(this.selectedIndexChanged);
        base.OnInit(e);
    }


    #endregion

    private void selectedIndexChanged(object sender, System.EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;

        if (ddl.ID.IndexOf("colorPaletteSize") != -1)
            this.WebHtmlEditor1.ColorPaletteSize = (Infragistics.WebUI.WebHtmlEditor.ColorPaletteSize)Enum.Parse(typeof(Infragistics.WebUI.WebHtmlEditor.ColorPaletteSize), ddl.SelectedItem.Value, true);
        else if (ddl.ID.IndexOf("localizationType") != -1)
            this.WebHtmlEditor1.LocalizationType = (Infragistics.WebUI.WebHtmlEditor.LocalizationType)Enum.Parse(typeof(Infragistics.WebUI.WebHtmlEditor.LocalizationType), ddl.SelectedItem.Value, true);
        else if (ddl.ID.IndexOf("rightClickBehavior") != -1)
            this.WebHtmlEditor1.RightClickBehavior = (Infragistics.WebUI.WebHtmlEditor.RightClickBehavior)Enum.Parse(typeof(Infragistics.WebUI.WebHtmlEditor.RightClickBehavior), ddl.SelectedItem.Value, true);
        else if (ddl.ID.IndexOf("startUpMode") != -1)
            this.WebHtmlEditor1.StartupMode = (Infragistics.WebUI.WebHtmlEditor.StartupMode)Enum.Parse(typeof(Infragistics.WebUI.WebHtmlEditor.StartupMode), ddl.SelectedItem.Value, true);
        else if (ddl.ID.IndexOf("tabStripDisplay") != -1)
            this.WebHtmlEditor1.TabStripDisplay = bool.Parse(ddl.SelectedItem.Value);
        else if (ddl.ID.IndexOf("focus") != -1)
            this.WebHtmlEditor1.Focus = bool.Parse(ddl.SelectedItem.Value);
        else if (ddl.ID.IndexOf("readOnly") != -1)
            this.WebHtmlEditor1.ReadOnly = bool.Parse(ddl.SelectedItem.Value);
        else if (ddl.ID.IndexOf("effects") != -1)
            this.WebHtmlEditor1.ExpandEffects.Slide = (Infragistics.WebUI.WebHtmlEditor.ExpandEffectsMode)Enum.Parse(typeof(Infragistics.WebUI.WebHtmlEditor.ExpandEffectsMode), ddl.SelectedItem.Value, true);
    }
}
