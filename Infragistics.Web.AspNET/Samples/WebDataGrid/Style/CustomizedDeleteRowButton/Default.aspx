<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Style_CustomizedDeleteRowButton_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
   <style>
      .ig-smp-delete-btn {
         -moz-border-radius:4px;
         -webkit-border-radius:4px;
         border-radius:4px;
         padding:2px 4px 2px 4px;
         filter:alpha(opacity:50);
         opacity:0.5;
      }

       .ig-smp-delete-btn-img {
            background-image: url('/samplesbrowser/samplescommon/aspnet/common/button-styles/delete.gif');
            width: 16px;
            height: 16px;
            display:inline-block;
            margin-bottom: -3px;
       }

      /* Use this to remove the default delete button X*/
      .ig-smp-delete-btn:before {
         content:'';
         margin:0px;
      }

      .ig-smp-delete-btn-hover {
         filter:alpha(opacity:100);
         opacity:1;
      }
      .ig-smp-delete-btn-pressed {
          background-color: #BBB;
          border-color: #660000;
      }
   </style>
   <script type="text/javascript">
     function WebDataGrid1_RowDeleting_DeleteButtonDisplaying(sender, eventArgs) {
        var row = eventArgs.getRow();
        var cell = row.get_cellByColumnKey('Country');
        var val = cell.get_value();

        if (val == 'USA')
           eventArgs.set_cancel(true);
     }
   </script>
   <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="425px" Width="100%" DataKeyFields="CustomerID"
         AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
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
                 <ig:RowDeleting Enabled="true" ShowDeleteButton="true" ButtonCssClass="ig-smp-delete-btn"
                     ButtonHoverCssClass="ig-smp-delete-btn-hover" ButtonPressedCssClass="ig-smp-delete-btn-pressed"
                     ButtonHtml="<%$ Resources:WebDataGrid, DeleteButton_Html %>"
                     ButtonToolTip="<%$ Resources:WebDataGrid, DeleteButton_ToolTip %>">
                    <RowDeletingClientEvents DeleteButtonDisplaying="WebDataGrid1_RowDeleting_DeleteButtonDisplaying" />
                 </ig:RowDeleting>
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
