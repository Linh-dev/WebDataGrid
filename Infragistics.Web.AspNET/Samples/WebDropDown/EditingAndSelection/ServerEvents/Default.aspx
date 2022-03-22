<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
    <ig:HtmlScript ID="HtmlScript1" runat="server" Type="text/javascript" Src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel runat="server" ID="SampleUpdatePanel" ChildrenAsTriggers="true"
            UpdateMode="Conditional">
            <ContentTemplate>
                <div id="div1" class="wgDataBind">
                    <div id="div2" class="ControlPanelHeader">
                        <img src="/samplesbrowser/samplescommon/aspnet/Common/serversideEvent.png" />
                        <%= this.GetGlobalResourceObject("Strings","ServerEventsCaption") %></div>
                    <div id="Div2" class="controlPanel">
                        <div id="Div3" class="controlPanelEventServer" runat="server">
                            <asp:Label ID="ServerMessage" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
                <ig:WebDropDown ID="WebDropDown1" runat="server" Width="200px" DataSourceID="DefaultDataSource"
                    TextField="Company" DropDownAnimationDuration="500" EnableDropDownAsChild="false" DropDownContainerHeight="300px"
                    DropDownContainerWidth="200px" ValueField="Id" DropDownAnimationType="EaseOut"
                    EnablePaging="False" PageSize="12" StyleSetName="IG">
                    <AutoPostBackFlags SelectionChanged="On"/>
                    <ClientEvents />
                </ig:WebDropDown>
            </ContentTemplate>
        </asp:UpdatePanel>
    <asp:AccessDataSource ID="DefaultDataSource" runat="server"
        SelectCommand="SELECT [CustomerID] AS Id, [CompanyName] AS Company, [ContactName] AS Contact, 
    [Address] AS Address, [City] AS City, [PostalCode] AS Zip, [Country] AS Country FROM [Customers]">
    </asp:AccessDataSource>

    <script type="text/javascript">
        function do_post() {
            alert('yo');
        }
    </script>
</asp:Content>
