<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Data_Binding_to_DomainDataSource_Default" %>

<%@ Register TagPrefix="asp" Namespace="System.Web.DomainServices.WebControls" Assembly="System.Web.DomainServices.WebControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css"
        rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <asp:DomainDataSource ID="dataSource" runat="server" DomainServiceTypeName="DomainDataSourceSample.LinqToSqlNorthwindDomainService"
                SelectMethod="GetCustomers" EnableDelete="true" EnableInsert="true" EnableUpdate="true">
            </asp:DomainDataSource>
            <ig:WebDataGrid DataKeyFields="CustomerID" ID="WebDataGrid1" runat="server" DataSourceID="dataSource"
                EnableDataViewState="true" CssClass="wdgColumnHeaders" Width="100%" EnableAjax="true"
                AutoGenerateColumns="false">
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
                    <ig:Sorting Enabled="true" SortingMode="Multi">
                    </ig:Sorting>
                    <ig:Paging PageSize="5" QuickPages="5">
                    </ig:Paging>
                    <ig:Filtering CaseSensitive="false">
                    </ig:Filtering>
                    <ig:Activation>
                    </ig:Activation>
                    <ig:Selection RowSelectType="Single">
                    </ig:Selection>
                </Behaviors>
            </ig:WebDataGrid>
        </div>
    </div>
</asp:Content>
