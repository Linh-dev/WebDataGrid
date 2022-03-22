using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;
using System.Text;
using System.ComponentModel;



namespace LocalizationUtils
{
	/// <summary>
	/// Summary description for LocalizedImage
	/// </summary>
	public class LocalizedImage : Image
	{
		private string m_LocalizedImageUrl;

		const string ENGISO = "eng";
		private string m_DefaultISO;

		public string LocalizedImageUrl
		{
			get {
				if (m_LocalizedImageUrl == null)
				{
					m_LocalizedImageUrl = LocalizePath(base.ImageUrl);
				}

				return m_LocalizedImageUrl;
			}
		}


		public override string ImageUrl
		{
			get
			{
				return this.LocalizedImageUrl;
			}
			set
			{
				base.ImageUrl = value;
			}
		}

		[DefaultValue("eng")]
		public string DefaultISO 
		{ 
			get 
			{
				if (m_DefaultISO == null)
					m_DefaultISO = ENGISO;

				return m_DefaultISO; 
			} 
			set { m_DefaultISO = value; } 
		}

		private string LocalizePath(string path)
		{
			string new_path;
			new_path = ReBuildPath(path, System.Threading.Thread.CurrentThread.CurrentCulture.ThreeLetterISOLanguageName);

			if(!CheckFile(this.Page.Server.MapPath(new_path)))
			{
				new_path = ReBuildPath(path, this.DefaultISO);
			}

			return new_path;
		}


		private bool CheckFile(string path) 
		{
			return System.IO.File.Exists(path);
		}

		private string ReBuildPath(string path, string iso_three) 
		{
			StringBuilder sb = new StringBuilder();

            if (path.ToLower().IndexOf("/"+ENGISO+"/") > 0)
            {
                sb.Append(path.Replace(ENGISO, iso_three));

            }
            else 
            {
                sb.Append(path.Substring(0, path.LastIndexOf("/")));
                sb.Append("/");
                sb.Append(iso_three);
                sb.Append(path.Substring(path.LastIndexOf("/"), path.Length - path.LastIndexOf("/")));
            }

			return sb.ToString();

		}



	}



}