<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Versions.aspx.cs" Inherits="Versions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Current Versions</title>
</head>
<body>
	<strong>ASP.Net Version: </strong>
	<asp:Label ID="aspLabel" runat="server" Text="None"></asp:Label> <br />
	<strong> SilverLight Version: </strong>
	<asp:Label ID="SLLabel" runat="server" Text="None"></asp:Label> <br />
	<strong>WF Version: </strong>
	<asp:Label ID="WFLabel" runat="server" Text="None"></asp:Label> <br />
	<strong>WPF Version: </strong>
	<asp:Label ID="WPFLabel" runat="server" Text="None"></asp:Label> <br />
</body>
</html>
