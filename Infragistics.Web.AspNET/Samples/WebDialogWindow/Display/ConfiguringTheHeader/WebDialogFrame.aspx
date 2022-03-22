<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebDialogFrame.aspx.cs" 
    Inherits="WebDialogFrame" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ig:WebScriptManager ID="ScriptManager1" runat="server"></ig:WebScriptManager>
        <ig:WebDialogWindow runat="server" ID="WebDialogWindow1" Height="200px" Width="320px"
		    Modal="false" WindowState="Normal" Moveable="true" Top="50px" BackColor="Transparent"
		    Left="200px" CssClass="dialog-window">
		    <Header CloseBox-Visible="false" MaximizeBox-Visible="true" MinimizeBox-Visible="true">
			    <MaximizeBox Visible="True"></MaximizeBox>
			    <MinimizeBox Visible="True"></MinimizeBox>
			    <CloseBox Visible="False"></CloseBox>
		    </Header>
		    <ContentPane>
			    <Template>
				    <div style="text-align: center; position: relative; padding: 10px;">
					    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:WebDialogWindow,Configuring_Header_Description_4 %>"></asp:Label>
				    </div>
			    </Template>
		    </ContentPane>
	    </ig:WebDialogWindow>
    </div>
    </form>
</body>
</html>
