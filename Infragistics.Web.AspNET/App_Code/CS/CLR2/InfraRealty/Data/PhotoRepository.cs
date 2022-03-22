using System.Data;

/// <summary>
/// Summary description for PhotoRepository
/// </summary>
public class PhotoRepository : BaseOleDBRepository<PhotoCollection>
{
	public PhotoRepository()
	{
	}

    protected override PhotoCollection MapResult(IDataReader dbReader)
    {
        PhotoCollection photos = new PhotoCollection();

        while (dbReader.Read())
        {
            Photo photo = new Photo();
            photo.mls_id = dbReader.GetString(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_MLSID));
            photo.photo_id = dbReader.GetInt32(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_PHOTOID));
            photo.url = dbReader.GetString(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_URL));
            photo.thumb_url = dbReader.GetString(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_THUMBURL));
            photos.Add(photo);
        }

        return photos;
    }



}
