<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Delete_Rows_Server_Events_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">

        function WebDataGridView_AJAXResponse(webDataGrid, evntArgs) {
            var errorMessage = evntArgs.get_gridResponseObject().Message;
            $get("eventList").innerHTML = errorMessage;
        }

        function DeleteRow() {
            var grid = $find('<%= WebDataGrid1.ClientID %>');
            var gridRows = grid.get_rows()

            var selectedRows = grid.get_behaviors().get_selection().get_selectedRows();
            for (var i = selectedRows.get_length() - 1; i >= 0; i--) {
                var row = selectedRows.getItem(i);
                gridRows.remove(row);
            }
        }
    
    </script>
    <div id="DataGridWrapper">
        <div id="headerContainer" class="ControlPanelHeader">
            <img alt="Server Side Events" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/serverSideEvent.png" />
            <%= this.GetGlobalResourceObject("WebDataGrid","DataEditing_DeleteRowServer_HeaderTitle") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <%= this.GetGlobalResourceObject("WebDataGrid","WebDataGrid_EventsDescription") %><br />
            </div>
        </div>
        <div id="topContentContainer" style="margin-top: 25px; margin-bottom: 20px;">
            <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="425" Width="100%" DataKeyFields="CustomerID"
                AutoGenerateColumns="false" DataSourceID="ObjectDataSource1" OnRowsDeleting="WebDataGrid1_RowDeleting">
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
                    <ig:EditingCore>
                        <Behaviors>
                            <ig:RowDeleting Enabled="true" />
                        </Behaviors>
                    </ig:EditingCore>
                </Behaviors>
                <ClientEvents AJAXResponse="WebDataGridView_AJAXResponse" />
            </ig:WebDataGrid>
        </div>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetCustomerDataSource"
        DeleteMethod="DeleteCustomer" EnableCaching="false" TypeName="NorthwindDataSource">
        <DeleteParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
        </DeleteParameters>
    </asp:ObjectDataSource>
</asp:Content>
