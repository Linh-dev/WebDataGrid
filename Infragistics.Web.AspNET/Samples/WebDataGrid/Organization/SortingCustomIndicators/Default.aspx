<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Organization_Sorting_Custom_Indicators_Events_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="wrapper" class="wgDataBind">
        <div id="container">
            <div id="DataGridWrapper">
                <ig:WebDataGrid ID="WebDataGrid1" runat="server" DataKeyFields="CustomerID" AutoGenerateColumns="False"
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
                        <ig:BoundDataField DataFieldName="Region" Key="Region">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderRegion %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
                        </ig:BoundDataField>
                        <ig:BoundDataField DataFieldName="Phone" Key="Phone">
                            <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPhone %>" />
                        </ig:BoundDataField>
                    </Columns>
                    <Behaviors>
                        <ig:Sorting SortingMode="Single" AscendingImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/Organization/SortingCustomIndicators/SortIconAsc.png"
                            DescendingImageUrl="/SamplesBrowser/SamplesCommon/aspnet/WebDataGrid/Organization/SortingCustomIndicators/SortIconDes.png" Enabled="true" />
                        <ig:Paging PagerAppearance="Bottom" PageSize="10" Enabled="true" />
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
        </div>
    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Phone] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>
