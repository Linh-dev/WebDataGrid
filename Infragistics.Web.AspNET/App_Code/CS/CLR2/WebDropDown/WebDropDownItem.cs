using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for WebDropDownItem
/// </summary>
public class WebDropDownItem
{
    private string _value, _text, _imageUrl;

    public string Value { 
        get { return _value; } 
        set { _value = value; } 
    }

    public string Text { 
        get { return _text; } 
        set { _text = value; } 
    }

    public string ImageUrl {
        get { return _imageUrl; }
        set { _imageUrl = value; } 
    }

	public WebDropDownItem()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}
