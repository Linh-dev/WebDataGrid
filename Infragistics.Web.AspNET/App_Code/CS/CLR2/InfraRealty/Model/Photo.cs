using System.Collections.Generic;

/// <summary>
/// Summary description for photo
/// </summary>
public class Photo
{

    public Photo()
    {
    }

    private string _mls_id;

    public string mls_id
    {
        get
        {
            return this._mls_id;
        }
        set
        {
            this._mls_id = value;
        }
    }

    private string _url = string.Empty;
    public string url
    {
        get
        {
            return this._url;
        }
        set
        {
            this._url = value;
        }
    }

    private string _thumb_url = string.Empty;
    public string thumb_url
    {
        get
        {
            return this._thumb_url;
        }
        set
        {
            this._thumb_url = value;
        }
    }

    private int _photo_id;
    public int photo_id
    {
        get
        {
            return this._photo_id;
        }
        set
        {
            this._photo_id = value;
        }
    }
    
    public string photo_id_string
    {
        get
        {
            return this.photo_id.ToString();
        }
    }
}

public class PhotoCollection : List<Photo>
{
    public PhotoCollection()
    {
    }

    public Photo DefaultPhoto
    {
        get
        {
            Photo defaultPhoto = null;

            if (this.Count > 0)
            {
                defaultPhoto = this[0];
            }
            else
            {
                defaultPhoto = new Photo();
            }


            return defaultPhoto;
        }
    }

}