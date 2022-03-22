using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Infragistics.Web.SampleBrowser.Core.Framework.DataAccess;


using Infragistics.Documents.Reports;
using Infragistics.Documents.Reports.Report;
using Infragistics.Documents.Reports.Graphics;
using Infragistics.Documents.Reports.Report.Section;
using Infragistics.Documents.Reports.Report.Table;
using Infragistics.Documents.Reports.Report.Text;
using Infragistics.Documents.Reports.Report.Preferences.Printing;
using Infragistics.Documents.Reports.Report.Band;
using System.Data.SqlClient;
using System.Data.OleDb;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    #region Private Fields
    private Report report;
    private ISection reportSection;

    // Styles
    private static readonly string fontName = "Arial Unicode MS";
    private static readonly Borders bordersStyle = new Borders(new Pen(new Color(59, 94, 145)));
    private static readonly Infragistics.Documents.Reports.Report.Text.Style normalStyle =
        new Infragistics.Documents.Reports.Report.Text.Style(new Font(fontName, 12), Brushes.Black);
    private static readonly Infragistics.Documents.Reports.Graphics.Font fontStyle = new Font(fontName, 9);
    private static readonly Infragistics.Documents.Reports.Report.Text.Style invoiceHeaderFontStyle = 
        new Infragistics.Documents.Reports.Report.Text.Style(new Font(fontName, 20), Brushes.DarkBlue);
    private static readonly Infragistics.Documents.Reports.Report.Text.Style pageNumberingStyle = 
        new Infragistics.Documents.Reports.Report.Text.Style(new Font(fontName, 9), Brushes.Black);
    #endregion

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SetupReportInfo((string)this.GetGlobalResourceObject("InfragisticsDocuments", "INVOICE_REPORT"));

        this.AddInvoiceHeader();
        this.AddCompanyInfo(companyInfoName.Text, companyInfoAddress.Text, companyInfoPhone.Text, companyInfoEmail.Text);
        this.AddInvoiceRecipient(invoiceRecipientName.Text, 
                                 invoiceRecipientCompanyName.Text, 
                                 invoiceRecipientStreetAddress.Text, 
                                 invoiceRecipientCity.Text, 
                                 invoiceRecipientPhone.Text);
        this.CreateTable();

        string documentFileNameRoot = string.Format("Document.{0}", expFormat.SelectedValue.ToLower());
        FileFormat exportFileFormat = (expFormat.SelectedValue.ToLower() == "pdf") ? FileFormat.PDF : FileFormat.XPS;
        
        this.SendForDownload(exportFileFormat, documentFileNameRoot);
    }

    private void AddHeaderCell(ITableHeader header, string text)
    {
        AddHeaderCell(header, text, null);
    }

   private void AddHeaderCell(ITableHeader header, string text, Width width)
    {
        IText headerText;
        ITableCell cell = header.AddCell();

        cell.Borders = bordersStyle;
        cell.Background = new Background(new Color(228, 234, 244));
        cell.Alignment.Vertical = Alignment.Middle;

        if (width != null)
        {
            cell.Width = width;
        }

        headerText = cell.AddText();

        headerText.Style.Font = fontStyle;
        headerText.Alignment = TextAlignment.Center;
        headerText.AddContent(text);
    }

    private void AddTableRows(ITable table, DataSet ds)
    {
        DataRowCollection dsRows = ds.Tables[0].Rows;
        DataColumnCollection dsColums = ds.Tables[0].Columns;
        ITableRow tableRow;
        ITableCell tableCell;
        IText cellText;
        Paddings cellPaddings = new Paddings(5, 3);       
        float totalSum = 0;

        foreach (DataRow dsRow in dsRows)
        {
            tableRow = table.AddRow();

            totalSum += float.Parse(dsRow["Total"].ToString());

            foreach (DataColumn dsColumn in dsColums)
            {
                tableCell = tableRow.AddCell();
                tableCell.Paddings = cellPaddings;

                if (dsColumn.ColumnName == "ProductName")
                {
                    tableCell.Width = new RelativeWidth(350);
                }

                tableCell.Borders = bordersStyle;
                cellText = tableCell.AddText();
                cellText.Style.Font = fontStyle;
                cellText.AddContent(dsRow[dsColumn].ToString());
            }
        }

        // Here is calculated the total price of all itemes
        tableRow = table.AddRow();
        tableCell = tableRow.AddCell();
        tableCell.Borders = bordersStyle;
        cellText = tableCell.AddText();
        cellText.Style.Font = fontStyle;
        cellText.Alignment.Horizontal = Alignment.Right;

        string totalPriceTxt = (string)this.GetGlobalResourceObject("InfragisticsDocuments", "TOTAL_PRICE");

        cellText.AddContent(totalPriceTxt + totalSum.ToString());
    }

    private DataSet GetTableData()
    {         
        DataRepository dataManager = new DataRepository();
        DataSet ds = new DataSet();
        using (OleDbConnection con = new OleDbConnection())
        {
            con.ConnectionString = dataManager.GetMdbConnectionString("Nwind.mdb");
            OleDbDataAdapter da = new OleDbDataAdapter("SELECT TOP 50 [Quantity], [ProductName], [UnitPrice], [Quantity]*[UnitPrice] as [Total] FROM [Invoices]", con);
            da.Fill(ds);
            return ds;
        }
    }

    private void AddInvoiceRecipient(string name, string companyName, string streetAddress, string city, string phone)
    {
        ITable table = reportSection.AddTable();
        ITableRow row = table.AddRow();
        Width columnWidth = new FixedWidth(25);
        ITableCell cell = row.AddCell();
        IText cellText = cell.AddText();
        
        cellText.Style.Font = fontStyle;

        table.Margins.Bottom = 5;
        
        //recipient name row
        cell.Width = columnWidth;
        cellText.Style.Font = fontStyle;

        string recipientToTxt = (string)this.GetGlobalResourceObject("InfragisticsDocuments", "TO");

        cellText.AddContent(recipientToTxt);
        cellText.Style.Font = fontStyle;
        
        cell = row.AddCell();
        cellText = cell.AddText();
        cellText.Style.Font = fontStyle;
        cellText.AddContent(name);
        
        //recipient company name row
        row = table.AddRow();
        cell = row.AddCell();
        cell.Width = columnWidth;

        cell = row.AddCell();
        cellText = cell.AddText();
        cellText.Style.Font = fontStyle;
        cellText.AddContent(companyName);

        //recipient street address row
        row = table.AddRow();
        cell = row.AddCell();
        cell.Width = columnWidth;

        cell = row.AddCell();
        cellText = cell.AddText();
        cellText.Style.Font = fontStyle;
        cellText.AddContent(streetAddress);

        //recipient city row
        row = table.AddRow();
        cell = row.AddCell();
        cell.Width = columnWidth;

        cell = row.AddCell();
        cellText = cell.AddText();
        cellText.Style.Font = fontStyle;
        cellText.AddContent(city);

        //recipient phone row
        row = table.AddRow();
        cell = row.AddCell();
        cell.Width = columnWidth;

        cell = row.AddCell();
        cellText = cell.AddText();
        cellText.Style.Font = fontStyle;
        cellText.AddContent(phone);
    }

    private void AddCompanyInfo(string companyName, string address, string phone, string email)
    {
        IText text = reportSection.AddText();
        text.AddContent(companyName);

        text = reportSection.AddText();
        text.AddContent(address);

        text = reportSection.AddText();
        text.AddContent(phone);

        text = reportSection.AddText();
        text.AddContent(email);

        text.Margins.Bottom = 10;
    }

    private void AddInvoiceHeader()
    {
        IBand band = reportSection.AddBand();

        band.Height = new FixedHeight(100);
        band.Margins.Vertical = 5;
        band.Paddings.All = 5;

        // Here you can see how to create a gradient color background
        band.Background = new Background(new LinearGradientBrush(new Color(198, 212, 232), Colors.White, 90));
        
        // Header
        IText text = band.AddText();
        text.Alignment.Horizontal = Alignment.Right;
        text.Style = invoiceHeaderFontStyle;
        text.AddContent((string)this.GetGlobalResourceObject("InfragisticsDocuments", "INVOICE"));

        // Here we add the IG logo
        System.Drawing.Image nativeImage = System.Drawing.Image.FromFile(Server.MapPath("/SamplesBrowser/SamplesCommon/aspnet/InfragisticsDocuments/Display/ExportToPDForXPS/ig-logo.gif"));
        Infragistics.Documents.Reports.Graphics.Image image = new Infragistics.Documents.Reports.Graphics.Image(nativeImage, Colors.White);
        
        band.AddImage(image);
     }

    private void CreateTable()
    {
        // Table
        IText text;
        ITable table = reportSection.AddTable();

        table.Borders = bordersStyle;
        table.Margins.Top = 5;
        table.Margins.Bottom = 5;
        table.Width = new FixedWidth(480);
        table.Margins.Left = 30;
        // Header
        ITableHeader header = table.Header;
        header.Height = new FixedHeight(25);
        header.Repeat = true;

        this.AddHeaderCell(header, (string)this.GetGlobalResourceObject("InfragisticsDocuments", "QTY"));
        this.AddHeaderCell(header, (string)this.GetGlobalResourceObject("InfragisticsDocuments", "NAME"), 
                                    new RelativeWidth(350));
        this.AddHeaderCell(header, (string)this.GetGlobalResourceObject("InfragisticsDocuments", "UNIT_PRICE"));
        this.AddHeaderCell(header, (string)this.GetGlobalResourceObject("InfragisticsDocuments", "TOTAL"));

        //Here we add all the rows of the table
        this.AddTableRows(table, this.GetTableData());

        // Footer
        ITableFooter footer = table.Footer;
        footer.Height = new FixedHeight(35);
        footer.Repeat = true;

        ITableCell cell = footer.AddCell();
        cell.Borders = bordersStyle;
        cell.Background = new Background(new Color(220, 220, 240));
        cell.Alignment.Vertical = Alignment.Middle;

        text = cell.AddText();
        text.Style = normalStyle;
        text.Alignment = TextAlignment.Center;
        text.AddContent((string)this.GetGlobalResourceObject("InfragisticsDocuments", "THANK_YOU_FOR_YOUR_BUSINESS"));
    }

    #region Private Methods
    private void SetupReportInfo(string title)
    {
        report = new Report();

        report.Info.Title = title;
        report.Info.Author = (string)this.GetGlobalResourceObject("InfragisticsDocuments", "IG_INC");
        report.Info.Creator = (string)this.GetGlobalResourceObject("InfragisticsDocuments", "IG_REPORT_WRITER");
        report.Info.Copyright = string.Format(
                            (string)this.GetGlobalResourceObject("InfragisticsDocuments", "IG_COPYRIGHT"), 
                            DateTime.Now.Year.ToString());

        report.Preferences.Printing.PaperSize = PaperSize.Auto;
        report.Preferences.Printing.PaperOrientation = PaperOrientation.Auto;
        report.Preferences.Printing.FitToMargins = true;

        SetupDefaultSection();
    }

    private void SetupDefaultSection()
    {
        reportSection = report.AddSection();
        reportSection.PageSize = PageSizes.Letter;
        reportSection.PageMargins.All = 35;
        reportSection.PageNumbering = new PageNumbering();
        reportSection.PageNumbering.Style = pageNumberingStyle;
        reportSection.PageNumbering.Template = (string)this.GetGlobalResourceObject("InfragisticsDocuments", "PAGING_TEMPLATE");
        reportSection.PageNumbering.Continue = true;
        reportSection.PageNumbering.SkipFirst = false;
        reportSection.PageNumbering.Alignment = PageNumberAlignment.Right;
        reportSection.PageNumbering.OffsetX = -10;  
    }

    private void SendForDownload(FileFormat exportFileFormat, string documentFileNameRoot)
    {
        Response.Clear();
        Response.AppendHeader("content-disposition", "attachment; filename=" + documentFileNameRoot);
        Response.ContentType = "application/octet-stream";
        report.Publish(Response.OutputStream, exportFileFormat);
        Response.End();
    }
    #endregion
}