using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Versions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (File.Exists(Server.MapPath("~/ASP_Version.txt")))
		{
			using (StreamReader sr = new StreamReader(Server.MapPath("~/ASP_Version.txt")))
			{
				String line = sr.ReadToEnd();
				this.aspLabel.Text = line;
			}
		}
		if (File.Exists(Server.MapPath("~/SL_Version.txt")))
		{
			using (StreamReader sr = new StreamReader(Server.MapPath("~/SL_Version.txt")))
			{
				String line = sr.ReadToEnd();
				this.SLLabel.Text = line;
			}
		}
		if (File.Exists(Server.MapPath("~/WF_Version.txt")))
		{
			using (StreamReader sr = new StreamReader(Server.MapPath("~/WF_Version.txt")))
			{
				String line = sr.ReadToEnd();
				this.WFLabel.Text = line;
			}
		}
		if (File.Exists(Server.MapPath("WPF_Version.txt")))
		{
			using (StreamReader sr = new StreamReader(Server.MapPath("WPF_Version.txt")))
			{
				String line = sr.ReadToEnd();
				this.WPFLabel.Text = line;
			}
		}
    }
}