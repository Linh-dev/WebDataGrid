<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:HtmlLink  runat="server" type="text/css" rel="Stylesheet" href="Style.css" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <br />
        <div class="MainContent">
          <div style="float:left;"><%= this.GetGlobalResourceObject("WebTab","WebTab_AddEditDeleteTabs_Url_Label")%>: </div> 
	        <div style="float:left; padding-left:5px;">
	            <select id="Select1" onchange="return UrlSelected(this.options[this.selectedIndex])">
                    <option value="<%= this.GetGlobalResourceObject("WebTab","WebTab_AddEditDeleteTabs_InfragisticsWebsite") %>">Infragistics</option>
                    <option value="//www.ask.com">Ask</option>
                    <option value="//www.jquery.com">Jquery</option>
                    <option value="//www.microsoft.com">Microsoft</option>
                </select>
	        </div>
        </div>
        <br />
    
    <div>
    <ig:WebTab ID="WebTab1" runat="server" Height="480px" Width="100%" TabOrientation="Horizontal" TabLocation="TopLeft" SelectedIndex="0" EnableActivation="true">
            <AddNewTabItem Enabled="true" TextForNewTab="<%$ Resources:WebTab, WebTab_AddEditDeleteTabs_Untitled%>" EnableTextEditingOnDoubleClick="true" />
            <CloseButton Enabled="true" />

            <PostBackOptions EnableLoadOnDemandUrl="true" />
            <ClientEvents TabAdded="TabAddedHandler"/>
            <TabMoving Enabled="true" />
            
            <Tabs>
                <ig:ContentTabItem runat="server" Text="Infragistics" ScrollBars="Hidden" ContentUrl="<%$ Resources:WebTab, WebTab_AddEditDeleteTabs_InfragisticsWebsite %>">
                
                </ig:ContentTabItem>
                
                <ig:ContentTabItem runat="server" Text="Bing" ScrollBars="Hidden" ContentUrl="<%$ Resources:WebTab, WebTab_AddEditDeleteTabs_BingWebsite %>">
                
                </ig:ContentTabItem>
                
            </Tabs>
        </ig:WebTab>
        </div>
    </div>
    <script type="text/javascript">
        function TabAddedHandler(sender, args) {
            var newTab = sender.getTabAt(args.get_tabIndex());

            var body = newTab.getBody();
            body.innerHTML = "<div style='text-align: center; margin-top: 50px'>" +
        '<%= this.GetGlobalResourceObject("WebTab","WebTab_AddEditDeleteTabs_NoUrlSpecified")%>' +
        " <br /> <img id='img1' src='/SamplesBrowser/SamplesCommon/aspnet/WebTab/EditingAndSelection/AddEditDeleteTabs/Warning.png' /> </div>";
        }

        function UrlSelected(listItem) {
            var webTab = $find("<%=WebTab1.ClientID%>");
				if (!webTab)
					return;
				var index = webTab.get_selectedIndex();
				var tab = index >= 0 ? webTab.getTabAt(index) : null;
				if (!tab)
					return;
				tab.set_contentUrl(listItem.value);
				tab.set_text(listItem.text);
        }
    
    </script>
</asp:Content>
