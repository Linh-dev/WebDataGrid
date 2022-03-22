<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Performance_Client_side_API_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="headerContainer" class="ControlPanelHeader">
        <img alt="Configuration" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/config.png" />
        <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:WebDataGrid, VirtualScrolling_ClientAPI_HeaderTitle %>" /></div>
    <div id="countContainer" class="controlPanel">
        <div id="Div1" class="controlPanelEvent" style="height: 55px; overflow: hidden;">
            <div style="padding-top: 10px; padding-bottom: 10px">
                <asp:Label ID="Label1" CssClass="leftTitle" runat="server" Text="<%$ Resources:WebDataGrid, VirtualScrolling_ClientAPI_VirtualScrolling %>" />
                <asp:RadioButton ID="EnableRadio" Checked="true" GroupName="VSMode" Text="<%$ Resources:WebDataGrid, VirtualScrolling_Enable %>"
                    AutoPostBack="true" runat="server" OnCheckedChanged="EnableRadio_CheckedChanged" />
                <asp:RadioButton ID="DisableRadio" GroupName="VSMode" Text="<%$ Resources:WebDataGrid, VirtualScrolling_Disable %>"
                    AutoPostBack="true" runat="server" OnCheckedChanged="DisableRadio_CheckedChanged" />
            </div>
            <div>
                <asp:Label CssClass="leftTitle" runat="server" Text="<%$ Resources:WebDataGrid, VirtualScrolling_ScrollingMode %>" />
                <asp:RadioButton ID="VirtualRadio" GroupName="ScrollingMode" Text="<%$ Resources:WebDataGrid, VirtualScrolling_Mode_Virtual %>"
                    AutoPostBack="true" Checked="true" runat="server" OnCheckedChanged="VirtualRadio_CheckedChanged" />
                <asp:RadioButton ID="DeferredRadio" GroupName="ScrollingMode" Text="<%$ Resources:WebDataGrid, VirtualScrolling_Mode_Deferred %>"
                    AutoPostBack="true" runat="server" OnCheckedChanged="DeferredRadio_CheckedChanged" />
            </div>
        </div>
        <div>
            <div style="font-weight: bold; padding-left: 10px; padding-top: 10px;">
                <%= this.GetGlobalResourceObject("WebProgressBar","ClientEventsLabel") %>
            </div>
            <div>
                <div id="eventList" class="controlPanelEvent" style="background-color: Transparent;
                    height: 100px; border: 0px; padding-top: 10px;">
                    <%= this.GetGlobalResourceObject("WebProgressBar","ClientEventsMessage") %><br />
                </div>
            </div>
        </div>
    </div>
    <ig:WebDataGrid ID="WebDataGridView" runat="server" DataSourceID="AccessDataSource1"
        DataKeyFields="CustomerID" AutoGenerateColumns="False" Height="270" Width="100%">
        <Columns>
            <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderID  %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="ContactName" Key="Contact">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Address" Key="Address">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="City" Key="City">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
            </ig:BoundDataField>
            <ig:BoundDataField DataFieldName="Country" Key="Country">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
            </ig:BoundDataField>
        </Columns>
        <Behaviors>
            <ig:VirtualScrolling ScrollingMode="Virtual" Enabled="true">
                <VirtualScrollingClientEvents MoreRowsReceived="WebDataGridView_MoreRowsReceived"
                    MoreRowsRequesting="WebDataGridView_MoreRowsRequesting" />
            </ig:VirtualScrolling>
        </Behaviors>
    </ig:WebDataGrid>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country] FROM [Customers]">
    </asp:AccessDataSource>
    <script type="text/javascript">

        function WebDataGridView_MoreRowsReceived(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","VirtualScrolling_RowsReceived") %>');
        }

        function WebDataGridView_MoreRowsRequesting(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","VirtualScrolling_RowsRequest") %>');
        }

    </script>
</asp:Content>
