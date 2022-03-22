<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_EditingAndSelection_DeleteRowButton_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
   <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="425" Width="100%" DataKeyFields="CustomerID"
         AutoGenerateColumns="false" DataSourceID="ObjectDataSource1">
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
            <ig:EditingCore>
               <Behaviors>
                     <ig:RowDeleting Enabled="true" ShowDeleteButton="true" />
               </Behaviors>
            </ig:EditingCore>
         </Behaviors>
   </ig:WebDataGrid>
   <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetCustomerDataSource"
       DeleteMethod="DeleteCustomer" EnableCaching="false" TypeName="NorthwindDataSource">
       <DeleteParameters>
           <asp:Parameter Name="CustomerID" Type="String" />
       </DeleteParameters>
   </asp:ObjectDataSource>
</asp:Content>
