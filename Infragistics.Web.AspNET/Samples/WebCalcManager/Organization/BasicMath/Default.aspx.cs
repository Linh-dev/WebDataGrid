using System;
using System.Web.UI;
using Infragistics.WebUI.UltraWebCalcManager;

public partial class Samples_WebCalcManager_Organization_Basic_Math_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        if (!this.Page.IsPostBack)
        {
            WebNumericEdit1.Value = 1;
            WebNumericEdit2.Value = 2;
            WebNumericEdit3.Value = 3;
            WebNumericEdit4.Value = 4;
            WebNumericEdit6.Value = 1;
            WebNumericEdit7.Value = 2;
            WebNumericEdit8.Value = 3;
            WebNumericEdit9.Value = 4;

            WebNumericEdit11.Value = 1;
            WebNumericEdit12.Value = 2;
            WebNumericEdit13.Value = 3;
            WebNumericEdit14.Value = 4;
            WebNumericEdit16.Value = 1;
            WebNumericEdit17.Value = 2;
            WebNumericEdit18.Value = 3;
            WebNumericEdit19.Value = 4;
        }

        this.CreateFormulas();
    }

    private void CreateFormulas()
    {
        this.CreateAdditionFormulas();
        this.CreateSumFunctionFormulas();

        this.SetPropertyName(this.WebNumericEdit21, "Value");
        this.SetFormula(this.WebNumericEdit21, String.Format("sum ( [//{0}] , [//{1}] , [//{2}] , [//{3}] )", this.WebNumericEdit5.ID, this.WebNumericEdit10.ID, this.WebNumericEdit15.ClientID, this.WebNumericEdit20.ClientID));
    }

    private void CreateAdditionFormulas()
    {
        // In order to use a simple control (which does not 
        // implement IUltraCalcParticipant) in a formula, the 
        // PropertyName on the CalcSettings extender 
        // property must first be set. 
        this.SetPropertyName(this.WebNumericEdit11, "Value");
        this.SetPropertyName(this.WebNumericEdit12, "Value");
        this.SetPropertyName(this.WebNumericEdit13, "Value");
        this.SetPropertyName(this.WebNumericEdit14, "Value");
        this.SetPropertyName(this.WebNumericEdit15, "Value");

        // Set the formula
        this.SetFormula(this.WebNumericEdit15, String.Format("[//{0}] + [//{1}] + [//{2}] + [//{3}]", this.WebNumericEdit11.ClientID, this.WebNumericEdit12.ClientID, this.WebNumericEdit13.ClientID, this.WebNumericEdit14.ClientID));
    }

    private void CreateSumFunctionFormulas()
    {
        // In order to use a simple control (which does not 
        // implement IUltraCalcParticipant) in a formula, the 
        // PropertyName on the CalcSettings extender 
        // property must first be set. 
        this.SetPropertyName(this.WebNumericEdit16, "Value");
        this.SetPropertyName(this.WebNumericEdit17, "Value");
        this.SetPropertyName(this.WebNumericEdit18, "Value");
        this.SetPropertyName(this.WebNumericEdit19, "Value");
        this.SetPropertyName(this.WebNumericEdit20, "Value");

        // Set the formula
        this.SetFormula(this.WebNumericEdit20, String.Format("sum ( [//{0}] , [//{1}] , [//{2}] , [//{3}] )", this.WebNumericEdit16.ClientID, this.WebNumericEdit17.ClientID, this.WebNumericEdit18.ClientID, this.WebNumericEdit19.ClientID));
    }

    private void SetPropertyName(Control control, string propertyName)
    {
        // To acces extender the CalcManager extender properties, call 
        // the first get the GetCalcSettings method.
        CalcSettings objCalcSettings = null;
        objCalcSettings = this.UltraWebCalcManager1.GetCalcSettings(control);

        // Set the PropertyName. This will prepare the control to be 
        // used in calculations. Note that in order for a control to
        // function properly as the SOURCE value of a calculation, the
        // property must also have a changed event. For example, if using
        // the Text property, the control must have a TextChanged event. 
        // Otherwise, the CalcManager cannot detect changes in the property.
        objCalcSettings.PropertyName = propertyName;
    }
    private void SetFormula(Control control, string formula)
    {
        // To acces extender the CalcManager extender properties, call 
        // the first get the GetCalcSettings method.
        CalcSettings objCalcSettings = null;
        objCalcSettings = this.UltraWebCalcManager1.GetCalcSettings(control);

        // Set the formula. 
        objCalcSettings.Formula = formula.Replace('_', '$');
        objCalcSettings.Alias = objCalcSettings.AliasResolved;
    }
}
