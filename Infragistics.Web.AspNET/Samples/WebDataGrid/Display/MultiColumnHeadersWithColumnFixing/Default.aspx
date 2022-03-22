<%@ Page Title="SomeTitle" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Display_MultiColumnHeadersWithColumnFixing_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">   
    <ig:WebDataGrid ID="WebDataGridView" runat="server" DataKeyFields="SupplierID" AutoGenerateColumns="False"
        Width="100%" Height="500px" DefaultColumnWidth="100px" ShowFooter="True" DataSourceID="AccessDataSource1">
        <Columns>
            <ig:BoundDataField DataFieldName="SupplierID" Key="SupplierID">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderSupplierID  %>" />
            </ig:BoundDataField>
            <ig:GroupField Key="SupCompanyInfo">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderSupplierCompanyInfo  %>" />
                <Columns>
                    <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName">
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany  %>" />
                    </ig:BoundDataField>
                    <ig:GroupField Key="SupContactInfo">
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContactInfo  %>" />
                        <Columns>
                            <ig:BoundDataField DataFieldName="ContactName" Key="ContactName">
                                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContact %>" />
                            </ig:BoundDataField>
                            <ig:BoundDataField DataFieldName="ContactTitle" Key="ContactTitle">
                                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderContactTitle %>" />
                            </ig:BoundDataField>
                        </Columns>
                    </ig:GroupField>
                </Columns>
            </ig:GroupField>
            <ig:GroupField Key="AddressGroup">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderAddress %>" />
                <Columns>
                    <ig:GroupField Key="LocalAddress">
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderLocalAddress %>" />
                        <Columns>
                            <ig:BoundDataField DataFieldName="Address" Key="Address">
                                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderStreetAddress %>" />
                            </ig:BoundDataField>
                            <ig:BoundDataField DataFieldName="City" Key="City">
                                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
                            </ig:BoundDataField>
                            <ig:BoundDataField DataFieldName="PostalCode" Key="PostalCode">
                                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderPostalCode %>" />
                            </ig:BoundDataField>
                        </Columns>
                    </ig:GroupField>
                    <ig:GroupField Key="RegionalAddressInfo">
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderRegionInfo %>" />
                        <Columns>
                            <ig:BoundDataField DataFieldName="Region" Key="Region">
                                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderRegion %>" />
                            </ig:BoundDataField>
                            <ig:BoundDataField DataFieldName="Country" Key="Country">
                                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
                            </ig:BoundDataField>
                        </Columns>
                    </ig:GroupField>
                </Columns>
            </ig:GroupField>
            <ig:BoundDataField DataFieldName="HomePage" Key="HomePage">
                <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderHomePage %>" />
            </ig:BoundDataField>
        </Columns>
        <Behaviors>
            <ig:Activation></ig:Activation>
            <ig:ColumnMoving></ig:ColumnMoving>
            <ig:ColumnResizing></ig:ColumnResizing>
            <ig:ColumnFixing ShowLeftSeparator="true" AutoAdjustCells="true">
                <ColumnSettings>
                    <ig:ColumnFixingSetting ColumnKey="HomePage" EnableFixing="false" />
                </ColumnSettings>
            </ig:ColumnFixing>
            <ig:Selection ColumnSelectType="Multiple"></ig:Selection>
        </Behaviors>
    </ig:WebDataGrid>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT * FROM [Suppliers]"></asp:AccessDataSource>
</asp:Content>
