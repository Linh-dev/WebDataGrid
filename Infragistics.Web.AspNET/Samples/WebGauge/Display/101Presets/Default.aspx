<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
	CodeFile="Default.aspx.cs" Inherits="Default" ValidateRequest="false" %>

<%@ Register Src="GaugePresetGallery.ascx" TagName="GaugePresetGalleryl" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
	<ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/webgauge/display/101presets/style.css" />
	<ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/webSample_style.css" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<div class="GalleryFrame">
		<iframe name="PreviewPane" allowtransparency="true" src="<%= this.ResolveUrl("PresetViewer.aspx?preset=%2fSamplesBrowser%2fSamplesCommon%2faspnet%2fWebGauge%2fDisplay%2f101Presets%2fPresets%2fstandard%2fBasic01.xml") %>" frameborder="0" id="PreviewPane"></iframe>
		<uc1:GaugePresetGalleryl id="GaugePresetGalleryl1" runat="server">
		</uc1:GaugePresetGalleryl>
	</div>
</asp:Content>

