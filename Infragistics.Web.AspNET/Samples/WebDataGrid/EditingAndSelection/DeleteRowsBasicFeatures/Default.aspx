<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true" Inherits="Infragistics.Web.SampleBrowser.Core.Framework.Web.UI.ASPNET.SamplePage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">

        function DeleteRow() {

            var grid = $find('<%= WebDataGrid1.ClientID %>');
            var gridRows = grid.get_rows()

            var selectedRows = grid.get_behaviors().get_selection().get_selectedRows();

            var rows = new Array();
            var i1 = 0;

            for (var i = selectedRows.get_length() - 1; i >= 0; i--) {

                rows[i1] = selectedRows.getItem(i);
                i1++;
            }

            grid.get_behaviors().get_editingCore().get_behaviors().get_rowDeleting().deleteRows(rows);
        }
        
    </script>
    <div id="DataGridWrapper">
        <div id="topContentContainer" style="margin-top: 25px; margin-bottom: 20px;">
            <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="425" Width="100%" DataKeyFields="CustomerID"
                AutoGenerateColumns="false" DataSourceID="ObjectDataSource1">
                <Columns>
                    <ig:TemplateDataField Key="DeleteItem" Width="60px">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" ID="DeleteItem" AlternateText="<%$ Resources:WebDataGrid, DataEditing_DeleteButton  %>"
                                ImageUrl="<%$ Resources:WebDataGrid, DataEditing_DeleteRowImagePath %>"
                                OnClientClick="DeleteRow(); return false;" />
                        </ItemTemplate>
                    </ig:TemplateDataField>
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
                    <ig:Activation />
                    <ig:Selection RowSelectType="Multiple" CellClickAction="Row" />
                    <ig:EditingCore Enabled="true">
                        <Behaviors>
                            <ig:RowDeleting Enabled="true" />
                        </Behaviors>
                    </ig:EditingCore>
                </Behaviors>
            </ig:WebDataGrid>
        </div>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetCustomerDataSource"
        DeleteMethod="DeleteCustomer" EnableCaching="false" TypeName="NorthwindDataSource">
        <SelectParameters>
            <asp:Parameter Name="singlePage" Type="Boolean" DefaultValue="true" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
        </DeleteParameters>
    </asp:ObjectDataSource>
</asp:Content>
