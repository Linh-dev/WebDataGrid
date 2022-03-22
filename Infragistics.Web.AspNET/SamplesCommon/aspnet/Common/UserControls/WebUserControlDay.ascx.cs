namespace TabbedPageSample
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using System.Xml;

	/// <summary>
	///		Summary description for WebUserControlDay.
	/// </summary>
	public partial  class WebUserControlDay : System.Web.UI.UserControl
	{
		protected System.Data.OleDb.OleDbConnection oleDbConnection1;

		private XmlDocument WebScheduleData
		{
			get
			{
				if (Session["WebScheduleData"] == null)
				{
					Session["WebScheduleData"] = WebScheduleSamples.Util.GenerateDocument();
				}
				return (XmlDocument)Session["WebScheduleData"];
			}	
		}

		protected void Page_Load(object sender, System.EventArgs e)
		{
			if(WebSamplesCS.Config.IsLockdownMode)
			{
				//The Custom Provider
				Infragistics.WebUI.Data.WebScheduleXMLDataProvider theCustomProvider 
					= new Infragistics.WebUI.Data.WebScheduleXMLDataProvider(this.WebScheduleData);
				theCustomProvider.WebScheduleInfo = this.WebScheduleInfo1;
			}
			else
			{
				this.WebScheduleOleDbProvider1.WebScheduleInfo = this.WebScheduleInfo1;
				this.oleDbConnection1.ConnectionString = WebSamplesCS.Config.WebScheduleMDBConnString;
				this.WebScheduleOleDbProvider1.Connection = this.oleDbConnection1;
			}

			this.WebScheduleInfo1.ActiveResourceName = "Javier Lamoreaux";
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		///		Required method for Designer support - do not modify
		///		the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.oleDbConnection1 = new System.Data.OleDb.OleDbConnection();

		}
		#endregion
	}
}
