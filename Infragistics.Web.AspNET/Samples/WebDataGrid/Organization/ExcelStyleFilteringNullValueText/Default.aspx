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
            <asp:Label ID="Label1" Text="<%$ Resources:WebDataGrid, ExcelStyleFiltering_NullValueText_LabelText  %>" runat="server" />
            <asp:TextBox ID="NullValueTextBox" runat="server" Text="Null" />
            <asp:Button Text="<%$ Resources:WebDataGrid, ExcelStyleFiltering_NullValueText_UpdateButtonCaption  %>" runat="server" ID="ApplyButton" />
        </div>
            <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="350px" Width="700px" DataSourceID="SqlDataSource1"
                AutoGenerateColumns="false">
                <Columns>
                    <ig:BoundDataField DataFieldName="CompanyName" Key="CompanyName"  Width="200px"
                    Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderCompany  %>" />
                    <ig:BoundDataField DataFieldName="ContactName" Key="ContactName" Width="200px"
                     Header-Text="<%$ Resources:WebDataGrid, ColumnHeaderContact  %>" />
                    <ig:BoundDataField DataFieldName="Region" Key="Region">
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderRegion  %>" />
                    </ig:BoundDataField>
                    <ig:BoundDataField DataFieldName="Fax" Key="Fax">
                        <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderFax  %>" />
                    </ig:BoundDataField>
                </Columns>
                <Behaviors>
                    <ig:Filtering FilterType="ExcelStyleFilter" />
                </Behaviors>
            </ig:WebDataGrid>
        </ContentTemplate>
    </asp:UpdatePanel>


      <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%# this.GetSqlConnectionString("SamplesDB.mdf") %>'
        SelectCommand="SELECT ContactName, CompanyName, Region, Fax FROM nwd.Suppliers">
    </asp:SqlDataSource>
</asp:Content>