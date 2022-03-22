<%@ Page Title="" Language="C#" AutoEventWireup="true"
    CodeFile="IEWebDataMenu.aspx.cs" Inherits="Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            margin: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server" />
    <div>
        <ig:WebDataMenu id="IEMenu" runat="server" enablescrolling="true">        
            <Items>
                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Toolbars %>">
                    <GroupSettings Orientation="Horizontal" />
                    <Items>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_MenuBar %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_FavouritesBar %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_CommandBar %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_StatusBar %>"></ig:DataMenuItem>
                    </Items>
                </ig:DataMenuItem>
                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_QuickTabs %>"></ig:DataMenuItem>
                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_ExplorerBars %>">
                    <GroupSettings Orientation="Horizontal" />
                    <Items>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Favourites %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_History %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Feeds %>"></ig:DataMenuItem>
                    </Items>
                </ig:DataMenuItem>
                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_GoTo %>">
                    <Items>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Back %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Froward %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_HomePage %>"></ig:DataMenuItem>
                    </Items>
                </ig:DataMenuItem>
                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Stop %>"></ig:DataMenuItem>
                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Refresh %>"></ig:DataMenuItem>
                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Zoom %>">
                    <Items>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_ZoomIn %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_ZoomOut %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="400%"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="200%"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="150%"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="125%"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="100%"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="75%"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="50%"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Custom %>"></ig:DataMenuItem>
                    </Items>
                </ig:DataMenuItem>
                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_TextSize %>">
                    <Items>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Largest %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Larger %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Medium %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Smaler %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Smalest %>"></ig:DataMenuItem>
                    </Items>
                </ig:DataMenuItem>
                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Encoding %>">
                    <GroupSettings Orientation="Vertical"></GroupSettings>
                    <Items>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_AutoSelect %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_WesternEuropeanWindows %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_CyrilicWindows %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_WesternEuropean %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_WesternEuropeanISO %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_More %>">
                            <Items>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Arabic1 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Arabic2 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Arabic3 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Arabic4 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Baltic1 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Baltic2 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_CE1 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_CE2 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_CE3 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Chinese1 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Chinese2 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Chinese3 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Chinese4 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Cyrilic1 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Cyrilic2 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Cyrilic3 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Cyrilic4 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Greek1 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Greek2 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Hebrew1 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Hebrew2 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Hebrew3 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Hebrew4 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_JP1 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_JP2 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_JP3 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Korean %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Thai %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Turtish1 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Turtish2 %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_UserDefined %>"></ig:DataMenuItem>
                                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, Encoding_Vietnamese %>"></ig:DataMenuItem>
                            </Items> 
                        </ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_LeftToRight %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_RightToLeft %>"></ig:DataMenuItem>
                    </Items>
                </ig:DataMenuItem>
                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Style %>">
                    <Items>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_NoStyle %>"></ig:DataMenuItem>
                        <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_Default %>"></ig:DataMenuItem>
                    </Items>
                </ig:DataMenuItem>
                <ig:DataMenuItem Text="<%$ Resources:WebDataMenu, IEMenu_CaretBrowsing %>"></ig:DataMenuItem>
            </Items>
        </ig:WebDataMenu>
    </div>
    </form>
</body>
</html>
