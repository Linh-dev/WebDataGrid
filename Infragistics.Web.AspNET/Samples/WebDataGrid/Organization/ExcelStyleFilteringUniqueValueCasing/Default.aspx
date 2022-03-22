<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript">
        $(window).load(function () {
            $("#sampleContainer").addClass("filteringDropDown");
        });
    </script>
    <style type="text/css">
        .filtering-options
        {
            color: #656565;
            font-size: 12px;
            margin: 5px 0;
            padding: 5px;
            border: 1px solid #000000;
            font-weight: bold;
        }
        .filtering-options > .filtering-info
        {
            font-style: italic;
            margin: 5px 20px;
            font-weight: normal;
        }
        .filtering-buttons
        {
            float: right;
            margin: 5px 0 5px 5px;
        }
        .filteringDropDown
        {
            overflow: visible !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <div class="filtering-options">
                <asp:Label ID="Label1" Text="<%$ Resources:WebDataGrid, ExcelStyleFiltering_UniqueValueCasing_Label1  %>" runat="server" />
                <asp:DropDownList ID="UniqueValueCasingDropDown" Width="100px" runat="server" AutoPostBack="true">
                    <asp:ListItem Text="<%$ Resources:WebDataGrid, ExcelStyleFiltering_UniqueValueCasing_DD_Values_Lower  %>" 
                    Selected="True" Value="Lower" />
                    <asp:ListItem Text="<%$ Resources:WebDataGrid, ExcelStyleFiltering_UniqueValueCasing_DD_Values_Upper  %>" 
                    Value="Upper" />
                    <asp:ListItem Text="<%$ Resources:WebDataGrid, ExcelStyleFiltering_UniqueValueCasing_DD_Values_Camel  %>" 
                    Value="Camel" />
                </asp:DropDownList>
            <br />
            <br />
            
                <asp:Label ID="Label2" Text="<%$ Resources:WebDataGrid, ExcelStyleFiltering_UniqueValueCasing_Label2  %>" runat="server" />
                <asp:DropDownList ID="ColumnUniqueValueCasingDropDown" Width="100px" runat="server" AutoPostBack="true">
                    <asp:ListItem Text="<%$ Resources:WebDataGrid, ExcelStyleFiltering_UniqueValueCasing_DD_Values_Lower  %>" 
                    Selected="True" Value="Lower" />
                    <asp:ListItem Text="<%$ Resources:WebDataGrid, ExcelStyleFiltering_UniqueValueCasing_DD_Values_Upper  %>" 
                    Value="Upper" />
                    <asp:ListItem Text="<%$ Resources:WebDataGrid, ExcelStyleFiltering_UniqueValueCasing_DD_Values_Camel  %>" 
                    Value="Camel" />
                </asp:DropDownList>
         </div>
                <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="350px" Width="100%" EnableAjax="false"
                    AutoGenerateColumns="false" DataSourceID="SqlDataSource1" DataKeyFields="SupplierID">
                    <Columns>
                        <ig:BoundDataField DataFieldName="SupplierID" Key="SupplierID" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderId  %>" Width="40px" />
                        <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany  %>" />
                        <ig:BoundDataField DataFieldName="ContactName" Key="ContactName" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderContact  %>" />
                        <ig:BoundDataField DataFieldName="ContactTitle" Key="ContactTitle" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderContactTitle  %>" />
                        <ig:BoundDataField DataFieldName="City" Key="City" Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderCity %>" />
                    </Columns>
                    <Behaviors>
                        <ig:Filtering FilterType="ExcelStyleFilter">
                            <ColumnSettings>
                                <ig:ColumnFilteringSetting ColumnKey="SupplierID" Enabled="false" />
                                <ig:ColumnFilteringSetting ColumnKey="ContactTitle" Enabled="true" />
                            </ColumnSettings>
                        </ig:Filtering>
                    </Behaviors>
                </ig:WebDataGrid>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%# this.GetSqlConnectionString("SamplesDB.mdf") %>'
        SelectCommand="SELECT SupplierID, CompanyName, ContactName, ContactTitle, City FROM nwd.Suppliers">
    </asp:SqlDataSource>
</asp:Content>