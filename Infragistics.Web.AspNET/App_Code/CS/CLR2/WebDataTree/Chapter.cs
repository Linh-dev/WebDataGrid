using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for TreeItem
/// </summary>
public class Chapter
{
    public Chapter(string value)
    {
        this.value = value;
    }

    private string value;
    public string Value
    {
        get
        {
            return this.value;
        }
        set
        {
            this.value = value;
        }
    }

    private string titleValue = string.Empty;
    public string Title
    {
        get
        {
            return this.titleValue;
        }
        set
        {
            this.titleValue = value;
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

}

