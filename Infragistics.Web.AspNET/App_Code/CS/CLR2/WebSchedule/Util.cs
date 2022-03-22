using Infragistics.WebUI.Shared;

using System;
using System.Collections;
using System.Drawing;
using System.Reflection;
using System.Web.UI.WebControls;
using System.Xml;

namespace WebScheduleSamples
{
    public enum GenerationSampleDataMode
    {
        MultiEventBannerMode,
        MultipleResourcesMode
    }

	public class Util
	{
		static Util()
		{
			PropertyInfo[] allColors = typeof(Color).GetProperties();
			ArrayList colorsList = new ArrayList();
			foreach (PropertyInfo currentColor in allColors)
			{
				if (currentColor.PropertyType == typeof(Color))
				{
					colorsList.Add(new ListItem(currentColor.Name));
				}
			}
			Util.NamedColors = (ListItem[])colorsList.ToArray(typeof(ListItem));

			Util.StyleNamesListItems = new ListItem[Util.StyleNames.Length];
			for (int current = 0; current < Util.StyleNames.Length; current++)
			{
				Util.StyleNamesListItems[current] = new ListItem(Util.StyleNames[current]);
			}
		}

        private static Random randomNumber = new Random();
		public static readonly ListItem[] NamedColors;
        public static readonly string[] StyleNames = new string[] { "Default", "IG", "Appletini", "Caribbean", "Claymation", "ElectricBlue", "Harvest", "LucidDream", "Nautilus", "Pear", "RedPlanet", "RubberBlack", "Trendy", "Windows7", "Office2007Blue", "Office2010Blue", "Office2007Black", "Office2007Silver" };
		public static readonly ListItem[] StyleNamesListItems;
		public const string VOL = Infragistics.WebUI.Shared.AssemblyVersion.Build;
		
		public static string GetStyleSheetFileName(string styleName, string fileName)
		{
			// File System web site path must be beneath project root.
			return System.Web.Configuration.WebConfigurationManager.AppSettings["WebScheduleStyleSheetPath"]+styleName + "/" + fileName;
		}
		public static string GetStyleSheetFileName(string styleName, string fileName, bool fileNameIncludesPath)
		{
			if (fileNameIncludesPath)
			{
				string[] tokens = fileName.Split('/');
				if (tokens != null && tokens.Length > 2)
				{
                    string currentStyle = tokens[tokens.Length - 2];
                    return fileName.Replace(currentStyle, styleName);
				}
			}
			return Util.GetStyleSheetFileName(styleName, fileName);
		}
		public static string GetNextStyleSheetFileName(string currentStyleSheetFileName)
		{
			string[] tokens = currentStyleSheetFileName.Split('/');
			if (tokens != null && tokens.Length > 1)
			{
				string currentFileName = tokens[tokens.Length - 1].ToUpper();
				string currentStyleName = tokens[tokens.Length - 2].ToUpper();
				switch (currentStyleName)
				{
						// use upper case
                    case "AQUA":
                        currentStyleSheetFileName = Util.GetStyleSheetFileName("Aqua", currentFileName);
                        break;
                    case "AERO":
                        currentStyleSheetFileName = Util.GetStyleSheetFileName("Aero", currentFileName);
                        break;
                    case "ONYX":
                        currentStyleSheetFileName = Util.GetStyleSheetFileName("Onyx", currentFileName);
                        break;
                    case "XPBLUE":
                        currentStyleSheetFileName = Util.GetStyleSheetFileName("XpBlue", currentFileName);
                        break;
                    case "XPOLIVE":
                        currentStyleSheetFileName = Util.GetStyleSheetFileName("XpOlive", currentFileName);
                        break;
                    case "XPSILVER":
                        currentStyleSheetFileName = Util.GetStyleSheetFileName("XpSilver", currentFileName);
                        break;
                    case "ROYALE":
                        currentStyleSheetFileName = Util.GetStyleSheetFileName("Royale", currentFileName);
                        break;
                    case "OFFICE2007BLUE":
                        currentStyleSheetFileName = Util.GetStyleSheetFileName("Office2007Blue", currentFileName);
                        break;
                    case "OFFICE2007BLACK":
                        currentStyleSheetFileName = Util.GetStyleSheetFileName("Office2007Black", currentFileName);
                        break;
                    case "OFFICE2007SILVER":
                        currentStyleSheetFileName = Util.GetStyleSheetFileName("Office2007Silver", currentFileName);
                        break;
                    default:
                    case "DEFAULT":                      
                        currentStyleSheetFileName = Util.GetStyleSheetFileName("Default", currentFileName);
                        break;

				}
			}
			return currentStyleSheetFileName;
		}

