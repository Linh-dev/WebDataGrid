<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Selection_Client_Events_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">

        function WebDataGridView_AJAXResponse(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","ClientMessageAJAXResponse") %>');
        }

        function WebDataGridView_CellSelectionChanged(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","Selection_ClientMessageCellSelectionChanged") %>');
        }

        function WebDataGridView_CellSelectionChanging(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","Selection_ClientMessageCellSelectionChanging") %>');
        }

        function WebDataGridView_ColumnSelectionChanged(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","Selection_ClientMessageColumnSelectionChanged")  %>');
        }

        function WebDataGridView_ColumnSelectionChanging(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","Selection_ClientMessageColumnSelectionChanging") %>');
        }

        function WebDataGridView_RowSelectionChanged(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","Selection_ClientMessageRowSelectionChanged") %>');
        }

        function WebDataGridView_RowSelectionChanging(webDataGrid, evntArgs) {
            addLine('<%= this.GetGlobalResourceObject("WebDataGrid","Selection_ClientMessageRowSelectionChanging") %>');
        }
       
    </script>
    <div id="wrapper" class="wgDataBind">
        <div id="headerContainer" class="ControlPanelHeader">
            <img src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/clientSideEvent.png" />
            <%= this.GetGlobalResourceObject("WebDataGrid","Selection_Client_EventsHeaderTitle") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <%= this.GetGlobalResourceObject("WebDataGrid","WebDataGrid_EventsDescription") %><br />
            </div>
        </div>
        <div id="container">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" DataKeyFields="CustomerID" runat="server" AutoGenerateColumns="False"
                    DataSourceID="AccessDataSource1" Width="100%" Height="425">
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
                        <ig:Activation Enabled="true" />
                        <ig:Paging PagerAppearance="Bottom" PageSize="10" Enabled="true" />
                        <ig:Selection CellSelectType="Single" ColumnSelectType="Single" Enabled="true">
                            <SelectionClientEvents CellSelectionChanged="WebDataGridView_CellSelectionChanged"
                                CellSelectionChanging="WebDataGridView_CellSelectionChanging" ColumnSelectionChanged="WebDataGridView_ColumnSelectionChanged"
                                ColumnSelectionChanging="WebDataGridView_ColumnSelectionChanging" RowSelectionChanged="WebDataGridView_RowSelectionChanged"
                                RowSelectionChanging="WebDataGridView_RowSelectionChanging" />
                        </ig:Selection>
                    </Behaviors>
                    <ClientEvents AJAXResponse="WebDataGridView_AJAXResponse" />
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>
