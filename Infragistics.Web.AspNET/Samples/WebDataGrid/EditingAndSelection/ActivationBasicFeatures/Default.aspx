<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Activation_Basic_Features_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
    <style type="text/css">
        .igg_ActiveCell
        {
            color: white;
            background-image: url(/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/EditingAndSelection/ActivationBasicFeatures/Activebg.gif);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div id="headerContainer" class="ControlPanelHeader">
                <img alt="Configuration" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/config.png" />
                <%= this.GetGlobalResourceObject("WebDataGrid","Activation_Basic_HeaderTitle") %></div>
            <div id="countContainer" class="controlPanel">
                <div id="eventList" class="controlPanelEvent">
                    <asp:CheckBox ID="ActivationOn" Text="<%$ Resources:WebDataGrid, Activation_Basic_On  %>"
                        AutoPostBack="true" Checked="true" runat="server" TextAlign="Left" OnCheckedChanged="ActivationOn_CheckedChanged" />
                </div>
            </div>
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGridView" runat="server" DataSourceID="AccessDataSource1"
                    DataKeyFields="CustomerID" AutoGenerateColumns="False" Width="100%" Height="425">
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
                        <ig:Activation ActiveCellCssClass="igg_ActiveCell" Enabled="true" />
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>