		public static ListItem[] StylesForType(Type type)
		{
			PropertyInfo[] allProps = type.GetProperties();
			ArrayList stylePropsList = new ArrayList();
			
			foreach (PropertyInfo currentProperty in allProps)
			{
				if (currentProperty.PropertyType == typeof(Infragistics.WebUI.Shared.Style))
				{
					stylePropsList.Add(currentProperty.Name);
				}
			}
			
			stylePropsList.Sort();
			
			ArrayList listItemsList = new ArrayList();
			foreach (string propName in stylePropsList)
			{
				listItemsList.Add(new ListItem(propName));
			}

			return (ListItem[])listItemsList.ToArray(typeof(ListItem));
		}

		/// <summary>
		/// Creates an XML Document for the WebSchedule Custom Provider
		/// </summary>
		/// <returns></returns>
		public static XmlDocument GenerateDocument()
		{
			//-<scheduleInfo>
			//----<resources>
			//-------<resource/>
			//-------<resource/>
			//-------<resource/>
			//----</resources>
			//----<appointments>
			//-------<appointment/>
			//-------<appointment/>
			//-------<appointment/>
			//-------<appointment/>
			//----</appointments>
            //----<recurrences>
            //-------<recurrence/>
            //-------<recurrence/>
            //----</recurrences>
			//-</scheduleInfo>

			XmlDocument theDoc = new XmlDocument();

			XmlNode theRootNode = theDoc.CreateElement("scheduleInfo"); //This is the root node for the WebSchedule Data
				
			XmlNode theResources = theDoc.CreateElement("resources"); //Create the Resources collection

			XmlNode aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

			aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Unassigned"; //Assign the default values
			aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "-999";
			aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "-999";
			aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress"));

			theResources.AppendChild(aResource); //then add it to the resources collection

			//Create another resource:
			aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

			aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Darren Straube"; //Assign the default values
			aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "12";
			aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "12";
			aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "dstraube@fictionalcompany.zzz";

			theResources.AppendChild(aResource); //then add it to the resources collection

			//Create another resource:
			aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

			aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Chandra Rochford"; //Assign the default values
			aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "13";
			aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "13";
			aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "crochford@fictionalcompany.zzz";

			theResources.AppendChild(aResource); //then add it to the resources collection

			//Create another resource:
			aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

			aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Lorrie Orduno"; //Assign the default values
			aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "14";
			aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "14";
			aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "lorduno@fictionalcompany.zzz";

			theResources.AppendChild(aResource); //then add it to the resources collection

			//Create another resource:
			aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

			aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Javier Lamoreaux"; //Assign the default values
			aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "15";
			aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "15";
			aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "jlamoreaux@fictionalcompany.zzz";

			theResources.AppendChild(aResource); //then add it to the resources collection

			//Create another resource:
			aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

			aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Jamie Gadomski"; //Assign the default values
			aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "16";
			aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "16";
			aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "jgadomski@fictionalcompany.zzz";

			theResources.AppendChild(aResource); //then add it to the resources collection

			//Create another resource:
			aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

			aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Allyson Tuley"; //Assign the default values
			aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "17";
			aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "17";
			aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "atuley@fictionalcompany.zzz";

			theResources.AppendChild(aResource); //then add it to the resources collection

			//Create another resource:
			aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

			aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Ted Redfern"; //Assign the default values
			aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "18";
			aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "18";
			aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "tredfern@fictionalcompany.zzz";

			theResources.AppendChild(aResource); //then add it to the resources collection

			//Create another resource:
			aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

			aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Tia Quijada"; //Assign the default values
			aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "19";
			aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "19";
			aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "tquijada@fictionalcompany.zzz";

			theResources.AppendChild(aResource); //then add it to the resources collection

			//Create another resource:
			aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

			aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Nelson Croce"; //Assign the default values
			aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "20";
			aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "20";
			aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "ncroce@fictionalcompany.zzz";

			theResources.AppendChild(aResource); //then add it to the resources collection

			//Create another resource:
			aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

			aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Christian Mazzariello"; //Assign the default values
			aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "21";
			aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "21";
			aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "cmazzariello@fictionalcompany.zzz";

			theResources.AppendChild(aResource); //then add it to the resources collection

			//Create another resource:
			aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

			aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Allan Fray"; //Assign the default values
			aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "22";
			aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "22";
			aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "afray@fictionalcompany.zzz";

			theResources.AppendChild(aResource); //then add it to the resources collection

			//Create another resource:
			aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

			aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Jim Morrison"; //Assign the default values
			aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "23";
			aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "23";
			aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "jmorrison@fictionalcompany.zzz";

			theResources.AppendChild(aResource); //then add it to the resources collection

			//Create another resource:
			aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

			aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Development Team"; //Assign the default values
			aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "24";
			aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "24";
			aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "dev@fictionalcompany.zzz";

			theResources.AppendChild(aResource); //then add it to the resources collection

			//Create another resource:
			aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

			aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Lance Klar"; //Assign the default values
			aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "25";
			aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "25";
			aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "lklar@fictionalcompany.zzz";

			theResources.AppendChild(aResource); //then add it to the resources collection

			//Create another resource:
			aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

			aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Amie Broker"; //Assign the default values
			aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "26";
			aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "26";
			aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "abroker@fictionalcompany.zzz";

			theResources.AppendChild(aResource); //then add it to the resources collection

			//Add the Resources to the Root XML Node
			theRootNode.AppendChild(theResources); //then add it to the Root Node




			XmlNode theAppointments = theDoc.CreateElement("appointments"); //Create the Appointments node collection

			XmlNode anAppointment = theDoc.CreateElement("appointment"); //now we set an appointment instance

			anAppointment.Attributes.Append(theDoc.CreateAttribute("allDayEvent")).Value = "False";
			anAppointment.Attributes.Append(theDoc.CreateAttribute("description")).Value = "Place more details about this appointment here.";
			anAppointment.Attributes.Append(theDoc.CreateAttribute("importance")).Value = "2";
			anAppointment.Attributes.Append(theDoc.CreateAttribute("location")).Value = "Office";
			anAppointment.Attributes.Append(theDoc.CreateAttribute("enableReminder")).Value = "True";
			anAppointment.Attributes.Append(theDoc.CreateAttribute("key")).Value = "85533";
			anAppointment.Attributes.Append(theDoc.CreateAttribute("subject")).Value = "Today's Appointment";
			anAppointment.Attributes.Append(theDoc.CreateAttribute("status")).Value = "3";
			anAppointment.Attributes.Append(theDoc.CreateAttribute("startDateTimeUtc")).Value = Convert.ToString(DateTime.UtcNow.Ticks/600000000); 
			anAppointment.Attributes.Append(theDoc.CreateAttribute("endDateTimeUtc")).Value = Convert.ToString(DateTime.UtcNow.AddHours(3).Ticks/600000000); 
			anAppointment.Attributes.Append(theDoc.CreateAttribute("resourceKey")).Value = "-999";
			anAppointment.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "85533";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("recurrenceKey")).Value = "-999";

