
/// <summary>
/// Summary description for ListingFilter
/// </summary>
public class ListingFilter
{
	public ListingFilter()
	{
	}

    private string _stateId;

    public string StateId
    {
        get
        {
            return this._stateId;
        }
        set
        {
            this._stateId = value;
        }
    }

    private int _cityId;

    public int CityId
    {
        get
        {
            return this._cityId;
        }
        set
        {
            this._cityId = value;
        }
    }

    public bool IsCityFilterOn
    {
        get
        {
            return this.CityId > 0;
        }
    }

    private string _zipCode;

    public string ZipCode
    {
        get
        {
            return this._zipCode;
        }
        set
        {
            this._zipCode = value;
        }
    }


    public bool IsZipCodeFilterOn
    {
        get
        {
            return !string.IsNullOrEmpty(this.ZipCode.Trim());
        }
    }
    
    private bool _isTownHouse;

    public bool IsTownHouse
    {
        get
        {
            return this._isTownHouse;
        }
        set
        {
            this._isTownHouse = value;
        }
    }

    private bool _isCondo;

    public bool IsCondo
    {
        get
        {
            return this._isCondo;
        }
        set
        {
            this._isCondo = value;
        }
    }
    
    private bool _isSingleFamily;

    public bool IsSingleFamily
    {
        get
        {
            return this._isSingleFamily;
        }
        set
        {
            this._isSingleFamily = value;
        }
    }

    private bool _isMultiFamily;

    public bool IsMultiFamily
    {
        get
        {
            return this._isMultiFamily;
        }
        set
        {
            this._isMultiFamily = value;
        }
    }

    public bool IsTypeFilterEnabled
    {
        get
        {
            return this.IsSingleFamily || this.IsMultiFamily || this.IsCondo || this.IsTownHouse;
        }
    }

    public CriteriaParameterCollection GetTypeFilter()
    {
        CriteriaParameterCollection listingTypeFilters = new CriteriaParameterCollection();

        if (this.IsCondo  || this.IsTownHouse)
        {
            listingTypeFilters.Add(new CriteriaParameter(InfraRealtyCommon.SQL_PARAMETER_CONDO, 10, InfraRealtyCommon.SQL_VALUE_CONDO, InfraRealtyCommon.SQL_WHERE_CONDO));
        }

        if (this.IsSingleFamily)
        {
            listingTypeFilters.Add(new CriteriaParameter(InfraRealtyCommon.SQL_PARAMETER_SINGLEFAMILY, 10, InfraRealtyCommon.SQL_VALUE_SINGLEFAMILY, InfraRealtyCommon.SQL_WHERE_SINGLEFAMILY));
        }

        if (this.IsMultiFamily)
        {
            listingTypeFilters.Add(new CriteriaParameter(InfraRealtyCommon.SQL_PARAMETER_MULTIFAMILY, 10, InfraRealtyCommon.SQL_VALUE_MULTIFAMILY, InfraRealtyCommon.SQL_WHERE_MULTIFAMILY));
        }

        return listingTypeFilters;
    }



    private RangeFilter _priceRange = new RangeFilter();

    public RangeFilter PriceRange
    {
        get
        {
            return this._priceRange;
        }
        set
        {
            this._priceRange = value;
        }
    }

    private RangeFilter _sqFeetRange = new RangeFilter();

    public RangeFilter SquareFeetRange
    {
        get
        {
            return this._sqFeetRange;
        }
        set
        {
            this._sqFeetRange = value;
        }
    }


}
