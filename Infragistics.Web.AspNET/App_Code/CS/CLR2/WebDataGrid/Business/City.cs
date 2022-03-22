using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for City
/// </summary>
namespace CS.WebDataGrid.Business
{
   [Serializable]
    public class City
    {
        public City()
        {
        }

        public City(string cityId, string cityName, double cityPopulation, bool isCityCapital, DateTime built, string country)
        {
            this._cityId = cityId;
            this._cityName = cityName;
            this._cityPopulation = cityPopulation;
            this._isCityCapital = isCityCapital;
            this._built = built;
            this._country = country;
        }

        string _cityId = "";
        public string CityID
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

        string _cityName = "";
        public string CityName
        {
            get
            {
                return this._cityName;
            }
            set
            {
                this._cityName = value;
            }
        }

        double _cityPopulation = 0;
        public double CityPopulation
        {
            get
            {
                return this._cityPopulation;
            }
            set
            {
                this._cityPopulation = value;
            }
        }

        bool _isCityCapital = false;
        public bool IsCityCapital
        {
            get
            {
                return this._isCityCapital;
            }
            set
            {
                this._isCityCapital = value;
            }
        }

        DateTime _built;
        public DateTime Built
        {
            get
            {
                return this._built;
            }
            set
            {
                this._built = value;
            }
        }

        string _country = "";
        public string Country
        {
            get
            {
                return this._country;
            }
            set
            {
                this._country = value;
            }
        }
    }
}