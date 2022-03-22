<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Selection_Behavior_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #selectedCellCountLabel
        {
            color: #4679A6;
            font-weight: bold;
        }
        #selectedColumnCountLabel
        {
            color: #4679A6;
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">

        function WebDataGrid1_ColumnSelectionChanged(webDataGrid, evntArgs) {
            var columns = evntArgs.getSelectedColumns();
            document.getElementById("selectedColumnCountLabel").innerHTML = columns.get_length();
        }

        function WebDataGrid1_CellSelectionChanged(webDataGrid, evntArgs) {
            var cells = evntArgs.getSelectedCells();
            document.getElementById("selectedCellCountLabel").innerHTML = cells.get_length();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="topContentContainer" style="margin-top: 25px; margin-bottom: 10px; margin-left: -5px;">
        <div id="headerContainer" class="ControlPanelHeader">
            <img src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/config.png" />
            <%= this.GetGlobalResourceObject("WebDataGrid","Selection_Basic_HeaderTitle") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" class="controlPanelEvent">
                <%= this.GetGlobalResourceObject("WebDataGrid","Selection_Basic_Description") %><br />
                <br />
                <div class="outputValue">
                    <%= this.GetGlobalResourceObject("WebDataGrid","Selection_Basic_SelectedCells") %>
                    <span id="selectedCellCountLabel">0</span></div>
                <div class="outputValue">
                    <%= this.GetGlobalResourceObject("WebDataGrid","Selection_Basic_SelectedColumns") %>
                    <span id="selectedColumnCountLabel">0</span></div>
            </div>
        </div>
    </div>
    <div id="WebDataGridContainer" style="margin-left: -5px;">
        <ig:WebDataGrid ID="WebDataGrid1" runat="server" AutoGenerateColumns="False" DataKeyFields="CustomerID"
            DataSourceID="AccessDataSource1" Height="425" Width="100%">
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
                <ig:Selection CellSelectType="Multiple" ColumnSelectType="Multiple" Enabled="true">
                    <SelectionClientEvents ColumnSelectionChanged="WebDataGrid1_ColumnSelectionChanged"
                        CellSelectionChanged="WebDataGrid1_CellSelectionChanged" />
                </ig:Selection>
                <ig:Paging PagerAppearance="Bottom" PageSize="10" Enabled="true" />
            </Behaviors>
        </ig:WebDataGrid>
    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile='<%# this.GetMdbLocation("Nwind.mdb") %>'
        SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [Address], [City], [PostalCode], [Country] FROM [Customers]">
    </asp:AccessDataSource>
</asp:Content>
