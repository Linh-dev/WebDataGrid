using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Infragistics.Documents.Word;
using System.Drawing;
using System.IO;
using Infragistics.Web.UI.GridControls;

public partial class Default :  Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Orders.DataBind();
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        using (MemoryStream ms = new MemoryStream())
        {
            // Create a new instance of the WordDocumentWriter class using the static 'Create' method.
            // This instance must be closed once content is written into Word.
            using (WordDocumentWriter docWriter = WordDocumentWriter.Create(ms))
            {
                docWriter.StartDocument();

                // Create the table properties
                TableProperties tableProps = docWriter.CreateTableProperties();
                tableProps.Alignment = ParagraphAlignment.Center;
                tableProps.BorderProperties.Color = Color.Black;
                tableProps.BorderProperties.Style = TableBorderStyle.Single;

                // Create the table header row properties
                TableRowProperties headerRowProps = docWriter.CreateTableRowProperties();
                headerRowProps.IsHeaderRow = true;

                // Create the table header cell properties
                TableCellProperties headerCellProps = docWriter.CreateTableCellProperties();
                headerCellProps.BackColor = Color.DarkGray;
                headerCellProps.TextDirection = TableCellTextDirection.LeftToRightTopToBottom;

                // Calculate the header cell's preferred width so that all columns hava the same width
                headerCellProps.PreferredWidthAsPercentage = 1f / this.WebDataGrid1.Columns.Count;

                // Start a table
                docWriter.StartTable(2, tableProps);

                // Start a row and apply it the header row properties
                docWriter.StartTableRow(headerRowProps);

                // Iterate through the grid columns and create the header row cells
                foreach (GridField gridField in this.WebDataGrid1.Columns)
                {
                    AddTableCell(docWriter, headerCellProps, gridField.Header.Text);
                }

                // End the header row
                docWriter.EndTableRow();

                // Create the table's content cell properties
                TableCellProperties contentCellProps = docWriter.CreateTableCellProperties();
                contentCellProps.BackColor = Color.AliceBlue;
                contentCellProps.PreferredWidthAsPercentage = 0.5f;

                // Iterate through the grid rows to extract the content data
                foreach (GridRecord gridRecord in this.WebDataGrid1.Rows)
                {
                    docWriter.StartTableRow();
                    for (int i = 0; i < this.WebDataGrid1.Columns.Count; i++)
                    {
                        AddTableCell(docWriter, contentCellProps, gridRecord.Items[i].Text);
                    }
                    docWriter.EndTableRow();
                }

                // End the table
                docWriter.EndTable();

                // End the document
                docWriter.EndDocument();

                // No need to call Close as the "using" will call Dispose which will close the WordDocumentWriter instance.
            }

            // Prepare the response for the file download
            Response.Clear();
            Response.AppendHeader("content-disposition", "attachment; filename=word.doc");
            Response.ContentType = "application/octet-stream";

            // Copy the contents of the MemoryStream to the OutputStream
            ms.Seek(0, SeekOrigin.Begin);
            Response.BinaryWrite(ms.ToArray());

            Response.End();
        }
    }

    private void AddTableCell(WordDocumentWriter documentWriter, TableCellProperties cellProperties, string cellText)
    {
        // Start a Cell
        documentWriter.StartTableCell(cellProperties);

        // Start a Paragraph and add a text run to the cell
        documentWriter.StartParagraph();
        documentWriter.AddTextRun(cellText);
        documentWriter.EndParagraph();

        // End the Cell
        documentWriter.EndTableCell();
    }
}
