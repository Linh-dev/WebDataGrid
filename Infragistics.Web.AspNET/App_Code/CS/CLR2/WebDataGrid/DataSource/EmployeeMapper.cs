using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for EmployeeMapper
/// </summary>
public class EmployeeMapper : IDataMapper<EmployeeCollection>
{
    public EmployeeMapper()
    {

    }
     public string ConnectString
    {
        get { return "Nwind.mdb"; }
    }

     public EmployeeCollection MapData(System.Data.IDataReader dbReader)
     {
         EmployeeCollection employees = new EmployeeCollection();

         while (dbReader.Read()) 
         {
             Employee employee = new Employee();
             employee.EmployeeID = dbReader.GetInt32(dbReader.GetOrdinal("EmployeeID"));
             employee.LastName = dbReader.GetString(dbReader.GetOrdinal("LastName"));
             employee.FirstName = dbReader.GetString(dbReader.GetOrdinal("FirstName"));
             employee.Title = dbReader.GetString(dbReader.GetOrdinal("Title"));
             employee.TitleOfCourtesy = dbReader.GetString(dbReader.GetOrdinal("TitleOfCourtesy"));
             employee.BirthDate = dbReader.GetDateTime(dbReader.GetOrdinal("BirthDate"));
             employee.City = dbReader.GetString(dbReader.GetOrdinal("City"));
             employee.Country = dbReader.GetString(dbReader.GetOrdinal("Country"));
       
            employees.Add(employee);
         }
         return employees;
     }
	
}