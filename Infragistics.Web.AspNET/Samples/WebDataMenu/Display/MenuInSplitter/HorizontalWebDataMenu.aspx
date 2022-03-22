<%@ Page Language="C#" AutoEventWireup="true" 
    CodeFile="HorizontalWebDataMenu.aspx.cs" Inherits="HorizontalWebDataMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="overflow:hidden;">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div>
        <ig:WebDataMenu ID="WebDataMenuHorizontal" runat="server" MaxDataBindDepth="1" StyleSetName="Office2007Black">
            <GroupSettings Orientation="Horizontal" />
            <DataBindings>
                <ig:DataMenuItemBinding DefaultText=" " TextField="ID" DataMember="Menu" ValueField="Value"
                    Depth="0" ImageUrlField="ImageUrl" TargetField="_blank" ToolTipField="Text" />
                <ig:DataMenuItemBinding DataMember="Menu" TextField="ID" ValueField="Value" ToolTipField="Text" />
            </DataBindings>
        </ig:WebDataMenu>
    </div>
    </form>
    <asp:XmlDataSource runat="server" ID="MenuDataSource" XPath="/MenuData/Scrolling/Menu" />
</body>
</html>
