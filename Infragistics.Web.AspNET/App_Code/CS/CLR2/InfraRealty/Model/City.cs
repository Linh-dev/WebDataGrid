using System.Collections.Generic;

namespace Infragistics.Samples.InfraRealty.Models
{
    /// <summary>
    /// Summary description for City
    /// </summary>
    public class City
    {
        public City()
        {
        }

        private int _id;
        public int Id
        {
            get
            {
                return this._id;
            }
            set
            {
                this._id = value;
            }
        }


        private string _name;
        public string name
        {
            get
            {
                return this._name;
            }
            set
            {
                this._name = value;
            }
        }

    }

    public class CityCollection : List<City>
    {
        public CityCollection()
        {
        }

    }
}