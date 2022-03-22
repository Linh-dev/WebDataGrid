using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Samples_WebHierarchicalDataGrid_EditingAndSelection_DeleteRowButton_Default : Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet data = Session["DataForWHDG"] as DataSet;
        if (data == null)
        {
            data = this.GetData();
            Session["DataForWHDG"] = data;
        }
        this.WebHierarchicalDataGrid1.DataSource = data;
    }
    private DataSet GetData()
    {
        DataSet data = new DataSet();

        DataTable person = new DataTable("Person");
        person.Columns.Add("ID", typeof(int));
        person.Columns.Add("FirstName", typeof(string));
        person.Columns.Add("LastName", typeof(string));
        person.Columns.Add("DOB", typeof(DateTime));
        person.PrimaryKey = new DataColumn[] { person.Columns["ID"] };

        person.Rows.Add(1, "Ed", "Smith", new DateTime(1975, 9, 12));
        person.Rows.Add(2, "Ivan", "Green", new DateTime(1922, 3, 21));
        person.Rows.Add(3, "Mary", "Tylo", new DateTime(1983, 10, 21));
        person.Rows.Add(4, "Kate", "Henui", new DateTime(1953, 3, 28));
        person.Rows.Add(5, "Ed", "Mitchel", new DateTime(1947, 12, 17));
        person.Rows.Add(6, "Jake", "Gurber", new DateTime(1966, 5, 7));
        person.Rows.Add(7, "Mary", "Gem", new DateTime(1985, 2, 9));
        person.Rows.Add(8, "Ed", "Nilk", new DateTime(1975, 12, 12));
        person.Rows.Add(9, "Jake", "White", new DateTime(1966, 5, 7));

        DataTable address = new DataTable("Address");
        address.Columns.Add("PersonID", typeof(int));
        address.Columns.Add("AddressType", typeof(string));
        address.Columns.Add("Street", typeof(string));
        address.Columns.Add("City", typeof(string));
        address.Columns.Add("State", typeof(string));
        address.Columns.Add("Zip", typeof(int));
        address.PrimaryKey = new DataColumn[] { address.Columns["PersonID"], address.Columns["AddressType"] };


        address.Rows.Add(1, "Home", "34 Milestone Rd", "Phila", "PA", 19832);
        address.Rows.Add(1, "Work", "250 Sunset Blvd.", "New York", "NY", 17374);
        address.Rows.Add(3, "Home", "55 Vitosha Blvd.", "Phila", "PA", 19116);
        address.Rows.Add(3, "Work", "24589 Chestnut St.", "Phila", "PA", 18364);
        address.Rows.Add(3, "Vacation", "23 Sunny Rd.", "Miami", "FL", 37475);
        address.Rows.Add(5, "Home", "659 Rising Sun Ave", "Trenton", "NJ", 12931);
        address.Rows.Add(5, "Work", "235 Market St.", "Trenton", "NJ", 28341);
        address.Rows.Add(6, "Home", "747 Cranbury Rd.", "Chicago", "IL", 18244);
        address.Rows.Add(7, "Home", "458 Merryberry Ave.", "Willmintong", "DE", 38291);
        address.Rows.Add(7, "Work", "2 Willow Rd.", "Willmintong", "DE", 38291);


        DataTable description = new DataTable("AddressDescription");
        description.Columns.Add("PersonID", typeof(int));
        description.Columns.Add("AddressType", typeof(string));
        description.Columns.Add("Description", typeof(string));
        description.PrimaryKey = new DataColumn[] { description.Columns["PersonID"], description.Columns["AddressType"] };

        description.Rows.Add(1, "Home", "Main residence.  Two story, single house");
        description.Rows.Add(1, "Work", "Place of business, ulgy red brick building");
        description.Rows.Add(3, "Home", "Old Victorian house");
        description.Rows.Add(3, "Work", "New hightech building");
        description.Rows.Add(3, "Vacation", "Appartment building");
        description.Rows.Add(5, "Home", "Townhouse");
        
        DataTable phone = new DataTable("Phone");
        phone.Columns.Add("PersonID", typeof(int));
        phone.Columns.Add("PhoneType", typeof(string));
        phone.Columns.Add("PhoneNumber", typeof(string));
        phone.PrimaryKey = new DataColumn[] { phone.Columns["PersonID"], phone.Columns["PhoneType"] };

        phone.Rows.Add(1, "Home", "(463)323-3288");
        phone.Rows.Add(1, "Cell", "(346)727-5611");
        phone.Rows.Add(2, "Home", "(215)371-8630");
        phone.Rows.Add(3, "Home", "(215)371-8630");
        phone.Rows.Add(3, "Cell", "(610)362-7699");
        phone.Rows.Add(3, "Work", "(610)272-3478");
        phone.Rows.Add(7, "Cell", "(788)811-3838");

        data.Tables.Add(person);
        data.Tables.Add(address);
        data.Tables.Add(phone);
        data.Tables.Add(description);

        data.Relations.Add(person.Columns["ID"], address.Columns["PersonID"]);
        data.Relations.Add(person.Columns["ID"], phone.Columns["PersonID"]);
        data.Relations.Add(
            new DataColumn[] { address.Columns["PersonID"], address.Columns["AddressType"] },
            new DataColumn[] { description.Columns["PersonID"], description.Columns["AddressType"] }
        );
        return data;
    }
}