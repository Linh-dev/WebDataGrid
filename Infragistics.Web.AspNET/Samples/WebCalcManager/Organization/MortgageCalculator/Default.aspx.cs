using System;
using System.Data;
using System.Text;
using System.Web.UI;
using Infragistics.WebUI.UltraWebCalcManager;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private DataTable paymentDataTable = null;
    protected NamedReference monthlyInterestRef;
    protected NamedReference exponent;

    protected void Page_Load(object sender, System.EventArgs e)
    {
        //    We will have the user click a button to perform the calculation,
        //    so set the CalcFrequency property ot Manual
        this.UltraWebCalcManager1.CalcFrequency = CalcFrequency.Manual;

        // set the labels for the lables
        string currencySymbol = System.Globalization.CultureInfo.CurrentCulture.NumberFormat.CurrencySymbol;

        if (!IsPostBack)
        {
            wpeInterestRate.Value = 6.5m;
            wneTerm.Value = 15;
            wnePayments.Value = 12;
            wceCalcPayment.Value = 0m;
            wcePrincipal.Value = 100000;
        }

        CreateFormulas();

        this.WebDataGrid1.DataSource = this.PaymentDataTable;
    }

    /// <summary>
    /// Creates and assigns the calculations for the fields on the form        
    /// </summary>
    private void CreateFormulas()
    {
        // Initialize the named references so that they can be used later in the calculation tree
        monthlyInterestRef = new NamedReference("MonthlyInterest", "[//InterestRate] / ([//Payments] * 100)");
        exponent = new NamedReference("Exponent", "([//Term] * [//Payments]) * -1");
        this.UltraWebCalcManager1.NamedReferences.Add(monthlyInterestRef);
        this.UltraWebCalcManager1.NamedReferences.Add(exponent);

        //Declare a CalcSettings object to use. 
        CalcSettings calcSettings = null;

        //Get the CalcSettings of the Payments UltraNumericEditor
        calcSettings = this.UltraWebCalcManager1.GetCalcSettings(this.wnePayments);
        calcSettings.Alias = calcSettings.Key = "Payments";
        calcSettings.PropertyName = "Value";

        //Get the CalcSettings of the Terms UltraNumericEditor
        calcSettings = this.UltraWebCalcManager1.GetCalcSettings(this.wneTerm);
        calcSettings.Alias = "Term";
        calcSettings.Key = "Term";
        calcSettings.PropertyName = "Value";

        //Get the CalcSettings of the InterestRate UltraPercentEditor
        calcSettings = this.UltraWebCalcManager1.GetCalcSettings(this.wpeInterestRate);
        calcSettings.Alias = calcSettings.Key = "InterestRate";
        calcSettings.PropertyName = "Value";

        //Get the CalcSettings of the Principal UltraCurrencyEditor
        calcSettings = this.UltraWebCalcManager1.GetCalcSettings(this.wcePrincipal);
        calcSettings.Alias = calcSettings.Key = "Principal";
        calcSettings.PropertyName = "Value";

        //Get the CalcSettings of the Calculated Payment UltraCurrencyEditor
        calcSettings = this.UltraWebCalcManager1.GetCalcSettings(this.wceCalcPayment);
        calcSettings.Alias = "CalcPayment";
        calcSettings.Key = "CalcPayment";
        calcSettings.PropertyName = "Value";

        StringBuilder sb = new StringBuilder(256);

        sb.Append("ROUND( ");
        sb.Append("[//Principal] * ");
        sb.Append("( ");
        sb.Append("[//MonthlyInterest]");
        sb.Append(" / ");
        sb.Append("(1 - POWER([//MonthlyInterest] + 1, [//Exponent]))");
        sb.Append(" )");
        sb.Append(", 2 )");

        calcSettings.Formula = sb.ToString();
    }

    #region PaymentDataTable
    /// <summary>
    /// Returns the DataTable that represents the DataSource for the payment schedule grid.
    /// </summary>
    private DataTable PaymentDataTable
    {
        get
        {
            if (this.paymentDataTable == null)
            {
                //    Create the table
                this.paymentDataTable = new DataTable("PaymentSchedule");

                //    Add the columns
                this.paymentDataTable.Columns.Add("PaymentDate", typeof(DateTime));
                this.paymentDataTable.Columns.Add("Interest", typeof(decimal));
                this.paymentDataTable.Columns.Add("PrincipalPayment", typeof(decimal));
                this.paymentDataTable.Columns.Add("PrincipalRemaining", typeof(decimal));
            }

            return this.paymentDataTable;
        }
    }
    #endregion PaymentDataTable
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
        //this.UltraWebGrid1.InitializeLayout += new Infragistics.WebUI.UltraWebGrid.InitializeLayoutEventHandler(this.UltraWebGrid1_InitializeLayout);

    }
    #endregion

    protected void Button1_Click(object sender, System.EventArgs e)
    {
        LiteralControl emptyRowLiteral = this.WebDataGrid1.EmptyRowsTemplateContainer.FindControl("EmptyRowsText") as LiteralControl;

        if (this.wcePrincipal.ValueDecimal <= 0.0M ||
            this.wneTerm.ValueInt <= 0 ||
            this.wnePayments.ValueInt <= 0 ||
            this.wpeInterestRate.ValueDecimal <= 0M

            )
        {
            if (emptyRowLiteral != null)
                emptyRowLiteral.Text = this.GetGlobalResourceObject("WebCalcManager", "Mortgage_ZeroError").ToString();
            return;
        }
        this.UltraWebCalcManager1.ReCalc();
        this.Button2.Enabled = true;
        if (emptyRowLiteral != null)
            emptyRowLiteral.Text = this.GetGlobalResourceObject("WebCalcManager", "Mortgage_BeginMessage").ToString();
        System.Diagnostics.Debug.WriteLine(monthlyInterestRef.FormulaResult.ToString());
    }

    protected void Button2_Click(object sender, System.EventArgs e)
    {
        LiteralControl emptyRowLiteral = this.WebDataGrid1.EmptyRowsTemplateContainer.FindControl("EmptyRowsText") as LiteralControl;

        this.UltraWebCalcManager1.ReCalc();
        this.GeneratePaymentSchedule();
        this.WebDataGrid1.DataSource = this.PaymentDataTable;
        this.WebDataGrid1.DataBind();
        this.Button2.Enabled = false;

        if (emptyRowLiteral != null)
            emptyRowLiteral.Text = this.GetGlobalResourceObject("WebCalcManager", "Mortgage_BeginMessage2").ToString();
    }


    #region GeneratePaymentSchedule
    /// <summary>
    /// Generates the payment schedule based on the calculated monthly payment.
    /// </summary>
    private void GeneratePaymentSchedule()
    {
        //    Start on the 15th of next month
        DateTime paymentDate = DateTime.Today.AddMonths(1);
        paymentDate = new DateTime(paymentDate.Year, paymentDate.Month, 15);

        decimal totalPrincipal = (decimal)(this.wcePrincipal.Value);
        decimal monthlyInterest = (decimal)(monthlyInterestRef.FormulaResult.ToDecimal());
        decimal monthlyPayment = (decimal)(this.wceCalcPayment.Value);

        this.PaymentDataTable.Rows.Clear();

        while (totalPrincipal > 0m)
        {
            //    Calculate the interest amount for this month's payment
            decimal interest = (totalPrincipal * monthlyInterest);

            //    If the remaining principal is less than the monthly
            //    payment, this is the last payment
            if ((totalPrincipal + interest) < monthlyPayment)
                monthlyPayment = totalPrincipal + interest;

            //    Calculate the principal amount for this month's payment
            decimal principal = monthlyPayment - interest;

            //    Subtract the amount of this month's payment from the total principal 
            totalPrincipal -= principal;

            //    Add a DataRow for this month's payment
            this.PaymentDataTable.Rows.Add(new object[] { paymentDate, interest, principal, totalPrincipal });

            //    Increment the date by one month for the next iteration
            paymentDate = paymentDate.AddMonths(1);
        }

    }
    #endregion GeneratePaymentSchedule

}

