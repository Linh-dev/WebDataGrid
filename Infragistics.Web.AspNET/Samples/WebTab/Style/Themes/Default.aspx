<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:htmllink runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
  <div class="MainContent">
        <asp:Label CssClass="topContent" ID="Label1" runat="server" Text="<%$ Resources:WebTab,WebTab_Themes_Label1 %>"></asp:Label>
        <ig:WebDropDown CssClass="topContent" ID="WebDropDown1" runat="server" Width="200px"
            CurrentValue="Claymation" AutoPostBack="True">
            <Items> 
                <ig:DropDownItem Selected="False" Text="Appletini" Value="">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="Caribbean" Value="">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="Claymation" Value="">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="Default" Value="">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="ElectricBlue" Value="">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="Harvest" Value="">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="LucidDream" Value="">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="Nautilus" Value="">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="Office2007Black" Value="">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="Office2007Blue" Value="">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="Office2007Silver" Value="">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="Pear" Value="">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="RedPlanet" Value="">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="RubberBlack" Value="">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="Trendy" Value="">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="Windows7" Value="">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="Office2010Blue" Value="">
                </ig:DropDownItem>
            </Items>
        </ig:WebDropDown>
        <br />
        <br />
        <asp:Label CssClass="topContent" ID="Label2" runat="server" Text=""></asp:Label>
        <asp:CheckBox ID="chkOverlap" runat="server" Checked="true" AutoPostBack="true" Text="<%$ Resources:WebTab,WebTab_Themes_Label2 %>" />
    </div>
    <br />
 
    
            <ig:WebTab ID="WebTab1" runat="server" Height="164px" Width="420px" StyleSetName="Claymation"
                EnableOverlappingTabs="true">
                <Tabs>
                    <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab,WebTab_Themes_Men %>">
                    </ig:ContentTabItem>
                    <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab,WebTab_Themes_Women %>">
                    </ig:ContentTabItem>
                    <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab,WebTab_Themes_Juniors %>">
                    </ig:ContentTabItem>
                    <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab,WebTab_Themes_Kids %>">
                    </ig:ContentTabItem>
                    <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab,WebTab_Themes_Baby %>">
                    </ig:ContentTabItem>
                </Tabs>
            </ig:WebTab>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>