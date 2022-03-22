<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<ig:HtmlLink  runat="server" type="text/css" rel="Stylesheet" href="Style.css" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <div>
            <ig:WebHierarchicalDataGrid ID="WebHierarchicalDataGrid1" runat="server" CssClass="/SamplesBrowser/Styles/IG/ig_hierarchicalDataGrid.css" DataSourceID="WebHierarchicalDataSource1" Height="520"
                Width="100%"  DataMember="CategoriesView" Key="CategoriesView" 
                DataKeyFields="EmployeeID" 
                ItemCssClass="Row" AltItemCssClass="odd"
                ShowHeader="true"
                AutoGenerateBands="true" AutoGenerateColumns="true"
                >
                
                <Behaviors>
                    <ig:Activation Enabled="true" >
                        <ActivationClientEvents ActiveCellChanging="ActiveGroupedRowChangingHandler" />
                    </ig:Activation>
                </Behaviors>
                
                <ClientEvents GroupedRowExpanded="GroupedRowExpandedHandler" GroupedRowCollapsed="GroupedRowCollapsedHandler" />
                
                <GroupingSettings EnableColumnGrouping="True" GroupAreaVisibility="Visible" GroupedRowCssClass="GroupRowDefault">
                    <GroupedColumns>
                        <ig:GroupedColumn ColumnKey="ReportsTo" />
                    </GroupedColumns>
                </GroupingSettings>

            </ig:WebHierarchicalDataGrid>
        </div>
        
        <ig:WebHierarchicalDataSource ID="WebHierarchicalDataSource1" runat="server">
        
        <DataViews>
            <ig:DataView ID="CategoriesView" DataSourceID="AccessDataSource1" />
        </DataViews>
    </ig:WebHierarchicalDataSource>
    
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile='<%# this.GetMdbLocation("NWind.mdb")%>'
            SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [Title], [ReportsTo] FROM [Employees]"></asp:AccessDataSource>
        
    </div>

     <script type="text/javascript">

         function GroupedRowExpandedHandler(sender, args) {
             var grid = $find("<%=WebHierarchicalDataGrid1.ClientID%>");

             var groupRow = args.get_row();

             // Mark expanded row as active
             grid.get_gridView().get_behaviors().get_activation().set_activeGroupedRow(groupRow, true);
         }

         function GroupedRowCollapsedHandler(sender, args) {
             var grid = $find("<%=WebHierarchicalDataGrid1.ClientID%>");

             var groupRow = args.get_row();
             var row;

             // Mark collapsed row as active
             grid.get_gridView().get_behaviors().get_activation().set_activeGroupedRow(groupRow, true);
         }

         // Reset old active group row and child rows' style and set new active group row and child rows' style
         function ActiveGroupedRowChangingHandler(sender, args) {
             var groupRow2 = args.getNewActiveGroupedRow();
             var groupRow1 = args.getCurrentActiveGroupedRow();
             var row;
             var childGroupRow;

             //Check if old active row exists and reset styles
             if (groupRow1) {
                 groupRow1.get_element().className = "";
                 SetStyle(groupRow1, "Reset");
             }

             // Check if new active row exists
             if (groupRow2) {
                 // Set new group row styles
                 SetStyle(groupRow2, "Active");
             }
         }

         // Set style for group row and child data rows
         function SetStyle(row, styleType) {

             // Check to reset style
             if (styleType == "Reset") {

                 row.get_element().className = "GroupRowDefault";

                 var childGroupRows = row.get_childGroupRows();

                 // Check for child group rows
                 if (childGroupRows) {
                     for (var i = 0; i < childGroupRows.get_length(); i++) {
                         // Reset style for all child group rows
                         SetStyle(childGroupRows.get_row(i), "Reset");
                     }
                 }
                 else {
                     for (var i = 0; i < row.get_rows().length; i++) {
                         // Reset style for data rows
                         var childRow = row.get_rows()[i].get_element();
                         childRow.className = "";
                     }
                 }
             } // Check to set active style
             else if (styleType == "Active") {
                 row.get_element().className = "GroupRow";

                 var childGroupRows = row.get_childGroupRows();

                 // Check for child group rows
                 if (childGroupRows) {
                     for (var i = 0; i < childGroupRows.get_length(); i++) {
                         // Style all group rows
                         SetStyle(childGroupRows.get_row(i), "Active");
                     }
                 }
                 else {
                     for (var i = 0; i < row.get_rows().length; i++) {
                         // Style all data rows
                         var childRow = row.get_rows()[i].get_element();
                         childRow.className = "ChildRow";
                     }
                 }
             }

         }
        
    </script>
</asp:Content>