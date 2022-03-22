<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_EditingAndSelection_RowEditingClientEvents_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
   <script type="text/javascript">
     function WebDataGrid1_RowEdit_EnteringEditMode(sender, eventArgs) {
        var cells = eventArgs.getCells();
        // example to get reference to GridCell object
		  //var gridCell_0 = cells[0].getCell();
		  var cell = cells[3];
		  var value = cell.get_value();
        if (value === "Germany")
        	cell.setReadOnly();
     	cells[2].set_value('<%= this.GetGlobalResourceObject("WebDataGrid", "RowEditing_EnterContact")%>');
     }
     function WebDataGrid1_RowEdit_ExitingEditMode(sender, eventArgs) {
        if (!eventArgs.isUpdate())
           return;
		  var cells = eventArgs.getCells();
		  var value0 = cells[0].get_value();
        if (!value0 || value0.length < 3)
           eventArgs.set_keepEditing(true);
        else if (value0.search(/[0-9]/) >= 0) {
            eventArgs.set_cancel(true);
        }
        else if (cells[2].get_value().indexOf('[') == 0)
            cells[2].set_value(cells[2].getOldValue());
     }
   </script>

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
            <ig:BoundDataField DataFieldName="Country" Key="Country">
               <Header Text="<%$ Resources:WebDataGrid, ColumnHeaderCountry %>" />
            </ig:BoundDataField>
         </Columns>
         <Behaviors>
            <ig:EditingCore>
               <Behaviors>
                  <ig:RowEditing>
                     <RowEditingClientEvents EnteringEditMode="WebDataGrid1_RowEdit_EnteringEditMode" ExitingEditMode="WebDataGrid1_RowEdit_ExitingEditMode" />
                  </ig:RowEditing>
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
