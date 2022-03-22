using System.Data;

/// <summary>
/// Summary description for RealtyService
/// </summary>
public class ListingRepository : BaseOleDBRepository<MLSListingCollection>
{
	public  ListingRepository()
	{


	}
    
    protected override MLSListingCollection MapResult(IDataReader dbReader)
    {
        MLSListingCollection listings = new MLSListingCollection();

        while (dbReader.Read())
        {
            MLSListing listing = new MLSListing();
            listing.mls_id = dbReader.GetString(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_MLSID));

            Address listAddress = new Address();
            listAddress.Street = dbReader.GetString(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_ADDRESS));
            listAddress.City = dbReader.GetString(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_CITYNAME));
            listAddress.State = dbReader.GetString(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_STATENAME));
            listAddress.Zipcode = dbReader.GetString(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_ZIPCODE));
            listing.ListingAddress = listAddress;

            listing.bathrooms = dbReader.GetDouble(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_BATHROOMS));
            listing.bedrooms = dbReader.GetInt16(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_BEDROOMS));
            listing.footage = dbReader.GetInt32(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_FOOTAGE));
            listing.hasFireplace = dbReader.GetBoolean(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_HASFIREPLACE));
            listing.hasLaundry = dbReader.GetBoolean(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_HASLAUNDRY));
            listing.hasPool = dbReader.GetBoolean(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_HASPOOL));
            listing.hasWalkInClosets = dbReader.GetBoolean(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_HASWALKINCLOSETS));
            listing.listedOn = dbReader.GetDateTime(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_LISTEDON));
            listing.status = dbReader.GetString(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_STATUS));
            listing.stories = dbReader.GetString(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_STORIES));
            listing.price = dbReader.GetDecimal(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_PRICE));
            listing.remarks = dbReader.GetString(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_REMARKS));
            listing.yearBuilt = dbReader.GetInt32(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_YEARBUILT));
            listings.Add(listing.mls_id , listing);
        }

        return listings;
    }
}
