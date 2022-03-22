<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:HtmlLink  runat="server" type="text/css" rel="Stylesheet" href="Style.css" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <div class="TabContainer">
    <ig:WebTab ID="WebTab1" runat="server" Height="200px" Width="100%" TabOrientation="Horizontal" TabLocation="TopLeft"
    SelectedIndex="0" EnableOverlappingTabs="false" EnableActivation="true">
    
    <ContentPane HolderCssClass="TabItemsContainer"></ContentPane>
    
             <CssClasses HeaderHolderCssClass="HeaderContainer" CssClass="TabContentContainer" />
             
             
            <TabMoving Enabled="true" />
            
            <TabItemStates EnableActive="true" EnableDisabled="true" EnableHover="true" EnableSelected="true" />
            
            <TabItemCssClasses 
                CssClass="TabBorder" 
                CenterCssClass="Tab" 
                TailCssClass="Tab" 
                TailHoverCssClass="TabHover" 
                CenterHoverCssClass="TabHover" 
                DisabledCssClass="TabDisabled" 
                CenterDisabledCssClass="TabDisabled"
                TailDisabledCssClass="TabDisabled" 
                HoverCssClass="TabHover" 
                SelectedCssClass="TabSelected" 
                CenterSelectedCssClass="TabSelected" 
                TailSelectedCssClass="TabSelectedInt" 
                TextSelectedCssClass="TabSelectedText"
                TextActiveCssClass="TabActive"
              />
            
            <Tabs>
                <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_Tab1 %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebTab/Style/StylingTabItemStates/Programming.png" CssClass="TabItemContainer" TabCssClasses-ImageCssClass="ClientTabs">
                
                </ig:ContentTabItem>
                
                <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_Tab2 %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebTab/Style/StylingTabItemStates/News.png" CssClass="TabItemContainer" TabCssClasses-ImageCssClass="ClientTabs">
                
                </ig:ContentTabItem>
                
                <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_Tab3 %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebTab/Style/StylingTabItemStates/Tech.png" CssClass="TabItemContainer" TabCssClasses-ImageCssClass="ClientTabs">
                
                </ig:ContentTabItem>
                
                <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab, WebTab_Tab4 %>" Enabled="false" ToolTip="<%$ Resources:WebTab, WebTab_Disabled %>">
                    <TabCssClasses TailCssClass="EndTab" />
                
                </ig:ContentTabItem>
                
            </Tabs>
            
        </ig:WebTab>
    </div>
</asp:Content>