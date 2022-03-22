<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebDialogFrame.aspx.cs" Inherits="WebDialogFrame" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function btnOpenDialog_onclick() {

            var wdw = $find("<%=WebDialogWindow1.ClientID %>");
            wdw.set_windowState(0);

            return false;
        }
    </script>
    <style>        
        .button
        {
            display: block;
            margin-left: auto;
            margin-right: auto;
            margin-top: 10px;
            margin-bottom: 10px;
            padding: 3px 5px 3px 5px;
            width:120px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="margin: 0;">
    <ig:WebScriptManager ID="ScriptManager1" runat="server">
    </ig:WebScriptManager>
    <div>
        <asp:Button ID="btnShowDialog" CssClass="button" runat="server" OnClientClick="return btnOpenDialog_onclick()" />
        <asp:Button ID="btnSubmitPage" CssClass="button" runat="server" />
        <ig:WebDialogWindow ID="WebDialogWindow1" runat="server" Height="300px" Width="400px"
            WindowState="Hidden">
            <Resizer Enabled="true" />
            <Header>
                <MaximizeBox Visible="true" />
                <MinimizeBox Visible="true" />
            </Header>
            <ContentPane BackColor="AliceBlue">
            </ContentPane>
        </ig:WebDialogWindow>
    </div>
    </form>
</body>
</html>
