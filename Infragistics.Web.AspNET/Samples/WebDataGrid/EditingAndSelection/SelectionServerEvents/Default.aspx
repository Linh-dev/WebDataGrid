<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Selection_Server_Events_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet"
        type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">

        function WebDataGridView_CellSelectionChanged(webDataGrid, evntArgs) {
            __doPostBack('<%= SampleUpdatePanel.ClientID %>', '');
        }

    </script>
    <div id="wrapper" class="wgDataBind">
        <asp:UpdatePanel runat="server" ID="SampleUpdatePanel" ChildrenAsTriggers="true"
            UpdateMode="Conditional">
            <ContentTemplate>
                <div id="headerContainer" class="ControlPanelHeader">
                    <img alt="Server Side Events" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/serverSideEvent.png" />
                    <%= this.GetGlobalResourceObject("WebDataGrid","Selection_Server_EventsHeaderTitle") %></div>
                <div id="countContainer" class="controlPanel">
                    <div id="eventList" class="controlPanelEventServer">
                        <asp:Label ID="ServerMessage" runat="server"></asp:Label>
                    </div>
                </div>
                <div id="container">
                    <div id="DataGridWrapper">
                        <ig:WebDataGrid ID="WebDataGridView" runat="server" DataSourceID="AccessDataSource1"
                            EnableAjax="false" DataKeyFields="CustomerID" AutoGenerateColumns="False" OnCellSelectionChanged="WebDataGridView_CellSelectionChanged"
                            Width="100%" Height="425">
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
                                <ig:Paging PagerAppearance="Bottom" PageSize="10" Enabled="true" />
                                <ig:Selection CellSelectType="Single" Enabled="true">
                                    <SelectionClientEvents CellSelectionChanged="WebDataGridView_CellSelectionChanged" />
                                </ig:Selection>
                            </Behaviors>
                        </ig:WebDataGrid>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>
