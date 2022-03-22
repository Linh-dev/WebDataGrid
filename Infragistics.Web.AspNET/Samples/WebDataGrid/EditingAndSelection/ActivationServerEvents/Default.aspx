<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Activation_Server_Events_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <asp:UpdatePanel runat="server" ID="SampleUpdatePanel" ChildrenAsTriggers="true"
                UpdateMode="Conditional">
                <ContentTemplate>
                    <div id="headerContainer" class="ControlPanelHeader">
                        <img alt="Server Side Events" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/serverSideEvent.png" />
                        <%= this.GetGlobalResourceObject("WebDataGrid","Activation_Server_EventsHeaderTitle") %></div>
                    <div id="countContainer" class="controlPanel">
                        <div id="eventList" class="controlPanelEventServer">
                            <asp:Label ID="ServerMessage" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div id="DataGridWrapper">
                        <ig:WebDataGrid ID="WebDataGridView" runat="server" DataSourceID="DefaultDataSource"
                            EnableAjax="false" DataKeyFields="CustomerID" AutoGenerateColumns="false" OnActiveCellChanged="Active_CellChanged"
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
                                <ig:Activation Enabled="true">
                                    <ActivationClientEvents ActiveCellChanged="WebDataGridView_ActiveCellChanged" />
                                </ig:Activation>
                            </Behaviors>
                        </ig:WebDataGrid>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <script type="text/javascript">

                function WebDataGridView_ActiveCellChanged(webDataGrid, evntArgs) {
                    __doPostBack('<%= SampleUpdatePanel.ClientID %>', '');
                }

            </script>
        </div>
        <asp:AccessDataSource ID="DefaultDataSource" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
            SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone] FROM [Customers]">
        </asp:AccessDataSource>
    </div>
</asp:Content>
