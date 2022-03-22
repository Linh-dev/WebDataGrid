<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="PresetViewer.aspx.cs"
	Inherits="Samples_WebGauge_Display_101Presets_PresetViewer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>Preset Viewer</title>
	<link type="text/css" rel="stylesheet" href="Style.css" />
	<!--[if lt IE 7]>
    <link href="~/iepngtransparency.css" rel="stylesheet" type="text/css" />
    <![endif]-->
</head>
<body style="margin: 0px;" class="ViewerBody">
	<form id="form1" runat="server">
	<div style="vertical-align: middle; margin: 0px auto 0px auto; text-align: center">
		<iggauge:UltraGauge runat="server" ID="Gauge">
		</iggauge:UltraGauge>
		<br />
		<asp:HyperLink runat="server" ID="Link" Target="_blank" Text="<%$ Resources:WebGauge, Presets_ViewXML %>" />
	</div>
	</form>
</body>
</html>
