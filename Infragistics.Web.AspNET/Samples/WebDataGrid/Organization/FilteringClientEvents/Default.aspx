<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Organization_Filtering_Client_Events_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="headerContainer" class="ControlPanelHeader">
            <img alt="Client Side Events" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/clientSideEvent.png" />
            <%= this.GetGlobalResourceObject("WebDataGrid","Filtering_ClientEvents_HeaderTitle") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <%= this.GetGlobalResourceObject("WebDataGrid","WebDataGrid_EventsDescription") %><br />
            </div>
        </div>
        <div id="container">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1"
                    DataKeyFields="CustomerID" Width="100%" Height="425">
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
                    <EditorProviders>
                        <ig:TextBoxProvider ID="TextBoxProvider" />
                    </EditorProviders>
                    <Behaviors>
                        <ig:Paging PagerAppearance="Bottom" PageSize="20" Enabled="true" />
                        <ig:Filtering Alignment="Top" Enabled="true">
                            <FilteringClientEvents DataFiltered="WebDataGridView_DataFiltered" DataFiltering="WebDataGridView_DataFiltering"
                                ColumnFilterAdded="WebDataGridView_ColumnFilterAdded" FilterDropdownDisplayed="WebDataGridView_FilterDropdownDisplayed"
                                FilterDropdownDisplaying="WebDataGridView_FilterDropdownDisplaying" FilterDropdownHidden="WebDataGridView_FilterDropdownHidden"
                                FilterDropdownHiding="WebDataGridView_FilterDropdownHidding" />
                        </ig:Filtering>
                    </Behaviors>
                </ig:WebDataGrid>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
                    SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country] FROM [Customers]">
                </asp:AccessDataSource>
            </div>
        </div>
        <script type="text/javascript">

            function WebDataGridView_DataFiltered(webDataGrid, evntArgs) {
                addLine('<%= this.GetGlobalResourceObject("WebDataGrid","Filtering_ClientMessageDataFiltered") %>');
            }

            function WebDataGridView_DataFiltering(webDataGrid, evntArgs) {
                addLine('<%= this.GetGlobalResourceObject("WebDataGrid","Filtering_ClientMessageDataFiltering")%>');
            }

            function WebDataGridView_ColumnFilterAdded(webDataGrid, evntArgs) {
                addLine('<%= this.GetGlobalResourceObject("WebDataGrid","Filtering_ClientMessageColumnFilter") %>');
            }

            function WebDataGridView_FilterDropdownDisplayed(webDataGrid, evntArgs) {
                addLine('<%= this.GetGlobalResourceObject("WebDataGrid","Filtering_ClientMessageFilterDropdownDisplayed") %>');
            }

            function WebDataGridView_FilterDropdownDisplaying(webDataGrid, evntArgs) {
                addLine('<%= this.GetGlobalResourceObject("WebDataGrid","Filtering_ClientMessageFilterDropdownDisplaying") %>');
            }

            function WebDataGridView_FilterDropdownHidden(webDataGrid, evntArgs) {
                addLine('<%= this.GetGlobalResourceObject("WebDataGrid","Filtering_ClientMessageFilterDropdownHiddend") %>');
            }

            function WebDataGridView_FilterDropdownHidding(webDataGrid, evntArgs) {
                addLine('<%= this.GetGlobalResourceObject("WebDataGrid","Filtering_ClientMessageFilterDropdownHidding") %>');
            }
   
        </script>
    </div>
</asp:Content>
