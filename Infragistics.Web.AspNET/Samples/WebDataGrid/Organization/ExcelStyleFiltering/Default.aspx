<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Organization_ExcelStyleFiltering_Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
        <script type="text/javascript">
            $(window).load(function () {
                $("#sampleContainer").addClass("filteringDropDown");
            });
        </script>
     <style type="text/css">
            .filteringDropDown
            {
              overflow: visible !important;
                }

         .igg_FilterRuleDropDown
         {
             min-width: 170px;
         }

         .igg_FilterCheckboxList
         {
             width: 100%;
         }

         #filterDDOkBtn, #filterDDCancelBtn
         {
             width: 75px;
         }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="gridContainer" style="overflow: visible">
    <ig:WebDataGrid ID="WebDataGrid1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1"
        Width="100%" Height="425" DataKeyFields="CustomerID">
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
            <ig:Filtering Alignment="Top" Visibility="Visible" Enabled="true" FilterType="ExcelStyleFilter">
                <ColumnSettings>
                    <ig:ColumnFilteringSetting ColumnKey="Address" Enabled="false" />
                </ColumnSettings>
            </ig:Filtering>
        </Behaviors>
    </ig:WebDataGrid>
    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>' OnInit="DataSourceInit"
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>
