<%@ Application Language="C#" %>
<script RunAt="server">

	void Application_Start(object sender, EventArgs e)
	{
		//var init = Infragistics.Web.SampleBrowser.Core.Framework.Repository.RepositoryFactory.FrameworkRepository;

		//log4net.Config.XmlConfigurator.Configure();
	}

	void Application_End(object sender, EventArgs e)
	{
		//  Code that runs on application shutdown

	}

	void Application_Error(object sender, EventArgs e)
	{
		if (!Infragistics.Web.SampleBrowser.Core.Framework.AppSettings.ShowErrors)
		{
			Exception objErr = Server.GetLastError().GetBaseException();

			//Catch general SQLException
			if (objErr is System.Data.SqlClient.SqlException)
			{
				this.Server.Transfer("~/sqlerror.aspx");
			}

			if (objErr is HttpException)
			{
				if (((HttpException)objErr).GetHttpCode() == 404)
				{
					return;
				}
			}

			this.Server.Transfer("~/error.aspx");
		}
	}

	protected void Application_BeginRequest(object sender, EventArgs e)
	{
		try
		{
			System.Threading.Thread.CurrentThread.CurrentUICulture = System.Globalization.CultureInfo.GetCultureInfo(Infragistics.Web.SampleBrowser.Core.Framework.AppSettings.LanguageId);
		}
		catch (ArgumentException)
		{
			return;
		}

		float v = Infragistics.Web.SampleBrowser.Core.Framework.Helpers.UrlHelper.GetInternetExplorerVersionNumber();

		if (v < 7 && v != -1)
		{
			if (!System.Web.HttpContext.Current.Request.Path.EndsWith(".js") &&
					!System.Web.HttpContext.Current.Request.Path.EndsWith(".css") &&
					!System.Web.HttpContext.Current.Request.Path.EndsWith(".png") &&
					!System.Web.HttpContext.Current.Request.Path.EndsWith(".gif"))
			{
				this.Server.Transfer("~/IE6.aspx");
			}
		}
	}

	void Session_Start(object sender, EventArgs e)
	{

	}

	void Session_End(object sender, EventArgs e)
	{
		// Code that runs when a session ends. 
		// Note: The Session_End event is raised only when the sessionstate mode
		// is set to InProc in the Web.config file. If session mode is set to StateServer 
		// or SQLServer, the event is not raised.

	}
       
</script>
