<%@ Page Language="C#" AutoEventWireup="true" 
    CodeFile="VerticalWebDataMenu.aspx.cs" Inherits="VerticalWebDataMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
    // necessary only for IE7 since it has a bug that even if overflow:hidden is set, scrollbars are shown for a moment
    function detectBrowserResize(sender,args)
    {
        if ($util.IsIE7)
        {
            $addHandler(window, 'resize', sender._onResizeFn);
        }
    }
    </script>
</head>
<body style="overflow:hidden;">
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>
    <div>
        <ig:WebDataMenu ID="WebDataMenuVertical" runat="server" MaxDataBindDepth="1" StyleSetName="Office2007Black">
        <ClientEvents Initialize="detectBrowserResize" />
            <GroupSettings Orientation="Vertical" />
            <DataBindings>
                <ig:DataMenuItemBinding DataMember="Menu" DefaultText=" " TextField="ID" ValueField="Value"
                    Depth="0" ImageUrlField="ImageUrl" NavigateUrlFields="URL" TargetField="_blank"
                    ToolTipField="Text" />
                <ig:DataMenuItemBinding DataMember="Menu" TextField="ID" ValueField="Value" ToolTipField="Text" />
            </DataBindings>
        </ig:WebDataMenu>
    </div>
    </form>
    <asp:XmlDataSource runat="server" ID="MenuDataSource" XPath="/MenuData/Scrolling/Menu" />
</body>
</html>
