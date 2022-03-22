<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Organization_Column_Sorting_Client_Events_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">

        function WebDataGridView_AJAXResponse(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","ClientMessageAJAXResponse") %>');
        }

        function WebDataGridView_ColumnSorted(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","Sorting_ColumnSorted") %>');
        }

        function WebDataGridView_ColumnSorting(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","Sorting_ColumnSorting") %>');
        }
    
    </script>
    <div id="wrapper" class="wgDataBind">
        <div id="headerContainer" class="ControlPanelHeader">
            <img alt="Client Side Events" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/clientSideEvent.png" />
            <%= this.GetGlobalResourceObject("WebDataGrid","Sorting_Client_EventsHeaderTitle") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <%= this.GetGlobalResourceObject("WebDataGrid","WebDataGrid_EventsDescription") %><br />
            </div>
        </div>
        <div id="container">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" DataKeyFields="CustomerID" runat="server" AutoGenerateColumns="False"
                    DataSourceID="DefaultDataSource" Width="100%" Height="425">
                    <Columns>
                        <ig:BoundDataField DataFieldName="CustomerID" Key="CustomerID">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderID  %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="ContactName" Key="ContactName">
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
                        <ig:Paging PagerAppearance="Bottom" PageSize="10" Enabled="true" />
                        <ig:Sorting SortingMode="Single" Enabled="true">
                            <SortingClientEvents ColumnSorted="WebDataGridView_ColumnSorted" ColumnSorting="WebDataGridView_ColumnSorting" />
                        </ig:Sorting>
                    </Behaviors>
                    <ClientEvents AJAXResponse="WebDataGridView_AJAXResponse" />
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
    <asp:AccessDataSource ID="DefaultDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>
