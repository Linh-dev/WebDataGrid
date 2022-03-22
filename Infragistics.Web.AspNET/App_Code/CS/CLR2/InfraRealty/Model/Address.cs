
/// <summary>
/// Summary description for Address
/// </summary>
public class Address
{
	public Address()
	{
	
	}

    private string _street;
    public string Street
    {
        get
        {
            return this._street;
        }
        set
        {
            this._street = value;
        }
    }

    private string _city;
    public string City
    {
        get
        {
            return this._city;
        }
        set
        {
            this._city = value;
        }
    }

    private string _state;
    public string State
    {
        get
        {
            return this._state;
        }
        set
        {
            this._state = value;
        }
    }


    private string _zipcode;
    public string Zipcode
    {
        get
        {
            return this._zipcode;
        }
        set
        {
            this._zipcode = value;
        }
    }


}
