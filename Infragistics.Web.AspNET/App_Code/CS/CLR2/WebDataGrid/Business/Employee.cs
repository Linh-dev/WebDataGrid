using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for Employee
/// </summary>
public class Employee
{
	public Employee()
	{

	}

    public Employee(int employeeID, string firstName, string lastName, string title, string titleOfCourtesy, DateTime birthDate, string city, string country)
    {
        this._employeeID = employeeID;
        this._firstName = firstName;
        this._lastName = lastName;
        this._birthDate = birthDate;
        this._title = title;
        this._titleOfCourtesy = titleOfCourtesy;
        this._city = city;
        this._country = country;
    }

    private int _employeeID;
    public int EmployeeID 
    {
        get { return this._employeeID; }
        set { this._employeeID = value; }
    }
    private string _firstName;
    public string FirstName
    {
        get { return this._firstName; }
        set { this._firstName = value; }
    }
    private string _lastName;
    public string LastName
    {
        get { return this._lastName; }
        set { this._lastName = value; }
    }
    private DateTime _birthDate;
    public DateTime BirthDate
    {
        get { return this._birthDate; }
        set { this._birthDate = value; }
    }
    private string _title;
    public string Title
    {
        get { return this._title; }
        set { this._title = value; }
    }
    private string _city;
    public string City
    {
        get { return this._city; }
        set { this._city = value; }
    }
    private string _country;
    public string Country
    {
        get { return this._country; }
        set { this._country = value; }
    }
    private string _titleOfCourtesy;
    public string TitleOfCourtesy
    {
        get { return this._titleOfCourtesy; }
        set { this._titleOfCourtesy = value; }
    }

}