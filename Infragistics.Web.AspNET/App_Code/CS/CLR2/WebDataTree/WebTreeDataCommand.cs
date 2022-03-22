using System.Collections.Generic;
using System.ComponentModel;
using System.Web;
using System.Xml;


using Infragistics.Web.UI.NavigationControls;
using Infragistics.Web.SampleBrowser.Core.Framework.DataAccess;

/// <summary>
/// Summary description for WebTreeDataCommand
/// </summary>
public class WebTreeDataCommand
{
    const string ROOT_BOOKS = "/Data/books/book";

    public WebTreeDataCommand()
    {
    }

    public void SetDataSource(WebDataTree target, Common.DataSourceTypes dataSourceType)
    {
        switch (dataSourceType)
        {
            case Common.DataSourceTypes.ICollection:
            case Common.DataSourceTypes.IEnumerable:
                target.DataSourceID = null;
                target.DataSource = this.GetBookData();
                target.DataBind();
                break;
            case Common.DataSourceTypes.IBindingList:
                target.DataSourceID = null;
                target.DataSource = new BindingList<Book>(this.GetBookData());
                target.DataBind();
                break;
            case Common.DataSourceTypes.DataTable:
            case Common.DataSourceTypes.Xml:
            default:
                target.DataSourceID = "TreeDataSource";
                break;
        }
    }


    private Book CreateBook(XmlNode source)
    {
        Book book = new Book(source.Attributes["Title"].Value);
        book.Title = source.Attributes["Title"].Value;
        book.ImageUrl = source.Attributes["ImageUrl"].Value;
        return book;
    }

    private Chapter CreateChapter(XmlNode source)
    {
        Chapter chapter = new Chapter(source.Attributes["Title"].Value);
        chapter.Title = source.Attributes["Title"].Value;
        chapter.ImageUrl = source.Attributes["ImageUrl"].Value;
        return chapter;
    }

    private IList<Book> GetBookData()
    {
        XmlDocument documentSource = LoadDocument();

        IList<Book> items = new List<Book>();

        XmlNodeList menuData = documentSource.SelectNodes(ROOT_BOOKS);
        foreach (XmlNode bookNode in menuData)
        {
            Book book = this.CreateBook(bookNode);
            items.Add(book);

            foreach (XmlNode childNode in bookNode.ChildNodes)
            {
                book.AddChapter(this.CreateChapter(childNode));
            }
        }

        return items;
    }

    public IList<Book> GetBooks()
    {
        XmlDocument documentSource = LoadDocument();

        IList<Book> items = new List<Book>();
        XmlNodeList menuData = documentSource.SelectNodes(ROOT_BOOKS);

        foreach (XmlNode bookNode in menuData)
        {
            Book book = this.CreateBook(bookNode);
            items.Add(book);
        }

        return items;
    }

    public IList<Chapter> GetChapeters(string bookTitle)
    {
        XmlDocument documentSource = LoadDocument();

        IList<Chapter> items = new List<Chapter>();
        XmlNodeList menuData = documentSource.SelectNodes(ROOT_BOOKS + "[@Title=\""+ bookTitle + "\"]/chapter");
        
        foreach (XmlNode chapterNode in menuData)
        {
            Chapter chapter = this.CreateChapter(chapterNode);
            items.Add(chapter);
        }

        return items;
    }

    private static XmlDocument LoadDocument()
    {
        DataRepository manager = new DataRepository();
        string dataSource = HttpContext.Current.Server.MapPath(manager.GetXmlFileVirtualLocation("SampleData.xml"));

        XmlDocument documentSource = new XmlDocument();
        documentSource.Load(dataSource);
        return documentSource;
    }

}
