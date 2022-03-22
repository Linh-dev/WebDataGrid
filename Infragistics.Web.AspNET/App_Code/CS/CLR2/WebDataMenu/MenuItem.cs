using System;
using System.Collections.Generic;
using System.Web;

public class MenuItem
{
    public MenuItem(string value)
    {
        this.menuValue = value;
    }

    private string menuValue;
    public string Value
    {
        get
        {
            return this.menuValue;
        }
        set
        {
            this.menuValue = value;
        }
    }

    private string textValue = string.Empty;
    public string Text
    {
        get
        {
            return this.textValue;
        }
        set
        {
            this.textValue = value;
        }
    }

    private string urlValue = string.Empty;
    public string URL
    {
        get
        {
            return this.urlValue;
        }
        set
        {
            this.urlValue = value;
        }
    }

    private string imageUrl = string.Empty;
    public string ImageUrl
    {
        get
        {
            return this.imageUrl;
        }
        set
        {
            this.imageUrl = value;
        }
    }

    private IList<MenuItem> menuItems = new List<MenuItem>();
    public ICollection<MenuItem> Items
    {
        get
        {
            return this.menuItems;
        }
    }

    public void AddChild(MenuItem item)
    {
        this.menuItems.Add(item);
    }


}
