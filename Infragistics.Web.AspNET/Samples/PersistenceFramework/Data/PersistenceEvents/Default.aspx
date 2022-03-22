<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" EnableViewState="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <ig:HtmlLink ID="HtmlLink1" runat="server" type="text/css" rel="Stylesheet" href="Style.css" />
    <ig:HtmlLink ID="HtmlLink2" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/Common.css" />
    <ig:HtmlLink ID="HtmlLink3" runat="server" type="text/css" rel="Stylesheet" href="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.css" />
    <ig:HtmlScript ID="HtmlScript1" runat="server" Type="text/javascript" Src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="wgDataBind">
        <div id="headerContainer" class="ControlPanelHeader">
            <img src="/samplesbrowser/samplescommon/aspnet/Common/serversideEvent.png" />
            <%= this.GetGlobalResourceObject("Strings","ServerEventsCaption") %>
        </div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent" runat="server">
            </div>
        </div>
               
        <ig:WebDataGrid runat="server" ID="wdg1" DataSourceID="adsProduct" width="700px" OnInit="wdg1_Init" EnableAjax="false" >
            <Behaviors>
                <ig:Paging Enabled="true"></ig:Paging>
                <ig:Filtering Enabled="true"></ig:Filtering>
            </Behaviors>
        </ig:WebDataGrid>
        <asp:AccessDataSource ID="adsProduct" runat="server"
            SelectCommand="SELECT ProductID, ProductName, SupplierID, QuantityPerUnit FROM Products">
        </asp:AccessDataSource>
    </div>
    <script type="text/javascript">
        $(function () {
            var objDiv = document.getElementById("<%= eventList.ClientID %>");
            objDiv.scrollTop = objDiv.scrollHeight;
        });
    </script>
</asp:Content>
