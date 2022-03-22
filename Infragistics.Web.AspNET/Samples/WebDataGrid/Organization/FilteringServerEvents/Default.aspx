<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Organization_Filtering_Server_Events_Default" %>

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
                        <img src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/serverSideEvent.png" />
                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:WebDataGrid, Filtering_ServerEvents_HeaderTitle %>"></asp:Label></div>
                    <div id="countContainer" class="controlPanel">
                        <div id="eventList" class="controlPanelEventServer">
                            <asp:Label ID="ServerMessage" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div id="DataGridWrapper">
                        <ig:WebDataGrid ID="WebDataGrid1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1"
                            DataKeyFields="CustomerID" OnDataFiltered="Data_Filtered" Width="100%" Height="425"
                            EnableAjax="false">
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
                                <ig:Filtering Alignment="Top" Enabled="true" />
                                <ig:Paging PagerAppearance="Bottom" PageSize="20" Enabled="true" />
                            </Behaviors>
                        </ig:WebDataGrid>
                        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
                            SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country] FROM [Customers]">
                        </asp:AccessDataSource>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
