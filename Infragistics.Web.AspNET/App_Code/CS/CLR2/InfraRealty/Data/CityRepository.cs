using Infragistics.Samples.InfraRealty.Models;
using System.Data;

/// <summary>
/// Summary description for CityRepository
/// </summary>
public class CityRepository :BaseOleDBRepository<CityCollection>
{
	public CityRepository()
	{

	}
    
    protected override CityCollection MapResult(IDataReader dbReader)
    {

        CityCollection cities = new CityCollection();

        // Add Default City
        City defaultCity = new City();
        defaultCity.Id = 0;
        defaultCity.name = string.Empty;
        cities.Add(defaultCity);

        while (dbReader.Read())
        {
            City city = new City();
            city.Id = dbReader.GetInt32(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_CITYID));
            city.name = dbReader.GetString(dbReader.GetOrdinal(InfraRealtyCommon.SQL_FIELD_NAME));
            cities.Add(city);
        }

        return cities;
    }

}
