using System;
using System.Web.UI;
using System.Collections;
using System.Data.Common;
using System.Data.Linq;
using Infragistics.Web.UI.GridControls;
using System.Collections.Generic;
using CS.WebDataGrid.Business;
using System.Web;

public partial class Samples_WebDataGrid_Editing_and_Selection_Row_Editing_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    private const string sessionKey = "RowEditingCities";

    protected void Page_Load(object sender, EventArgs e)
    {
        List<City> cities = this.GetCities();
        this.WebDataGrid1.DataSource = cities;
    }

    protected void WebDataGrid1_RowUpdated(object sender, Infragistics.Web.UI.GridControls.RowUpdatedEventArgs e)
    {
        WebDataGrid grid = sender as WebDataGrid;

        if (grid != null)
        {
            GridRecord row = grid.Rows.FromIDPair(e.RowID);
            City city = row != null ? row.DataItem as City : null;

            if (city != null)
                SaveCity(city);
        }
    }

    private void SaveCity(CS.WebDataGrid.Business.City city)
    {
        List<City> cities = this.GetCities();
        City existingCity = cities.Find(c => c.CityID == city.CityID);

        if (existingCity != null)
        {
            existingCity.Built = city.Built;
            existingCity.CityName = city.CityName;
            existingCity.CityPopulation = city.CityPopulation;
            existingCity.Country = city.Country;
            existingCity.IsCityCapital = city.IsCityCapital;
        }

        HttpContext.Current.Session[sessionKey] = cities;
    }

    private List<City> GetCities()
    {
        List<City> cities = HttpContext.Current.Session[sessionKey] as List<City>;

        if (cities == null)
        {
            CustomDataSource dataSources = new CustomDataSource();
            cities = dataSources.GetCities();
        }

        return cities;
    }
}
