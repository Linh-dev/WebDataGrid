using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


using Infragistics.Documents.Excel;
using System.IO;
using Infragistics.Web.SampleBrowser.Core.Framework.DataAccess;
using System.Data.OleDb;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        this.fileExtensionValidator.Text = (string)this.GetGlobalResourceObject("InfragisticsExcel", "WrongExtension_ErrorMessage");
	}

	protected void btnSave_Click(object sender, EventArgs e)
	{
		// Create a new workbook
		Workbook workbook = new Workbook();

		// Show only the vertical scroll bar
		workbook.WindowOptions.ScrollBars = Infragistics.Documents.Excel.ScrollBars.Vertical;

		string sheet1Name = (string)this.GetGlobalResourceObject("InfragisticsExcel", "SaveLoad_Sheet1");
		string sheet2Name = (string)this.GetGlobalResourceObject("InfragisticsExcel", "SaveLoad_Sheet2");

		// Create two worksheets for the workbook
		Infragistics.Documents.Excel.Worksheet worksheet1 = workbook.Worksheets.Add(sheet1Name);
		Infragistics.Documents.Excel.Worksheet worksheet2 = workbook.Worksheets.Add(sheet2Name);

        FillWorksheetWithInvoiceData(worksheet2, GetTableData());

		// Zoom in to double the normal viewing size on Sheet2
		worksheet2.DisplayOptions.MagnificationInNormalView = 200;

		// Make Sheet2 the selected worksheet
		workbook.WindowOptions.SelectedWorksheet = worksheet2;

		string filename = (string)this.GetGlobalResourceObject("InfragisticsExcel", "SaveLoad_Workbook1");
		switch (ddlFormats.SelectedValue)
		{
			case "xlsx":
				workbook.SetCurrentFormat(WorkbookFormat.Excel2007);
				filename += ".xlsx";
				break;
			case "xltx":
				workbook.SetCurrentFormat(WorkbookFormat.Excel2007Template);
				filename += ".xltx";
				break;
			case "xlsm":
				workbook.SetCurrentFormat(WorkbookFormat.Excel2007MacroEnabled);
				filename += ".xlsm";
				break;
			case "xltm":
				workbook.SetCurrentFormat(WorkbookFormat.Excel2007MacroEnabledTemplate);
				filename += ".xltm";
				break;
			case "xls":
				workbook.SetCurrentFormat(WorkbookFormat.Excel97To2003);
				filename += ".xls";
				break;
			case "xlt":
				workbook.SetCurrentFormat(WorkbookFormat.Excel97To2003Template);
				filename += ".xlt";
				break;
			default:
				workbook.SetCurrentFormat(WorkbookFormat.Excel97To2003);
				filename += ".xls";
				break;
		}

		SendForDownload(workbook, filename);
	}

	protected void btnLoadModifySave_Click(object sender, EventArgs e)
	{
        if (!fuExistingWorkbook.HasFile)
            return;

		// Reads the Workbook from the selected file
		Workbook existingworkbook = Workbook.Load(fuExistingWorkbook.FileContent);

		string newSheetName = (string)this.GetGlobalResourceObject("InfragisticsExcel", "SaveLoad_ImageSheet");

		// Add a new Worksheet to add a image to it
		Worksheet imageworksheet = existingworkbook.Worksheets.Add(newSheetName);

		// Set the imageworksheet as the selected, active worksheet.
		existingworkbook.WindowOptions.SelectedWorksheet = imageworksheet;

		string imagePath = Server.MapPath("/SamplesBrowser/SamplesCommon/aspnet/InfragisticsExcel/Data/SaveLoadExcelFile/butterfly1.jpg");

		// make sure we dispose of the resources when we do not need them anymore
		using (FileStream fs = new FileStream(imagePath, FileMode.Open, FileAccess.Read))
		using (System.Drawing.Image image = System.Drawing.Image.FromStream(fs))
		{
			WorksheetImage imageShape = new WorksheetImage(image);

			WorksheetCell cellA1 = imageworksheet.Rows[0].Cells[0];
			WorksheetCell cellE5 = imageworksheet.Rows[7].Cells[4];

			// The top-left corner of the image should be at the 
			// top-left corner of cell A1
			imageShape.TopLeftCornerCell = cellA1;
			imageShape.TopLeftCornerPosition = new System.Drawing.PointF(0.0F, 0.0F);

			// The bottom-right corner of the image should be at 
			// the bottom-right corner of cell A1
			imageShape.BottomRightCornerCell = cellE5;
			imageShape.BottomRightCornerPosition = new System.Drawing.PointF(100.0F, 100.0F);

			imageworksheet.Shapes.Add(imageShape);

			SendForDownload(existingworkbook, fuExistingWorkbook.FileName);
		}
	}

    private void FillWorksheetWithInvoiceData(Worksheet worksheet, DataSet invoiceData)
    {
        // Fill the header cells
        worksheet.GetCell("A1").Value = "Item";
        worksheet.GetCell("B1").Value = "Qty";
        worksheet.GetCell("C1").Value = "Price";

        ApplyHeaderCellsStyle(worksheet.GetRegion("A1:C1"));

        int currentRow = 1;
        foreach (DataRow row in invoiceData.Tables[0].Rows)
        {
            // Fill each row of the invoice cells with data
            worksheet.Rows[currentRow].Cells[0].Value = Convert.ToString(row["ProductName"]);
            worksheet.Rows[currentRow].Cells[1].Value = Convert.ToInt32(row["Quantity"]);
            worksheet.Rows[currentRow].Cells[2].Value = Convert.ToDecimal(row["Total"]);
            currentRow++;
        }

        // Add a foother row with formula calculating the total sum of all item's prices
        worksheet.Rows[currentRow].Cells[0].Value = "Total";
        worksheet.Rows[currentRow].Cells[2].ApplyFormula(string.Format("=SUM(C2:C{0})", currentRow - 1));

        ApplyFooterCellsStyle(worksheet.GetRegion(string.Format("A{0}:C{0}", currentRow + 1)));
    }

    private void ApplyHeaderCellsStyle(WorksheetRegion region)
    {
        foreach (WorksheetCell cell in region)
        {
            cell.CellFormat.BottomBorderColor = System.Drawing.Color.Black;
            cell.CellFormat.BottomBorderStyle = CellBorderLineStyle.Medium;
            cell.CellFormat.Alignment = HorizontalCellAlignment.Center;
        }
    }

    private void ApplyFooterCellsStyle(WorksheetRegion region)
    {
        foreach (WorksheetCell cell in region)
        {
            cell.CellFormat.TopBorderColor = System.Drawing.Color.Black;
            cell.CellFormat.TopBorderStyle = CellBorderLineStyle.Medium;
        }
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

	private void SendForDownload(Workbook workbook, string filename)
	{
		Response.Clear();
		Response.AppendHeader("content-disposition", "attachment; filename=" + filename);
		Response.ContentType = "application/octet-stream";
		workbook.Save(Response.OutputStream);
		Response.End();
	}
}
