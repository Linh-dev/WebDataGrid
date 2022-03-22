using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;



using Infragistics.Documents;

public partial class Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Repeater1.DataSource = this.GetDataSource();
        this.Repeater1.DataBind();
    }

    private List<MyItem> GetDataSource()
    {
        List<MyItem> items = new List<MyItem>();

        items.Add(this.GetListItem("1", "/samplesbrowser/SamplesCommon/aspnet/WebDragDrop/Display/SortableList/silverLight48.png",
                this.GetGlobalResourceObject("WebDragDrop","SortListItemSilverlight").ToString()));

        items.Add(this.GetListItem("2", "/samplesbrowser/SamplesCommon/aspnet/WebDragDrop/Display/SortableList/dotNet48.png",
                this.GetGlobalResourceObject("WebDragDrop","SortListItemWinForm").ToString()));

        items.Add(this.GetListItem("3", "/samplesbrowser/SamplesCommon/aspnet/WebDragDrop/Display/SortableList/appStylist48.png",
                this.GetGlobalResourceObject("WebDragDrop","SortListItemAppStylist").ToString()));

        items.Add(this.GetListItem("4", "/samplesbrowser/SamplesCommon/aspnet/WebDragDrop/Display/SortableList/jsf48.png",
                this.GetGlobalResourceObject("WebDragDrop","SortListItemJSF").ToString()));

        items.Add(this.GetListItem("5", "/samplesbrowser/SamplesCommon/aspnet/WebDragDrop/Display/SortableList/Test48.png",
                this.GetGlobalResourceObject("WebDragDrop","SortListitemTestAdvantage").ToString()));

        return items;
    }


    private MyItem GetListItem(string displayIndex, string imageUrl, string description)
    {
        MyItem listItem = new MyItem();
        listItem.ImageUrl = imageUrl;
        listItem.Description = description;
        listItem.DisplayIndex = displayIndex;
        return listItem;
    }

    public class MyItem
    {
        string _imageUrl, _displayIndex, _description;
        public string ImageUrl
        {
            get { return _imageUrl; }
            set { _imageUrl = value; }
        }


        public string DisplayIndex
        {
            get { return _displayIndex; }
            set { _displayIndex = value; }
        }

        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }
    }
}
