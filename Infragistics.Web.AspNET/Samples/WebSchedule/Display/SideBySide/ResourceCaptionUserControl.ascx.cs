using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

public partial class SideBySide_ResourceCaptionUserControl : System.Web.UI.UserControl
{
    private const string JS_SCRIPT = "javascript:this.src='{0}'";

    public event EventHandler ButtonClick;
    public event EventHandler ResourceButtonClick; 

    private object _tag;
    public object Tag 
    {
        get { return _tag; }
        set { _tag = value; }
    }

    private string _imageUrl;
    public string ImageUrl
    {
        get { return _imageUrl; }
        set { _imageUrl = value; }
    }

    private string _imageHoverUrl;
    public string ImageHoverUrl
    {
        get { return _imageHoverUrl; }
        set { _imageHoverUrl = value; }
    }

    private string _imageHeaderLeftUrl;
    public string ImageHeaderLeftUrl
    {
        get { return _imageHeaderLeftUrl; }
        set { _imageHeaderLeftUrl = value; }
    }

    private string _imageHeaderRightUrl;
    public string ImageHeaderRightUrl
    {
        get { return _imageHeaderRightUrl; }
        set { _imageHeaderRightUrl = value; }
    }

    private string _imageHeaderMiddleUrl;
    public string ImageHeaderMiddleUrl
    {
        get { return _imageHeaderMiddleUrl; }
        set { _imageHeaderMiddleUrl = value; }
    }

    private System.Drawing.Color _color;
    public System.Drawing.Color ResourceColor
    {
        get { return _color; }
        set
        {
            _color = value;
            //mainDiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, System.Drawing.ColorTranslator.ToHtml(_color));
        }
    }

    private System.Drawing.Color _selectedColor = System.Drawing.ColorTranslator.FromHtml("#e5cc88");
    public System.Drawing.Color SelectedColor
    {
        get { return _selectedColor; }
        set
        {
            _selectedColor = value;
        }
    }

    public string HtmlColor
    {
        get 
        {
            if(IsSelected)
                return System.Drawing.ColorTranslator.ToHtml(_selectedColor);

            if (System.Drawing.Color.Empty != _color)
                return System.Drawing.ColorTranslator.ToHtml(_color);
            else
                return "#ccc";
        }
    }

    private decimal _width;
    public decimal Width
    {
        get { return _width; }
        set
        {
            _width = value;              
            mainDiv.Style.Add(HtmlTextWriterStyle.Width,GetWidth(value));
        }
    }

    private string _title;
    public string Title
    {
        get { return _title; }
        set
        {
            _title = value;
           mainDiv.Attributes.Add("title", value);
        }
    }

    public string Caption
    {
        get { return resourceButton.Text; }
        set { resourceButton.Text = value; }
    }

    public bool IsSelected
    {
        get { return resourceButton.Font.Bold; }
        set { resourceButton.Font.Bold = value; }
    }

    public bool IsMovable
    {
        get { return this.button.Enabled; }
        set { this.button.Enabled = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        button.ImageUrl = this.ImageUrl;

        //if (System.Drawing.Color.Empty == _color)
        //    mainDiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, "#fff4bc");

        if (!String.IsNullOrEmpty(this.ImageHoverUrl))
        {
            button.Attributes.Add("onmouseover", String.Format(JS_SCRIPT, this.ImageHoverUrl));
            button.Attributes.Add("onmouseout", String.Format(JS_SCRIPT, this.ImageUrl));
        }
    }

    protected void resourceButton_Click(object sender, EventArgs e)
    {
        if (ResourceButtonClick != null)
            ResourceButtonClick(this, e);
    }

    protected void button_Click(object sender, ImageClickEventArgs e)
    {
        if (ButtonClick != null)
            ButtonClick(this, e);
    }

    private string GetWidth(decimal width)
    {
        NumberFormatInfo nfi = new NumberFormatInfo();   
        nfi.NumberDecimalSeparator = ".";
        nfi.NumberDecimalDigits = 2;

        return String.Format(nfi, "{0}%", width);
    }
}