			theAppointments.AppendChild(anAppointment);

            // Create another appointment, this time a recurring appointment taking
            // place every weekday.
            anAppointment = theDoc.CreateElement("appointment");

            string originalStartDateTimeUtc = Convert.ToString(DateTime.Today.AddHours(16.0).Ticks / 600000000);
            string originalStartDateTimeUtcPlus2 = Convert.ToString(DateTime.Today.AddDays(2.0).AddHours(16.0).Ticks / 600000000);

            string varianceKey = Guid.NewGuid().ToString();

            anAppointment.Attributes.Append(theDoc.CreateAttribute("allDayEvent")).Value = "False";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("description")).Value = "Peanut butter and jelly sandwich, milk, cookies.";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("importance")).Value = "1";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("location")).Value = "Cafe";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("enableReminder")).Value = "False";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("key")).Value = "320887";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("subject")).Value = "Lunch";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("status")).Value = "3";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("startDateTimeUtc")).Value = originalStartDateTimeUtc;
            anAppointment.Attributes.Append(theDoc.CreateAttribute("endDateTimeUtc")).Value = Convert.ToString(DateTime.Today.AddHours(17.0).Ticks / 600000000);
            anAppointment.Attributes.Append(theDoc.CreateAttribute("resourceKey")).Value = "-999";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "320887";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("recurrenceKey")).Value = "712505";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("varianceKey")).Value = varianceKey;

            theAppointments.AppendChild(anAppointment);

            // Create another appointment, this time a variance on the daily lunch appointment.
            anAppointment = theDoc.CreateElement("appointment");

            anAppointment.Attributes.Append(theDoc.CreateAttribute("allDayEvent")).Value = "False";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("description")).Value = "Caesar salad, garlic bread, and pomogranate juice.";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("importance")).Value = "1";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("location")).Value = "Diner";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("enableReminder")).Value = "False";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("key")).Value = "60893";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("subject")).Value = "Lunch";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("status")).Value = "3";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("startDateTimeUtc")).Value = Convert.ToString(DateTime.Today.AddDays(2.0).AddHours(16.0).AddMinutes(30.0).Ticks / 600000000);
            anAppointment.Attributes.Append(theDoc.CreateAttribute("endDateTimeUtc")).Value = Convert.ToString(DateTime.Today.AddDays(2.0).AddHours(17.0).AddMinutes(45.0).Ticks / 600000000);
            anAppointment.Attributes.Append(theDoc.CreateAttribute("resourceKey")).Value = "-999";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "60893";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("recurrenceKey")).Value = "712505";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("originalStartDateTimeUtc")).Value = originalStartDateTimeUtcPlus2;
            anAppointment.Attributes.Append(theDoc.CreateAttribute("varianceKey")).Value = varianceKey;

            theAppointments.AppendChild(anAppointment);

            theRootNode.AppendChild(theAppointments);

            XmlNode theRecurrences = theDoc.CreateElement("recurrences"); //Create the Recurrences node collection

            XmlNode aRecurrence = theDoc.CreateElement("recurrence"); //now we set a recurrence instance

            aRecurrence.Attributes.Append(theDoc.CreateAttribute("recurrenceID")).Value = "712505";
            aRecurrence.Attributes.Append(theDoc.CreateAttribute("period")).Value = "1";    /* Weekly - from the RecurrencePeriod enum */
            aRecurrence.Attributes.Append(theDoc.CreateAttribute("periodMultiple")).Value = "1";
            aRecurrence.Attributes.Append(theDoc.CreateAttribute("dayOfWeekMaskUtc")).Value = "62"; /* AllWeekdays - from the RecurrenceDayOfWeekMask enum */
            aRecurrence.Attributes.Append(theDoc.CreateAttribute("dayOfMonth")).Value = "1";
            aRecurrence.Attributes.Append(theDoc.CreateAttribute("monthOfYear")).Value = "1";
            aRecurrence.Attributes.Append(theDoc.CreateAttribute("endDateUtc")).Value = Convert.ToString(DateTime.Today.AddDays(7.0).Ticks / 600000000);
            aRecurrence.Attributes.Append(theDoc.CreateAttribute("lastReminderDateTimeUtc")).Value = Convert.ToString(DateTime.Today.AddDays(7.0).Ticks / 600000000);

            theRecurrences.AppendChild(aRecurrence);

            theRootNode.AppendChild(theRecurrences);

            theDoc.AppendChild(theRootNode); //add the scheduleInfo Root Node to the XML Document

            return theDoc;
		}

        /// <summary>
        /// Creates an XML Document for the WebSchedule Custom Provider
        /// </summary>
        /// <returns></returns>
        public static XmlDocument GenerateDocument(GenerationSampleDataMode mode)
        {
            //-<scheduleInfo>
            //----<resources>
            //-------<resource/>
            //-------<resource/>
            //-------<resource/>
            //----</resources>
            //----<appointments>
            //-------<appointment/>
            //-------<appointment/>
            //-------<appointment/>
            //-------<appointment/>
            //----</appointments>
            //----<recurrences>
            //-------<recurrence/>
            //-------<recurrence/>
            //----</recurrences>
            //-</scheduleInfo>

            XmlDocument theDoc = new XmlDocument();

            XmlNode theRootNode = theDoc.CreateElement("scheduleInfo"); //This is the root node for the WebSchedule Data

            XmlNode theResources = theDoc.CreateElement("resources"); //Create the Resources collection

            // Generate Resources
            CreateResources(theDoc, ref theResources);

            //Add the Resources to the Root XML Node
            theRootNode.AppendChild(theResources); //then add it to the Root Node

            XmlNode theAppointments = theDoc.CreateElement("appointments"); //Create the Appointments node collection

            XmlNode anAppointment = theDoc.CreateElement("appointment"); //now we set an appointment instance

            DateTime dtNow = DateTime.Today.AddHours(7);

            if (mode == GenerationSampleDataMode.MultiEventBannerMode)
            {
                #region MultiEventBannerMode

                CreateAppointment(theDoc, theResources, ref theAppointments, "15",
                    dtNow, dtNow.AddDays(2),
                    "Sales Expo", "NYC", true);

                CreateAppointment(theDoc, theResources, ref theAppointments, "16",
                    dtNow.AddDays(2), dtNow.AddDays(5),
                    "Win 7 Rollout ", "US", true);

                //CreateAppointment(theDoc, theResources, ref theAppointments, "12",
                //    dtNow.AddDays(3), dtNow.AddDays(8),
                //    "Finalise Merger", "Milan", true);

                //CreateAppointment(theDoc, theResources, ref theAppointments, "14",
                //    dtNow.AddDays(1), dtNow.AddDays(3),
                //    "Tour Sites", "India", true);

                CreateAppointment(theDoc, theResources, ref theAppointments, "18",
                    dtNow.AddDays(3), dtNow.AddDays(4),
                    "Roadshow", "Abu Dhabi", true);

                //int days = randomNumber.Next(0, 4);

                //CreateAppointment(theDoc, theResources, ref theAppointments, "12",
                //    dtNow.AddDays(days).AddMinutes(randomNumber.Next(60, 120)),
                //    dtNow.AddDays(days).AddMinutes(randomNumber.Next(130, 160)),
                //    "VC Golf", "Country Club", false);

                //days = randomNumber.Next(1, 4);

                //CreateAppointment(theDoc, theResources, ref theAppointments, "17",
                //    dtNow.AddDays(days).AddMinutes(randomNumber.Next(60, 90)),
                //    dtNow.AddDays(days).AddMinutes(randomNumber.Next(100, 160)),
                //    "Conf Call", "London", false);

                CreateAppointment(theDoc, theResources, ref theAppointments, "14",
                     dtNow.AddDays(-9).AddHours(10), dtNow.AddDays(-8).AddHours(10),
                     "Release Planning", "US", true);

                //CreateAppointment(theDoc, theResources, ref theAppointments, "14",
                //     dtNow.AddDays(-16), dtNow.AddDays(-12).AddHours(10),
                //     "East Coast Surfing Championships", "Virginia Beach Oceanfront", true);

                CreateAppointment(theDoc, theResources, ref theAppointments, "15",
                     dtNow.AddDays(-20), dtNow.AddDays(-15),
                     "Team Building", "Caribbean Islands", true);

                #endregion
            }
            else if (mode == GenerationSampleDataMode.MultipleResourcesMode)
            {
                #region MultipleResourcesMode

                CreateAppointment(theDoc, theResources, ref theAppointments, "15",
                    dtNow.AddMinutes(60),
                    dtNow.AddMinutes(120),
                    "Sales Expo", "NYC", false);

                CreateAppointment(theDoc, theResources, ref theAppointments, "15",
                    dtNow.AddDays(2).AddMinutes(270),
                    dtNow.AddDays(2).AddMinutes(345),
                    "Win 7 Rollout ", "US", false);

                CreateAppointment(theDoc, theResources, ref theAppointments, "12",
                    dtNow.AddMinutes(360),
                    dtNow.AddMinutes(420),
                    "Finalise Merger", "Milan", false);

                CreateAppointment(theDoc, theResources, ref theAppointments, "12",
                    dtNow.AddDays(1).AddMinutes(150),
                    dtNow.AddDays(1).AddMinutes(240),
                    "Tour Sites", "India", false);

                CreateAppointment(theDoc, theResources, ref theAppointments, "13",
                    dtNow.AddDays(3).AddMinutes(120),
                    dtNow.AddDays(3).AddMinutes(180),
                    "Roadshow", "Abu Dhabi", false);

                CreateAppointment(theDoc, theResources, ref theAppointments, "14",
                    dtNow.AddDays(4).AddMinutes(210),
                    dtNow.AddDays(4).AddMinutes(300),
                    "VC Golf", "Country Club", false);

                CreateAppointment(theDoc, theResources, ref theAppointments, "12",
                     dtNow.AddDays(-9).AddHours(10), dtNow.AddDays(-9).AddHours(11),
                     "Release Planning", "US", false);

                CreateAppointment(theDoc, theResources, ref theAppointments, "13",
                     dtNow.AddDays(-17), dtNow.AddDays(-17).AddHours(4),
                     "East Coast Surfing Championships", "Virginia Beach Oceanfront", false);

                #endregion
            }

            string originalStartDateTimeUtc = Convert.ToString(DateTime.Today.AddHours(16.0).Ticks / 600000000);
            string originalStartDateTimeUtcPlus2 = Convert.ToString(DateTime.Today.AddDays(2.0).AddHours(16.0).Ticks / 600000000);

            string varianceKey = Guid.NewGuid().ToString();

            theRootNode.AppendChild(theAppointments);

            theDoc.AppendChild(theRootNode); //add the scheduleInfo Root Node to the XML Document

            return theDoc;
        }

        protected static void CreateResources(XmlDocument theDoc, ref XmlNode theResources)
        {
            XmlNode aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

            aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Unassigned"; //Assign the default values
            aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "-999";
            aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "-999";
            aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress"));

            theResources.AppendChild(aResource); //then add it to the resources collection

            //Create another resource:
            aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

            aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Darren Straube"; //Assign the default values
            aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "12";
            aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "12";
            aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "dstraube@fictionalcompany.zzz";

            theResources.AppendChild(aResource); //then add it to the resources collection

            //Create another resource:
            aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

            aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Chandra Rochford"; //Assign the default values
            aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "13";
            aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "13";
            aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "crochford@fictionalcompany.zzz";

            theResources.AppendChild(aResource); //then add it to the resources collection

            //Create another resource:
            aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

            aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Lorrie Orduno"; //Assign the default values
            aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "14";
            aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "14";
            aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "lorduno@fictionalcompany.zzz";

            theResources.AppendChild(aResource); //then add it to the resources collection

            //Create another resource:
            aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

            aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Javier Lamoreaux"; //Assign the default values
            aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "15";
            aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "15";
            aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "jlamoreaux@fictionalcompany.zzz";

            theResources.AppendChild(aResource); //then add it to the resources collection

            //Create another resource:
            aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

            aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Jamie Gadomski"; //Assign the default values
            aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "16";
            aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "16";
            aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "jgadomski@fictionalcompany.zzz";

            theResources.AppendChild(aResource); //then add it to the resources collection

            //Create another resource:
            aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

            aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Allyson Tuley"; //Assign the default values
            aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "17";
            aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "17";
            aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "atuley@fictionalcompany.zzz";

            theResources.AppendChild(aResource); //then add it to the resources collection

            //Create another resource:
            aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

            aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Ted Redfern"; //Assign the default values
            aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "18";
            aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "18";
            aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "tredfern@fictionalcompany.zzz";

            theResources.AppendChild(aResource); //then add it to the resources collection

            //Create another resource:
            aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

            aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Tia Quijada"; //Assign the default values
            aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "19";
            aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "19";
            aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "tquijada@fictionalcompany.zzz";

            theResources.AppendChild(aResource); //then add it to the resources collection

            //Create another resource:
            aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

            aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Nelson Croce"; //Assign the default values
            aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "20";
            aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "20";
            aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "ncroce@fictionalcompany.zzz";

            theResources.AppendChild(aResource); //then add it to the resources collection

            //Create another resource:
            aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

            aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Christian Mazzariello"; //Assign the default values
            aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "21";
            aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "21";
            aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "cmazzariello@fictionalcompany.zzz";

            theResources.AppendChild(aResource); //then add it to the resources collection

            //Create another resource:
            aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

            aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Allan Fray"; //Assign the default values
            aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "22";
            aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "22";
            aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "afray@fictionalcompany.zzz";

            theResources.AppendChild(aResource); //then add it to the resources collection

            //Create another resource:
            aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

            aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Jim Morrison"; //Assign the default values
            aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "23";
            aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "23";
            aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "jmorrison@fictionalcompany.zzz";

            theResources.AppendChild(aResource); //then add it to the resources collection

            //Create another resource:
            aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

            aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Development Team"; //Assign the default values
            aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "24";
            aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "24";
            aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "dev@fictionalcompany.zzz";

            theResources.AppendChild(aResource); //then add it to the resources collection

            //Create another resource:
            aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

            aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Lance Klar"; //Assign the default values
            aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "25";
            aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "25";
            aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "lklar@fictionalcompany.zzz";

            theResources.AppendChild(aResource); //then add it to the resources collection

            //Create another resource:
            aResource = theDoc.CreateElement("resource"); //Create an instance of a Resource

            aResource.Attributes.Append(theDoc.CreateAttribute("name")).Value = "Amie Broker"; //Assign the default values
            aResource.Attributes.Append(theDoc.CreateAttribute("key")).Value = "26";
            aResource.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = "26";
            aResource.Attributes.Append(theDoc.CreateAttribute("emailAddress")).Value = "abroker@fictionalcompany.zzz";

            theResources.AppendChild(aResource); //then add it to the resources collection
        }

        protected static void CreateAppointment(XmlDocument theDoc, XmlNode theResources, ref XmlNode theAppointments,
            string resourceKey, DateTime startDateTime, DateTime endDateTime, string description, string location, bool allDayEvent)
        {
            XmlNode anAppointment = theDoc.CreateElement("appointment");

            string dataKey = randomNumber.Next().ToString();

            anAppointment.Attributes.Append(theDoc.CreateAttribute("allDayEvent")).Value = allDayEvent.ToString();
            anAppointment.Attributes.Append(theDoc.CreateAttribute("description")).Value = description;
            anAppointment.Attributes.Append(theDoc.CreateAttribute("importance")).Value = "2";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("location")).Value = location;
            anAppointment.Attributes.Append(theDoc.CreateAttribute("enableReminder")).Value = "True";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("key")).Value = dataKey;
            anAppointment.Attributes.Append(theDoc.CreateAttribute("subject")).Value = description;
            anAppointment.Attributes.Append(theDoc.CreateAttribute("status")).Value = "3";
            anAppointment.Attributes.Append(theDoc.CreateAttribute("startDateTimeUtc")).Value = Convert.ToString(startDateTime.ToUniversalTime().Ticks / 600000000);
            anAppointment.Attributes.Append(theDoc.CreateAttribute("endDateTimeUtc")).Value = Convert.ToString(endDateTime.ToUniversalTime().Ticks / 600000000);
            anAppointment.Attributes.Append(theDoc.CreateAttribute("resourceKey")).Value = resourceKey;
            anAppointment.Attributes.Append(theDoc.CreateAttribute("dataKey")).Value = dataKey;
            anAppointment.Attributes.Append(theDoc.CreateAttribute("recurrenceKey")).Value = "-999";

            theAppointments.AppendChild(anAppointment);
        }

	}


}
