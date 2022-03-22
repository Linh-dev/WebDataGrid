<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:HtmlLink  runat="server" type="text/css" rel="Stylesheet" href="Style.css" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
<div>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <ig:WebTab ID="WebTab1" runat="server" Height="150px"  
        Width="100%" DisplayMode="Scrollable">
        <tabs>
            <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab,WebTab_SpaceBetweenTabs_Home %>" >
            </ig:ContentTabItem>
            <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab,WebTab_SpaceBetweenTabs_Personal %>">
            </ig:ContentTabItem>
            <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab,WebTab_SpaceBetweenTabs_Corporate %>">
            </ig:ContentTabItem>
            <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab,WebTab_SpaceBetweenTabs_Institutional %>">
            </ig:ContentTabItem>
            <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab,WebTab_SpaceBetweenTabs_ContactUs %>">
            </ig:ContentTabItem>
        </tabs>
    </ig:WebTab>
    </ContentTemplate>
    </asp:UpdatePanel>
    
    <br />
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebTab,WebTab_SpaceBetweenTabs_Label1 %>"></asp:Label>
    
    </div>
    <div style="height: 50px">
    
        <ig:WebDropDown ID="WebDropDown1" runat="server" Width="200px"
            DropDownContainerHeight="100px" >
            <ClientEvents SelectionChanged="WebDropDown1_SelectionChanged" />
            <AutoPostBackFlags SelectionChanged="Async" />
            <Items>
                <ig:DropDownItem Selected="False" Text="<%$ Resources:WebTab,WebTab_SpaceBetweenTabs_Home %>" Value="HOME">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="<%$ Resources:WebTab,WebTab_SpaceBetweenTabs_Personal %>" Value="PERSONAL">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="<%$ Resources:WebTab,WebTab_SpaceBetweenTabs_Corporate %>" Value="CORPORATE">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="<%$ Resources:WebTab,WebTab_SpaceBetweenTabs_Institutional %>" Value="INSTITUTIONAL">
                </ig:DropDownItem>
                <ig:DropDownItem Selected="False" Text="<%$ Resources:WebTab, WebTab_SpaceBetweenTabs_ContactUs %>" Value="CONTACTUS">
                </ig:DropDownItem>
            </Items>
        </ig:WebDropDown>
        
    
    </div>
    <div>
    
    </div>
    <div>
        <asp:Label ID="Label2" runat="server" 
            Text="<%$ Resources:WebTab,WebTab_SpaceBetweenTabs_Label2 %>"></asp:Label>
        <span lang="en-us">&nbsp;&nbsp;&nbsp;&nbsp;
            <ig:WebNumericEditor ID="WebNumericEditor1" runat="server" MaxValue="50" 
                MinValue="0">
            </ig:WebNumericEditor>
        </span>
    </div>
    <div style="margin-top:5px">
    </div>
    <div>
        <asp:Label ID="Label3" runat="server" 
            Text="<%$ Resources:WebTab,WebTab_SpaceBetweenTabs_Label3 %>"></asp:Label>
        <span lang="en-us">&nbsp;&nbsp;&nbsp;&nbsp;
            <ig:WebNumericEditor ID="WebNumericEditor2" runat="server" MaxValue="50" 
                MinValue="0">
            </ig:WebNumericEditor>
        </span>
    </div>
    <br />
   <div>
   
   <asp:UpdatePanel ID="UpdatePanel2" runat="server">
   <ContentTemplate>
       <asp:Button ID="Button1" runat="server" Text="<%$ Resources:WebTab,WebTab_SpaceBetweenTabs_Button1 %>" onclick="Button1_Click" />
   </ContentTemplate>
   </asp:UpdatePanel>
      </div> 
</div>
<script type="text/javascript">
    function WebDropDown1_SelectionChanged(sender, e) {

        var dropdown = $find("<%= WebDropDown1.ClientID %>");
        var tab = $find("<%= WebTab1.ClientID %>");
        tab.set_selectedIndex(dropdown.get_selectedItemIndex());

    }
   
   
   </script> 
</asp:Content>