<%@ Page Title="" Language="C#" MasterPageFile="~/SamplePage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Samples_WebDataGrid_Editing_and_Selection_Editing_Rows_Server_Events_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="/SamplesBrowser/SamplesCommon/aspnet/Common/ControlPanel/ControlPanelSingle.css" rel="stylesheet" type="text/css" />
    <script src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/ControlPanel.js" type="text/javascript"></script>
    <script type="text/javascript">

        function WebDataGridView_AJAXResponse(webDataGrid, evntArgs)
        {
            var errorMessage = evntArgs.get_gridResponseObject().Message;
            $get("<%= eventList.ClientID %>").innerHTML = errorMessage;
        }
    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="Div1">
        <div id="headerContainer" class="ControlPanelHeader">
            <img alt="Server Side Events" src="/samplesbrowser/samplescommon/aspnet/Common/ControlPanel/images/serverSideEvent.png" />
            <%= this.GetGlobalResourceObject("WebDataGrid","DataEditing_UpdateRowServer_HeaderTitle") %></div>
        <div id="countContainer" class="controlPanel">
            <div id="eventList" runat="server" class="controlPanelEventServer">
            </div>
        </div>
        <div id="topContentContainer" style="margin-top: 25px; margin-bottom: 20px;">
            <ig:WebDataGrid ID="WebDataGrid1" runat="server" Height="425" Width="100%" DataKeyFields="CustomerID"
                AutoGenerateColumns="false" DataSourceID="ObjectDataSource1" OnRowUpdating="WebDataGrid1_RowUpdating">
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
                    <ig:Activation />
                    <ig:Selection RowSelectType="Multiple" CellClickAction="Row" />
                    <ig:EditingCore>
                        <Behaviors>
                            <ig:CellEditing Enabled="true">
                                <EditModeActions EnableF2="true" EnableOnActive="true" MouseClick="Single" />
                                <ColumnSettings>
                                    <ig:EditingColumnSetting ColumnKey="CustomerID" ReadOnly="true" />
                                </ColumnSettings>
                            </ig:CellEditing>
                        </Behaviors>
                    </ig:EditingCore>
                </Behaviors>
                <ClientEvents AJAXResponse="WebDataGridView_AJAXResponse" />
            </ig:WebDataGrid>
        </div>
        <br />
        <asp:Button ID="SaveButton" runat="server" Text="<%$ Resources:WebDataGrid, SaveButton %>" />
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" UpdateMethod="UpdateCustomer"
        SelectMethod="GetCustomerDataSource" EnableCaching="false" TypeName="NorthwindDataSource">
        <UpdateParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="ContactName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:Parameter Name="singlePage" Type="Boolean" DefaultValue="true" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
