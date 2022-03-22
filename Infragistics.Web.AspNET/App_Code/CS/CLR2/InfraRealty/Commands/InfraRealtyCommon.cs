using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
/// Summary description for InfraRealtyCommon
/// </summary>
public class InfraRealtyCommon
{

    #region CONST
    
    public const string JAVASCRIPT_FIELDNAMES = "field_names";
    public const int SLIDER_PRICE_SMALLCHANGE = 25000;
    public const int SLIDER_PRICE_LARGECHANGE = 100000;
    public const int SLIDER_PRICE_MINVALUE = 0;
    public const int SLIDER_PRICE_MAXVALUE = 1000000;
    public const int SLIDER_SQFT_SMALLCHANGE = 50;
    public const int SLIDER_SQFT_LARGECHANGE = 100;
    public const int SLIDER_SQFT_MINVALUE = 0;
    public const int SLIDER_SQFT_MAXVALUE = 10000;

    public const string ASYNC_POSTBACK_TRIGGER = "button_trigger";
    public const string ASYNC_POSTBACK_SEARCH = "button_search";
    public const string ASYNC_POSTBACK_RESET = "button_reset";

    public const string LISTING_PHOTOS_FORM_KEY = "input_galleryImageKey";
    public const string LISTING_PHOTOS_FORM_LISTING = "input_gallerylisting";

    public const string LISTING_PHOTOS_PATH = "~/WebShowcase/InfraRealty/images/listings/";

    public const string SORTING_ASC = "ASC";
    public const string SORTING_DESC = "DESC";

    public const string EXPRESSION_PHOTOS = "Photos";
    public const string EXPRESSION_PHOTO_URL = "MainPhoto.url";
    public const string EXPRESSION_MLSID = "mls_id";

    public const string SQL_GETCITIES = @"SELECT city_id, name FROM city WHERE state_id = @stateId";
    public const string SQL_GETSTATES = @"SELECT state_id, name FROM State";
    public const string SQL_GETPHOTOS = @"SELECT photo.mls_id, photo.photo_id, photo.url, photo.thumb_url FROM photo WHERE mls_id = @mlsId";
    public const string SQL_GETLISTING = @"SELECT listing.mls_id, listing.address, listing.zipcode, listing.state_id, listing.status, listing.price, listing.bedrooms, listing.footage, listing.bathrooms,  listing.stories, listing.yearBuilt, listing.type, listing.hasPool, listing.listedOn, listing.hasLaundry, listing.hasFireplace, listing.hasWalkInClosets, listing.remarks, listing.mainphoto_id, listing.city_id, city.name as cityname, state.name AS statename FROM ((listing INNER JOIN state ON listing.state_id = state.state_id)INNER JOIN city on city.city_id = listing.city_id)";

    public const string SQL_CRITERIABUIDLER_CONDITION_START = "(";
    public const string SQL_CRITERIABUIDLER_CONDITION_END = ")";
    public const string SQL_CRITERIABUIDLER_CONDITION_AND = " AND ";
    public const string SQL_CRITERIABUIDLER_CONDITION_OR = " OR ";
    public const string SQL_CRITERIABUIDLER_WHERE = " WHERE " ;

    public const string SQL_PARAMETER_MLSID = "@mlsId";
    public const string SQL_PARAMETER_PRICERANGE_START = "@pricerangestart";
    public const string SQL_PARAMETER_PRICERANGE_END = "@pricerangeend";
    public const string SQL_PARAMETER_SQFT_START = "@sqfeetstart";
    public const string SQL_PARAMETER_SQFT_END = "@sqfeetend";
    public const string SQL_PARAMETER_CITYID = "@cityId";
    public const string SQL_PARAMETER_STATEID = "@stateId";
    public const string SQL_PARAMETER_ZIPCODE = "@zipcode";
    public const string SQL_PARAMETER_CONDO = "@typeCondo";
    public const string SQL_PARAMETER_SINGLEFAMILY = "@typeSingleFamily";
    public const string SQL_PARAMETER_MULTIFAMILY = "@typeMultiFamily";

    public const string SQL_WHERE_PRICE_START = "listing.price >= @pricerangestart";
    public const string SQL_WHERE_PRICE_END = "listing.price <= @pricerangeend";
    public const string SQL_WHERE_SQFT_START = "listing.footage >= @sqfeetstart";
    public const string SQL_WHERE_SQFT_END = "listing.footage <= @sqfeetend";
    public const string SQL_WHERE_CITYID = " listing.city_id = @cityId";
    public const string SQL_WHERE_STATEID = "Listing.State_Id = @StateId";
    public const string SQL_WHERE_ZIPCODE = "Listing.ZipCode = @ZipCode";
    public const string SQL_WHERE_CONDO = " Listing.ListingTypeId = @typeCondo";
    public const string SQL_WHERE_SINGLEFAMILY = " Listing.ListingTypeId = @typeSingleFamily";
    public const string SQL_WHERE_MULTIFAMILY = " Listing.ListingTypeId = @typeMultiFamily";

    public const string SQL_VALUE_CONDO = "1";
    public const string SQL_VALUE_SINGLEFAMILY = "2";
    public const string SQL_VALUE_MULTIFAMILY = "3";

    public const string SQL_FIELD_MLSID = "mls_id";
    public const string SQL_FIELD_NAME = "name";
    public const string SQL_FIELD_ADDRESS = "address";
    public const string SQL_FIELD_CITYID = "city_id";
    public const string SQL_FIELD_CITYNAME = "cityname";
    public const string SQL_FIELD_STATEID = "state_id";
    public const string SQL_FIELD_STATENAME = "statename";
    public const string SQL_FIELD_ZIPCODE = "zipcode";

    public const string SQL_FIELD_BATHROOMS = "bathrooms";
    public const string SQL_FIELD_BEDROOMS = "bedrooms";
    public const string SQL_FIELD_FOOTAGE = "footage";
    public const string SQL_FIELD_HASFIREPLACE = "hasFireplace";
    public const string SQL_FIELD_HASLAUNDRY = "hasLaundry";
    public const string SQL_FIELD_HASPOOL = "hasPool";
    public const string SQL_FIELD_HASWALKINCLOSETS = "hasWalkInClosets";
    public const string SQL_FIELD_LISTEDON = "listedOn";
    public const string SQL_FIELD_STATUS = "status";
    public const string SQL_FIELD_STORIES = "stories";
    public const string SQL_FIELD_PRICE = "price";
    public const string SQL_FIELD_REMARKS = "remarks";
    public const string SQL_FIELD_YEARBUILT = "yearBuilt";
    public const string SQL_FIELD_PHOTOID = "photo_id";
    public const string SQL_FIELD_URL = "url";
    public const string SQL_FIELD_THUMBURL = "thumb_url";

    #endregion
}
