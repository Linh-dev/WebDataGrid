using Infragistics.Samples.InfraRealty.Models;

/// <summary>
/// Summary description for ListingCommand
/// </summary>
public class ListingCommand
{
    private static ListingCommand _command;

    private ListingCommand()
    {
    }

    public static ListingCommand Currrent
    {
        get
        {
            if (_command == null)
            {
                _command = new ListingCommand();
            }

            return ListingCommand._command;
        }
    }

    public CityCollection GetCities(string stateId)
    {
        string CommandText = InfraRealtyCommon.SQL_GETCITIES;

        RepositoryCriteria criteria = new RepositoryCriteria();
        criteria.AddCharParameter(new CriteriaParameter(InfraRealtyCommon.SQL_PARAMETER_STATEID, 2, stateId, string.Empty));
        return new CityRepository().ExecuteQuery(CommandText, criteria);
    }

    public StateCollection GetStates()
    {
        string CommandText = InfraRealtyCommon.SQL_GETSTATES;
        return new StateRepository().ExecuteQuery(CommandText, new RepositoryCriteria());
    }

    public PhotoCollection GetPhotos(string mlsId)
    {
        return this.GetPhotos(new PhotoRepository(), mlsId);
    }

    public PhotoCollection GetPhotos(PhotoRepository repository, string mlsId)
    {
        string CommandText = InfraRealtyCommon.SQL_GETPHOTOS;

        RepositoryCriteria criteria = new RepositoryCriteria();
        criteria.AddStringParameter(new CriteriaParameter(InfraRealtyCommon.SQL_PARAMETER_MLSID, 10, mlsId, string.Empty));
        return repository.ExecuteQuery(CommandText, criteria);
    }


    public MLSListingCollection GetListings(ListingFilter listingFilter)
    {
        string CommandText = InfraRealtyCommon.SQL_GETLISTING;

        RepositoryCriteria criteria = new RepositoryCriteria();
        GetAddressFilter(criteria, listingFilter);
        GetListingTypeFilter(criteria, listingFilter);
        GetPriceRangeFilter(criteria, listingFilter);
        GetSquareFeetFilter(criteria, listingFilter);

        CommandText += criteria.GetWhereClause();

        MLSListingCollection mlsListings = new ListingRepository().ExecuteQuery(CommandText, criteria);
        this.AddPhotosToListings(mlsListings);
        return mlsListings;
    }

    private void AddPhotosToListings(MLSListingCollection mlsListings)
    {

        PhotoRepository repository = new PhotoRepository();

        foreach (MLSListing listing in mlsListings.Values)
        {
            listing.Photos = this.GetPhotos(repository, listing.mls_id);
        }

    }

    private void GetPriceRangeFilter(RepositoryCriteria criteria, ListingFilter listingFilter)
    {
        if (listingFilter.PriceRange.IsRangeFilterOn)
        {
            criteria.AddCondtionAnd();
            criteria.StartFilter();
            criteria.AddMoneyParameter(new CriteriaParameter(InfraRealtyCommon.SQL_PARAMETER_PRICERANGE_START, 0, listingFilter.PriceRange.MinValue.ToString(), InfraRealtyCommon.SQL_WHERE_PRICE_START));
            criteria.AddCondtionAnd();
            criteria.AddMoneyParameter(new CriteriaParameter(InfraRealtyCommon.SQL_PARAMETER_PRICERANGE_END, 0, listingFilter.PriceRange.MaxValue.ToString(), InfraRealtyCommon.SQL_WHERE_PRICE_END));
            criteria.EndFilter();
        }
    }

    private void GetSquareFeetFilter(RepositoryCriteria criteria, ListingFilter listingFilter)
    {
        if (listingFilter.SquareFeetRange.IsRangeFilterOn)
        {
            criteria.AddCondtionAnd();
            criteria.StartFilter();
            criteria.AddMoneyParameter(new CriteriaParameter(InfraRealtyCommon.SQL_PARAMETER_SQFT_START, 0, listingFilter.SquareFeetRange.MinValue.ToString(), InfraRealtyCommon.SQL_WHERE_SQFT_START));
            criteria.AddCondtionAnd();
            criteria.AddMoneyParameter(new CriteriaParameter(InfraRealtyCommon.SQL_PARAMETER_SQFT_END, 0, listingFilter.SquareFeetRange.MaxValue.ToString(), InfraRealtyCommon.SQL_WHERE_SQFT_END));
            criteria.EndFilter();
        }
    }

    private void GetListingTypeFilter(RepositoryCriteria criteria, ListingFilter listingFilter)
    {
        CriteriaParameterCollection typeFiltering = listingFilter.GetTypeFilter();

        bool isFirstitem = true;

        if (typeFiltering.Count > 0)
        {
            criteria.AddCondtionAnd();
            criteria.StartFilter();
        }


        foreach (CriteriaParameter parameter in typeFiltering)
        {
            if (!isFirstitem)
            {
                criteria.AddCondtionOr();
            }
            criteria.AddIntParameter(parameter);
            isFirstitem = false;
        }

        if (typeFiltering.Count > 0)
        {
            criteria.EndFilter();
        }

    }

    private void GetAddressFilter(RepositoryCriteria criteria, ListingFilter listingFilter)
    {

        criteria.StartFilter();

        if (listingFilter.IsZipCodeFilterOn)
        {
            criteria.AddCharParameter(new CriteriaParameter(InfraRealtyCommon.SQL_PARAMETER_ZIPCODE, 5, listingFilter.ZipCode, InfraRealtyCommon.SQL_WHERE_ZIPCODE));
        }
        else
        {
            criteria.AddCharParameter(new CriteriaParameter(InfraRealtyCommon.SQL_PARAMETER_STATEID, 2, listingFilter.StateId, InfraRealtyCommon.SQL_WHERE_STATEID));
            if (listingFilter.IsCityFilterOn)
            {
                criteria.AddCondtionAnd();
                criteria.AddIntParameter(new CriteriaParameter(InfraRealtyCommon.SQL_PARAMETER_CITYID, 0, listingFilter.CityId.ToString(), InfraRealtyCommon.SQL_WHERE_CITYID));
            }
        }

        criteria.EndFilter();

    }

}
