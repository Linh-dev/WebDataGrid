using System;
using System.Collections.Generic;

/// <summary>
/// Summary description for MLSListing
/// </summary>
public class MLSListing
{
	public MLSListing()
	{
	}

    private Address _listingAddress = new Address();

    private string _mls_id;

    private string _status;

    private decimal _price;

    private short _bedrooms;

    private double _bathrooms;

    private string _stories;

    private int _footage;

    private int _yearBuilt;

    private string _type;

    private DateTime _listedOn;

    private bool _hasPool;

    private bool _hasLaundry;

    private bool _hasFireplace;

    private bool _hasWalkInClosets;

    private string _remarks;
	
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

    public Address ListingAddress
    {
        get
        {
            return this._listingAddress;
        }
        set
        {
            this._listingAddress = value;
        }
    }
	
	public string address
	{
		get
		{
			return this._listingAddress.Street;
		}
	}
	
	public string zipcode
	{
		get
		{
            return this._listingAddress.Zipcode;
		}
	}
	
	public string status
	{
		get
		{
			return this._status;
		}
		set
		{
    		this._status = value;
		}
	}
	
	public decimal price
	{
		get
		{
			return this._price;
		}
		set
		{
    		this._price = value;
		}
	}
	
	public short bedrooms
	{
		get
		{
			return this._bedrooms;
		}
		set
		{
			this._bedrooms = value;
		}
	}

    public double bathrooms
	{
		get
		{
			return this._bathrooms;
		}
		set
		{
			this._bathrooms = value;
		}
	}
	
	public string stories
	{
		get
		{
			return this._stories;
		}
		set
    	{
	        this._stories = value;
		}
	}
	
	public int footage
	{
		get
		{
			return this._footage;
		}
		set
		{
    		this._footage = value;
		}
	}
	
	public int yearBuilt
	{
		get
		{
			return this._yearBuilt;
		}
		set
		{
			this._yearBuilt = value;
		}
	}
	
	public string type
	{
		get
		{
			return this._type;
		}
		set
		{
			this._type = value;
		}
	}
	
	public DateTime listedOn
	{
		get
		{
			return this._listedOn;
		}
		set
		{
			this._listedOn = value;
		}
	}
	
	public bool hasPool
	{
		get
		{
			return this._hasPool;
		}
		set
		{
    		this._hasPool = value;
		}
	}
	
	public bool hasLaundry
	{
		get
		{
			return this._hasLaundry;
		}
		set
		{
			this._hasLaundry = value;
		}
	}
	
	public bool hasFireplace
	{
		get
		{
			return this._hasFireplace;
		}
		set
		{
			this._hasFireplace = value;
		}
	}
	
	public bool hasWalkInClosets
	{
		get
		{
			return this._hasWalkInClosets;
		}
		set
		{
			this._hasWalkInClosets = value;
		}
	}
	
	public string remarks
	{
		get
		{
			return this._remarks;
		}
		set
		{
			this._remarks = value;
		}
	}
	
    public Photo MainPhoto
    {
        get
        {
            return Photos.DefaultPhoto;
        }
    }

    private PhotoCollection _photes = new PhotoCollection();

    public PhotoCollection Photos
    {
        get
        {
            return _photes;
        }
        set
        {
            this._photes = value;
        }
    }


    public string CityName
    {
        get
        {
            return this._listingAddress.City;
        }
    }


    public string StateName
    {
        get
        {
            return this._listingAddress.State;
        }
    }

}


public class MLSListingCollection : Dictionary<string, MLSListing>
{
    public MLSListingCollection()
    {
    }

    public List<MLSListing> GetList
    {
        get
        {
            return new List<MLSListing>(this.Values);
        }
    }

}


