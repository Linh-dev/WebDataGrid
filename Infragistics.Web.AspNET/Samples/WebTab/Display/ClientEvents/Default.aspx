<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
  <ig:HtmlScript runat="server" Type="text/javascript" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
   <ig:HtmlLink  runat="server" type="text/css" rel="Stylesheet" href="ControlPanel.css" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <div id="Div1" class="wgDataBind">
        <div id="Div1" class="ControlPanelHeader">
             <img src="/samplesbrowser/samplescommon/aspnet/Common/clientsideEvent.png" />
            <%= this.GetGlobalResourceObject("Strings","ClientEventsCaption") %>
            </div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <%= this.GetGlobalResourceObject("Strings","ClientEventsDescription") %><br />
            </div>
        </div>
   <div style="padding-top:15px;">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <ig:WebTab ID="WebTab1" runat="server" Height="150px"  
        Width="620px" DisplayMode="Scrollable" EnableActivation="True"  >
        <tabs>
            <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab,WebTab_Tab1 %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebTab/Display/ClientEvents/Programming.png" TabCssClasses-ImageCssClass="ClientTabs">
            </ig:ContentTabItem>
            <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab,WebTab_Tab2 %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebTab/Display/ClientEvents/News.png" TabCssClasses-ImageCssClass="ClientTabs">
            </ig:ContentTabItem>
            <ig:ContentTabItem runat="server" Text="<%$ Resources:WebTab,WebTab_Tab3 %>" ImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebTab/Display/ClientEvents/Tech.png" TabCssClasses-ImageCssClass="ClientTabs">
            </ig:ContentTabItem>
          
        </tabs>
        <AddNewTabItem AnimationDuration="1500" Enabled="True" 
            EnableTextEditingOnDoubleClick="True">
        </AddNewTabItem>
        <CloseButton Enabled="True" />
        <TabMoving Enabled="True" />
         <ClientEvents ActiveTabChange="ActiveTabChange" Focus="Focus" EndEditing="EndEditing" Initialize="Initialize" 
            KeyDown="KeyDown"  MouseDown="MouseDown" MouseOut="MouseOut" 
            MouseOver="MouseOver" Scrolled="Scrolled" Scrolling="Scrolling" 
            SelectedIndexChanged="SelectedIndexChanged" 
            SelectedIndexChanging="SelectedIndexChanging" StartEditing="StartEditing" 
            TabAddAnimationEnded="TabAddAnimationEnded" TabAdded="TabAdded" 
            TabAdding="TabAdding" TabClosed="TabClosed" TabClosing="TabClosing" 
            TabMoved="TabMoved" TabMovedEnd="TabMovedEnd" TabMoving="TabMoving" 
            TabMovingEnd="TabMovingEnd" TabMovingStart="TabMovingStart" >
         </ClientEvents>
    </ig:WebTab>
    </ContentTemplate>
    </asp:UpdatePanel>

    </div>
    </div>
    
    
   <script type="text/javascript">

       function ActiveTabChange(sender, e) {
           addLine("ActiveTabChange");
       }
       function Focus(sender, e) {

           addLine("Focus");
       }


       function EndEditing(sender, e) {
           addLine("EndEditing");

       }
       function Initialize(sender, e) {

           addLine("Initialize");
       }
       function KeyDown(sender, e) {

           addLine("KeyDown");
       }


       function MouseDown(sender, e) {

           addLine("MouseDown");
       }
       function MouseOut(sender, e) {

           addLine("MouseOut");
       }
       function MouseOver(sender, e) {
           addLine("MouseOver");

       }
       function Scrolled(sender, e) {
           addLine("Scrolled");

       }
       function Scrolling(sender, e) {
           addLine("Scrolling");

       }
       function SelectedIndexChanged(sender, e) {
           addLine("SelectedIndexChanged");

       }
       function SelectedIndexChanging(sender, e) {

           addLine("SelectIndexChanging");
       }
       function StartEditing(sender, e) {
           addLine("StartEditing");

       }
       function TabAddAnimationEnded(sender, e) {
           addLine("TabAddAnimationEnded");


       }
       function TabAdded(sender, e) {
           addLine("TabAdded");
       }
       function TabAdding(sender, e) {
           addLine("TabAdding");

       }
       function TabClosed(sender, e) {

           addLine("TabClosed");
       }
       function TabClosing(sender, e) {

           addLine("TabClosing");
       }
       function TabMoved(sender, e) {
           addLine("TabMoved");

       }
       function TabMovedEnd(sender, e) {
           addLine("TabMovedEnd");

       }
       function TabMoving(sender, e) {

           addLine("TabMoving");
       }
       function TabMovingEnd(sender, e) {

           addLine("TabMovingEnd");
       }
       function TabMovingStart(sender, e) {

           addLine("TabMovingStart");
       }
    </script>
</asp:Content>
