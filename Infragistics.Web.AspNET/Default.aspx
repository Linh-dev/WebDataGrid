<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/WebformsSite.master" AutoEventWireup="true"
	Inherits="Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.Page" %>

<%@ Import Namespace="Infragistics.Web.SampleBrowser.Core.Framework" %>
<%@ Import Namespace="Infragistics.Web.SampleBrowser.Core.Framework.Repository" %>
<%@ Register Assembly="Infragistics.Web.SampleBrowser.Core.Framework" Namespace="Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.Controls"
	TagPrefix="IGCustom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
	<% this.overview.ContentCollection = RepositoryFactory.FrameworkRepository.GetProductControls(AppSettings.ProductFamilyName);
	this.PageTitle = this.GetGlobalResourceObject("SampleBrowserResources", "ProductFamily_Name") as string; %>
	<%= this.PageTitle %>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="content" runat="server">
	<div class="content_area samples">
		<h2>
			<%= this.GetGlobalResourceObject("SampleBrowserResources","Featured_Controls") %></h2>
		<IGCustom:ProductControlsOverviewControl ID="overview" runat="server" />
	</div>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="beforeClosingBody" runat="server">
</asp:Content>
