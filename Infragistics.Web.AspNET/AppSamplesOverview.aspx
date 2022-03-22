<%@ Page Title="" Language="C#" MasterPageFile="~/WebformsSite.master" AutoEventWireup="true"
	Inherits="Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.Page" %>

<%@ Import Namespace="Infragistics.Web.SampleBrowser.Core.Framework" %>
<%@ Import Namespace="Infragistics.Web.SampleBrowser.Core.Framework.Repository" %>
<%@ Register Assembly="Infragistics.Web.SampleBrowser.Core.Framework" Namespace="Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.Controls"
	TagPrefix="IGCustom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
	<% this.overview.ContentCollection = RepositoryFactory.FrameworkRepository.GetAppSamples(AppSettings.ProductFamilyName); %>
	<div class="content_area app-samples">
		<h2>
			<%= this.GetGlobalResourceObject("SampleBrowserResources", "Application_Samples")%></h2>
		<IGCustom:ProductControlsOverviewControl ID="overview" runat="server" />
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="beforeClosingBody" runat="server">
	<script>
		function ___scrollPageToElement() {
			var elements = document.location.href.split('#');
			if (elements.length > 1) {
				$('html, body').animate({ 'scrollTop': $('#' + elements[1]).position().top }, 1000);
			}
		}
	</script>
</asp:Content>
